/* ===========================================================================
   4. Optimize Execution Plan
============================================================================== 

The image is the execution plan of SQL Server query.
Do the following:
	- Describe the execution plan step by step.
	- Identify performance bottlenecks and issues.
	- Suggest ways to improve performance and optimize the execution plan.
*/

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Execution Plan Optimization Analysis
==============================================================================

1. Description of Execution Plan Steps:

   - High-Cost Data Scans: The plan starts with highly inefficient full data reads: a **Table Scan (26%)** on the 'OrdersArc' table and a **Clustered Index Scan (23%)** on the 'Customers' table. This means the engine is reading almost the entire contents of these large tables.
   - Aggregation: A **Stream Aggregate (25%)** processes the large dataset resulting from the scans (likely calculating sums or counts).
   - Joining: Multiple **Nested Loop Joins** are used. Though individually low in cost percentage, they iterate repeatedly over large input sets, which is inefficient.

------------------------------------------------------------------------------
2. Performance Bottlenecks:

   - **Primary Bottleneck: Full Table Scans (49% Total Cost):** The massive cost of the Table Scan and Clustered Index Scan shows a critical lack of appropriate indexing for the query's filtering and joining predicates.
   - **Inefficient Joins:** The database resorts to Nested Loop Joins with large inputs, which typically results in poor performance compared to Hash or Merge Joins.

------------------------------------------------------------------------------
3. Suggestions for Optimization:

   - **Indexing:** The most crucial fix is to create **non-clustered indexes** on the columns used for filtering or joining the 'OrdersArc' and 'Customers' tables. This will convert the costly Scans into fast **Index Seeks**.
   - **Join Strategy:** Ensure database **statistics are current** on all join columns. This can prompt the optimizer to use more efficient **Hash** or **Merge Joins**.
   - **Query Review:** Verify the underlying SQL avoids inefficient patterns like correlated subqueries for aggregation or non-sargable functions (e.g., functions on indexed columns in the WHERE clause).

*/