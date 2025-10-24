/* Query Hints (Advanced)
We can use query hints (OPTION) to force the optimizer to use a specific plan behavior,
which is useful for testing but should be used with caution. */


-- Example: Forcing the optimizer to use a HASH JOIN (often better for large tables)

SELECT a.SalesAmount, b.EnglishProductName
FROM [FactInternetSales] a
JOIN [DimProduct] b ON a.ProductKey = b.ProductKey
WHERE a.SalesOrderNumber = N'SO43697'
OPTION (HASH JOIN); 

-- Example: Forcing the use of a specific index (IndexName) on a table (TableName)
-- NOTE: Only use this if you know the optimizer is making a mistake.

SELECT *
FROM [FactInternetSales] WITH (INDEX([PK_Customer_A4AE64B87FC20A48]))
WHERE OrderDateKey > 20130101;