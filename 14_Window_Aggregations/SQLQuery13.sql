-- Calculate moving average of sales for each product over time.

SELECT
	OrderID,
	ProductID,
	OrderDate,
	ProductID,
	Sales,
	AVG(Sales) OVER(PARTITION BY ProductID) AS AvgByProduct,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) AS MovingAvg
FROM Sales.Orders