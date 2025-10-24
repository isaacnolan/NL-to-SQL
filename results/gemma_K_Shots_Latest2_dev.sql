SELECT *
FROM flights
WHERE departure_city = 'DEN'
AND arrival_city = 'PHL'
AND departure_date = '2023-10-26';
SELECT *
FROM flights
WHERE origin = 'Washington' AND destination = 'Boston' AND departure_time >= '12:00:00' AND departure_time < '18:00:00';
SELECT *
FROM flights
WHERE arrival_airport = 'BAL'
AND arrival_date = '2023-04-13'
AND arrival_time < '09:00:00';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Milwaukee';
SELECT * FROM flights WHERE origin = 'philadelphia' AND destination = 'san francisco' AND stops = 'dallas';
SELECT * FROM flights WHERE origin = 'DEN';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'SFO' AND f.num_stops = 0;
SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'ATL';
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'Atlanta';
SELECT *
FROM flights
WHERE origin = 'Newark' AND destination = 'Tampa';
SELECT *
FROM flights
WHERE origin = 'ATL' AND destination = 'BAL';
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Boston';
SELECT f.fl_num
FROM flights f
WHERE f.origin = 'HOU'
AND f.dest = 'MIL'
AND f.day_of_week = 'FRIDAY'
AND f.carrier = 'AA';
SELECT *
FROM flights
WHERE airline = 'United Airlines' AND origin = 'Boston' AND destination = 'Denver';
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'PHL';
SELECT f.fl_date, f.origin, f.dest, f.dep_time
FROM flights f
WHERE f.origin = 'DEN' AND f.dest = 'BOS'
ORDER BY f.dep_time ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Boston' AND date = '2023-08-08';
SELECT *
FROM flights
WHERE origin = 'Oakland'
AND destination = 'Philadelphia'
AND departure_time = '1:00 PM'
AND arrival_time = '5:00 PM';
SELECT MIN(Price)
FROM Flights
WHERE Origin = 'Dallas'
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Baltimore' AND departure_time < '08:00';
SELECT f.flight_id, f.origin, f.destination, f.num_stops
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'SFO'
ORDER BY f.num_stops DESC
SELECT * FROM flights WHERE airline = 'American Airlines' AND origin = 'Philadelphia' AND destination = 'Dallas';
SELECT f.flight_number, f.origin, f.destination, f.actual_arrival_time
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.destination = 'Baltimore' AND f.actual_arrival_time = '4:00';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, p.price
FROM flights f
JOIN prices p ON f.flight_id = p.flight_id
WHERE f.origin = 'la' AND f.destination = 'charlotte' AND f.departure_time >= '20
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'BAL'
AND arrival_time < '2023-10-26 10:00:00';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'DFW' AND (departure_time BETWEEN '10:00:00' AND '15:00:00')
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Philadelphia';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Pittsburgh' AND f.departure_date = 'Tuesday';
```
SELECT
▁▁f.flight_id,
▁▁f.origin_city,
▁▁f.destination_city,
▁▁f.departure_time,
▁▁f.arrival_time,
▁▁f.airline,
▁▁f.cost
FROM
▁▁flights f
WHERE
▁▁f.airline = 'United Airlines' AND
▁▁f.flight_
SELECT f.*
FROM flights f
WHERE f.origin = 'BOS'
AND f.destination = 'SFO'
AND f.stops = 1
AND f.airline = 'American';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Philadelphia'
AND f.destination = 'Pittsburgh'
AND f.departure_time >= '2023-10-24 06:00:00'
AND f.departure
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'PHL';
SELECT *
FROM flights
WHERE origin = 'PHL'
AND destination = 'PIT'
AND departure_time BETWEEN '16:30:00' AND '17:30:00';
SELECT *
FROM flights
WHERE airline = 'Midwest Express' AND origin = 'Detroit' AND destination = 'Chicago';
SELECT * FROM flights WHERE origin = 'BAL' AND destination = 'PHL';
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Denver';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Houston' AND f.departure_time < '2023-04-01';
SELECT *
FROM flights
WHERE origin = 'PHL'
AND destination = 'DEN'
AND dayofweek = 'Sunday';
SELECT *
FROM flights
WHERE carrier = 'DL' AND origin = 'DEN' AND destination = 'DAL' AND departure_time > '2023-03-10 05:00:00';
SELECT f.cost
FROM flights f
WHERE f.origin = 'Boston' AND f.dest = 'Denver' AND f.carrier = 'UA' AND f.flight_num IN (201, 343);
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Indianapolis' AND f.destination = 'Orlando' AND f.departure_time >= '2023-12-27' AND f.arrival_time <= '20
SELECT *
FROM flights
WHERE origin = 'Atlanta' AND destination = 'Washington DC' AND day = 'Wednesday' AND time > '16:00:00';
SELECT *
FROM flights
WHERE origin = 'Toronto' AND destination = 'Atlanta' AND departure_time >= '2023-03-23 12:00:00' AND departure_time < '2023-03-23 18:00:00';
SELECT DISTINCT f.aircraft_type
FROM flights f
WHERE f.origin = 'DEN'
AND f.destination = 'SFO'
AND f.scheduled_departure_time < '10:00';
SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'SFO' AND departure_time >= '12:00 PM' AND arrival_time <= '5:00 PM';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'DEN' AND f.destination = 'BAL';
```sql
SELECT
▁▁▁▁f.origin,
▁▁▁▁f.destination,
▁▁▁▁f.flight_date,
▁▁▁▁f.return_date
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'Dallas'
▁▁▁▁AND f.destination = 'Pittsburgh'
▁▁▁▁AND f.flight_date >= '2023-04-01'
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.ground_transportation_id
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.departure_time >= '2023-10-25 00:00:00' AND
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Orlando' AND f.destination = 'Kansas City'

SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'PHL';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Pittsburgh';
SELECT f.price
FROM flights f
WHERE f.airline = 'American Airlines' AND f.flight_number = '19' AND f.origin = 'New York' AND f.destination = 'Los Angeles';
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'DEN';
SELECT * FROM flights WHERE origin = 'San Francisco' AND destination = 'Pittsburgh';
SELECT *
FROM flights
WHERE airline = 'American Airlines'
AND origin = 'Boston'
AND destination = 'Denver';
SELECT f.flight_id, f.origin_city, f.dest_city, f.airline, f.fare_amount
FROM flights f
WHERE f.origin_city = 'San Francisco' AND f.dest_city = 'Denver' AND f.airline = 'United';
SELECT f.cost
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Boston' AND f.date = 'tomorrow';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.destination = 'Dallas' AND f.stops = 1 AND f.stop_city = 'Atlanta';
SELECT DISTINCT f.aircraft_type
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'SFO';
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'DEN';
SELECT * FROM flights WHERE origin = 'BOS' AND destination = 'ATL' AND date = '2023-03-15' ORDER BY departure_time ASC LIMIT 1;
SELECT * FROM flights WHERE origin = 'Charlotte' AND departure_time = '1pm';
SELECT f.flight_id, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.origin = 'Salt Lake City' AND f.destination = 'New York City' AND f.arrival_time < '18:00:00';
SELECT *
FROM flights
WHERE departure_city = 'Oakland'
AND arrival_city = 'Dallas'
AND departure_date = '2023-12-16';
SELECT f.price
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Baltimore' AND f.class = 'First';
SELECT f.fare
FROM flights f
WHERE f.airline = 'Delta' AND f.origin = 'Dallas' AND f.destination = 'San Francisco';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'CLEVELAND' AND f.destination = 'MIAMI' AND f.departure_time >= '2023-10-25 00:00:00
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'Philadelphia';
SELECT f.fl_num, f.origin, f.dest, f.actual_elapsed_time
FROM flights f
WHERE f.origin = 'LAS' AND f.dest = 'NYC' AND f.carrier = 'AWE';
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Washington';
SELECT iah FROM flights;
SELECT *
FROM flights
WHERE origin = 'ATL'
AND destination = 'BAL'
AND arrival_time = '19:00:00';
SELECT * FROM flights WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT * FROM flights WHERE origin = 'PHL' AND destination = 'DEN' AND day = 'Sunday';
SELECT *
FROM flights
WHERE origin = 'Montreal' AND destination = 'Charlotte';
SELECT COUNT(*)
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Philadelphia' AND
▁▁▁▁date = 'August 18';
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Pittsburgh';
SELECT f.origin, f.dest, f.price
FROM flights f
WHERE f.dest = 'WA'
ORDER BY f.price DESC
LIMIT 1;

SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'PIT';
SELECT
▁▁▁▁MIN(dep_time) AS earliest_flight
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'ATL' AND
▁▁▁▁dest = 'BOS';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'ATL'
AND f.destination = 'BOS'
AND f.departure_date = '2023-09-05'
ORDER BY f.departure_time
SELECT DISTINCT f.Airline
FROM Flights f
WHERE f.Origin = 'New York'
AND f.Destination = 'Miami'
AND f.DayOfWeek = 'Friday';
SELECT *
FROM flights
WHERE origin = 'BOS'
AND dayofweek(flight_date) = 3
AND departure_time BETWEEN '06:00:00' AND '11:00:00'
AND destination = 'DEN';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'PIT' AND f.destination = 'SFO' AND f.departure_time >= '2023-10-23 00:00:00'
```sql
SELECT DISTINCT f.origin, f.dest, f.arr_time, f.dep_time
FROM flights f
WHERE f.origin = 'BOS'
AND f.dest IN ('Boston', 'Cambridge', 'Somerville', 'Quincy', 'Brockton', 'Newton', 'Waltham', 'Watertown', 'Medford', 'Malden
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'San Francisco' AND day = 'Saturday' AND arrival < '16:00:00';
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'SFO';
SELECT *
FROM flights
WHERE airline = 'Delta' AND origin = 'Dallas' AND destination = 'Boston';
SELECT aircraft FROM flights WHERE co = '1209';
SELECT *
FROM flights
WHERE airline = 'Continental'
AND day_of_week = 'Monday'
AND departure_time < '12:00 PM'
AND origin = 'Denver'
AND destination = 'Chicago';
SELECT *
FROM flights
WHERE origin = 'Atlanta' AND destination = 'Boston';
SELECT *
FROM flights
WHERE airline = 'united' AND origin = 'san francisco' AND destination = 'boston';
SELECT COUNT(*)
FROM flights
WHERE airline = 'united' AND destination = 'san francisco';
SELECT *
FROM flights
WHERE origin = 'HOU'
AND destination = 'MEM'
AND day = 'Tuesday'
AND time >= '06:00:00'
SELECT * FROM flights WHERE origin = 'ATL' AND destination = 'PIT' AND one_way = 'TRUE' ORDER BY price ASC LIMIT 1;
SELECT f.ground_transportation, f.cost
FROM flights f
WHERE f.origin = 'PIT' AND f.destination = 'Downtown';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Pittsburgh';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Pittsburgh' AND f.departure_time >= '2023-10-23 06:00:00'
SELECT
▁▁flight_id,
▁▁origin,
▁▁destination,
▁▁departure_time,
▁▁arrival_time
FROM
▁▁flights
WHERE
▁▁origin = 'train' AND destination = 'newark';
SELECT f.fl_num, f.origin, f.dest, f.actual_time, f.tail_num
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'ATL' AND f.actual_time > '17:00:00';
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'Baltimore';
select distinct ff from flights;
```sql
SELECT DISTINCT f.tailnum
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
JOIN airports o ON f.origin = o.faa
JOIN airports d ON f.dest = d.faa
WHERE a.name = 'United Airlines'
AND o.city = 'Denver'
AND d.city = 'San Francisco'
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT f.flight_id, f.origin, f.destination, f.fare
FROM flights f
WHERE f.airline = 'united' AND f.origin = 'boston' AND f.destination = 'san francisco' AND f.class = 'first'
ORDER BY f.fare ASC
LIMIT 1;
SELECT f.origin, f.dest, f.one_way_price
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'DEN'
ORDER BY f.one_way_price ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'San Francisco';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'BAL' AND f.destination = 'DAL' AND f.departure_date >= '2023-03-01' AND f.arrival_date <= '20
SELECT *
FROM Flights
WHERE Destination = 'Atlanta';
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT *
FROM flights
WHERE origin = 'SEA' AND destination = 'SLC';
SELECT
▁▁▁▁MIN(flights.actual_departure_time) AS earliest_departure_time,
▁▁▁▁flights.origin,
▁▁▁▁flights.destination
FROM
▁▁▁▁flights
WHERE
▁▁▁▁flights.origin = 'PIT' AND
▁▁▁▁flights.destination = 'SFO';
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'BOS'
AND departure_time BETWEEN '12:00:00' AND '17:00:00';
SELECT ord FROM flights
SELECT f.fl_num, f.origin, f.dest, f.arr_time
FROM flights f
WHERE f.origin = 'Los Angeles' AND f.dest = 'Pittsburgh' AND f.arr_time < '17:00:00' AND f.day_of_week = 'Tuesday';

```
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'BWI' AND f.departure_time >= '2023-03-10 12:00:00'
ORDER BY f.departure_
SELECT COUNT(*)
FROM flights
WHERE dest = 'General Mitchell International';
SELECT DISTINCT f.dest_city_name
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE a.name = 'Air Canada' AND f.dest_country = 'Canada';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'PIT'
SELECT CAPACITY
FROM FLIGHTS
WHERE PLANE_TYPE = 'f28';
SELECT *
FROM car_rentals
WHERE city = 'Denver'
AND airport = 'DEN'
AND start_date >= '2023-10-29'
AND end_date <= '2023-10-29';
SELECT *
FROM flights
WHERE origin = 'MIA'
AND destination = 'CLE'
AND airline = 'US Air'
AND departure_time > '12:00 PM';
SELECT * FROM flights WHERE origin = 'Atlanta' AND destination = 'Washington' AND departure_time > '15:00:00';
SELECT *
FROM flights
WHERE origin = 'CLEVELAND' AND destination = 'MEMPHIS';
SELECT fare_code, fare_description
FROM fares
WHERE fare_code = 'qw';
SELECT *
FROM flights
WHERE origin = 'Cincinnati' AND destination = 'Toronto';
```
SELECT
▁▁DISTINCT f.flight_id,
▁▁f.origin,
▁▁f.destination,
▁▁f.departure_date,
▁▁f.arrival_date,
▁▁f.price
FROM
▁▁flights f
WHERE
▁▁f.origin = 'LAS'
▁▁AND f.destination = 'NYC'
▁▁AND f.num
SELECT *
FROM flights
WHERE origin = 'ATL' AND destination = 'BOS'
ORDER BY departure_time DESC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'MEM' AND destination = 'LAS';
```
SELECT f.flight_id, f.origin, f.destination, f.aircraft_type, f.arrival_time
FROM flights f
WHERE f.origin = 'Atlanta'
AND f.destination = 'Baltimore'
AND f.aircraft_type = 'Boeing 757'
AND f.arrival_time = '1900-
SELECT *
FROM flights
WHERE origin = 'St. Paul'
AND destination = 'Kansas City'
AND day = 'Friday'
AND dinner = 'Supper';
SELECT f.origin, f.dest FROM flights f WHERE f.origin = 'BOS' AND f.dest = 'BOS';
SELECT *
FROM flights
WHERE origin = 'BAL' AND destination = 'SFO';
SELECT
▁▁f.origin,
▁▁f.dest,
▁▁f.fare
FROM
▁▁flights f
WHERE
▁▁f.origin = 'DAL' AND
▁▁f.dest = 'DEN' AND
▁▁f.class = 'First';
SELECT *
FROM flights
WHERE airline = 'Continental' AND
▁▁▁▁▁▁origin = 'Seattle' AND
▁▁▁▁▁▁dayofweek = 'Sunday' AND
▁▁▁▁▁▁time > '4:30pm';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.duration, f.airline, f.model, f.num_stops, f.layover_time, f.base_price, f.total_price, f.currency, f.status
FROM flights f
WHERE
SELECT *
FROM flights
WHERE origin = 'Boston' AND destination = 'Dallas';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.price
FROM flights f
WHERE f.origin = 'Baltimore' AND f.destination = 'San Francisco'
ORDER BY f.price ASC
LIMIT 1;
SELECT * FROM flights WHERE airline = 'American' AND destination = 'San Francisco' AND day = 'Tuesday';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'BOS'
AND f.dest = 'DEN'
AND f.dep_time BETWEEN '12:00:00' AND '15:00:00';
SELECT *
FROM flights
WHERE DAYNAME(flight_date) = 'Monday'
AND origin = 'Philadelphia'
AND destination = 'Boston'
AND departure_time > '07:00:00';
SELECT * FROM flights WHERE destination = 'Salt Lake City';
SELECT f.fl_num, f.origin, f.dest, f.actual_time
FROM flights f
WHERE f.origin = 'Nashville, TN' AND f.dest = 'St. Louis, MO';
SELECT DISTINCT class
FROM flights;
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'San Francisco International Airport' AND f.destination_city = 'Downtown San Francisco';
SELECT *
FROM flights
WHERE origin = 'Atlanta' AND destination = 'Washington';
SELECT * FROM fare_codes WHERE fare_code = 'QO';
SELECT f.flight_id, f.origin, f.destination, f.airline
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Baltimore' AND f.airline IN ('American', 'Delta')
SELECT SUM(total_amount) AS limousine_cost
FROM bookings
WHERE city = 'Pittsburgh'
AND service = 'limousine';
SELECT MIN(one_way_fare)
FROM flights
WHERE origin = 'BOS' AND destination = 'DCA';
SELECT *
FROM flights
WHERE origin = 'Miami'
AND destination = 'Las Vegas'
AND DAYNAME(flight_date) = 'Sunday'
AND HOUR(flight_time) < 12;
SELECT f.fl_num, f.origin, f.dest, f.actual_time, f.air_time, f.distance, f.capacity, f.price
FROM flights f
WHERE f.origin = 'ATL' AND f.dest = 'SFO';
```sql
SELECT f.flight_id, f.departure_city, f.arrival_city, f.departure_time, f.arrival_time
FROM flights f
WHERE f.departure_city = 'DEN'
AND f.arrival_city = 'SFO'
AND f.departure_time < '2023-03-20
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'MIAMI'
AND airline = 'US AIRLINES'
AND arrival_time < '16:00';
SELECT distinct class_of_service
FROM flights
WHERE airline = 'Lufthansa';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'Washington' AND f.dest = 'Denver'
SELECT f.meal
FROM flights f
WHERE f.flight_num = 'ua 270'
AND f.origin = 'denver'
AND f.dest = 'philadelphia';
```
SELECT *
FROM flights
WHERE origin = 'PIT'
AND (departure_time BETWEEN '12:00 PM' AND '4:00 PM')
AND airline IN ('American Airlines', 'Delta Air Lines', 'United Airlines', 'Southwest Airlines', 'JetBlue Airways', 'Spirit Airlines', 'Frontier Airlines', 'Hawaiian Airlines', 'Alaska Airlines',
SELECT *
FROM flights
WHERE origin = 'CLEVELAND'
AND destination = 'MIAMI'
AND day = 'WEDNESDAY';
```sql
SELECT f.flight_id, f.origin, f.destination, f.arrival_time
FROM flights f
WHERE f.origin = 'OAK' AND f.destination = 'PHL' AND f.arrival_time >= '17:00:00' AND f.arrival_time <= '18:00:00';
SELECT *
FROM flights
WHERE origin = 'PHX'
AND destination = 'MKE'
AND dayofweek = 'Wednesday';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.base_price, f.num_stops, f.duration, f.airline, f.aircraft, f.layover_city, f.layover_time, f.layover_airport, f.layover_
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Houston' AND stops = 0;
SELECT *
FROM flights
WHERE origin = 'Chicago'
AND destination = 'Milwaukee'
AND departure_time >= '16:00:00'
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Atlanta'
AND f.destination = 'Washington DC'
AND f.departure_time >= '2023-03-01'
AND f.departure_time <
SELECT f.fl_num, f.origin, f.dest, f.dept_time, f.carrier
FROM flights f
WHERE f.origin = 'PHL' AND f.dest = 'DAL' AND f.dept_time < '12:00:00' AND f.carrier = 'AA';
SELECT fare FROM flights WHERE airline = 'American Airlines' AND flight_number = '928' AND origin = 'Dallas Fort Worth' AND destination = 'Boston';
SELECT
▁▁name,
▁▁distance
FROM
▁▁airports
WHERE
▁▁name = 'Dallas Fort Worth Airport';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
WHERE a.name = 'American Airlines' AND f.origin = 'Cincinnati' AND f.destination = 'Burbank' AND f.
SELECT DISTINCT f.Airline
FROM Flights f
WHERE f.Origin = 'WA' AND f.Destination = 'SF';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'LAS' AND f.destination = 'NYC' AND f.num_stops = 0;
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'Atlanta';
SELECT *
FROM flights
WHERE origin = 'Phoenix' AND destination = 'Las Vegas';
SELECT f.fl_num
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE a.name = 'Continental' AND f.dest = 'Chicago' AND f.day_of_week = 'Sunday';
```sql
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'PHL'
AND dayofweek(flight_date) = 6
AND flight_date > (SELECT flight_date FROM flights WHERE dayofweek(flight_date) = 1 AND origin = 'DEN' AND destination = 'PHL')
AND EXTRACT(hour
SELECT *
FROM flights
WHERE origin = 'Love Field';
SELECT *
FROM flights
WHERE origin = 'Love Field' OR destination = 'Love Field';
SELECT
▁▁▁▁COUNT(*) AS total_flights
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'BOS' AND
▁▁▁▁destination = 'OAK' AND
▁▁▁▁stops = 'DEN';
SELECT f.flight_id, f.origin, f.destination, f.fare
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Atlanta' AND f.fare = 'Economy';
SELECT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'San Francisco International Airport'
SELECT *
FROM flights
WHERE origin = 'ATL' AND destination = 'DEN';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'San Francisco';
SELECT *
FROM flights
WHERE origin = 'Oakland' AND destination = 'San Francisco';
SELECT *
FROM flights
WHERE origin = 'New York' AND destination = 'Miami' AND
▁▁▁▁▁▁day_of_week = 'Tuesday' AND return_day_of_week = 'Sunday';
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'BAL'
AND date = '1991-07-25'
AND class = 'first';
SELECT *
FROM flights
WHERE airline = 'American Airlines' AND origin = 'Milwaukee' AND destination = 'Phoenix';
SELECT MIN(fare) AS lowest_fare
FROM flights
WHERE origin = 'ATL' AND destination = 'BWI';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'YYZ' AND f.dest = 'DEN';
SELECT f.fare
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Oakland' AND f.date = '2023-11-07';
SELECT * FROM flights WHERE origin = 'ewr';
SELECT f.flight_id, f.origin, f.destination, f.airline, f.departure_time
FROM flights f
WHERE f.origin = 'Chicago'
AND f.destination = 'Seattle'
AND f.airline = 'Continental Airlines'
AND f.departure_time < '08:00:00';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.airline, f.class
FROM flights f
WHERE f.origin = 'DEN' AND f.destination = 'BAL' AND f.airline = 'United' AND f.class = 'First';
SELECT * FROM flights WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT * FROM flights WHERE origin = 'PIT' AND destination = 'OAK' AND departure_time >= '2023-10-26 00:00:00' AND departure_time < '2023-10-27 00:00:00';
SELECT f.flight_id, f.origin, f.destination, f.base_price
FROM flights f
WHERE f.flight_id = 'ua 297' AND f.origin = 'denver' AND f.destination = 'san francisco';
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'San Francisco';
SELECT * FROM flights WHERE origin = 'atlanta' AND destination = 'oakland' AND day = 'thursday';
SELECT *
FROM flights
WHERE origin = 'Tampa'
AND destination = 'St. Louis'
AND departure_time < '10:00';
SELECT *
FROM flights
WHERE airline = 'American Airlines' AND origin = 'Philadelphia' AND destination = 'Dallas';

SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Baltimore' AND departure_time >= '06:00:00' AND departure_time < '12:00:00';
```
SELECT DISTINCT f.dest_city_name
FROM flights f
JOIN airlines a ON f.carrier = a.carrier
WHERE a.country = 'Canada' AND f.dest_city_name NOT IN (
▁▁SELECT DISTINCT f2.dest_city_name
▁▁FROM flights f2
▁▁JOIN airlines a2 ON f2.carrier = a2

SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.airline
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Boston' AND f.airline = 'Delta' AND f.stopover = 'Dallas Fort Worth';
SELECT * FROM flights WHERE origin = 'Boston' AND destination = 'Washington DC' AND departure_time > '2023-11-11 17:00:00' AND class = 'Economy';
SELECT *
FROM flights
WHERE origin = 'ATL' AND destination = 'BOS';
SELECT *
FROM flights
WHERE origin = 'Cincinnati' AND destination = 'Houston';
SELECT f.*
FROM flights f
WHERE f.origin = 'DEN' AND f.dest = 'SFO' AND f.origin != 'DEN' AND f.dest != 'PHL';
SELECT *
FROM flights
WHERE origin = 'New York' AND destination = 'Miami';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'PIT' AND f.dest = 'BAL';
SELECT * FROM flights WHERE origin = 'sa';
SELECT *
FROM flights
WHERE airline = 'united'
AND origin = 'bwi'
AND destination = 'denver';
SELECT *
FROM flights
WHERE origin = 'ATL'
AND destination = 'DCA'
AND day = 'Thursday'
AND time < '0900';
SELECT f.fl_num, f.origin, f.dest
FROM flights f
WHERE f.origin = 'Newark' AND f.dest = 'Nashville' AND f.carrier = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'Dallas' AND day = 'Monday';
SELECT *
FROM flights
WHERE origin = 'Boston'
AND destination = 'Washington DC'
AND date = '2023-11-11';
SELECT f.origin, f.dest, f.ground_transportation
FROM flights f
WHERE f.origin = 'Orlando International Airport' AND f.dest = 'Orlando';
SELECT *
FROM flights
WHERE origin = 'Chicago'
AND destination = 'San Francisco'
AND airline = 'Continental';
```
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'LAS'
AND f.destination = 'BUR'
AND f.departure_time >= '2023-05-20 00:00:00'
SELECT *
FROM flights
WHERE origin = 'Atlanta'
AND destination = 'St. Louis'
AND dayofweek = 'Tuesday'
AND arrivaltime = '230pm';
SELECT f.flight_id, f.origin, f.destination, f.airline
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.destination = 'San Francisco' AND f.airline = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'St. Louis' AND day = 'Sunday' AND time = 'Morning';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'EWR';
SELECT f.aircraft_type
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Atlanta' AND f.scheduled_departure = '08:00:00';
SELECT DISTINCT f.ground_transport
FROM flights f
WHERE f.city = 'Seattle';
SELECT * FROM flights WHERE origin = 'PIT' AND destination = 'BOS' ORDER BY price ASC LIMIT 1;
SELECT * FROM flights WHERE origin = 'BOS' AND destination = 'ATL' AND departure_time >= '12:00 PM' AND arrival_time <= '6:00 PM';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'ATL' AND f.destination = 'SFO' AND f.departure_time >= '12:00:00' AND f.departure_time < '18:
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'Philadelphia';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Dallas';
SELECT * FROM flights WHERE origin = 'BOS' AND destination = 'SFO' AND stops > 3;
SELECT
▁▁▁▁*
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'Dallas' AND destination = 'Baltimore'
ORDER BY
▁▁▁▁price ASC
LIMIT 1;
SELECT f.dep_time
FROM flights f
WHERE f.origin = 'OAK' AND f.dest = 'BOS'
ORDER BY f.dep_time ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'ATL'
AND destination = 'DCA'
AND dayofweek = '4'
ORDER BY departuretime ASC
LIMIT 1;
SELECT f.flight_id, f.origin, f.destination, f.scheduled_departure_time
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Boston'
ORDER BY f.scheduled_departure_time ASC
LIMIT 1;
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'PIT' AND f.destination = 'DEN';
```
SELECT
▁▁▁▁f.flight_id,
▁▁▁▁f.origin,
▁▁▁▁f.destination,
▁▁▁▁f.departure_time
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'St. Petersburg'
▁▁▁▁AND f.destination = 'Milwaukee'
▁▁▁▁AND f.departure_time >= '2023-10-26
SELECT *
FROM flights
WHERE origin = 'MEM' AND destination = 'CLT';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.destination = 'Dallas' AND f.num_stops = 1;
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'Oakland' AND f.destination = 'Boston';
SELECT DISTINCT
▁▁▁▁car_rental_cost
FROM
▁▁▁▁flights
WHERE
▁▁▁▁city = 'Denver';
```sql
SELECT
▁▁▁▁f.flight_id,
▁▁▁▁f.origin,
▁▁▁▁f.destination,
▁▁▁▁f.departure_date,
▁▁▁▁f.return_date,
▁▁▁▁f.fare
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'MSP' AND
▁▁▁▁f.destination = 'SAN' AND
▁▁▁▁f.class =
SELECT *
FROM flights
WHERE origin = 'Atlanta' AND destination = 'Denver';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'ATL';
SELECT f.origin, f.dest, f.date, f.price
FROM flights f
WHERE f.origin = 'OAK' AND f.dest = 'DAL' AND f.date = '2023-12-16' AND f.one_way = 'true';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'ATL';
SELECT f.fare
FROM flights f
JOIN meals m ON f.meal_id = m.meal_id
WHERE f.origin = 'Boston' AND f.destination = 'Pittsburgh' AND f.departure_time < '12:00:00' AND f.day_of_week = 'Thursday';
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'PHL';
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'Pittsburgh' AND month = 'July' AND day = '8';
SELECT f.fl_date, f.op_unique_carrier, f.origin, f.dest, f.crs_dep_time, f.crs_arr_time
FROM flights f
WHERE f.fl_date = '2023-09-20'
AND f.op_unique_carrier = 'UA'
AND f.origin
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Baltimore';
SELECT * FROM flights WHERE origin = 'Oakland' AND destination = 'Boston' AND stopover = 'Dallas Fort Worth';
SELECT *
FROM flights
WHERE origin = 'San Francisco'
AND destination = 'Pittsburgh'
AND departure_time BETWEEN '06:00:00' AND '12:00:00';
SELECT *
FROM flights
WHERE origin = 'Columbus' AND destination = 'Baltimore';
SELECT f.fare_code, f.fare_description
FROM flights f
WHERE f.fare_code = 'QX';
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Dallas' AND arrival_time LIKE '%pm%'
SELECT f.price
FROM flights f
WHERE f.airline = 'Delta' AND f.origin = 'Dallas' AND f.destination = 'Baltimore';
SELECT aircraft_type
FROM flights
WHERE flight_number = '825' AND origin = 'ATL' AND destination = 'DEN' AND departure_time = '555';
SELECT f.flight_id, f.origin, f.destination, f.airline, f.departure_time
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'OAK' AND f.airline = 'United' AND f.departure_time = '08:38:00';
```sql
SELECT f.fl_num, f.origin, f.dest, f.dep_date, f.dep_time
FROM flights f
WHERE f.origin = 'CHI'
AND f.dep_date = '2023-10-28'
AND f.dep_time >= '06:00:00
SELECT * FROM flights WHERE code = y;
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.duration, f.status, f.airplane_id,
▁▁▁▁▁▁▁ff.fare_id, ff.price, ff.currency, ff.class, ff.seat_number
FROM flights f
JOIN flight_fares ff
SELECT f.flight_id, f.origin, f.destination, f.airline
FROM flights f
WHERE f.origin = 'Washington' AND f.destination = 'Denver' AND f.airline = 'United';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'ATL';
SELECT f.ground_transportation
FROM flights f
WHERE f.origin = 'San Francisco';
SELECT *
FROM flights
WHERE origin = 'Phoenix'
AND day_of_week = 'Wednesday'
AND time_of_day = 'Evening'
AND destination = 'Milwaukee';
SELECT *
FROM flights
WHERE airline = 'Delta' AND destination = 'Atlanta';
SELECT yncode FROM flights;
SELECT
▁▁flight_number,
▁▁actual_arrival_time
FROM
▁▁flights
WHERE
▁▁day_of_week = 'Wednesday'
▁▁AND origin = 'Atlanta'
▁▁AND destination = 'Washington DC'
ORDER BY
▁▁actual_arrival_time DESC
LIMIT 1;
SELECT f.fl_num, f.origin, f.dest, f.actual_arrival
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'DCA' AND f.actual_arrival > '16:00:00';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Washington DC';
SELECT *
FROM flights
WHERE origin = 'BOS'
AND destination = 'ATL'
AND date = '2023-11-07';
SELECT *
FROM flights
WHERE origin = 'Oakland' AND destination = 'Denver' AND departure_time >= '06:00:00' AND departure_time < '12:00:00';
SELECT *
FROM flights
WHERE origin = 'PHL'
AND destination = 'DEN'
AND departure_time BETWEEN '14:00:00' AND '15:00:00';
SELECT *
FROM flights
WHERE origin = 'Kansas City'
AND destination = 'Burbank'
AND airline = 'America West'
AND day = 'Saturday'
AND month = 'May'
AND year = '2022';
SELECT * FROM flights WHERE origin = 'DET' AND destination = 'SPB' AND dayofweek = 'Tuesday';
SELECT
▁▁▁▁MIN(total_amount) AS cheapest_flight
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin_city = 'Atlanta' AND
▁▁▁▁destination_city = 'Pittsburgh' AND
▁▁▁▁flight_type = 'Roundtrip';
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'Dallas';
SELECT COUNT(*)
FROM flights
WHERE airline = 'united'
AND class = 'first'
AND departure_date = CURDATE();
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'San Francisco';

SELECT *
FROM flights
WHERE origin = 'BAL'
AND destination = 'PHL'
AND arrival_time > '2100';
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'ATL'
AND day = 'Wednesday'
SELECT *
FROM flights
WHERE origin = 'DEN'
AND (destination = 'PIT' OR destination = 'ATL')

SELECT *
FROM flights
WHERE origin = 'oakland' AND destination = 'philadelphia';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'Chicago'
AND f.destination = 'Seattle'
AND f.departure_date = '2023-04-01'
SELECT *
FROM flights
WHERE origin_airport = 'LGA' AND destination_airport = 'JFK';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'DEN'
ORDER BY f.departure_time ASC
LIMIT 1;
```
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Tampa, FL'
AND f.destination = 'Charlotte, NC'
AND f.departure_date = '2023-04-06
SELECT MIN(Price) AS CheapestPrice
FROM Flights
WHERE DepartureCity = 'Memphis' AND ArrivalCity = 'Miami';
```
SELECT f.fl_num, f.origin, f.dest, f.dep_time, f.arr_time
FROM flights f
WHERE f.origin = 'DEN' AND f.dest = 'SFO' AND f.dep_time >= '12:00:00' AND f.dep_time < '18:0
SELECT COUNT(*)
FROM ground_transportation
WHERE city = 'Dallas'
AND origin = 'Dallas Airport'
AND destination = 'Downtown Dallas';
SELECT *
FROM flights
WHERE origin = 'Atlanta'
AND destination = 'Boston'
AND price = 124

SELECT *
FROM flights
WHERE origin = 'HOU'
AND destination = 'LAS'
SELECT *
FROM flights
WHERE origin = 'San Jose' AND destination = 'St. Paul';
SELECT COUNT(*)
FROM aircraft
WHERE model = '734';
SELECT * FROM airports WHERE code = 'EWR';

SELECT * FROM flights WHERE origin = 'PIT' AND destination = 'NYC';
SELECT
▁▁▁▁COUNT(*) AS num_flights
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'St. Petersburg'
▁▁▁▁AND destination = 'Milwaukee'
▁▁▁▁AND departure_date = 'tomorrow'
▁▁▁▁AND departure_time = 'morning'
▁▁▁▁AND stops = 1;
SELECT airline_name
FROM airlines
WHERE airline_code = 'ea';
SELECT * FROM airlines WHERE airline_id = 'US';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.city = 'Denver';
SELECT *
FROM flights
WHERE airline = 'American Airlines' AND origin = 'Phoenix' AND destination = 'Denver';
SELECT *
FROM flights
WHERE origin = 'Washington'
AND destination = 'Denver'
AND departure_time = '3:00 PM';
SELECT *
FROM flights
WHERE origin = 'Orlando'
AND destination = 'San Diego'
AND aircraft = 'Boeing 737';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.price
FROM flights f
WHERE f.origin = 'LAS' AND f.destination = 'NYC' AND f.departure_time = '7:18 AM';

SELECT f.origin, f.dest, f.dep_date, f.dep_time, f.arr_date, f.arr_time
FROM flights f
WHERE f.origin = 'PIT' AND f.dest = 'DEN'
SELECT DISTINCT f.ground_transport
FROM flights f
WHERE f.city = 'San Francisco';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
WHERE f.origin = 'DEN' AND f.departure_time < '12:00 PM' AND a.airline_name = 'Northwest Airlines';
SELECT * FROM flights WHERE destination = 'General Mitchell International';
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'PHL';
SELECT DISTINCT f.name
FROM flights f
WHERE f.city = 'Boston';
SELECT *
FROM flights
WHERE origin = 'Baltimore';
SELECT * FROM flights WHERE flight_number = 'ap/80';
SELECT
▁▁▁▁SUM(f.price) AS total_cost
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'DEN'
▁▁▁▁AND f.destination = 'PIT'
▁▁▁▁AND f.flight_type = 'roundtrip';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'SFO';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'SFO';
SELECT f.fare
FROM flights f
WHERE f.airline = 'US Air' AND f.origin = 'Boston' AND f.destination = 'Philadelphia';
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'DAL'
AND departure_time BETWEEN '12:00 PM' AND '5:00 PM';

SELECT f.fl_num, f.arr_time
FROM flights f
WHERE f.origin = 'BOS' AND f.dest = 'ATL'
ORDER BY f.arr_time ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'Toronto' AND destination = 'Salt Lake City' AND departure_time BETWEEN '17:30:00' AND '19:00:00';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.airline = 'Delta Airlines' AND f.origin = 'Atlanta' AND f.destination = 'Pittsburgh';
SELECT * FROM flights WHERE origin = 'Washington DC' AND destination = 'Philadelphia' AND day = 'Tuesday' AND time = 'Morning';

SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'BOS' AND day = 'Wednesday' AND day_of_month = '20';
SELECT *
FROM flights
WHERE departure_city = 'DEN'
AND airline = 'Delta';
SELECT f.ground_transportation
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'BOS';
SELECT f.fl_date, f.origin, f.dest, f.dep_time
FROM flights f
WHERE f.origin = 'Tampa' AND f.dest = 'Milwaukee' AND f.fl_date = 'tomorrow'
ORDER BY f.dep_time ASC
LIMIT 1;
SELECT f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Toronto' AND f.destination = 'San Diego' AND f.layover = 'Denver';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Washington DC' AND month = 'December' AND day = '1';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'BAL'
AND f.destination = 'EWR'
AND f.departure_time >= '2023-03-01'
AND f.departure_time
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'PHL'
AND departure_date = DATE(NOW() + INTERVAL '2 WEEK')
SELECT
▁▁▁▁flight_id,
▁▁▁▁origin,
▁▁▁▁destination,
▁▁▁▁fare
FROM
▁▁▁▁flights
WHERE
▁▁▁▁origin = 'PIT' AND
▁▁▁▁destination = 'ATL' AND
▁▁▁▁class = 'coach';
SELECT COUNT(*)
FROM airport_limos
WHERE airport_code = 'ATL';
SELECT f.flight_id, f.origin, f.destination, f.scheduled_departure
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'SFO'
ORDER BY f.scheduled_departure DESC
LIMIT 1
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'Charlotte' AND f.destination = 'Atlanta' AND f.departure_date = 'next Tuesday';
SELECT
▁▁▁▁SUM(f.base_price) AS cost
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'OAK' AND
▁▁▁▁f.destination = 'ATL' AND
▁▁▁▁f.class = 'first' AND
▁▁▁▁f.roundtrip = 'true';
SELECT *
FROM flights
WHERE origin = 'Nashville, TN' AND destination = 'Seattle, WA';
```
SELECT f.fl_num, f.origin, f.dest, f.actual_time, f.arr_time, f.tail_num, f.class, f.fare
FROM flights f
WHERE f.origin = 'ATL'
AND f.dest = 'DEN'
AND f.class = 'F'
ORDER BY f.actual
SELECT f.flight_id, f.origin, f.destination, f.day_of_week
FROM flights f
WHERE f.origin = 'Newark' AND f.destination = 'Cleveland' AND f.day_of_week = 'Daily';
SELECT f.fl_num, f.origin, f.dest, f.actual_elapsed_time, f.arr_time, f.dep_time, f.tail_num, f.flight_id
FROM flights.flights f
WHERE f.origin = 'IND' AND f.dest = 'SEA'
SELECT * FROM flights WHERE origin = 'San Francisco' AND destination = 'Pittsburgh' AND day = 'Monday' AND class = 'First';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'Seattle' AND day = 'Saturday' AND time = 'Morning';
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'LAX'
AND DAYNAME(departure_time) = 'Thursday'
AND HOUR(departure_time) >= 18;
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time, f.num_seats, f.base_price, f.num_stops
FROM flights f
WHERE f.origin = 'Indianapolis' AND f.destination = 'Orlando' AND f.departure_time >= '202
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Philadelphia' AND date = '2023-09-15';
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'OAK'
ORDER BY departure_time ASC
LIMIT 1;
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'Washington DC';
SELECT *
FROM flights
WHERE origin = 'Washington' AND destination = 'San Francisco';
```sql
SELECT f.origin, f.dest, f.date, f.time, f.duration, f.num_stops, f.airline, f.flight_num
FROM flights f
WHERE f.origin = 'ORD' AND f.dest = 'LAX' AND f.date = '2023-03-15' AND f
SELECT *
FROM flights
WHERE origin = 'PHL' AND destination = 'OAK' AND day = 'Friday' AND time = 'Afternoon';
SELECT f.flight_id, f.origin, f.destination, f.meal
FROM flights f
WHERE f.origin = 'St. Paul' AND f.destination = 'Kansas City' AND f.day = 'Friday' AND f.meal = 'Yes';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Long Beach' AND f.destination = 'St. Louis' AND f.stops = 'Dallas';
SELECT
▁▁▁▁f.actual_arrival - f.actual_departure AS flight_duration
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'Kansas City' AND f.destination = 'St. Paul';
SELECT *
FROM flights
WHERE origin = 'Los Angeles' AND destination = 'Pittsburgh';
SELECT *
FROM flights
WHERE origin = 'DEN'
AND destination = 'PHL';
SELECT *
FROM flights
WHERE origin = 'Philadelphia' AND destination = 'San Francisco';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time
FROM flights f
WHERE f.origin = 'DEN'
AND f.destination = 'SFO'
AND f.departure_date = '2023-10-15'
AND f.departure_time
SELECT *
FROM flights
WHERE origin = 'DEN' AND destination = 'SLC';
SELECT DISTINCT class FROM flights WHERE carrier = 'TWA';
SELECT * FROM flights WHERE origin = 'BAL' AND destination = 'OAK' AND departure_time BETWEEN '12:00 PM' AND '5:00 PM';
```sql
SELECT f.fl_date, f.op_unique_carrier, f.tail_num, f.origin, f.dest, f.crs_dep_time
FROM flights f
WHERE f.origin = 'DAL' AND f.dest = 'IAH'
ORDER BY f.fl_date ASC, f.crs_dep_time ASC
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'BAL'
AND f.destination = 'SEA'
AND f.departure_date >= '2023-03-01'
AND f.arrival_date <=
SELECT
▁▁COUNT(*) AS num_flights
FROM
▁▁flights
WHERE
▁▁origin = 'San Francisco' AND
▁▁destination = 'Boston' AND
▁▁stops = 'Dallas Fort Worth';
```
SELECT
▁▁airport.name AS airport_name,
▁▁airports.city AS airport_city,
▁▁airports.state AS airport_state,
▁▁airports.country AS airport_country,
▁▁airports.latitude AS airport_latitude,
▁▁airports.longitude AS airport_longitude
FROM
▁▁airports
WHERE
▁▁airports
SELECT airline
FROM airlines
WHERE airline = 'dl';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.destination = 'Love Field'
ORDER BY f.departure_time DESC
LIMIT 1;
SELECT * FROM flights WHERE arrival_airport = 'General Mitchell International Airport';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'New York' AND f.destination = 'Los Angeles' AND f.stop = 'Milwaukee';
SELECT *
FROM flights
WHERE origin = 'Philadelphia'
AND destination = 'Dallas'
AND airline = 'American Airlines';
SELECT *
FROM flights
WHERE origin = 'Westchester County' AND destination = 'Cincinnati';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Pittsburgh' AND DAYNAME(departure_time) = 'Monday';
SELECT MIN(Price) AS lowest_price
FROM Flights
WHERE Origin = 'Boston' AND Destination = 'Washington';
SELECT * FROM flights WHERE origin = 'San Francisco' AND destination = 'Washington' AND departure_time = (SELECT MAX(departure_time) FROM flights WHERE origin = 'San Francisco' AND destination = 'Washington' AND departure_time LIKE '%19:00%');
SELECT DISTINCT f.ground_transport
FROM flights f
WHERE f.origin = 'Minneapolis';
SELECT type
FROM planes
WHERE model = 'm80';
SELECT *
FROM flights
WHERE origin = 'PIT' AND destination = 'PHL' AND departure_time < '09:00';
SELECT f.price
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'Baltimore' AND f.class = 'Economy';
SELECT airport_code
FROM airports
WHERE city = 'Tampa';
SELECT *
FROM flights
WHERE origin = 'BOS' AND departure_date = '2023-10-26';
SELECT * FROM flights WHERE origin = 'ATL' AND destination = 'BAL';
SELECT f.price
FROM flights f
WHERE f.origin = 'Baltimore' AND f.destination = 'Dallas' AND f.date = '2023-07-29';
SELECT *
FROM flights
WHERE origin = 'HOU' AND destination = 'LAS';
```sql
SELECT f.origin, f.dest, f.dept_date, f.dept_time, f.arr_date, f.arr_time, f.carrier, f.flight_num, f.base_price, f.fuel_surcharge, f.total_price
FROM flights f
WHERE f.origin = 'New York' AND
SELECT *
FROM flights
WHERE origin = 'sfo' AND destination = 'denver';
SELECT * FROM flights WHERE origin = 'Dallas' AND destination = 'Tampa';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_date, f.arrival_time
FROM flights f
WHERE f.origin = 'DEN' AND f.destination = 'SFO' AND f.airline = 'United' AND f.departure_time >= '
SELECT *
FROM flights
WHERE origin = 'Baltimore' AND destination = 'Philadelphia';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Phoenix' AND f.destination = 'Detroit' AND f.departure_time LIKE '%Tuesday%';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Toronto'
AND f.destination = 'San Diego'
AND f.stop_city = 'St. Louis';
SELECT f.flight_id, f.origin, f.destination, f.meal_service
FROM flights f
WHERE f.origin = 'Atlanta' AND f.destination = 'Denver' AND f.meal_service = 'Yes'
ORDER BY f.departure_time ASC
LIMIT 1;
SELECT f.fl_date, f.origin, f.dest, f.dep_time, f.arr_time
FROM flights f
WHERE f.origin = 'San Francisco' AND f.dest = 'Atlanta';
SELECT *
FROM flights
WHERE origin = 'Washington DC' AND destination = 'Philadelphia' AND date = '2023-12-02';
SELECT *
FROM flights
WHERE origin = 'Baltimore'
AND destination = 'San Francisco'
AND arrival_time = '2023-10-27 20:00:00';
SELECT *
FROM flights
WHERE origin = 'Boston' AND destination = 'San Francisco';
SELECT DISTINCT f.aircraft_type
FROM flights f
WHERE f.origin = 'ATL'
AND f.destination = 'DEN'
AND f.scheduled_departure < '18:00:00';
SELECT *
FROM flights
WHERE origin = 'Columbus'
AND destination = 'Nashville'
AND departure_time >= '2023-10-26 06:00:00'
AND departure_time < '2023-10-26 12:00:00';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Boston' AND date = '1991-08-31';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.departure_time, f.arrival_time, f.base_price
FROM flights f
WHERE f.origin = 'New York' AND f.destination = 'Miami' AND f.departure_day = 'Tuesday';
SELECT *
FROM flights
WHERE origin = 'PHOENIX'
AND destination = 'MILWAUKEE'
AND airline = 'AMERICA'
AND day_of_week = 'WEDNESDAY';
SELECT *
FROM flights
WHERE origin = 'Tampa' AND destination = 'Cincinnati';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.city = 'Philadelphia';
SELECT *
FROM rentalcars
WHERE state = 'DC';
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'ATL' OR origin = 'ATL' AND destination = 'BOS';
SELECT f.fare
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'San Francisco';
SELECT
▁▁▁▁f.origin,
▁▁▁▁f.dest,
▁▁▁▁f.distance
FROM
▁▁▁▁flights f
WHERE
▁▁▁▁f.origin = 'Dallas/Fort Worth International Airport'
▁▁▁▁AND f.dest = 'Downtown Dallas';
SELECT f.origin, f.dest, f.roundtrip
FROM flights f
WHERE f.origin = 'San Jose' AND f.dest = 'Salt Lake City';
SELECT f.fare
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Dallas Fort Worth' AND f.airline = 'Delta' AND f.flight_number = '852';
SELECT *
FROM flights
WHERE origin = 'PIT'
AND destination = 'PHL'
AND day = 'next tuesday'
AND arrival_time = '6:00';
SELECT f.origin, f.dest, f.price
FROM flights f
WHERE f.origin = 'Dallas' AND f.dest = 'Baltimore'
ORDER BY f.price ASC
LIMIT 1;
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'BOS' AND f.destination = 'DEN' AND f.departure_time >= '06:00:00';
SELECT MIN(one_way_fare)
FROM flights
WHERE origin = 'DEN' AND destination = 'ATL';
SELECT f.flight_id, f.origin, f.destination, f.departure_time
FROM flights f
WHERE f.origin = 'Baltimore' AND f.destination = 'Dallas' AND f.departure_time LIKE '%02:00%' AND f.day_of_week = 'Tuesday';
SELECT *
FROM flights
WHERE origin = 'Chicago' AND destination = 'Nashville';
SELECT *
FROM flights
WHERE departure_city = 'Boston'
AND arrival_city = 'San Francisco'
AND departure_date = '1992-01-01';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Denver' AND DAYOFWEEK(flight_date) = 5;
SELECT COUNT(*)
FROM flights
WHERE origin = 'BOS' AND destination = 'ATL' AND stops = 0;
SELECT *
FROM flights
WHERE origin = 'OAK'
AND destination = 'BOS'
AND airline = 'TWA';
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'LAS' AND f.destination = 'NYC' AND f.num_stops = 0;
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'ATL' AND departure_time < '05:00:00' AND day_of_week = 'Thursday';
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'Philadelphia' AND f.destination = 'Dallas' AND f.stops = 'Atlanta';
SELECT f.*
FROM flights f
WHERE f.origin = 'St. Petersburg' AND f.destination = 'Toronto' AND f.day_of_week = 'Monday';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'PIT';
SELECT f.price
FROM flights f
WHERE f.flight_number = 'ua 270' AND f.origin = 'denver' AND f.destination = 'philadelphia';
SELECT DISTINCT f.carrier FROM flights f WHERE f.dest = 'PIT';
SELECT f.flight_id, f.origin, f.destination, f.stops
FROM flights f
WHERE f.origin = 'MEM' AND f.destination = 'TAC' AND f.stops = 'LAX';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.duration, f.status, f.airplane_id,
▁▁▁▁▁▁▁ff.fare_id, ff.amount, ff.currency, ff.type
FROM flights f
JOIN flight_fares ff ON f.flight_id
SELECT *
FROM flights
WHERE origin = 'Toronto' AND destination = 'San Francisco';
SELECT f.fare
FROM flights f
WHERE f.airline = 'Delta' AND f.flight_number = 217 AND f.origin = 'Dallas' AND f.destination = 'San Francisco';
SELECT *
FROM flights
WHERE origin = 'BOS'
AND destination = 'ATL'
AND day = 'Wednesday'
AND time > '6:00 pm';
SELECT * FROM flights WHERE airline = 'US Air' AND origin = 'Indianapolis' AND destination = 'San Diego' AND departure_time >= '12:00:00' AND departure_time < '18:00:00';
SELECT *
FROM flights
WHERE origin = 'Boston' AND destination = 'Denver' AND date = 'today';
SELECT f.flight_id, f.origin, f.destination
FROM flights f
WHERE f.origin = 'PIT' AND f.destination = 'DTW';
SELECT *
FROM flights
WHERE origin = 'Milwaukee' AND destination = 'Montreal';
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'PHL'
ORDER BY departure_time ASC
LIMIT 1;
SELECT flight_number
FROM flights
WHERE origin = 'Minneapolis' AND destination = 'Long Beach' AND date = '2023-06-26';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'PHL' AND f.destination = 'DAL' AND f.stop = 'hartfield';
SELECT DISTINCT f.carrier
FROM flights f
WHERE f.origin = 'PIT'
AND f.dest = 'SFO'
AND f.day = 'Monday'
AND f.month = 'September'
AND f.year = '2023';
SELECT *
FROM flights
WHERE origin = 'BOS' AND destination = 'SFO';
SELECT *
FROM flights
WHERE origin = 'Boston' AND destination = 'Denver' AND date = '2023-07-29';
SELECT DISTINCT f.plane_type
FROM flights f
WHERE f.origin = 'PIT' AND f.destination = 'BAL';
SELECT * FROM flights WHERE origin = 'BOS' AND destination = 'DCA' AND day = 'Monday' AND time = 'Morning';
SELECT *
FROM flights
WHERE origin = 'Cincinnati' AND destination = 'Dallas';
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Atlanta';
SELECT DISTINCT f.ground_transportation
FROM flights f
WHERE f.origin_city = 'Boston' AND f.origin_airport = 'BOS';
SELECT *
FROM flights
WHERE origin = 'San Francisco' AND destination = 'Las Vegas';
SELECT f.fl_num
FROM flights f
WHERE f.origin = 'HOU'
AND f.dest = 'MIL'
AND f.day_of_week = 'FRIDAY'
AND f.carrier = 'AA';
SELECT f.total_amount
FROM flights f
WHERE f.origin = 'ATL' AND f.destination = 'Downtown';
SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'PIT';
```sql
SELECT f.flight_id, f.origin, f.destination, f.departure_time, f.arrival_time
FROM flights f
WHERE f.origin = 'San Francisco' AND f.destination = 'Washington' AND f.departure_time >= '2023-04-01 18:00:00'
SELECT *
FROM flights
WHERE origin = 'Seattle' AND destination = 'Minneapolis';
SELECT COUNT(*)
FROM flights.ground_transportation
WHERE origin = 'PHX' AND destination = 'Downtown Phoenix';
SELECT *
FROM flights
WHERE origin = 'San Jose'
AND destination = 'Nashville'
AND day = 'Friday'
AND month = 'June'
AND year = '2023';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date
FROM flights f
WHERE f.origin = 'Dallas' AND f.destination = 'San Francisco' AND f.departure_date = '2023-10-28';
SELECT f.flight_id, f.origin, f.destination, f.departure_date, f.arrival_date, f.price
FROM flights f
WHERE f.origin = 'DEN' AND f.destination = 'PIT'
ORDER BY f.price ASC
LIMIT 1;
SELECT *
FROM flights
WHERE origin = 'San Diego'
AND destination = 'Dulles'
AND aircraft = 'Boeing 767';
SELECT DISTINCT f.Airline
FROM Flights f
WHERE f.Origin = 'BOS' AND f.Destination = 'DCA'
SELECT *
FROM flights
WHERE origin = 'Dallas' AND destination = 'Oakland' AND departure_time < '12:00:00';
