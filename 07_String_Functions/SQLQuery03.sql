-- Transform the customer's first name to upper case.

SELECT 
	first_name,
	UPPER(first_name) AS up_name
FROM customers