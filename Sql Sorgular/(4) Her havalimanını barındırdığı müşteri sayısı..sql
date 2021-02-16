SELECT
	airports.code,
	COUNT ( fares.customer_id ) AS SUM_CUSTOMER 
FROM
	airports
	INNER JOIN flight_legs ON airports.code = flight_legs.arrival_airport_code 
	OR airports.code = flight_legs.departure_airport_code
	INNER JOIN flights ON flight_legs.flight_id = flights."id"
	INNER JOIN fares ON flights."id" = fares.flight_id 
GROUP BY
	airports.code