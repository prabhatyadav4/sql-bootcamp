/* Analyze the Month-over-Month Performance by Finding the Percentage Change in Sales
   Between the Current and Previous Months. */

SELECT
	*,
	CurrentMonthSales - PreviousMonthSales AS MoM_Change,
	CONCAT(ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT) / PreviousMonthSales * 100, 1), '%') AS MoM_Per
FROM(
	SELECT
		MONTH(OrderDate) AS OrderMonth,
		SUM(Sales) AS CurrentMonthSales,
		LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) AS PreviousMonthSales
	FROM Sales.Orders
	GROUP BY 
		MONTH(OrderDate)
)t