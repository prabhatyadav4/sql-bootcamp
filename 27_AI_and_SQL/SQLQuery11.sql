/* 
==============================================================================
   10. Generate Test Dataset
==============================================================================

I need dataset for testing the following SQL Server DDL 
Do the following:
	- Generate test dataset as Insert statements.
	- Dataset should be realstic.
	- Keep the dataset small.	
	- Ensure all primary/foreign key relationships are valid (use matching IDs).
	- Dont introduce any Null values. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
TEST DATASET: INSERT STATEMENTS
------------------------------------------------------------------------------
Ensures all PK/FK constraints are met and data types are valid.
Note: IDENTITY columns (PKs) are handled automatically by SQL Server, 
      but we will explicitly set IDENTITY_INSERT for simplicity and control.
==============================================================================
*/

-- Temporarily enable IDENTITY_INSERT for explicit ID control
SET IDENTITY_INSERT Sales.Products ON;
INSERT INTO Sales.Products (ProductID, Product, Category, Price) VALUES
(1, 'Wireless Keyboard', 'Electronics', 59.99),
(2, 'Organic Coffee Beans', 'Grocery', 14.50),
(3, 'Leather Wallet', 'Accessories', 35.00);
SET IDENTITY_INSERT Sales.Products OFF;


SET IDENTITY_INSERT Sales.Customers ON;
INSERT INTO Sales.Customers (CustomerID, FirstName, LastName, Country, Score) VALUES
(101, 'Alice', 'Smith', 'USA', 95),
(102, 'Bob', 'Johnson', 'Canada', 78),
(103, 'Charlie', 'Brown', 'USA', 88);
SET IDENTITY_INSERT Sales.Customers OFF;


SET IDENTITY_INSERT Sales.Employees ON;
INSERT INTO Sales.Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(1, 'David', 'Lee', 'Sales', '1985-05-15', 'M', 60000.00, NULL), -- Manager
(2, 'Eve', 'Adams', 'Sales', '1990-11-20', 'F', 45000.00, 1),   -- Report to David
(3, 'Frank', 'Jones', 'Support', '1995-02-01', 'M', 40000.00, 1);  -- Report to David
SET IDENTITY_INSERT Sales.Employees OFF;


SET IDENTITY_INSERT Sales.Orders ON;
INSERT INTO Sales.Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES
(1001, 1, 101, 2, '2025-01-10', '2025-01-12', 'Delivered', '123 Main St', '123 Main St', 1, 59.99, GETDATE()), -- Alice bought Keyboard
(1002, 2, 101, 2, '2025-01-15', '2025-01-18', 'Shipped', '123 Main St', '123 Main St', 5, 72.50, GETDATE()),  -- Alice bought Coffee (5 * 14.50)
(1003, 3, 102, 1, '2025-02-01', '2025-02-04', 'Delivered', '456 Oak Dr', '456 Oak Dr', 1, 35.00, GETDATE()),  -- Bob bought Wallet
(1004, 1, 103, 2, '2025-02-05', '2025-02-07', 'Pending', '789 Pine Ln', '789 Pine Ln', 2, 119.98, GETDATE()); -- Charlie bought 2 Keyboards
SET IDENTITY_INSERT Sales.Orders OFF;


-- Reset IDENTITY_INSERT (Crucial for normal database operations)
SET IDENTITY_INSERT Sales.Products OFF;
SET IDENTITY_INSERT Sales.Customers OFF;
SET IDENTITY_INSERT Sales.Employees OFF;
SET IDENTITY_INSERT Sales.Orders OFF;