SELECT
	customer_id,
	seat_number 
FROM
	seat_reservations
	INNER JOIN physically_checked_ins ON seat_reservations.ID = physically_checked_ins.seat_reservation_id;