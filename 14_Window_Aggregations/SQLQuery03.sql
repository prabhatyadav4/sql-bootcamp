-- Check whether the table 'OrdersArchive' contains any duplicate rows


SELECT
	*
	FROM(
		SELECT
			*,
			COUNT(*) OVER(PARTITION BY OrderID) AS CheckPK
		FROM Sales.OrdersArchive
	) t
WHERE CheckPK > 1