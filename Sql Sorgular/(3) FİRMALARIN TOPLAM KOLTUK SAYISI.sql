SELECT
	airlines."name",
	SUM ( airplane_types.max_seats ) AS SUM_SEAT 
FROM
	airplanes
	INNER JOIN airlines ON airplanes.airline_id = airlines."id"
	INNER JOIN airplane_types ON airplanes.airplane_type_id = airplane_types."id" 
GROUP BY
	airlines."name" 
ORDER BY
	SUM ( airplane_types.max_seats ) DESC 