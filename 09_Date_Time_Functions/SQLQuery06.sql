-- How many orders were placed each month?

SELECT
	MONTH(OrderDate),
	COUNT(*) AS NoOfOrders
FROM Sales.Orders
GROUP BY MONTH(OrderDate)