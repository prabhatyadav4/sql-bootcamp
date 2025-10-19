-- Find the deviation of each sales from the minimum and maximum sales amounts.

SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) OVER() AS HighestSales,
	MIN(Sales) OVER() AS LowestSales,
	Sales - MIN(Sales) OVER() AS DeviationFromMin,
	MAX(Sales) OVER() - Sales AS DeviationFromMax
FROM Sales.Orders