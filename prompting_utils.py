import os


def read_schema(schema_path):
    '''
    Read the .schema file
    '''
    # TODO

def extract_sql_query(response):
    '''
    Extract the SQL query from the model's response
    '''
    import re

    if response is None:
        return ""

    # Normalize
    txt = response.strip()
    if not txt:
        return ""

    # 1) If the model returned a fenced code block, prefer that (```sql ... ``` or ``` ... ```)
    m = re.search(r"```(?:sql)?\s*(.*?)```", txt, flags=re.S | re.I)
    if m:
        candidate = m.group(1).strip()
        return _clean_sql(candidate)

    # 2) If the model included an explicit 'SQL:' label, take the tail after the last occurrence
    if "SQL:" in txt:
        candidate = txt.split("SQL:")[-1].strip()
        return _clean_sql(candidate)

    # 3) Heuristic: if the response contains common SQL keywords, attempt to extract from the first SQL keyword
    sql_kw = re.search(r"(SELECT|WITH|INSERT|UPDATE|DELETE)\b", txt, flags=re.I)
    if sql_kw:
        candidate = txt[sql_kw.start():].strip()
        return _clean_sql(candidate)

    # 4) Fallback: return the whole response cleaned
    return _clean_sql(txt)


def _clean_sql(candidate: str) -> str:
    """
    Clean extracted candidate SQL text by:
      - stripping surrounding quotes and whitespace
      - truncating after the last semicolon if present (to get a complete statement)
      - removing simple explanatory lines that start with common stop tokens
    """
    import re

    if not candidate:
        return ""

    # Remove surrounding single/double quotes
    if (candidate.startswith('"') and candidate.endswith('"')) or (candidate.startswith("'") and candidate.endswith("'")):
        candidate = candidate[1:-1].strip()

    # Split into lines and drop trailing explanation lines
    lines = [ln.rstrip() for ln in candidate.splitlines()]
    stop_prefixes = ('explain', 'explanation', 'note', 'answer', 'reason', 'analysis', 'comment')
    cleaned_lines = []
    for ln in lines:
        if not ln:
            # keep empty lines (SQL may be multi-line) but don't treat as stop by itself
            cleaned_lines.append(ln)
            continue
        lp = ln.lstrip().lower()
        if any(lp.startswith(p) for p in stop_prefixes):
            break
        cleaned_lines.append(ln)

    candidate = "\n".join(cleaned_lines).strip()

    # If there is a semicolon, keep up to the last semicolon (inclusive)
    if ';' in candidate:
        last_semi = candidate.rfind(';')
        candidate = candidate[: last_semi + 1 ].strip()

    # Final strip
    return candidate.strip()

def save_logs(output_path, sql_em, record_em, record_f1, error_msgs):
    '''
    Save the logs of the experiment to files.
    You can change the format as needed.
    '''
    # Validate output_path
    if not output_path:
        raise ValueError("output_path is empty. Please provide a valid path to save logs.")

    # Ensure parent directory exists
    dirpath = os.path.dirname(output_path)
    if dirpath:
        os.makedirs(dirpath, exist_ok=True)

    with open(output_path, "w") as f:
        f.write(f"SQL EM: {sql_em}\nRecord EM: {record_em}\nRecord F1: {record_f1}\nModel Error Messages: {error_msgs}\n")