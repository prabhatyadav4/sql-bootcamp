-- Rank the orders based on their sales from highest to lowest (Using RANK).

SELECT	
	OrderID,
	ProductID,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) AS SalesRank_Rank
FROM Sales.Orders