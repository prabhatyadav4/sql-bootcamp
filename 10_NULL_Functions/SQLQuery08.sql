-- Demonstrate differences between NULL, empty strings, and blank spaces

WITH Orders AS(
SELECT 1 Id, 'A' Category UNION
SELECT 2, NULL UNION
SELECT 3, '' UNION
SELECT 4, '   ' 
)
SELECT 
	*,
	DATALENGTH(Category) AS LenCategory,
	TRIM(Category) AS Policy1,
	NULLIF(TRIM(Category), '') AS Policy2,
	COALESCE(NULLIF(TRIM(Category), ''), 'unknown') AS Policy3
FROM Orders