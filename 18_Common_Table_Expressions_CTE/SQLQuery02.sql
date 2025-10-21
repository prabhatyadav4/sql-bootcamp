-- Generate a sequence of numbers from 1 to 20.

-- CTE Query
WITH Series AS
(
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
SELECT
	*
FROM Series

-- Control Recursion
-- OPTION(MAXRECURSION 50)