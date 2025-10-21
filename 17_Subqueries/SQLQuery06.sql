-- Show customer details along with their total sales.

SELECT
	c.*,
	t.TotalSales
FROM Sales.Customers c
LEFT JOIN(
	SELECT 
		CustomerID,
		SUM(Sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)t
ON c.CustomerID = t.CustomerID