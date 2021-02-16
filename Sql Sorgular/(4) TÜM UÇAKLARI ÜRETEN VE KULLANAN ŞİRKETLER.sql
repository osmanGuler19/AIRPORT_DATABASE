SELECT
	airplane_types."name" as airplane_type,
	airplane_companies."name" as airplane_manufacturer,
	airlines."name" as airline
FROM
	airlines
	INNER JOIN airplanes ON airlines."id" = airplanes.airline_id
	INNER JOIN airplane_companies ON airplanes.airplane_company_id = airplane_companies."id"
	INNER JOIN airplane_types ON airplanes.airplane_type_id = airplane_types."id"