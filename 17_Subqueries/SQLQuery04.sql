-- Show the ProductID, ProductName, Price and the total number of orders.

-- Mainquery
SELECT
	ProductID,
	Product,
	Price,
	-- Subquery
	(SELECT COUNT(*) FROM Sales.Orders) AS TotalOrders
FROM Sales.Products