SELECT
	airlines."name",
	airplane_types."name",
	airplane_types.max_seats
FROM
	airplanes
	INNER JOIN airlines ON airplanes.airline_id = airlines."id"
	INNER JOIN airplane_types ON airplanes.airplane_type_id = airplane_types."id" 
WHERE
	airlines.NAME = 'AAG - Airline 1'