-- Calculate Total Sales by Order Status for current and previous two orders.

SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(
		PARTITION BY OrderStatus
		ORDER BY OrderID
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS TotalSales
FROM Sales.Orders