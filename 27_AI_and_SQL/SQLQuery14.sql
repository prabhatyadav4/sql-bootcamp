/*
==============================================================================
   13. Understand SQL Concept
==============================================================================

I want detailed explanation about SQL Window Functions.
Do the following:
	- Explain what Window Functions are.
	- Give an analogy.
	- Describe why we need them and when to use them.	
	- Explain the syntax.
	- Provide simple examples.
	- List the top 3 use cases. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
Deep Dive: SQL Window Functions
==============================================================================

-- What are SQL Window Functions?
Window Functions perform a calculation across a set of table rows that are somehow related to the current row. Unlike aggregate functions (like SUM() or COUNT() with GROUP BY), Window Functions do NOT collapse the rows of the result set. Instead, they produce a result for each row while using data from a "window" of related rows for the calculation.

-- Analogy: The Team Scoreboard
Imagine you are looking at a list of individual student test scores.
1.  **Standard Aggregate (GROUP BY):** If you use GROUP BY, you only see the *average score for the entire class* (one single number). You lose the individual student detail.
2.  **Window Function:** You still see every student's individual score, but in an adjacent column, you see the *average score for the entire class* next to each student's name. The calculation runs over the "window" of all students, but the original rows remain intact.

-- Why We Need Them and When to Use Them
We need Window Functions to solve complex analytical problems where you must compare individual records against the entire group, a subset of the group, or preceding/following records.

You should use them when:
1.  You need both the individual record detail AND the aggregate or ranking information in the same result set.
2.  You need to calculate running totals, moving averages, or sequential differences.
3.  You need to rank records based on some criteria within specific groups (e.g., rank sales within each country).

-- SQL Window Function Syntax
The core of a Window Function is the OVER clause, which defines the window.

    <Window_Function> ( <Expression> )
    OVER (
        PARTITION BY <Column(s)>   -- 1. Divides the data into groups (windows). (Optional)
        ORDER BY <Column(s)>       -- 2. Defines the order within the window. (Required for Ranking/Value functions)
        ROWS/RANGE <Frame>         -- 3. Defines the subset of rows within the partition to include in the calculation (the "sliding frame"). (Optional)
    )

-- Simple Examples:

-- Example 1: Ranking (Window function: RANK)
-- Ranks products based on sales, partitioning the data by Category.
SELECT
    ProductName,
    Category,
    Sales,
    RANK() OVER (PARTITION BY Category ORDER BY Sales DESC) AS RankInCategory
FROM Sales.Orders;

-- Example 2: Rolling Aggregation (Window function: SUM)
-- Calculates the running total of Sales for a single customer.
SELECT
    OrderID,
    OrderDate,
    Sales,
    SUM(Sales) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningCustomerTotal
FROM Sales.Orders;

-- Top 3 Use Cases:

1.  **Ranking (e.g., RANK(), ROW_NUMBER(), DENSE_RANK()):** Essential for finding the 'top N' items within groups. (e.g., "Find the 3 best-selling products in every department").

2.  **Sequential Analysis (e.g., LAG(), LEAD()):** Used heavily in time series or behavioral analysis to compare a current record to a previous or future record. (e.g., "Calculate the difference between a customer's current order date and their previous order date").

3.  **Moving Averages / Running Totals (e.g., SUM() OVER()):** Key for financial and performance reporting to smooth out data fluctuations or track cumulative progress. (e.g., "Compute the 7-day average revenue for every day").
*/