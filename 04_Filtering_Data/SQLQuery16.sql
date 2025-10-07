-- Find all customers whose first name starts has 'r' in the third position.

SELECT * FROM customers
WHERE first_name LIKE '__r%'
