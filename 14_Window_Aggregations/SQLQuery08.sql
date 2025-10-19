-- Find all orders where sales are higher than the average sales across all orders.

SELECT
	*
	FROM(
	SELECT
		OrderID,
		ProductID,
		Sales,
		AVG(COALESCE(Sales,0)) OVER() AS AvgSales
	FROM Sales.Orders
)t
WHERE Sales > AvgSales