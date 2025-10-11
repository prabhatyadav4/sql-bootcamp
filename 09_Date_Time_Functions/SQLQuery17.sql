-- Time Gap Analysis: Find the number of days between each order and the previous order.

SELECT
	OrderID, 
	OrderDate AS CurrentOrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
	DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders