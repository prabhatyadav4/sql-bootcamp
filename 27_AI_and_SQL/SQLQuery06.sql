/* ===========================================================================
   5. Debugging
==============================================================================

The following SQL Server Query causing this error: "Msg 8120, Level 16, State 1, Line 5"
Do the following: 
	- Explain the error massage.
	- Find the root cause of the issue.
	- Suggest how to fix it.
*/

SELECT 
    C.CustomerID,
    C.Country,
    SUM(O.Sales) AS TotalSales,
    RANK() OVER (PARTITION BY C.Country ORDER BY O.Sales DESC) AS RankInCountry
FROM Sales.Customers C
LEFT JOIN Sales.Orders O 
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Country

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Debugging Analysis: Msg 8120
==============================================================================

1. Explain the Error Message:

   - Msg 8120 (Column is invalid...): This error occurs when a query includes a standard GROUP BY clause and attempts to reference a non-aggregated column (a column not inside a SUM(), COUNT(), etc.) in the SELECT list, but the column is NOT listed in the GROUP BY clause itself.

------------------------------------------------------------------------------
2. Find the Root Cause of the Issue:

   - The query attempts to use the single order sales column, O.Sales, inside the RANK() function:
     RANK() OVER (PARTITION BY C.Country ORDER BY O.Sales DESC)
   - When the GROUP BY C.CustomerID, C.Country runs, it collapses multiple order rows into one row per customer. The database can no longer identify which specific O.Sales value to use for the RANK() function's ORDER BY clause, as O.Sales is not one of the grouped columns.

------------------------------------------------------------------------------
3. Suggest How to Fix It:

   - The fix is to use the already aggregated value, SUM(O.Sales) (TotalSales), in the ORDER BY clause of the RANK() function. This ensures the ranking is based on the customer's total performance, which is the correct business requirement, and satisfies the aggregation rules. */

-- Corrected Query:

SELECT 
    C.CustomerID,
    C.Country,
    SUM(O.Sales) AS TotalSales,
    -- CORRECT: Rank by the calculated total sales for the group.
    RANK() OVER (PARTITION BY C.Country ORDER BY SUM(O.Sales) DESC) AS RankInCountry
FROM 
    Sales.Customers C
LEFT JOIN 
    Sales.Orders O 
ON 
    C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerID, C.Country;