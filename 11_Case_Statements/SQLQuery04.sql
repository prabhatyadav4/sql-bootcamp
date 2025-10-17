/* Find the average scores of customers and treat Nulls as 0
   Additionally provide details such as CustomerID and LastName. */

SELECT
	CustomerId,
	LastName,
	Score,
	CASE 
		WHEN Score IS NULL THEN 0
		ELSE Score
	END ScoreClean,
	AVG(
		CASE 
		WHEN Score IS NULL THEN 0
		ELSE Score
	END) OVER() AS AvgCustomerClean, 
	AVG(Score) OVER() AS AvgCustomer 
FROM Sales.Customers