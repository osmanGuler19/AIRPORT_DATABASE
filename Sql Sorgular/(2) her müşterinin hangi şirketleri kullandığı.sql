SELECT
	airlines."name", 
	customers."name"
FROM
	customers
	INNER JOIN
	airlines
	ON 
		customers.airline_id = airlines."id"
GROUP BY
	customers."name", 
	airlines."name"