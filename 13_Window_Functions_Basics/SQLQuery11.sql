-- Calculate Total Sales by Order Status from previous two orders only.

SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(
		PARTITION BY OrderStatus
		ORDER BY OrderDate
		ROWS 2 PRECEDING
	) AS TotalSales
FROM Sales.Orders