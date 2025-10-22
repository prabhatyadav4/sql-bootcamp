/* ==============================================================================
   Error Handling TRY CATCH in Stored Procedure
============================================================================== */

-- Define Stored Procedure
ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'
AS 
BEGIN

	BEGIN TRY
		-- Declare Variables
		DECLARE @TotalCustomers INT, @AvgScore FLOAT;

			/* --------------------------------------------------------------------------
				Prepare & Cleanup Data
			-------------------------------------------------------------------------- */
			IF EXISTS (SELECT 1 FROM Sales.Customers WHERE SCORE IS NULL AND Country = @Country)
				BEGIN 
					PRINT('Updating NULL Scores to 0');
					UPDATE Sales.Customers
					SET Score = 0
					WHERE Score IS NULL AND Country = @Country;
				END

			ELSE
				BEGIN
					PRINT('No NULL Scores found')
				END;
		
			/* --------------------------------------------------------------------------
				Generating Reports
			 -------------------------------------------------------------------------- */

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
					SUM(Sales) AS TotalSales,
					1/0 AS FaultyCalculation  -- Intentional error for demonstration
			FROM Sales.Orders AS o
			JOIN Sales.Customers AS c
			ON c.CustomerID = o.CustomerID
			WHERE Country = @Country;
	END TRY
	BEGIN CATCH
		/* --------------------------------------------------------------------------
           Error Handling
        -------------------------------------------------------------------------- */
		PRINT('An Error Occured.');
		PRINT('Error Message: ' + ERROR_MESSAGE());
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR));
		PRINT('Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR));
		PRINT('Error Procedure: ' + ISNULL(ERROR_PROCEDURE(), 'N/A'));
	END CATCH
END

-- Execute Stored Procedure

EXEC GetCustomerSummary @Country = 'Germany';
EXEC GetCustomerSummary @Country = 'USA';
EXEC GetCustomerSummary;