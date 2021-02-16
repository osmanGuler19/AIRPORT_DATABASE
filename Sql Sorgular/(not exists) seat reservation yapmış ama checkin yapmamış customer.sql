SELECT
	customers.NAME,
	seat_reservations.customer_id as customer_id,
	seat_reservations."id" as seat_id
FROM
	seat_reservations,
	customers 
WHERE
	NOT EXISTS ( SELECT physically_checked_ins.ID FROM physically_checked_ins WHERE seat_reservations.ID = physically_checked_ins.seat_reservation_id ) 
	AND seat_reservations.customer_id = customers.ID