-- Count how many times each customer has made an order with sales greater than 30.

SELECT
	CustomerID, 
	SUM(CASE
			WHEN Sales > 30 THEN 1
			ELSE 0
		END) AS TotalOrdersHighSales,
	COUNT(*)AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID