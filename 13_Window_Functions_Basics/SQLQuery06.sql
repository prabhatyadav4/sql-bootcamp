/* Find the total sales across each product.
   Find the total sales for each product.
   Additionally provide details such OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProducts
FROM Sales.Orders