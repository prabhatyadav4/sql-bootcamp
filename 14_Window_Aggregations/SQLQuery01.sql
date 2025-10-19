-- Find the Total Number of Orders and the Total Number of Orders for Each Customer.

SELECT 
	OrderID,
	OrderDate,
	CustomerID,
	COUNT(*) OVER() AS TotalOrders,
	COUNT(*) OVER(PARTITION BY CustomerID) AS OrdersByCustomer
FROM Sales.Orders