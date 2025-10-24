-- #######################################################
-- #                        JOINS                        #
-- #######################################################

/* ==============================================================================
   Tip 8: Understand The Speed of Joins & Use INNER JOIN when possible
===============================================================================*/

-- Best Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c INNER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

-- Slightly Slower Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c RIGHT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID
SELECT c.FirstName, o.OrderID FROM Sales.Customers c LEFT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

-- Worst Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c OUTER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID

/* ==============================================================================
   Tip 9: Use Explicit Join (ANSI Join) Instead of Implicit Join (non-ANSI Join)
===============================================================================*/

-- Bad Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers c, Sales.Orders o
WHERE c.CustomerID = o.CustomerID

-- Good Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID;

--For simple queries: There is no measurable performance difference if both ANSI and non-ANSI queries are correctly written.
--For complex queries: ANSI joins are usually easier to optimize and debug because their structure makes the intent of the query clearer.

/* ==============================================================================
   Tip 10: Make sure to Index the columns used in the ON clause
===============================================================================*/

SELECT c.FirstName, o.OrderID
FROM Sales.Orders AS o
INNER JOIN Sales.Customers AS c
    ON c.CustomerID = o.CustomerID;

CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Sales.Orders(CustomerID)

/* ==============================================================================
   Tip 11: Filter Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Filter After Join (WHERE)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Delivered';

-- Filter During Join (ON)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
   AND o.OrderStatus = 'Delivered';

-- Best Practice For Big Tables
-- Filter Before Join (SUBQUERY)
SELECT c.FirstName, o.OrderID
FROM Sales.Customers AS c
INNER JOIN (
    SELECT OrderID, CustomerID
    FROM Sales.Orders
    WHERE OrderStatus = 'Delivered'
) AS o
    ON c.CustomerID = o.CustomerID;

/* ==============================================================================
   Tip 12: Aggregate Before Joining (Big Tables)
===============================================================================*/

-- Best Practice For Small-Medium Tables
-- Grouping and Joining
SELECT c.CustomerID, c.FirstName, COUNT(o.OrderID) AS OrderCount
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

-- Best Practice For Big Tables
-- Pre-aggregated Subquery
SELECT c.CustomerID, c.FirstName, o.OrderCount
FROM Sales.Customers AS c
INNER JOIN (
    SELECT CustomerID, COUNT(OrderID) AS OrderCount
    FROM Sales.Orders
    GROUP BY CustomerID
) AS o
    ON c.CustomerID = o.CustomerID;

-- Bad Practice
-- Correlated Subquery
SELECT 
    c.CustomerID, 
    c.FirstName,
    (SELECT COUNT(o.OrderID)
     FROM Sales.Orders AS o
     WHERE o.CustomerID = c.CustomerID) AS OrderCount
FROM Sales.Customers AS c;

/* ==============================================================================
   Tip 13: Use Union Instead of OR in Joins
===============================================================================*/

-- Bad Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
    OR c.CustomerID = o.SalesPersonID;

-- Best Practice
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
UNION
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.SalesPersonID;

/* ==============================================================================
   Tip 14: Check for Nested Loops and Use SQL HINTS
===============================================================================*/

SELECT o.OrderID, c.FirstName
FROM Sales.Customers c
INNER JOIN Sales.Orders o 
ON c.CustomerID = o.CustomerID

-- Good Practice for Having Big Table & Small Table
SELECT o.OrderID, c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON c.CustomerID = o.CustomerID
OPTION (HASH JOIN);