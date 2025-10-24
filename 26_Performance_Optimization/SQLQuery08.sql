-- ##############################################################
-- #                             DDL                            #
-- ##############################################################
/*
=============================================================================
Tip 21: Avoid VARCHAR Data Type If Possible
=============================================================================
Tip 22: Avoid Using MAX or Overly Large Lengths
=============================================================================
Tip 23: Use NOT NULL If possible 
=============================================================================
Tip 24: Make sure all tables have a CLUSTERED PRIMARY KEY
=============================================================================
Tip 25: Creeate Nonclustered Index on Foreign Key if they are frequently used
=============================================================================
*/
-- Bad Practice 
CREATE TABLE CustomersInfo (
    CustomerID INT,
    FirstName VARCHAR(MAX),
    LastName TEXT,
    Country VARCHAR(255),
    TotalPurchases FLOAT, 
    Score VARCHAR(255),
    BirthDate VARCHAR(255),
    EmployeeID INT,
    CONSTRAINT FK_Bad_Customers_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Sales.Employees(EmployeeID)
);

-- Good Practice Practice 
CREATE TABLE CustomersInfo (
    CustomerID INT PRIMARY KEY CLUSTERED,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    TotalPurchases FLOAT,
    Score INT,
    BirthDate DATE,
    EmployeeID INT,
    CONSTRAINT FK_CustomersInfo_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Sales.Employees(EmployeeID)
);
CREATE NONCLUSTERED INDEX IX_CustomersInfo_EmployeeID
ON CustomersInfo(EmployeeID);