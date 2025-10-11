-- How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?

SELECT 
	FORMAT(OrderDate, 'MMM yy') AS OrderDate,
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')