/* Find the average scores of customers.
   Additionally, provide details such as CustomerID and LastName. */

SELECT 
	CustomerID,
	LastName,
	Score,
	COALESCE(Score,0) AS CustomerScore,
	AVG(Score) OVER() AS AvgScores,
	AVG(COALESCE(Score,0)) OVER() AS AvgScoreWithoutNull
FROM Sales.Customers