-- In order to export the data, divide the orders into 2 groups.

SELECT 
	NTILE(2) OVER(ORDER BY OrderID) AS Buckets,
	*
FROM Sales.Orders;