/* ===========================================================================
   9. Improve Database DDL
============================================================================== 
The following SQL Server DDL Script has to be optimized.
Do the following:
	- Naming: Check the consistency of table/column names, prefixes, standards.
	- Data Types: Ensure data types are appropriate and optimized.
	- Integrity: Verify the integrity of primary keys and foreign keys.	
	- Indexes: Check that indexes are sufficient and avoid redundancy.
	- Normalization: Ensure proper normalization and avoid redundancy. */

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
OPTIMIZED DDL SCRIPT (Based on Schema Analysis)
------------------------------------------------------------------------------
Improvements include: Optimal data types, IDENTITY columns for PKs, explicit FK
constraints with ON UPDATE CASCADE, and necessary non-clustered indexes.
==============================================================================
*/

-- 1. Products Table
CREATE TABLE Sales.Products (
    ProductID       INT             PRIMARY KEY IDENTITY(1,1), -- Use IDENTITY for auto-incrementing key
    ProductName     NVARCHAR(100)   NOT NULL,                  -- Increased length slightly for flexibility
    Category        NVARCHAR(50)    NOT NULL,                  -- Category should likely be NOT NULL
    Price           DECIMAL(10, 2)  NOT NULL CHECK (Price >= 0) -- Use DECIMAL for precise pricing
);

-- 2. Customers Table
CREATE TABLE Sales.Customers (
    CustomerID      INT             PRIMARY KEY IDENTITY(1,1),
    FirstName       NVARCHAR(50)    NOT NULL,
    LastName        NVARCHAR(50)    NULL,
    Country         NVARCHAR(50)    NOT NULL,
    Score           TINYINT         NULL CHECK (Score >= 0 AND Score <= 100) -- Optimized to TINYINT if score is small (0-255)
);

-- Index for efficient Country filtering/searching (e.g., in reporting)
CREATE NONCLUSTERED INDEX IX_Customers_Country ON Sales.Customers (Country);


-- 3. Employees Table (Self-Referencing ManagerID)
CREATE TABLE Sales.Employees (
    EmployeeID      INT             PRIMARY KEY IDENTITY(1,1),
    FirstName       NVARCHAR(50)    NOT NULL,
    LastName        NVARCHAR(50)    NOT NULL,
    Department      NVARCHAR(50)    NOT NULL,
    BirthDate       DATE            NULL,
    Gender          CHAR(1)         NULL, -- Optimized to CHAR(1)
    Salary          DECIMAL(10, 2)  NOT NULL CHECK (Salary >= 0),
    ManagerID       INT             NULL, -- Self-referencing FK
    
    CONSTRAINT FK_Employees_Manager
        FOREIGN KEY (ManagerID) REFERENCES Sales.Employees(EmployeeID)
        ON DELETE NO ACTION      -- Prevent deleting a manager who still has reports
        ON UPDATE CASCADE        -- If manager's ID changes, update reports
);

-- Index for quickly finding all employees reporting to a specific manager
CREATE NONCLUSTERED INDEX IX_Employees_ManagerID ON Sales.Employees (ManagerID);


-- 4. Orders Table (Transactional/Fact Table)
CREATE TABLE Sales.Orders (
    OrderID         INT             PRIMARY KEY IDENTITY(1,1),
    ProductID       INT             NOT NULL,
    CustomerID      INT             NOT NULL,
    SalesPersonID   INT             NULL,                      -- Changed from EmployeeID to SalesPersonID for clarity
    OrderDate       DATE            NOT NULL CHECK (OrderDate <= GETDATE()), -- Use DATE, validate date
    ShipDate        DATE            NULL CHECK (ShipDate >= OrderDate),      -- ShipDate cannot precede OrderDate
    OrderStatus     NVARCHAR(50)    NOT NULL CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    ShipAddress     NVARCHAR(255)   NULL,
    BillAddress     NVARCHAR(255)   NULL,
    Quantity        INT             NOT NULL CHECK (Quantity > 0),
    Sales           DECIMAL(10, 2)  NOT NULL,
    CreationTime    DATETIME2(0)    NOT NULL DEFAULT GETDATE(), -- Use DATETIME2(0) for optimization, default to current time
    
    -- Foreign Key Constraints
    CONSTRAINT FK_Orders_Products
        FOREIGN KEY (ProductID) REFERENCES Sales.Products(ProductID)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID) REFERENCES Sales.Customers(CustomerID)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        
    CONSTRAINT FK_Orders_SalesPerson
        FOREIGN KEY (SalesPersonID) REFERENCES Sales.Employees(EmployeeID)
        ON DELETE SET NULL ON UPDATE CASCADE -- If sales person leaves, set FK to NULL
);

-- Non-Clustered Indexes on Foreign Keys for fast joins and lookups
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID    ON Sales.Orders (CustomerID);
CREATE NONCLUSTERED INDEX IX_Orders_ProductID     ON Sales.Orders (ProductID);
CREATE NONCLUSTERED INDEX IX_Orders_SalesPersonID ON Sales.Orders (SalesPersonID);

-- Index for efficient filtering by date range
CREATE NONCLUSTERED INDEX IX_Orders_OrderDate     ON Sales.Orders (OrderDate);