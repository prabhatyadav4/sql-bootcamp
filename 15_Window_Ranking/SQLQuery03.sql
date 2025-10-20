-- Rank the orders based on their sales from highest to lowest (Using DENSE_RANK).

SELECT
	OrderID,
	ProductID,
	Sales,
	DENSE_RANK() OVER(ORDER BY Sales) AS SalesRank_Dense
FROM Sales.Orders