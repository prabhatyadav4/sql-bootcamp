/* Rank each order based on their sales from highest to lowest.
   Additionally provide details such as OrderID, OrderDate. */

SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) AS RankSales
FROM Sales.Orders