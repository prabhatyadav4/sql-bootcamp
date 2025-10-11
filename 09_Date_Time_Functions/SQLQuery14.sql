-- Perform date arithmetic on OrderDate.

SELECT
	OrderID,
	OrderDate,
	DATEADD(DAY, -10, OrderDate) AS TenDaysBefore,
	DATEADD(MONTH, 3, OrderDate) AS ThreeMonthsLater,
	DATEADD(YEAR, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders