/* ===========================================================================
   3. Optimize the Performance Query
============================================================================== 

The following SQL Server query is slow. 
Do the following:
	- Propose optimizations to improve its performance.
	- Provide the improved SQL query.
	- Explain each improvement to understand the reasoning behind it.
*/
-- Query with Bar Performance
SELECT 
    o.OrderID,
    o.CustomerID,
    c.FirstName AS CustomerFirstName,
    (SELECT COUNT(o2.OrderID)
     FROM Sales.Orders o2
     WHERE o2.CustomerID = c.CustomerID) AS OrderCount
FROM 
    Sales.Orders o
LEFT JOIN 
    Sales.Customers c ON o.CustomerID = c.CustomerID
WHERE 
    LOWER(o.OrderStatus) = 'delivered'
    OR YEAR(o.OrderDate) = 2025
    OR o.CustomerID =1 OR o.CustomerID =2 OR o.CustomerID =3
    OR o.CustomerID IN (
        SELECT CustomerID
        FROM Sales.Customers
        WHERE Country LIKE '%USA%'
    )

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

-- Optimized Query for Performance Improvement
SELECT
    o.OrderID,
    o.CustomerID,
    c.FirstName AS CustomerFirstName,
    -- Use an analytic window function (COUNT OVER) instead of a slow scalar subquery
    COUNT(o.OrderID) OVER (PARTITION BY o.CustomerID) AS CustomerOrderCount
FROM
    Sales.Orders o
LEFT JOIN
    Sales.Customers c ON o.CustomerID = c.CustomerID
-- Use an INNER JOIN to pre-filter customers, making the main WHERE clause cleaner
INNER JOIN
    -- Find all US/USA customers in advance
    (SELECT CustomerID FROM Sales.Customers WHERE Country LIKE '%USA%') AS us_cust
    ON o.CustomerID = us_cust.CustomerID
    
-- Apply efficient filtering and consolidate redundant logic
WHERE
    -- 1. Combine status filter with a simpler check (no need for LOWER if data is consistent)
    o.OrderStatus = 'Delivered' 
    -- 2. Use a direct comparison for date/year
    OR o.OrderDate >= '2025-01-01' AND o.OrderDate < '2026-01-01'
    -- 3. Consolidate OR logic using IN
    OR o.CustomerID IN (1, 2, 3) 
    -- 4. No need for the Country filter here, as it's handled by the INNER JOIN
    
-- Add a primary sort order if needed, otherwise this is the final result
ORDER BY
    o.OrderID;