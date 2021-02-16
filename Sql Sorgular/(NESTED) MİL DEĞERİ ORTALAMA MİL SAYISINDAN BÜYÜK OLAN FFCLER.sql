SELECT
	customers.NAME 
FROM
	customers 
WHERE
	customers.mileage_sum > ( SELECT AVG ( customers.mileage_sum ) FROM customers ) 
	AND EXISTS ( SELECT customers.NAME FROM ffcs INNER JOIN customers ON ffcs.customer_id = customers."id" )