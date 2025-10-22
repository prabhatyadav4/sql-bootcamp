-- Find the running total of sales of each month

SELECT
	OrderMonth,
	TotalSales,
	SUM(TotalSales) OVER(ORDER BY OrderMonth) AS RunningTotal
FROM Sales.V_Monthly_Summary