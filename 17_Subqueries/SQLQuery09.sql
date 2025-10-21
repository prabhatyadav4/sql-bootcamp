-- Show the details of orders made by customers not in Germany.

-- Main Query
SELECT
	*
FROM Sales.Orders
WHERE CustomerID NOT IN ( 
	-- Sub Query
	SELECT 
		CustomerID
	FROM Sales.Customers
	WHERE Country = 'Germany'
)