/* Find the average sales across all orders
   and the average sales for each product.
   Additionally, provide details such as OrderID and OrderDate. */

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	AVG(Sales) OVER() AS AvgSales,
	AVG(Sales) OVER(PARTITION BY ProductID) AS AvgSalesByProducts
FROM Sales.Orders