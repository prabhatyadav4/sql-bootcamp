-- How to create CTAS?

SELECT 
	DATENAME(MONTH, OrderDate) AS OrderMonth,
	COUNT(OrderID) AS TotalOrders
INTO Sales.MonthlyOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate)

-- How to check CTAS?

SELECT * FROM Sales.MonthlyOrders

-- How to delete CTAS?

DROP TABLE Sales.MonthlyOrders