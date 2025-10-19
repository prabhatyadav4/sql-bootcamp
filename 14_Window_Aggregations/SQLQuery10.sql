/* Find the highest and lowest sales for each product.
   Additionally provide details such as OrderID, OrderDate. */

SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MAX(Sales) OVER(PARTITION BY ProductID) AS HighestSalesByProducts,
	MIN(Sales) OVER(PARTITION BY ProductID) AS LowestSalesByProducts
FROM Sales.Orders