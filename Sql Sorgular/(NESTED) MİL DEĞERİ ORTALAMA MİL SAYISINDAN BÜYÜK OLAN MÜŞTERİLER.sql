SELECT
	customers.NAME,
	customers.mileage_sum 
FROM
	customers 
WHERE
	customers.mileage_sum > ( SELECT AVG ( customers.mileage_sum ) FROM customers )