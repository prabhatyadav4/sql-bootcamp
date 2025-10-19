/* Find the highest and lowest sales of all orders.
   Additionally provide details such as OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) OVER() AS HighestSales,
	MIN(Sales) OVER() AS LowestSales
FROM Sales.Orders