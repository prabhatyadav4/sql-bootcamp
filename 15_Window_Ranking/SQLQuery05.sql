 -- Bottom-N Analysis: Find the Lowest 2 Customers Based on Their Total Sales.

 SELECT *
 FROM(
	 SELECT
		CustomerID,
		SUM(Sales) AS TotalSales,
		ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS RankCustomers
	FROM Sales.Orders
	GROUP BY CustomerID
)t
WHERE RankCustomers <= 2