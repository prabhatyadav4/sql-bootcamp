/* ==============================================================================
   SUBQUERY | RESULT TYPES
===============================================================================*/

-- Scalar Subquery

SELECT
	AVG(Sales)
FROM Sales.Orders

-- Row Subquery

SELECT
	CustomerID
FROM Sales.Orders

-- Table Subquery

SELECT
	OrderID,
	OrderDate
FROM Sales.Orders