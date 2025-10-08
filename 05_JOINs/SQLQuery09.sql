/* Get all orders without matching customers (Using LEFT JOIN). */

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL