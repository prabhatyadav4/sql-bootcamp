/* Retrieve all customers from either Germany or USA. */

SELECT * FROM customers
WHERE country IN ('Germany', 'USA')

-- OR

SELECT * FROM customers
WHERE country = 'Germany' OR country = 'USA'