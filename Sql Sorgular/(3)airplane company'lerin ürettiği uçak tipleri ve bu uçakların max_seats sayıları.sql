SELECT
	airplane_companies.NAME AS Manufacturer,
	airplane_types.NAME AS Manufactured_airplane_type,
	airplane_types.max_seats AS MAX_SEATS 
FROM
	airplane_companies
	INNER JOIN airplanes ON airplane_companies.ID = airplanes.airplane_company_id
	INNER JOIN airplane_types ON airplanes.airplane_type_id = airplane_types.ID