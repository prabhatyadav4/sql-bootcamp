-- Retrieve all the customers who are not from Germany.
SELECT * FROM customers
WHERE country != 'Germany'

-- OR

SELECT * FROM customers
WHERE country <> 'Germany'