/* ==============================================================================
   Variables in Stored Procedure
============================================================================== */

-- Define Stored Procedure
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
BEGIN

-- Declare Variables
DECLARE @TotalCustomers INT, @AvgScore FLOAT;

	-- Query 1: Find the Total Nr. of Customers and the Average Score
	SELECT
		@TotalCustomers = COUNT(*),
		@AvgScore = AVG(Score)
	FROM Sales.Customers
	WHERE Country = @Country;
	-- Print Information
	PRINT 'Total Customers from ' + @Country + ': ' + CAST(@TotalCustomers AS NVARCHAR);
	PRINT 'Avg Score from ' + @Country + ': ' + CAST(@AvgScore AS NVARCHAR);

	-- Query 2: Find the Total Nr. of Orders and Total Sales
	SELECT
			COUNT(OrderID) AS TotalOrders,
			SUM(Sales) AS TotalSales
	FROM Sales.Orders AS o
	JOIN Sales.Customers AS c
	ON c.CustomerID = o.CustomerID
	WHERE Country = @Country;
END

-- Execute Stored Procedure

EXEC GetCustomerSummary @Country = 'Germany';
EXEC GetCustomerSummary @Country = 'USA';
EXEC GetCustomerSummary;