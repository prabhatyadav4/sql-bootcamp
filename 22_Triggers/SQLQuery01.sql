/* ----------------------------------------------------------------------------
   SQL Triggers
------------------------------------------------------------------------------- */

-- STEP 1: Create Log Table
CREATE TABLE Sales.EmployeeLogs(
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeID INT,
	LogMessage VARCHAR(255),
	LogDate DATE
)	

-- STEP 2: Create Trigger on Employees Table
CREATE TRIGGER trg_AfterInsertEmployee ON Sales.Employees
AFTER INSERT
AS
BEGIN 
	INSERT INTO Sales.EmployeeLogs(EmployeeID, LogMessage, LogDate)
	SELECT
		EmployeeID,
		'New Employee Added: ' + COALESCE(FirstName, '') + ' ' + COALESCE(LastName, ''),
		GETDATE()
	FROM INSERTED
END

-- STEP 3: Insert New Data Into Employees
INSERT INTO Sales.Employees
VALUES 
	(6, 'Maria', 'Doe', 'HR', '1998-08-18', 'F', 80000, 3);

-- STEP 4: Check the Logs
SELECT * FROM Sales.Employees