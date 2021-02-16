SELECT
	companies.ID AS COMPANY_ID,
	companies.NAME AS COMPANY_NAMES,
	airplane_companies.ID AS AIRPLANE_COMPANY_ID,
	airplane_companies.NAME AS AIRPLANE_COMPANY_NAMES 
FROM
	airplane_companies
	FULL OUTER JOIN companies ON companies.ID = airplane_companies.company_id