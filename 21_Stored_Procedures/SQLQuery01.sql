-- STEP 1: Write a Query.
-- For US Customers, find the total number of customers and the average scores.

SELECT
	-- Reports: Summary from Customers and Orders
	COUNT(*) AS TotalCustomers,
	AVG(Score) AS AvgScore
FROM Sales.Customers
WHERE Country = 'USA';

-- STEP 2: Turning the Query into a Stored Procedure.

CREATE PROCEDURE GetCustomerSummary AS
BEGIN 
	SELECT
		COUNT(*) AS TotalCustomers,
		AVG(Score) AS AvgScore
	FROM Sales.Customers
	WHERE Country = 'USA'
END

-- STEP 3: Execute the Stored Procedure

EXEC GetCustomerSummary
