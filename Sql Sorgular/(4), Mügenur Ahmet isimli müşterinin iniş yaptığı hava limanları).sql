SELECT
	leg_instances.arrival_airport_code,
	airports."name" AS airport_name,
	customers."name" AS customer_name 
FROM
	seat_reservations
	INNER JOIN customers ON seat_reservations.customer_id = customers."id"
	INNER JOIN leg_instances ON seat_reservations.leg_instance_id = leg_instances."id"
	INNER JOIN airports ON leg_instances.departure_airport_code = airports.code 
WHERE
	customers."name" = 'Mügenur Ahmet'