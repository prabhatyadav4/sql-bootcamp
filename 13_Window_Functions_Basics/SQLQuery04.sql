/* Find the total sales across all orders.
   Additionally provide details such OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	SUM(Sales) OVER() AS TotalSales
FROM Sales.Orders