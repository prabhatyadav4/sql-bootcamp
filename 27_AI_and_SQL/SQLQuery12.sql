/* 
==============================================================================
   11. Migrating from SQL Server to Another Database
============================================================================== */

-- Convert the following SQL Query from SQL Server to other databases.
SELECT TOP 10
    CustomerID,
    Score,
    ISNULL(Score, 2) AS IsNullScore,
    FirstName + ' ' + LastName AS FullName,
    GETDATE() AS CurrentDateTime
FROM
    Sales.Customers;

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Query Conversion Across Dialects
------------------------------------------------------------------------------ */

-- 1. MySQL:

-- Uses LIMIT for row limiting, IFNULL for null checking, and CONCAT for concatenation.
SELECT
    CustomerID,
    Score,
    IFNULL(Score, 2) AS IsNullScore,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    NOW() AS CurrentDateTime
FROM
    Sales.Customers
LIMIT 10;

------------------------------------------------------------------------------

-- 2. PostgreSQL:

-- Uses LIMIT for row limiting, COALESCE for null checking, and '||' for concatenation.
SELECT
    CustomerID,
    Score,
    COALESCE(Score, 2) AS IsNullScore,
    FirstName || ' ' || LastName AS FullName,
    NOW() AS CurrentDateTime
FROM
    Sales.Customers
LIMIT 10;

------------------------------------------------------------------------------

-- 3. Oracle:

-- Uses FETCH FIRST for row limiting, NVL for null checking, and '||' for concatenation.
SELECT
    CustomerID,
    Score,
    NVL(Score, 2) AS IsNullScore,
    FirstName || ' ' || LastName AS FullName,
    SYSDATE AS CurrentDateTime
FROM
    Sales.Customers
FETCH FIRST 10 ROWS ONLY;

------------------------------------------------------------------------------
-- 4. Azure SQL Database:

-- Azure SQL Database uses the standard SQL Server dialect.
SELECT TOP 10
    CustomerID,
    Score,
    ISNULL(Score, 2) AS IsNullScore,
    FirstName + ' ' + LastName AS FullName,
    GETDATE() AS CurrentDateTime
FROM
    Sales.Customers;