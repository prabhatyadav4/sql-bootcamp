/* Create a view that summarizes monthly sales by aggregating:
     - OrderMonth (truncated to month)
     - TotalSales, TotalOrders, and TotalQuantities. */

CREATE VIEW Sales.V_Monthly_Summary AS
(
    SELECT
        DATETRUNC(MONTH, OrderDate) AS OrderMonth,
        SUM(Sales) AS TotalSales,
        COUNT(OrderID) AS TotalOrders,
        SUM(Quantity) AS TotalQuantity
    FROM Sales.Orders
    GROUP BY DATETRUNC(MONTH, OrderDate)
)