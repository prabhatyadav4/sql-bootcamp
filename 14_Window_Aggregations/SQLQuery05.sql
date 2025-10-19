-- Find the Percentage Contribution of Each Product's Sales to the Total Sales.

SELECT
	OrderID,
	ProductId,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER() * 100, 2) AS PercentageofTotal
FROM Sales.Orders