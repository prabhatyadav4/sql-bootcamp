/* Find the total sales across each product.
   Find the total sales for each product.
   Find the total sales for each combination of product and OrderStatus.
   Additionally provide details such OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProduct,
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS SalesByProductAndStatus
FROM Sales.Orders