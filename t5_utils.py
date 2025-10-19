import os

import torch

import transformers
from transformers import T5ForConditionalGeneration, T5Config
from transformers.pytorch_utils import ALL_LAYERNORM_LAYERS
import wandb

DEVICE = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')

def setup_wandb(args):
    # Implement this if you wish to use wandb in your experiments
    pass

def initialize_model(args):
    '''
    Helper function to initialize the model. You should be either finetuning
    the pretrained model associated with the 'google-t5/t5-small' checkpoint
    or training a T5 model initialized with the 'google-t5/t5-small' config
    from scratch.
    '''
    if args.finetune:
        model = T5ForConditionalGeneration.from_pretrained('google-t5/t5-small')
    else:
        config = T5Config.from_pretrained('google-t5/t5-small')
        model = T5ForConditionalGeneration(config)
    return model
# Add near other helpers in t5_utils.py

def mkdir(dirpath):
    if not os.path.exists(dirpath):
        try:
            os.makedirs(dirpath)
        except FileExistsError:
            pass

def save_model(checkpoint_dir, model, optimizer=None, scheduler=None, epoch=None, best=False):
    """
    Save model weights (HF format if possible) + training state.
    Writes into: <checkpoint_dir>/last/  and <checkpoint_dir>/best/ (if best=True).
    """
    sub = 'best' if best else 'last'
    out_dir = os.path.join(checkpoint_dir, sub)
    mkdir(out_dir)

    # Save model weights (Hugging Face format preferred)
    try:
        model.save_pretrained(out_dir)
    except Exception:
        # fallback: save state_dict
        torch.save(model.state_dict(), os.path.join(out_dir, 'pytorch_model.bin'))

    # Save training state: optimizer, scheduler, epoch
    state = {
        'epoch': epoch,
        'optimizer_state_dict': optimizer.state_dict() if optimizer is not None else None,
        'scheduler_state_dict': scheduler.state_dict() if scheduler is not None else None,
    }
    torch.save(state, os.path.join(out_dir, 'training_state.pt'))

def load_model_from_checkpoint(args, best=False, map_location=None, load_optimizer=False, optimizer=None, scheduler=None):
    """
    Load model and (optionally) optimizer/scheduler state from checkpoint.
    Returns: model, training_state (dict or None)
    - args: expects args.finetune and args.experiment_name present (used to build path)
    - best: whether to load best/last
    - map_location: e.g., DEVICE
    - load_optimizer: if True and optimizer/scheduler objects passed, their states will be loaded
    """
    model_type = 'ft' if args.finetune else 'scr'
    checkpoint_dir = os.path.join('checkpoints', f'{model_type}_experiments', args.experiment_name)
    sub = 'best' if best else 'last'
    ckpt_path = os.path.join(checkpoint_dir, sub)

    if not os.path.exists(ckpt_path):
        raise FileNotFoundError(f'Checkpoint not found: {ckpt_path}')

    training_state = None
    # Try HF from_pretrained first
    try:
        model = T5ForConditionalGeneration.from_pretrained(ckpt_path)
    except Exception:
        # fallback: initialize model and load state_dict
        model = initialize_model(args)
        sd_path = os.path.join(ckpt_path, 'pytorch_model.bin')
        if os.path.exists(sd_path):
            sd = torch.load(sd_path, map_location=map_location)
            model.load_state_dict(sd)

    # load training state if present
    state_path = os.path.join(ckpt_path, 'training_state.pt')
    if os.path.exists(state_path):
        training_state = torch.load(state_path, map_location=map_location)
        if load_optimizer and optimizer is not None and training_state.get('optimizer_state_dict') is not None:
            optimizer.load_state_dict(training_state['optimizer_state_dict'])
        if load_optimizer and scheduler is not None and training_state.get('scheduler_state_dict') is not None:
            scheduler.load_state_dict(training_state['scheduler_state_dict'])

    return model, training_state

def initialize_optimizer_and_scheduler(args, model, epoch_length):
    optimizer = initialize_optimizer(args, model)
    scheduler = initialize_scheduler(args, optimizer, epoch_length)
    return optimizer, scheduler

def initialize_optimizer(args, model):
    decay_parameters = get_parameter_names(model, ALL_LAYERNORM_LAYERS)
    decay_parameters = [name for name in decay_parameters if "bias" not in name]
    optimizer_grouped_parameters = [
        {
            "params": [
                p for n, p in model.named_parameters() if (n in decay_parameters and p.requires_grad)
            ],
            "weight_decay": args.weight_decay,
        },
        {
            "params": [
                p for n, p in model.named_parameters() if (n not in decay_parameters and p.requires_grad)
            ],
            "weight_decay": 0.0,
        },
    ]

    if args.optimizer_type == "AdamW":
        optimizer = torch.optim.AdamW(
            optimizer_grouped_parameters, lr=args.learning_rate, eps=1e-8, betas=(0.9, 0.999)
        )
    else:
        pass

    return optimizer
        
def initialize_scheduler(args, optimizer, epoch_length):
    num_training_steps = epoch_length * args.max_n_epochs
    num_warmup_steps = epoch_length * args.num_warmup_epochs

    if args.scheduler_type == "none":
        return None
    elif args.scheduler_type == "cosine":
        return transformers.get_cosine_schedule_with_warmup(optimizer, num_warmup_steps, num_training_steps)
    elif args.scheduler_type == "linear":
        return transformers.get_linear_schedule_with_warmup(optimizer, num_warmup_steps, num_training_steps)
    else:
        raise NotImplementedError

def get_parameter_names(model, forbidden_layer_types):
    result = []
    for name, child in model.named_children():
        result += [
            f"{name}.{n}"
            for n in get_parameter_names(child, forbidden_layer_types)
            if not isinstance(child, tuple(forbidden_layer_types))
        ]
    # Add model specific parameters (defined with nn.Parameter) since they are not in any child.
    result += list(model._parameters.keys())
    return result

