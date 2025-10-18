-- Find the total sales for each product.

SELECT
	ProductID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY ProductID