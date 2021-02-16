SELECT
	* 
FROM
	ffcs 
WHERE
	EXISTS ( SELECT seat_reservations.customer_id FROM seat_reservations WHERE seat_reservations.customer_id = ffcs.customer_id ) 
	AND ffcs.ffc_degree >2