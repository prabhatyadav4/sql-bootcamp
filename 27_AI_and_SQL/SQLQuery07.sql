/* ===========================================================================
   6. Explain the Result
============================================================================== 

I didn't understand the result of the following SQL Server query.
Do the following:
	- Break down how SQL processes the query step by step.
	- Explaining each stage and how the result is formed.
*/
WITH Series AS (
	-- Anchor Query
	SELECT
	1 AS MyNumber
	UNION ALL
	-- Recursive Query
	SELECT
	MyNumber + 1
	FROM Series
	WHERE MyNumber < 20
)
-- Main Query
SELECT *
FROM Series

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Query Explanation: Recursive CTE (Number Series)
==============================================================================

This query uses a Recursive Common Table Expression (CTE) named 'Series' to generate a sequence of integers from 1 to 20.

1. Anchor Member (Initialization):
   - Action: The query before the UNION ALL is executed first: SELECT 1 AS MyNumber.
   - Result: This establishes the starting point, generating the first row: MyNumber = 1.

2. Recursive Member (Iteration/Loop):
   - The query after the UNION ALL executes repeatedly, using the result from the previous step as its input.
   - Action: SELECT MyNumber + 1 is executed, adding 1 to the last generated number.
   - Condition: The loop continues ONLY as long as the termination condition is met: WHERE MyNumber < 20.

3. Termination:
   - The loop stops when the last generated number (19 + 1 = 20) is checked against the WHERE clause.
   - Since 20 < 20 is FALSE, the recursion ends, preventing an infinite loop.

4. Final Query (Result):
   - The main SELECT * FROM Series retrieves all rows generated in the Anchor step (1) plus all rows generated during the recursive loop (2 through 20).

Final Result: A single column, MyNumber, containing the integers 1, 2, 3, ..., 20.
*/