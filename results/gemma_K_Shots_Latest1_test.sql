SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Phoenix';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Salt Lake City';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Milwaukee' AND f.destination = 'Denver' AND f.departure_time < '2023-04-01';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin = 'DEN';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'DEN' AND f.destination = 'STL' AND f.departure_time >= '2023-03-21 06:00:00' AND f.departure_time <
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin = 'St. Louis';
SELECT * FROM flights WHERE origin = 'St. Louis' AND destination = 'Milwaukee' AND day = 'Wednesday' AND time = 'Afternoon';
SELECT *
FROM flights
WHERE origin = 'Washington' AND destination = 'Seattle';
SELECT * FROM flights WHERE origin = 'Atlanta' AND destination = 'Seattle';
SELECT *
FROM flights
WHERE origin = 'San Diego' AND destination = 'Seattle';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Denver';
SELECT *
FROM flights
WHERE origin = 'Salt Lake City' AND destination = 'Phoenix';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'PHX';
SELECT * FROM flights WHERE origin = 'Washington DC' AND destination = 'Denver';
SELECT *
FROM flights
WHERE origin = 'Washington'
AND destination = 'Boston'
AND dayofweek = 'Saturday';
SELECT *
FROM flights
WHERE origin = 'Washington'
AND destination = 'Montreal'
AND day = 'Saturday';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.base_price
FROM flights f
WHERE f.origin = 'Washington' AND f.destination = 'Toronto' AND f.departure_date = '2023-10-28';
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Washington' AND dayofweek = 'Saturday';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'DALLAS'
AND departure_time < '12:00 PM';
SELECT f.origin, f.dest, f.fare
FROM flights f
WHERE f.origin = 'Washington' AND f.dest = 'Boston';
SELECT f.flight_id, f.origin, f.destination, f.fare
FROM flights f
WHERE f.origin = 'Washington' AND f.destination = 'Boston' AND f.day = 'Saturday';
SELECT f.origin, f.dest, f.fare
FROM flights f
WHERE f.origin = 'Washington' AND f.dest = 'Montreal';
SELECT f.flight_id, f.origin, f.destination, f.fare
FROM flights f
WHERE f.origin = 'Washington' AND f.destination = 'Montreal' AND f.day_of_week = 'Saturday';
SELECT f.flight_id, f.origin, f.destination, f.fare
FROM flights f
WHERE f.origin = 'Washington' AND f.destination = 'Toronto' AND f.day = 'Saturday';
SELECT f.fare
FROM flights f
WHERE f.origin = 'Washington'
AND f.destination = 'Toronto'
AND f.day = 'Saturday';
SELECT *
FROM flights
WHERE origin = 'Washington' AND destination = 'Boston' AND DAYNAME(date) = 'Saturday';
SELECT *
FROM flights
WHERE origin = 'Boston' AND destination = 'Washington' AND DAYNAME(date) = 'Saturday';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'DTW';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Detroit';
SELECT *
FROM flights
WHERE origin = 'Detroit' AND destination = 'Toronto';
SELECT *
FROM flights
WHERE origin = 'Toronto' AND destination = 'Milwaukee';
SELECT *
FROM flights
WHERE origin = 'Oakland'
AND destination = 'Salt Lake City'
AND day = 'Thursday';
SELECT *
FROM flights
WHERE origin = 'Oakland'
AND destination = 'Salt Lake City'
AND dayofweek = 'Wednesday'
ORDER BY departure_time DESC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'Oakland'
AND destination = 'Salt Lake City'
AND dayofweek = 'Wednesday'
AND time = (SELECT MAX(time)
▁▁▁▁▁▁▁▁▁▁▁FROM flights
▁▁▁▁▁▁▁▁▁▁▁WHERE origin = 'Oakland'
▁▁▁▁▁▁▁▁▁▁▁AND destination = 'Salt Lake City'
▁▁▁▁▁▁▁▁▁▁▁AND dayofweek = 'Wednesday')
SELECT * FROM flights WHERE origin = 'TORONTO' AND destination = 'SAN DIEGO' AND stops = 'DTW';
SELECT *
FROM flights
WHERE origin = 'St. Petersburg' AND destination = 'Charlotte';
SELECT *
FROM flights
WHERE origin = 'Milwaukee'
AND destination = 'Indianapolis'
AND day = 'Monday'
AND time < '09:00';
SELECT *
FROM flights
WHERE origin = 'Milwaukee'
AND destination = 'Indianapolis'
AND day = 'Monday'
AND time < '08:00';
SELECT COUNT(*)
FROM flights.ground_transportation
WHERE airport_code = 'IND';
SELECT *
FROM flights
WHERE origin = 'Indianapolis'
AND destination = 'Cleveland'
AND day = 'Tuesday'
AND time = 'Noon';
SELECT *
FROM flights
WHERE departure_city = 'CLEVELAND'
AND arrival_city = 'MILWAUKEE'
AND day_of_week = 'WEDNESDAY'
AND departure_time > '18:00:00';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND' AND destination = 'MILWAUKEE' AND dayofweek = 'WEDNESDAY' AND hour > '17';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'MILWAUKEE'
AND dayofweek = 'WEDNESDAY'
AND hour > '17';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'MILWAUKEE'
AND dayofweek = 'WEDNESDAY'
AND hour > '17';
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'SLC'
AND DAYNAME(departure_time) = 'Monday';
SELECT COUNT(*)
FROM ground_transportation
WHERE airport_code = 'DEN';

SELECT COUNT(*)
FROM flights.airports
WHERE city = 'Salt Lake City';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'Salt Lake City'
AND f.destination = 'Phoenix'
AND f.departure_date = 'Wednesday'
AND f.departure_time > '17:00:
SELECT COUNT(*)
FROM flights.airports
WHERE code = 'PHX' AND ground_transportation = 'true';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'OAK' AND f.destination = 'SLC' AND f.departure_time >= '2023-10-25 18:00:00';
```sql
SELECT f.flight_number, f.origin, f.destination, f.departure_time, f.arrival_time, f.duration, f.status, f.gate, f.baggage_claim, f.in_flight_entertainment, f.wifi, f.meal, f.luggage, f.baggage, f.pet
```
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_date, f.arrival_time, f.base_price, f.num_stops, f.airline_id, f.duration, f.aircraft_id, f.status, f.gate, f.
```
SELECT f.flight_number, a.name
FROM flights f
JOIN airlines a ON f.airline_id = a.id
WHERE f.origin = 'OAK'
AND f.destination = 'SLC'
AND f.departure_date = '2023-10-26'
AND f.departure_time < '08
SELECT flight_number FROM flights WHERE day_of_week = 'Thursday' AND departure_time < '08:00:00' AND origin = 'Oakland' AND destination = 'Salt Lake City';
SELECT DISTINCT f.dest_airport
FROM flights f
WHERE f.dest_airport IN (
▁▁▁▁SELECT a.faa
▁▁▁▁FROM airports a
▁▁▁▁WHERE a.state = 'AZ' OR a.state = 'NV' OR a.state = 'CA'
);
SELECT DISTINCT f.origin
FROM flights f
WHERE f.origin IN ('California', 'Nevada', 'Arizona')
SELECT * FROM airports WHERE state = 'AZ';
SELECT *
FROM airports
WHERE state = 'CA';
SELECT *
FROM flights
WHERE origin = 'LAS' AND destination = 'PHX';
SELECT *
FROM airports
WHERE state = 'CA';
SELECT DISTINCT AirportName
FROM Flights
SELECT *
FROM flights
WHERE origin = 'Oakland'
AND destination = 'Salt Lake City'
AND day = 'Wednesday'
AND time >= '19:00:00'
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Oakland' AND f.destination = 'Salt Lake City' AND f.departure_time < '2023-10-26 06:00:00';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'YYZ' AND f.dest = 'SAN';
```sql
SELECT f.flight_id, f.origin, f.destination, f.scheduled_departure, f.scheduled_arrival
FROM flights f
WHERE f.origin = 'St. Petersburg' AND f.destination = 'Charlotte' AND f.scheduled_departure >= '2023-03-01' AND f.scheduled_departure < '
SELECT tpa FROM flights;
SELECT *
FROM flights
WHERE origin = 'CLEVELAND' AND destination = 'DALLAS';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'DALLAS'
AND departure_time < '12:00:00';
SELECT DISTINCT f.aircraft_type
FROM flights f
WHERE f.origin = 'CLEVELAND' AND f.destination = 'DALLAS' AND f.scheduled_departure_time < '12:00:00';
SELECT * FROM flights WHERE origin = 'Indianapolis' AND destination = 'Seattle';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'MEM' AND f.destination = 'SEA'
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Nashville' AND f.destination = 'Seattle';
SELECT *
FROM flights
WHERE origin = 'Nashville, Tennessee'
AND destination = 'Seattle';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Tampa';
SELECT f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Tampa';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'St. Louis' AND f.destination = 'Milwaukee' AND f.departure_time >= '2023-03-01' AND f.departure_time < '
SELECT *
FROM flights
WHERE origin = 'Oakland' AND destination = 'Salt Lake City';
SELECT * FROM flights WHERE origin = 'Toronto' AND destination = 'San Diego';
SELECT * FROM flights WHERE origin = 'Toronto' AND destination = 'San Diego';

SELECT * FROM flights WHERE origin = 'St. Petersburg' AND destination = 'Charlotte';
SELECT flight_number
FROM flights
WHERE departure_city = 'CLEVELAND' AND arrival_city = 'DALLAS';
SELECT f.origin, f.destination
FROM flights f
WHERE f.origin = 'New York' AND f.destination = 'Miami'
SELECT f.fare_code, f.description
FROM flights f
WHERE f.fare_code = 'QO';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Orlando';
select abbreviation from us
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Orlando';
SELECT * FROM flights WHERE fare_code = 'f'
SELECT
▁▁▁▁fare_code,
▁▁▁▁description
FROM
▁▁▁▁fare_codes
WHERE
▁▁▁▁fare_code = 'h';
SELECT f.fare_code, f.description
FROM flights f
WHERE f.fare_code = 'y';
SELECT *
FROM restrictions
WHERE code = 'ap/57';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Indianapolis' AND f.destination = 'Memphis' AND f.departure_time < '10:00';

SELECT *
FROM flights
WHERE origin = 'ORL' AND destination = 'YUL'
SELECT airline
FROM airlines
WHERE airline = 'dl';
SELECT *
FROM flights
WHERE airline = 'Delta Airlines' AND origin = 'Montreal' AND destination = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'Orlando' AND destination = 'Montreal';
SELECT airline
FROM flights
WHERE airline = 'kw';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.class
FROM flights f
WHERE f.origin = 'New York' AND f.destination = 'Miami';
SELECT * FROM flights WHERE fare_code = 'bh';
SELECT *
FROM flights
WHERE origin = 'MIA'
AND destination = 'JFK'
AND return_date IS NOT NULL;
SELECT * FROM flights WHERE fare_code = 'bh';
SELECT * FROM flights WHERE fare_code = 'bh';
SELECT * FROM flights WHERE fare_code = 'bh';
SELECT * FROM flights WHERE fare_code = 'bh';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Milwaukee' AND f.destination = 'Orlando' AND f.departure_time > '18:00:00' AND f.day_of_week = 'Wednesday';
SELECT *
FROM flights
WHERE origin = 'Indianapolis' AND destination = 'Memphis';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'BUR' AND f.destination = 'SEA'
SELECT *
FROM flights
WHERE origin = 'Orlando' AND destination = 'Montreal'
SELECT *
FROM flights
WHERE origin = 'Montreal' AND destination = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'Montreal' AND destination = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'Montreal' AND destination = 'Orlando' AND roundtrip = 'true';
SELECT
▁▁fl.origin,
▁▁fl.dest,
▁▁fl.price
FROM
▁▁flights fl
WHERE
▁▁fl.origin = 'Montreal' AND
▁▁fl.dest = 'Orlando' AND
▁▁fl.one_way = 'true'
ORDER BY
▁▁fl.price ASC
LIMIT 1;
SELECT
▁▁fl.origin,
▁▁fl.dest,
▁▁fl.price
FROM
▁▁flights AS fl
WHERE
▁▁fl.origin = 'ORL'
▁▁AND fl.dest = 'YUL'
▁▁AND fl.one_way = 'true'
ORDER BY
▁▁fl.price ASC
LIMIT 1;
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.price
FROM flights f
WHERE f.origin = 'Kansas City' AND f.destination = 'Las Vegas' AND f.class = 'Economy';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.price
FROM flights f
WHERE f.origin = 'Kansas City' AND f.destination = 'Las Vegas' AND f.class = 'Economy';
SELECT airline FROM flights WHERE airline = 'hp';
SELECT f.dest_city, f.dest_state, f.dest_country, f.ground_transportation
FROM flights f
WHERE f.dest_city = 'LAS';
SELECT DISTINCT f.origin, f.dest, f.arr_time, f.dep_time
FROM flights f
WHERE f.dest = 'LAS';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.price
FROM flights f
WHERE f.origin = 'LAS VEGAS' AND f.destination = 'BALTIMORE' AND f.class = 'ECONOMY';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.price
FROM flights f
WHERE f.origin = 'LAS VEGAS' AND f.destination = 'BALTIMORE' AND f.class = 'ECONOMY';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.price
FROM flights f
WHERE f.origin = 'Baltimore' AND f.destination = 'Kansas City' AND f.class = 'Economy';
select * from airlines where airline_name = 'us';
SELECT airline FROM flights WHERE airline = 'US';
SELECT airline FROM flights WHERE airline = 'US';
SELECT airline FROM flights WHERE airline = 'US';
SELECT airline FROM flights WHERE airline = 'US';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Columbus' AND f.destination = 'Chicago' AND f.departure_time < '10:00:00';
SELECT airline FROM flights WHERE airline = 'hp';
SELECT * FROM flights WHERE origin = 'st petersburg' AND destination = 'detroit';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Milwaukee' AND f.destination = 'Orlando' AND f.departure_time > '2023-03-08 17:00:00';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Milwaukee' AND f.destination = 'Atlanta' AND f.departure_time < '10:00:00';
SELECT name
FROM airlines
WHERE code = 'yx';
SELECT *
FROM flights
WHERE origin = 'San Jose' AND destination = 'Phoenix';
SELECT *
FROM flights
WHERE origin = 'San Jose' AND destination = 'Phoenix';
SELECT airline FROM flights WHERE airline = 'hp';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.city = 'Phoenix';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Fort Worth';
SELECT f.ground_transportation
FROM flights f
WHERE f.origin = 'Fort Worth';
SELECT *
FROM flights
WHERE origin = 'Fort Worth' AND destination = 'San Jose';
SELECT *
FROM flights
WHERE origin = 'New York'
AND destination = 'Miami'
AND class = 'First';
SELECT *
FROM flights
WHERE origin = 'New York'
AND destination = 'Miami'
AND class = 'First';
SELECT *
FROM flights
WHERE origin = 'New York'
AND destination = 'Miami'
AND stops = 0;
SELECT *
FROM flights
WHERE origin = 'MIA'
AND destination = 'NYC'
AND stops = 0;
SELECT f.fl_num, f.origin, f.dest, f.actual_time
FROM flights f
WHERE f.origin = 'IND' AND f.dest = 'MEM' AND f.actual_time < 1000;
SELECT * FROM flights WHERE fare_code = 'f'
SELECT *
FROM flights
WHERE origin = 'BUR' AND destination = 'TAC';
SELECT *
FROM restrictions
WHERE code = 'ap58';
SELECT
▁▁▁▁fare_code,
▁▁▁▁description
FROM
▁▁▁▁fare_codes
WHERE
▁▁▁▁fare_code = 'h';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'SEA' AND f.dest = 'PDX' AND f.year = 2013 AND f.month = 7 AND f.day = 1
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'SEA' AND f.dest = 'PDX' AND f.year = 2013 AND f.month = 7 AND f.day = 1
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'SEA' AND f.dest = 'PDX' AND f.year = 2013 AND f.month = 7 AND f.day = 1
SELECT * FROM airlines WHERE name LIKE '%s%'
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'St. Petersburg' AND f.destination = 'Toronto' AND f.layover_city IS NULL;
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'Toronto' AND f.destination = 'St. Petersburg';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.num_stops, f.base_price
FROM flights f
WHERE f.origin = 'Toronto' AND f.destination = 'St. Petersburg' AND f.num_stops = 0;
SELECT *
FROM flights
WHERE origin = 'Toronto' AND destination = 'St. Petersburg' AND stops = 0;
SELECT airline FROM flights WHERE airline = 'hp';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'San Diego';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'San Diego';
SELECT *
FROM flights
WHERE origin = 'Kansas City' AND destination = 'Denver';
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'PHX';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Las Vegas';
SELECT *
FROM flights
WHERE origin = 'LAS' AND destination = 'SAN';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'Kansas City' AND departure_time >= '06:00:00' AND departure_time < '12:00:00';
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'SJC';
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'MKE';
SELECT *
FROM flights
WHERE origin = 'Milwaukee'
AND destination = 'San Jose'
AND day = 'Wednesday';
SELECT *
FROM flights
WHERE origin = 'San Jose' AND destination = 'Dallas' AND day = 'Friday';
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Houston';
```sql
SELECT
▁▁▁▁airports.name AS airport_name,
▁▁▁▁airports.city AS airport_city,
▁▁▁▁airports.state AS airport_state,
▁▁▁▁airports.lat AS airport_lat,
▁▁▁▁airports.lon AS airport_lon,
▁▁▁▁downtown_nyc.name AS downtown_name,
▁▁▁▁downtown_nyc.lat AS
SELECT DISTINCT f.dest_airport
FROM flights f
WHERE f.dest_airport IN (
▁▁SELECT DISTINCT a.faa
▁▁FROM airports a
▁▁WHERE a.city = 'New York City'
);
SELECT DISTINCT f.dest_airport
FROM flights f
WHERE f.dest_airport IN (
▁▁SELECT DISTINCT a.faa
▁▁FROM airports a
▁▁WHERE a.city = 'New York City'
);
SELECT *
FROM airports
WHERE city = 'Los Angeles';
SELECT DISTINCT AirportName
FROM Flights
SELECT *
FROM airports
WHERE city = 'Los Angeles';
SELECT *
FROM airports
WHERE city = 'Los Angeles';
SELECT * FROM airports WHERE city = 'Los Angeles';
SELECT * FROM flights WHERE origin = 'la';
SELECT * FROM flights WHERE origin = 'la';
SELECT *
FROM flights
WHERE origin = 'New York' AND destination = 'LA';
SELECT *
FROM flights
WHERE origin = 'LaGuardia' AND destination = 'Burbank';
SELECT *
FROM flights
WHERE origin = 'LAX' AND destination = 'MCO';
SELECT *
FROM flights
WHERE origin = 'Ontario, California' AND destination = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'Ontario, California' AND destination = 'Orlando';
SELECT * FROM flights WHERE origin = 'Indianapolis' AND destination = 'Memphis' AND day = 'Monday';
SELECT *
FROM flights
WHERE origin = 'Indianapolis'
AND destination = 'Memphis'
AND dayofweek = 'Monday';
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'MIA'
AND dayofweek = 'Wednesday';
SELECT *
FROM flights
WHERE origin = 'Miami' AND destination = 'Indianapolis' AND DAYNAME(departure_time) = 'Sunday';
SELECT *
FROM flights
WHERE origin = 'CLT'
AND DAYNAME(flight_date) = 'Saturday'
AND HOUR(flight_time) >= 12
AND HOUR(flight_time) < 18;
SELECT DISTINCT f.type
FROM flights f
WHERE f.origin = 'Charlotte';
SELECT class
FROM flights
WHERE fare_code = 'q';
SELECT * FROM flights WHERE origin = 'ORL' AND destination = 'TAC' AND dayofweek = '6' AND farebasiscode = 'Q';
SELECT f.origin, f.dest, f.date, f.time, f.duration, f.price
FROM flights f
WHERE f.origin = 'DET' AND f.dest = 'SPB' AND f.class = 'first' AND f.roundtrip = 'true';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.base_price
FROM flights f
WHERE f.origin = 'DET' AND f.destination = 'SPB' AND f.flight_type = 'coach' AND f.return_flight = 'round';
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'EWR'
AND dayofweek = 'Monday'
AND time > '06:00:00';
SELECT *
FROM flights
WHERE origin = 'Minneapolis'
AND destination = 'Pittsburgh'
AND day = 'Friday';
SELECT *
FROM flights
WHERE origin = 'cincinnati' AND destination = 'tampa' AND departure_time < '09:00:00';
SELECT * FROM flights WHERE origin = 'Cincinnati' AND destination = 'Tampa' AND departure_time < '12:00';
SELECT *
FROM flights
WHERE origin = 'Tampa' AND destination = 'Cincinnati' AND departure_time > '15:00:00';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'SEA' AND f.dest = 'SLC';
SELECT *
FROM flights
WHERE origin = 'Seattle' AND destination = 'Salt Lake City';
SELECT f.flight_id, f.origin, f.destination, s.capacity
FROM flights f
JOIN seating s ON f.flight_id = s.flight_id
WHERE f.origin = 'Seattle' AND f.destination = 'Salt Lake City' AND f.airline = 'Delta';
SELECT f.fl_num, f.origin, f.dest, f.aircraft_type
FROM flights f
WHERE f.origin = 'SEA' AND f.dest = 'SLC' AND f.carrier = 'DL';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.city = 'Baltimore';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.city = 'Baltimore';
SELECT *
FROM flights
WHERE origin = 'BAL'
AND destination = 'SFO'
AND day = 'Friday';
SELECT *
FROM flights
WHERE origin = 'Los Angeles' AND destination = 'Pittsburgh' AND DAYNAME(date) = 'Tuesday';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'LAX' AND day = 'Thursday' AND time = 'Evening';
```sql
SELECT
▁▁▁▁f.flight_id,
▁▁▁▁f.origin,
▁▁▁▁f.destination,
▁▁▁▁f.departure_time,
▁▁▁▁f.arrival_time,
▁▁▁▁f.price
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'CLE' AND
▁▁▁▁f.destination = 'MIA' AND
▁▁▁▁f.departure_
SELECT f.fare
FROM flights f
WHERE f.origin = 'CLE'
AND f.destination = 'MIA'
AND f.day = 'Wednesday'
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.duration, f.days_of_week, f.base_price, f.num_stops, f.airline, f.flight_number, f.aircraft_type, f.layover_city, f.
SELECT f.fare
FROM flights f
WHERE f.origin = 'MIA'
AND f.destination = 'CLE'
AND f.date = '2023-10-29';
SELECT *
FROM flights
WHERE origin = 'Milwaukee'
AND destination = 'Phoenix'
AND (day = 'Saturday' OR day = 'Sunday')
AND airline = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'Phoenix'
AND destination = 'Milwaukee'
AND dayofweek = 'Wednesday'
AND time >= '18:00:00';
SELECT *
FROM flights
WHERE origin = 'Phoenix'
AND destination = 'Milwaukee'
AND day = 'Wednesday'
AND airline = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'PHX'
AND destination = 'MKE'
AND airline = 'American';
SELECT *
FROM flights
WHERE origin = 'PHX' AND destination = 'MKE';
```
SELECT f.flight_id, f.origin, f.destination, f.meal
FROM flights f
WHERE f.origin = 'Chicago'
AND f.destination = 'Seattle'
AND f.meal = 'Yes'
AND f.departure_time >= '2023-10-28 06:00:00
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_date, f.arrival_time
FROM flights f
WHERE f.origin = 'Chicago' AND f.destination = 'Seattle' AND f.departure_date = '2023-03-1
SELECT *
FROM flights
WHERE origin = 'Seattle' AND destination = 'Chicago' AND meals = 'Continental';
```sql
SELECT f.flight_id, f.origin, f.destination, f.meal, f.day_of_week
FROM flights f
WHERE f.origin = 'Seattle' AND f.destination = 'Chicago' AND f.meal = 'Continental' AND f.day_of_week = 'Saturday' AND f.time >= '06:
SELECT f.flight_id, f.origin, f.destination, f.airline, f.meal_time
FROM flights f
WHERE f.origin = 'Chicago' AND f.destination = 'Seattle' AND f.airline = 'Continental' AND f.meal_time = 'Early Saturday Morning';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_time, f.meal_time
FROM flights f
WHERE f.origin = 'Chicago'
AND f.destination = 'Seattle'
AND f.meal_time = 'Early Saturday Morning';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.meal
FROM flights f
WHERE f.origin = 'Chicago' AND f.destination = 'Minneapolis' AND f.departure_time >= '2023-10-28 06:00:0
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
JOIN meals m ON f.meal_id = m.meal_id
WHERE a.airline_name = 'Continental'
AND f
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.airline
FROM flights f
WHERE f.origin = 'Chicago'
AND f.destination = 'St. Paul'
AND f.airline = 'Continental'
AND f.departure_time >= '2023
SELECT *
FROM flights
WHERE origin = 'New York' AND destination = 'Las Vegas' AND stops = 0;
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'LAS'
AND stops = 0;
SELECT * FROM flights WHERE origin = 'Newark' AND destination = 'Tampa' AND day = 'Friday';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Tampa' AND f.destination = 'Charlotte' AND f.departure_time LIKE '%Sunday%'
SELECT *
FROM flights
WHERE origin = 'Charlotte' AND destination = 'Baltimore' AND day = 'Tuesday' AND time = 'Morning';
SELECT *
FROM flights
WHERE origin = 'BAL'
AND destination = 'EWR'
AND departure_time BETWEEN '06:00:00' AND '12:00:00';
SELECT flight_number
FROM flights
WHERE origin = 'Dallas' AND destination = 'Houston';
SELECT f.flight_number
FROM flights f
WHERE f.origin = 'HOU' AND f.destination = 'DAL';

SELECT f.fl_num
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
JOIN airports o ON f.origin = o.faa
JOIN airports d ON f.dest = d.faa
WHERE a.name = 'American Airlines' AND o.city = 'Phoenix' AND d.city = 'Milwaukee';
SELECT f.flight_number
FROM flights f
WHERE f.origin = 'Chicago' AND f.destination = 'Seattle';
SELECT f.flight_num
FROM flights f
JOIN airlines a ON f.carrier_id = a.carrier_id
WHERE a.name = 'Continental' AND f.origin = 'Chicago' AND f.dest = 'Seattle';
SELECT f.flight_num
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE f.origin = 'SEA' AND f.dest = 'ORD' AND a.name = 'Continental';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'CLE' AND fare < 200;
```
SELECT
▁▁▁▁SUM(f.price) AS total_price
FROM
▁▁▁▁flights f
JOIN
▁▁▁▁airports a ON f.origin = a.iata_code
JOIN
▁▁▁▁airports a2 ON f.destination = a2.iata_code
WHERE
▁▁▁▁a.city = 'Pittsburgh' AND a2.city = 'Atlanta' AND f
SELECT * FROM flights WHERE origin = 'Newark' AND destination = 'Tampa' AND day = 'Friday';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Tampa' AND f.destination = 'Charlotte' AND f.departure_time >= '2023-10-29 00:00:00' AND f.departure_time < '
SELECT *
FROM flights
WHERE origin = 'Charlotte'
AND destination = 'Baltimore'
AND dayofweek = 'Tuesday';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Baltimore' AND f.destination = 'Newark' AND f.departure_time LIKE '%Wednesday%' AND f.departure_time LIKE '%Morning%';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Houston' AND f.departure_time > '12:01am';
SELECT * FROM flights WHERE origin = 'HOUSTON' AND destination = 'DALLAS' AND arrival_time < '00:00';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_date, f.arrival_time
FROM flights f
WHERE f.origin = 'Indianapolis' AND f.destination = 'Orlando' AND f.departure_date = '2023-12-27
SELECT * FROM flights WHERE origin = 'cleveland' AND destination = 'miami' AND dayofweek = 'wednesday' AND arrival < '16:00';
SELECT *
FROM flights
WHERE origin = 'MIA'
AND destination = 'CLE'
AND day = 'Sunday'
AND time = 'Afternoon';
SELECT * FROM flights WHERE origin = 'new york city' AND destination = 'las vegas' AND day = 'sunday';
SELECT * FROM flights WHERE origin = 'new york city' AND destination = 'las vegas' AND day = 'sunday';
SELECT *
FROM flights
WHERE origin = 'New York'
AND destination = 'Las Vegas'
AND day = 'Sunday'
AND time = 'Afternoon';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_date, f.arrival_time
FROM flights f
WHERE f.origin = 'MEM'
AND f.destination = 'LAS'
AND f.departure_date = '2023-10
SELECT * FROM flights WHERE origin = 'New York' AND destination = 'Las Vegas' AND day = 'Sunday' AND time = 'Afternoon';
SELECT *
FROM flights
WHERE origin = 'Chicago'
AND destination = 'Seattle'
AND day = 'Saturday'
AND time >= '06:00:00'
AND time < '12:00:00';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'Las Vegas' AND day = 'Saturday' AND time = 'Morning';
SELECT * FROM flights WHERE origin = 'PIT' AND destination = 'LAX' AND dayofweek = 'Thursday' AND time > '16:00:00';
SELECT *
FROM flights
WHERE origin = 'Milwaukee'
AND destination = 'Phoenix'
AND day = 'Saturday';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'phoenix' AND f.destination = 'milwaukee' AND f.departure_time LIKE '%Sunday%';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'phoenix' AND f.destination = 'milwaukee' AND f.departure_day = 'wednesday';
SELECT *
FROM flights
WHERE origin = 'Baltimore'
AND destination = 'San Francisco'
AND arrival_time BETWEEN '17:00:00' AND '20:00:00';
SELECT COUNT(*)
FROM flights
WHERE origin = 'St. Paul' AND destination = 'Northwest';
SELECT COUNT(*)
FROM flights
WHERE origin = 'Washington DC'
AND destination LIKE '%Northwest%';
SELECT COUNT(*)
FROM flights
WHERE airline = 'Northwest' AND origin = 'Dulles';
SELECT DISTINCT origin
FROM flights
WHERE carrier = 'WN';
SELECT DISTINCT city FROM flights WHERE airline = 'Northwest';
SELECT DISTINCT dest
FROM flights
WHERE carrier = 'WN';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'San Francisco' AND f.departure_time > '2023-03-10 16:00:00';
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'San Francisco';
```sql
SELECT
▁▁▁▁fl.fl_num,
▁▁▁▁fl.origin,
▁▁▁▁fl.dest,
▁▁▁▁fl.dep_time,
▁▁▁▁fl.arr_time,
▁▁▁▁fl.carrier
FROM
▁▁▁▁flights AS fl
WHERE
▁▁▁▁fl.origin = 'PHL'
▁▁▁▁AND fl.dest = 'DAL'
▁▁▁▁AND fl.
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT DISTINCT flight_num
FROM flights
WHERE dest = 'd9s';
select type from planes where tailnum = 'd9s';
SELECT DISTINCT flight_num
FROM flights
WHERE dest = 'd9s';
SELECT * FROM airports WHERE airport_name LIKE '%tower air%';
SELECT f.flight_id, f.origin, f.destination, f.flight_date, f.flight_time, f.first_class_seats, f.coach_seats
FROM flights f
WHERE f.origin = 'JFK' AND f.destination = 'ORL'
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.airline, f.flight_number, f.class
FROM flights f
WHERE f.origin = 'JFK' AND f.destination = 'MIA' AND f.class IN ('First', 'Coach')
SELECT *
FROM flights
WHERE origin = 'JFK'
AND destination = 'MIA'
AND class = 'first' OR class = 'coach';
SELECT f.meal FROM flights f WHERE f.meal = 'tower air';
SELECT snacks
FROM flights
WHERE tower = 'air';
SELECT *
FROM flights
WHERE airline = 'Delta' AND origin = 'JFK' AND destination = 'MIA';
SELECT *
FROM flights
WHERE airline = 'Delta Airlines' AND origin = 'Boston' AND destination = 'Salt Lake';
SELECT *
FROM flights
WHERE airline = 'Delta' AND origin = 'Boston' AND destination = 'Salt Lake City';
SELECT *
FROM flights
WHERE airline = 'Delta' AND origin = 'Boston' AND destination = 'Salt Lake City';
SELECT f.origin, f.dest, f.fare
FROM flights f
WHERE f.origin = 'Boston' AND f.dest = 'Washington DC';
SELECT MIN(Price)
FROM Flights
WHERE Origin = 'BOS' AND Destination = 'SLC';
SELECT
▁▁MIN(fare) AS lowest_fare
FROM
▁▁flights
WHERE
▁▁origin = 'Washington DC' AND destination = 'Salt Lake City';
SELECT MIN(fare)
FROM flights
WHERE origin = 'BWI' AND destination = 'SLC';
SELECT f.fl_num, f.origin, f.dest, f.actual_time, f.arr_time, f.tailnum, f.class, f.price
FROM flights f
WHERE f.origin = 'DET' AND f.dest = 'LAS' AND f.class = 'First';
SELECT f.fl_date, f.origin, f.dest, f.arr_time
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'DCA'
ORDER BY f.arr_time ASC
LIMIT 1;
SELECT f.fl_date, f.origin, f.dest, f.arr_time
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'DCA'
ORDER BY f.arr_time ASC
LIMIT 1;
SELECT f.fl_date, f.origin, f.dest, f.arr_time
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'DCA'
ORDER BY f.arr_time ASC
LIMIT 1;
SELECT
▁▁▁▁flight_number,
▁▁▁▁actual_arrival_time
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'HOU'
▁▁▁▁AND destination = 'MCO'
ORDER BY
▁▁▁▁actual_arrival_time ASC
LIMIT 1;
SELECT
▁▁▁▁flight_number,
▁▁▁▁actual_arrival_time
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'HOU'
▁▁▁▁AND destination = 'MCO'
ORDER BY
▁▁▁▁actual_arrival_time ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'MCO';
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'MCO';
SELECT *
FROM flights
WHERE origin = 'Houston' AND destination = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'DEN'
AND (departure_time >= '2023-10-26 20:00:00'
AND departure_time < '2023-10-26 21:00:00');
SELECT aircraft_capacity FROM aircraft WHERE aircraft_type = '733';
SELECT aircraft_capacity FROM aircraft WHERE aircraft_model = '72s';
SELECT aircraft_capacity FROM flights WHERE aircraft_model = '72s';
SELECT aircraft_seating_capacity
FROM aircraft
WHERE aircraft_model = 'm80';
SELECT aircraft_capacity
FROM aircraft
WHERE aircraft_type = 'm80';
SELECT aircraft_code, seating_capacity
FROM aircraft
WHERE aircraft_code = 'm80';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.dest = 'DEN';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.dest = 'DEN' OR f.origin = 'DEN';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.dest = 'DEN';
SELECT *
FROM flights
WHERE arrival_time BETWEEN '2023-03-20 20:00:00' AND '2023-03-20 21:00:00';
SELECT capacity
FROM planes
WHERE model = '737';
SELECT *
FROM flights
WHERE origin = '73s';
SELECT aircraft_code, SUM(seat_capacity) AS total_capacity
FROM aircraft
WHERE aircraft_code LIKE '73%'
GROUP BY aircraft_code;
SELECT aircraft_capacity
FROM aircraft
WHERE aircraft_model = '757';
SELECT COUNT(*) FROM passengers WHERE plane_id = (SELECT id FROM planes WHERE model = '757');
SELECT COUNT(*)
FROM passengers
WHERE aircraft_type = '757';
SELECT *
FROM flights
WHERE arrival_time BETWEEN '2023-04-01 20:00:00' AND '2023-04-01 21:00:00';
```sql
SELECT f.flight_id, f.origin, f.destination, f.actual_arrival_time
FROM flights f
WHERE f.actual_arrival_time >= '2023-10-26 20:00:00' AND f.actual_arrival_time < '2023-10-2
SELECT *
FROM flights
WHERE arrival_time >= '2023-03-15 20:00:00' AND arrival_time < '2023-03-16 00:00:00'
SELECT
▁▁▁▁SUM(capacity) AS total_capacity
FROM
▁▁▁▁flights
WHERE
▁▁▁▁model = '757';


SELECT * FROM aircraft WHERE aircraft_type = 'm80';
SELECT f.seating_capacity
FROM flights f
WHERE f.model = '733';
SELECT f.seating_capacity
FROM flights f
WHERE f.model = 'm80';
SELECT aircraft_capacity FROM aircraft WHERE aircraft_type = 'm80';
```sql
SELECT *
FROM flights
WHERE (origin = 'DEN' AND arrival_time >= '2023-03-20 20:00:00' AND arrival_time < '2023-03-21 00:00:00')
OR (destination = 'DEN' AND departure_
SELECT *
FROM flights
WHERE arrival_time BETWEEN '2023-03-20 20:00:00' AND '2023-03-20 21:00:00';
```sql
SELECT f.fl_num, f.origin, f.dest, f.actual_time
FROM flights f
JOIN aircraft a ON f.tailnum = a.tailnum
WHERE f.dest = 'DEN'
AND f.actual_time BETWEEN '2023-03-20 20:00:00'
SELECT *
FROM flights
WHERE origin = 'Nashville'
AND destination = 'Memphis'
AND day = 'Monday'
AND time = 'Morning';
SELECT *
FROM flights
WHERE origin = 'Nashville'
AND destination = 'Memphis'
AND DAYNAME(departure_time) = 'Monday'
AND HOUR(departure_time) = 9;
SELECT DISTINCT f.flight_num, f.origin, f.dest, f.actual_arrival_time
FROM flights f
WHERE f.origin = 'MEM' AND f.dest = 'CLT' AND f.actual_arrival_time >= '08:42:00';
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'NYC'
AND day_of_week = 'Monday'
AND time_of_day = 'Night';
SELECT * FROM flights WHERE origin = 'cvg';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin = 'LaGuardia Airport' AND f.destination = 'New York City';
SELECT COUNT(*)
FROM flights.routes
WHERE origin = 'LGA'
AND destination = 'NYC';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin = 'LGA' AND f.destination = 'NYC';
SELECT f.ground_transportation
FROM flights f
WHERE f.origin = 'EWR' AND f.destination = 'NYC';
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'NYC'
AND departure_time >= '06:00:00'
AND departure_time < '12:00:00';
SELECT *
FROM flights
WHERE origin = 'New York City'
AND destination = 'Nashville'
AND dayofweek(departure_time) = 4
AND hour(departure_time) >= 17;
SELECT f.origin, f.dest, f.carrier, f.tailnum, f.flightnum, f.arr_time, f.dep_time
FROM flights f
WHERE f.origin = 'NAS'
SELECT *
FROM flights
WHERE origin = 'Cincinnati'
AND destination = 'Charlotte'
AND departure_time >= '12:00:00'
AND arrival_time < '19:00:00';
SELECT COUNT(*)
FROM flights
WHERE airline = 'Alaska Airlines' AND destination = 'Burbank';
SELECT * FROM flights WHERE origin = 'BUR' AND airline = 'Alaska Airlines';
SELECT *
FROM flights
WHERE airline = 'Alaska Airlines' AND origin = 'Burbank';
SELECT DISTINCT f.airline
FROM flights f
WHERE f.airline IN (
▁▁▁▁SELECT DISTINCT f.airline
▁▁▁▁FROM flights f
▁▁▁▁WHERE f.origin = 'ORD'
▁▁▁▁AND f.dest = 'LAX'
)
AND f.origin = 'ORD'
AND f.dest = 'LAX';
SELECT f.flight_number, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.airline = 'Alaska Airlines' AND f.destination = 'Burbank';
SELECT *
FROM flights
WHERE origin = 'BUR' AND airline = 'Alaska Airlines';
SELECT *
FROM flights
WHERE airline = 'Alaska Airlines';
SELECT *
FROM flights
WHERE origin = 'Seattle';
SELECT *
FROM flights
WHERE origin = 'Indianapolis' AND destination = 'Memphis' AND departure_time < '12:00:00';
SELECT f.origin, f.dest, f.fare
FROM flights f
WHERE f.origin = 'CHARLOTTE' AND f.dest = 'LAS VEGAS'
ORDER BY f.fare ASC
LIMIT 1;
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Los Angeles' AND f.destination = 'Charlotte' AND f.departure_time LIKE '%00:00%'
SELECT * FROM flights WHERE origin = 'CLT' AND destination = 'EWR' AND departure_time BETWEEN '06:00:00' AND '12:00:00';
SELECT * FROM flights WHERE origin = 'Newark' AND destination = 'Los Angeles' AND departure_time >= '06:00:00';
SELECT *
FROM flights
WHERE origin = 'Newark'
AND destination = 'Los Angeles'
AND departure_time >= '16:00:00';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Montreal, Quebec' AND f.destination = 'San Diego, California' AND f.departure_date = 'Sunday';
SELECT * FROM flights WHERE origin = 'San Diego' AND destination = 'Indianapolis Indiana' AND depart_time >= '12:00:00';
SELECT * FROM flights WHERE origin = 'Indianapolis' AND destination = 'Toronto' AND day = 'Thursday' AND time = 'Morning';
SELECT * FROM flights WHERE origin = 'Toronto' AND destination = 'Montreal' AND day = 'Friday' AND time = 'Morning';
SELECT * FROM flights WHERE origin = 'Cincinnati' AND destination = 'Burbank' AND airline = 'American';
SELECT aircraft_type FROM flights WHERE flight_time = '419pm' AND origin = 'American';
SELECT *
FROM flights
WHERE origin = 'Kansas City'
AND destination = 'Chicago'
AND day = 'Wednesday'
AND return_day = 'Thursday';
SELECT *
FROM flights
WHERE origin = 'Long Beach' AND destination = 'St. Louis';
SELECT * FROM flights WHERE origin = 'MEM' AND destination = 'LAS';
SELECT *
FROM flights
WHERE origin = 'LAS' AND destination = 'ONT';
SELECT * FROM flights WHERE origin = 'ontario' AND destination = 'memphis';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.airport = 'LAS';
SELECT *
FROM flights
WHERE airport = 'ONT';
SELECT *
FROM flights
WHERE origin = 'Tampa' AND destination = 'Milwaukee';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Seattle';
SELECT f.flight_id, f.origin, f.destination, f.airline
FROM flights f
WHERE f.origin = 'LaGuardia' AND f.destination = 'San Jose' AND f.airline = 'United';
SELECT *
FROM flights
WHERE DAYOFWEEK(departure_time) = 2
AND origin_city = 'Charlotte, North Carolina'
AND destination_city = 'Phoenix, Arizona';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'PHOENIX, ARIZONA' AND f.destination = 'ST. PAUL, MINNESOTA' AND f.departure_time LIKE '%TUESDAY%'
SELECT *
FROM flights
WHERE origin = 'St. Paul, Minnesota'
AND destination = 'St. Louis'
AND day = 'Thursday';
SELECT *
FROM flights
WHERE origin = 'St. Louis' AND destination = 'Charlotte North Carolina' AND day = 'Friday';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'MCO' AND f.stops = 'NYC';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'BUR'
AND f.destination = 'MKE'
AND f.departure_time >= '2023-10-30 06:00:00'
AND f.
SELECT * FROM flights WHERE origin = 'Milwaukee' AND destination = 'St. Louis' AND day = 'Monday' AND time = 'Night';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'St. Louis' AND f.destination = 'Burbank' AND f.departure_time LIKE '%Tuesday%' AND f.departure_time LIKE '%afternoon%';
SELECT * FROM flights WHERE origin = 'St. Louis' AND destination = 'Burbank' AND day = 'Tuesday' AND time = 'Night';
SELECT f.flight_id, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.origin = 'SLC' AND f.destination = 'EWR' AND f.arrival_time < '2023-10-28 18:00:00';
SELECT f.flight_id, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.origin = 'Cincinnati' AND f.destination = 'Newark' AND f.arrival_time < '2023-10-28 18:00:00';

SELECT * FROM flights WHERE origin = 'MEM' AND destination = 'TAC' AND stops = 'LAX';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Cincinnati' AND f.destination = 'San Jose, California' AND f.departure_time > '18:00:00';
SELECT f.origin, f.dest, f.num_stops
FROM flights f
WHERE f.origin = 'San Jose' AND f.dest = 'Houston, Texas' AND f.num_stops = 0;
SELECT *
FROM flights
WHERE origin = 'HOU'
AND destination = 'MEM'
AND stops = 0;
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'CVG'
AND dayofweek = 'Wednesday';
SELECT f.fl_num, f.origin, f.dest
FROM flights f
WHERE f.origin = 'newark' AND f.dest = 'nashville' AND f.carrier = 'American';
SELECT f.origin, f.dest, f.stops
FROM flights f
WHERE f.origin = 'ontario' AND f.dest = 'westchester' AND f.stops = 'chicago';
SELECT *
FROM flights
WHERE origin = 'Los Angeles' AND destination = 'Charlotte';
SELECT *
FROM flights
WHERE origin = 'Charlotte' AND destination = 'Newark';
SELECT *
FROM flights
WHERE origin = 'Newark' AND destination = 'Los Angeles';
SELECT *
FROM flights
WHERE origin = 'Cincinnati'
AND destination = 'Burbank'
AND airline = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'Kansas City' AND destination = 'Chicago' AND date = '2023-06-16';
SELECT * FROM flights WHERE origin = 'Chicago' AND destination = 'Kansas City' AND date = '2023-06-17';
SELECT *
FROM flights
WHERE origin = 'Kansas City'
AND destination = 'Chicago'
AND date = '2023-06-16';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'Kansas City' AND date = '2023-06-17';
SELECT * FROM flights WHERE origin = 'burbank' AND destination = 'milwaukee';
SELECT *
FROM flights
WHERE origin = 'Cincinnati' AND destination = 'New York' AND departure_time < '2023-10-28 18:00:00';
SELECT *
FROM flights
WHERE airline = 'Delta'
AND origin = 'SLC'
AND destination = 'NYC'
AND arrival_time < '2023-10-28 18:00:00';
SELECT * FROM flights WHERE origin = 'MIA' AND destination = 'CHI' AND airline = 'American Airlines' AND arrival_time = '17:00';

```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Kansas City'
AND f.destination = 'Chicago'
AND f.departure_time >= '2023-05-24 16:00:00
SELECT * FROM flights WHERE origin = 'MEM' AND destination = 'TAC' AND stops = 'LAX';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'San Diego' AND f.destination = 'Phoenix' AND f.departure_date = 'Monday' AND f.departure_time = 'AM';
SELECT *
FROM flights
WHERE origin = 'Phoenix'
AND destination = 'Detroit'
AND day = 'Monday';
SELECT *
FROM flights
WHERE origin = 'DET' AND destination = 'SAN' AND dayofweek = 'Tuesday';
SELECT *
FROM flights
WHERE origin = 'Cincinnati'
AND destination = 'San Jose'
AND DAYNAME(date) = 'Monday';
SELECT *
FROM flights
WHERE origin = 'San Jose' AND destination = 'Houston' AND day = 'Wednesday';
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'MEM' AND day = 'Friday';
SELECT *
FROM flights
WHERE origin = 'MEM'
AND destination = 'CVG'
AND dayofweek = 'Sunday';
SELECT *
FROM flights
WHERE origin = 'Newark'
AND destination = 'Nashville'
AND departure_time BETWEEN '18:30:00' AND '18:31:00';
SELECT *
FROM flights
WHERE departure_city = 'burbank' AND arrival_city = 'tacoma' AND departure_date = '2023-06-10';

SELECT *
FROM flights
WHERE origin = 'burbank' AND destination = 'milwaukee';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'St. Louis';
SELECT *
FROM flights
WHERE origin = 'St. Louis' AND destination = 'Burbank';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'BUR' AND f.dest = 'MKE'
OR f.origin = 'MKE' AND f.dest = 'STL'
OR f.origin = 'STL' AND f.dest = 'BUR'
SELECT f.origin, f.destination, f.flight_date, f.flight_number, f.airline
FROM flights f
WHERE f.origin = 'BUR' AND f.destination = 'MKE' AND f.flight_date = '2023-04-01'
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.destination = 'Westchester County';
SELECT * FROM flights WHERE origin = 'Salt Lake City' AND destination = 'Westchester County';
SELECT DISTINCT f.origin_airport
FROM flights f
JOIN airports a ON f.origin_airport = a.iata_code
WHERE a.state = 'New York' AND a.county = 'Westchester';
SELECT f.flight_id, f.origin, f.destination, f.airline, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Cincinnati' AND f.destination = 'New York City' AND f.airline = 'United Airlines' AND f.departure_date = 'next saturday';
SELECT *
FROM airports
WHERE city = 'New York City';
```
SELECT f.flight_id, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.origin = 'Cincinnati, OH'
AND f.destination LIKE '%New York City%'
AND f.arrival_time BETWEEN '2023-10-28 18:00:00' AND '
SELECT *
FROM flights
WHERE origin = 'Cincinnati' AND destination LIKE '%New York City%';
SELECT f.flight_id, f.origin, f.destination, f.airline
FROM flights f
WHERE f.origin = 'Miami' AND f.destination = 'Chicago' AND f.airline = 'American Airlines';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.price
FROM flights f
WHERE f.origin = 'Kansas City' AND f.destination = 'Chicago' AND f.departure_date >= '2023-03-01' AND f.arrival_date
SELECT * FROM flights WHERE origin = 'Memphis' AND destination = 'Tacoma';
