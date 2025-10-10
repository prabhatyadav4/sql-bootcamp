-- Show CreationTime using the following format: 
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT
	OrderId,
	CreationTime,
	'Day ' + FORMAT(CreationTime, 'ddd MMM') + ' Q' + DATENAME(quarter, CreationTime) + 
	' ' + FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS Custom_Time
FROM Sales.Orders;