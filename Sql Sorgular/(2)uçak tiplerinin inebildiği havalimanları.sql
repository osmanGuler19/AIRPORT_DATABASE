SELECT
	airports."name", 
	can_land.airplane_type_id
FROM
	airports
	
	INNER JOIN
	can_land
	ON 
		airports.code=can_land.airport_code
ORDER BY airports."name"
