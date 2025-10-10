-- How many orders were placed each month (using friendly month names)?

SELECT
	DATENAME(month,OrderDate),
	COUNT(*) AS NoOfOrder
FROM Sales.Orders
GROUP BY DATENAME(month,OrderDate)