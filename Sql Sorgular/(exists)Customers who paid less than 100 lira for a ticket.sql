SELECT
	customers.NAME 
FROM
	customers 
WHERE
	EXISTS ( SELECT fare_code FROM fares WHERE fares.customer_id = customers.ID AND fares.amount < 100 )