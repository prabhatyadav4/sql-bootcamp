-- Show the details of orders made by customers in Germany.

-- Main Query

SELECT
	*
FROM Sales.Orders
WHERE CustomerID IN (
	-- Sub Query
	SELECT 
	CustomerID
	FROM Sales.Customers
	WHERE Country = 'Germany'
)