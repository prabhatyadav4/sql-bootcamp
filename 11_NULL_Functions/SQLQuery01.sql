-- Find the average scores of the customers 
SELECT
	CustomerID,
	Score AS Score1,
	AVG(Score) OVER() AS AvgScores1,
	COALESCE(Score, 0) AS Score2,
	AVG(COALESCE(Score,0)) OVER() AS AvgScores2
FROM Sales.Customers