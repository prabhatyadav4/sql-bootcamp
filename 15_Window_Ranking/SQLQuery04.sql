-- Top-N Analysis: Find the Highest Sale for Each Product.

SELECT *
FROM(
	SELECT
		OrderID,
		ProductID,
		Sales,
		ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct
	FROM Sales.Orders
) AS TopProductSales
WHERE RankByProduct = 1;