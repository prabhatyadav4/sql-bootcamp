/* Retrieve all customers whose score falls
   in the range between 100 and 500 */

SELECT * FROM customers
WHERE score BETWEEN 100 AND 500

-- OR

SELECT * FROM customers
WHERE score >= 100 AND score <=500