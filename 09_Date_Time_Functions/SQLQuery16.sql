-- Find the average shipping duration in days for each month

SELECT
	MONTH(OrderDate) AS OrderDate,
	AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)