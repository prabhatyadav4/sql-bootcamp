-- Segment all orders into 3 categories: High, Medium & Low Sales.

SELECT *,
	CASE
		WHEN Buckets = 1 THEN 'High'
		WHEN Buckets = 2 THEN 'Medium'
		WHEN Buckets = 3 THEN 'Low'
	END AS SalesSegmentation
FROM(
	SELECT
		OrderID,
		Sales,
		NTILE(3) OVER(ORDER BY Sales DESC) AS Buckets
	FROM Sales.Orders
)t