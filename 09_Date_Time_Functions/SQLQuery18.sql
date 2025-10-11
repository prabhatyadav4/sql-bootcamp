-- Validate OrderDate using ISDATE and convert valid dates.

SELECT 
	OrderDate,
	ISDATE(OrderDate)  AS IsDate,
	CASE WHEN ISDATE(OrderDate) = 1 THEN CAST (OrderDate AS DATE)
	ELSE '9999-1-1'
	END AS NewOrderDate
FROM 
(
	SELECT '2025-08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-22' UNION
	SELECT '2025-08'
) AS t