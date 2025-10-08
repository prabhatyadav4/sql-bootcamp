-- Show a list of customer's first names together with their country in one column.

SELECT 
	first_name,
	country,
	CONCAT(first_name, '-', country) AS name_country
FROM customers