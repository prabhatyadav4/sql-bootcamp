-- Retrieve a list of customer's first names removing the first character.

SELECT
	 first_name,
	 SUBSTRING (TRIM(first_name), 2, LEN(first_name)) AS sub_name 
FROM customers