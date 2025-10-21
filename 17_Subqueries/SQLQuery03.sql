-- Rank Customers based on their total amount of sales.

-- Mainquery
SELECT 
	*,
	RANK() OVER(ORDER BY TotalSales DESC) AS RankCustomer
FROM(
	-- Subquery
	SELECT
		CustomerID,
		SUM(Sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
	)t