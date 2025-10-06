-- Change the score of customer 10 to 0 and update the country to UK

UPDATE customers
SET 
	score = 0,
	country = 'UK'
WHERE id = 10

SELECT * FROM customers