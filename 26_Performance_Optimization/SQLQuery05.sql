-- ################################################################
-- #                           UNION                              #
-- ################################################################

/* ==============================================================================
   Tip 15: Use UNION ALL instead of using UNION | duplicates are acceptable
===============================================================================*/

-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive 

-- Best Practice
SELECT CustomerID FROM Sales.Orders
UNION ALL
SELECT CustomerID FROM Sales.OrdersArchive 

/* =======================================================================================
   Tip 16: Use UNION ALL + Distinct instead of using UNION | duplicates are not acceptable
========================================================================================*/

-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive 

-- Best Practice
SELECT DISTINCT CustomerID
FROM (
    SELECT CustomerID FROM Sales.Orders
    UNION ALL
    SELECT CustomerID FROM Sales.OrdersArchive
) AS CombinedData