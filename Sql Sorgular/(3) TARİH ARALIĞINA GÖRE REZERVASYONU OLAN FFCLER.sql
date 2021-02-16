SELECT
	customers."name",
	ffcs.ffc_degree,
	ffcs.ffc_number 
FROM
	ffcs
	INNER JOIN customers ON ffcs.customer_id = customers."id"
	INNER JOIN seat_reservations ON seat_reservations.customer_id = customers."id" 
WHERE
	seat_reservations.created_at BETWEEN '2021-03-01 00:00:00' 
	AND '2021-03-31 23:59:59'