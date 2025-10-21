-- Find the products that have a price higher than the average price of all products

-- Main Query
SELECT
	ProductID,
	Price,
	(SELECT AVG(Price) FROM Sales.Products) AS AvgPrice
FROM Sales.Products
              -- Sub Query
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)