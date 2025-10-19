-- Calculate Total Sales by Order Status for current and next two orders.

SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(
		PARTITION BY OrderStatus
		ORDER BY OrderDate 
		ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
	) AS TotalSales
FROM Sales.Orders	