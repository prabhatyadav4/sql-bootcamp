/*
==============================================================================
   14. Comparing SQL Concepts
============================================================================== 

I want to understand the differences between SQL Windows and GROUP BY.
Do the following:
	- Explain the key differences between the two concepts.
	- Describe when to use each concept, with examples.
	- Provide the pros and cons of each concept.	
	- Summarize the comparison in a clear side-by-side table. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
Comparing SQL Concepts: Window Functions vs. GROUP BY
==============================================================================

-- Key Differences:
The core distinction lies in how the final result set is formed:

1.  **Row Count:** GROUP BY collapses multiple rows into a single summary row for each group. Window Functions perform calculations over a set of rows but RETAIN the original row detail in the output.
2.  **Access to Detail:** After a GROUP BY operation, the individual row data used to form the group is lost (or inaccessible). Window Functions keep the original, unaggregated columns available alongside the calculated metric.
3.  **Output:** GROUP BY returns a summary table. Window Functions return a result column that is added to the original table.

------------------------------------------------------------------------------
-- When to Use Each Concept:

-- 1. Use GROUP BY when you need:
    - A summary table showing metrics per group (e.g., total, average).
    - To reduce the number of rows in the final output.

    Example: Find the total sales for every country.
    SELECT Country, SUM(Sales) AS TotalCountrySales
    FROM Sales.Orders
    GROUP BY Country;

-- 2. Use Window Functions when you need:
    - To compare an individual row to its group's aggregate without losing the row detail.
    - Ranking (e.g., finding the top 3 best sellers in each region).
    - Sequential calculations (e.g., running totals, prior period comparisons using LAG/LEAD).

    Example: List every order, and show the average sales for its entire country next to it.
    SELECT
        OrderID,
        Country,
        Sales,
        AVG(Sales) OVER (PARTITION BY Country) AS CountryAverageSales
    FROM Sales.Orders;

------------------------------------------------------------------------------
-- Pros and Cons:

-- GROUP BY
    - Pros:
        - Highly efficient for producing simple summary reports.
        - The syntax is widely understood across all levels of SQL users.
        - Reduces the size of the final result set dramatically.
    - Cons:
        - The individual detail used for aggregation is destroyed/removed from the output.
        - Cannot be easily used to calculate complex sequential metrics (like running totals).

-- WINDOW FUNCTIONS
    - Pros:
        - Retains full row-level detail, allowing direct comparison between the row and its group.
        - Capable of complex analysis like ranking, running totals, and time-based comparisons (LAG/LEAD).
        - Often more readable for complex partitioning logic than self-joins.
    - Cons:
        - Can be less performant than a simple GROUP BY on huge datasets, as they process and retain more rows.
        - More complex syntax (requiring the OVER clause and PARTITION BY/ORDER BY).

------------------------------------------------------------------------------
-- Summary Comparison (Side-by-Side):

| Feature                            | GROUP BY                                                        | WINDOW FUNCTIONS                                        |
|------------------------------------|-----------------------------------------------------------------|---------------------------------------------------------|
| **Result**                         | Returns one row per group (summary).                            | Returns one row per original input row (detail).        |
| **Data Access**                    | Destroys row detail; only non-aggregated columns are available. | Retains row detail; all original columns are available. |
| **Core Goal**                      | Aggregation and Data Reduction.                                 | Comparison and Contextual Calculation.                  |
| **Typical Use**                    | Total sales per month, Average salary per department.           | Ranking, Running Totals, Percentiles, MoM comparisons.  |

*/