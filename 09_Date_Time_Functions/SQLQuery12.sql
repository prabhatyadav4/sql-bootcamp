-- Demonstrate conversion using CONVERT.

SELECT
	CONVERT(INT, '123') AS [String to Int Convert],
	CONVERT(DATE, '2025-08-20') AS [String to Date Convert],
	CreationTime,
	CONVERT(DATE, CreationTime) AS [Datetime to Date Convert],
	CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style: 32],
	CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style: 34]
FROM Sales.Orders;