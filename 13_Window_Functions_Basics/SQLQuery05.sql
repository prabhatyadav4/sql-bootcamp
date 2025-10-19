/* Find the total sales for each product.
   Additionally provide details such OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSales
FROM Sales.Orders