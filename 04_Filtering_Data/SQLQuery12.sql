/* Retrieve all customers not from either Germany or USA. */

SELECT * FROM customers
WHERE country NOT IN ('Germany', 'USA')