-- Change the score of customer 6 to 0. 

UPDATE customers
SET score = 0
WHERE id = 6

SELECT * FROM customers