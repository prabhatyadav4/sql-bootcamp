/* Find the total sales for each product.
   Additionally provide details such as OrderID, OrderDate */

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProducts
FROM Sales.Orders