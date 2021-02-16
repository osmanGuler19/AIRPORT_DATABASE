SELECT
	* 
FROM
	fares 
WHERE
	fares.amount > ( SELECT AVG ( fares.amount ) FROM fares )
ORDER BY fares.amount