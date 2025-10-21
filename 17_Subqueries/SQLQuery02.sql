-- Find the products that have a price higher than the average price of all products.

-- Mainquery
SELECT *
FROM(
-- Subquery
	SELECT
		ProductID,
		Price,
		AVG(Price) OVER() AS AvgPrice
	FROM Sales.Products
	)t
WHERE Price > AvgPrice