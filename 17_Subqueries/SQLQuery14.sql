-- Show the details of orders made by customers not in Germany.

-- Main Query
SELECT
	*
FROM Sales.Orders AS o
WHERE NOT EXISTS (
	-- Sub Query
	SELECT 1
	FROM Sales.Customers AS c
	WHERE Country = 'Germany' 
	AND o.CustomerID = c.CustomerID
	)