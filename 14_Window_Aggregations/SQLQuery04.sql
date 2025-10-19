/* Find the total sales across all orders
   and the total sales of each prouct.
   Additionally, provide details such as OrderId, OrderDate. */

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS SalesByProducts
FROM Sales.Orders