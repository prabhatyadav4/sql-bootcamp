-- Identify Duplicate Rows in 'Order Archive'.
-- And return a clean result without any duplicates.

SELECT *
FROM(
	SELECT
		ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime) AS RankNumber,
		*
	FROM Sales.OrdersArchive
)t
WHERE RankNumber = 1;