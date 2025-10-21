-- Show all customer details and find the total orders of each customer.

-- Mainquery
SELECT
	c.*,
	o.TotalOrders
FROM Sales.Customers AS c
-- Subquery
LEFT JOIN(
	SELECT
		CustomerID,
		COUNT(*) AS TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID
) AS o
ON c.CustomerID = o.CustomerID