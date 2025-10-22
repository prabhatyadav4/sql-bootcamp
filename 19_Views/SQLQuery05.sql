-- Modify Logic in View.
-- Remove TotalQuantity Column from the View.

-- STEP 1: Drop View if it exists.
IF OBJECT_ID('Sales.V_Monthly_Summary') IS NOT NULL
	DROP VIEW Sales.V_Monthly_Summary
GO

-- STEP 2: Re-create the view with modified logic.
CREATE VIEW Sales.V_Monthly_Summary AS
(
	SELECT
		DATETRUNC(month, OrderDate) AS OrderMonth,
    SUM(Sales) AS TotalSales,
    COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY DATETRUNC(month, OrderDate)
)