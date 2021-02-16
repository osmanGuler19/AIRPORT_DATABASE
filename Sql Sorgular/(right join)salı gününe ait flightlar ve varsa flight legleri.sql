SELECT flights.id AS FLİGHT_ID,flight_legs.flight_number AS FLIGHT_NUMBERS, flight_legs.id as LEGS
FROM flight_legs RIGHT JOIN flights ON flights.id = flight_legs.flight_id
WHERE flights.weekdays = 'TUESDAY'
