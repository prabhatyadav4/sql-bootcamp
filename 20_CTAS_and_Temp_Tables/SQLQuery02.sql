-- How to refresh CTAS?

IF OBJECT_ID('Sales.MonthlyOrders', 'U') IS NOT NULL
	DROP TABLE Sales.MonthlyOrders
GO
SELECT 
	DATENAME(MONTH, OrderDate) AS OrderMonth,
	COUNT(OrderID) AS TotalOrders
INTO Sales.MonthlyOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate)