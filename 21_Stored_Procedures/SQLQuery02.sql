-- For Germany Customers, find the total number of customers and the average scores.

CREATE PROCEDURE GetCustomerSummaryGermany AS
BEGIN 
	SELECT
		COUNT(*) AS TotalCustomers,
		AVG(Score) AS AvgScore
	FROM Sales.Customers
	WHERE Country = 'Germany'
END

-- Execute the Stored Procedure

EXEC GetCustomerSummaryGermany

-- Delete the Stored Procedure

DROP PROCEDURE GetCustomerSummaryGermany

/* ==============================================================================
   Parameters in Stored Procedure
============================================================================== */

-- Edit the Stored Procedure
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
BEGIN 
	SELECT
		-- Reports: Summary from Customers and Orders
		COUNT(*) AS TotalCustomers,
		AVG(Score) AS AvgScore
	FROM Sales.Customers
	WHERE Country = @Country
END

--Execute Stored Procedure
EXEC GetCustomerSummary @Country = 'USA'
EXEC GetCustomerSummary @Country = 'Germany'
EXEC GetCustomerSummary 