-------------------------------------------------------------------------------
-- Include Actual Execution Plan: Press Ctrl + M or click the button, then run the query.
-------------------------------------------------------------------------------

-- 1. Activate the 'Include Actual Execution Plan' button in SSMS (Ctrl + M).
-- 2. Execute the query:

SELECT SalesAmount
FROM FactInternetSales
WHERE SalesOrderNumber = N'SO43697'; 

-- Result: Runs the query and displays the 'Execution Plan' tab with the *actual* plan used.