-- Retrieve the Lowest 2 customers with the highest score.

SELECT TOP 2 *
FROM customers
ORDER BY score ASC