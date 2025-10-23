/* ==============================================================================
   Monitor Missing Indexes
============================================================================== */
-- Change Database to AdventureWorksDW2022.
USE AdventureWorksDW2022
-- Run Query to get recommendation about missing indexes.
SELECT 
    fs.SalesOrderNumber,
    dp.EnglishProductName,
    dp.Color
FROM        FactInternetSales AS fs
INNER JOIN  DimProduct AS dp
ON          fs.ProductKey = dp.ProductKey
WHERE       dp.Color = 'Black'
AND fs.OrderDateKey BETWEEN 20101229 AND 20101230

-- Run this query to get the information about missing indexes.
SELECT * 
FROM sys.dm_db_missing_index_details;