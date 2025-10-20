-- Rank the orders based on their sales from highest to lowest (Using ROW_NUMBER).

SELECT	
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row
FROM Sales.Orders