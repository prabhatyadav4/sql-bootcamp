-- Update all customers with a NULL score by setting their score to 0. 

UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT * FROM customers