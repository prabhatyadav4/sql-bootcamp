-- ###############################################################
-- #                        FETCHING DATA                        #
-- ###############################################################

-- ============================================
-- Tip 1: Select Only What You Need
-- ============================================

-- Bad Practice
SELECT * FROM Sales.Customers

-- Good Practice
SELECT CustomerID, FirstName, LastName FROM Sales.Customers

-- ============================================
-- Tip 2: Avoid unnecessary DISTINCT & ORDER BY
-- ============================================

-- Bad Practice
SELECT DISTINCT 
	FirstName 
FROM Sales.Customers 
ORDER BY FirstName

-- Good Practice
SELECT 
	FirstName 
FROM Sales.Customers

-- ============================================
-- Tip 3: For Exploration Purpose, Limit Rows!
-- ============================================

-- Bad Practice
SELECT 
	OrderID,
	Sales 
FROM Sales.Orders

-- Good Practice
SELECT TOP 10 
	OrderID,
	Sales 
FROM Sales.Orders