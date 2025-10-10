-- How many orders were placed each year?

SELECT
	YEAR(OrderDate),
	COUNT(*) AS NoOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)