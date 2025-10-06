-- Retrieve customers from Germany.

SELECT 
	first_name,
	country

FROM customers
WHERE country = 'GERMANY'