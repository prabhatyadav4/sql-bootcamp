-- Transform the customer's first name to lower case.

SELECT 
	first_name,
	LOWER(first_name) AS low_name
FROM customers