/*
=============================================================
Create Database and Schemas + Load Gold Tables

Script Purpose:
    This script creates a new database named 'DataWarehouseAnalytics' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
WARNING:
    Running this script will drop the entire 'DataWarehouseAnalytics' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
=============================================================
*/

PRINT 'Checking if database exists...';
USE master;
GO

-- Drop DB if exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    PRINT 'Dropping existing database: DataWarehouseAnalytics';
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create DB
PRINT 'Creating new database: DataWarehouseAnalytics';
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Create gold schema
PRINT 'Creating schema: gold';
CREATE SCHEMA gold;
GO

/*
------------------------------------------------------
Create Gold Dimension & Fact Tables
------------------------------------------------------
*/

PRINT 'Creating table: gold.dim_customers';
CREATE TABLE gold.dim_customers (
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO

PRINT 'Creating table: gold.dim_products';
CREATE TABLE gold.dim_products (
	product_key int,
	product_id int,
	product_number nvarchar(50),
	product_name nvarchar(50),
	category_id nvarchar(50),
	category nvarchar(50),
	subcategory nvarchar(50),
	maintenance nvarchar(50),
	cost int,
	product_line nvarchar(50),
	start_date date
);
GO

PRINT 'Creating table: gold.fact_sales';
CREATE TABLE gold.fact_sales (
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int
);
GO


/*
------------------------------------------------------
Load Data into Gold Tables
------------------------------------------------------
*/

PRINT 'Truncating table: gold.dim_customers';
TRUNCATE TABLE gold.dim_customers;
GO

PRINT 'Loading data into: gold.dim_customers';
BULK INSERT gold.dim_customers
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_customers.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
GO


PRINT 'Truncating table: gold.dim_products';
TRUNCATE TABLE gold.dim_products;
GO

PRINT 'Loading data into: gold.dim_products';
BULK INSERT gold.dim_products
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_products.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
GO


PRINT 'Truncating table: gold.fact_sales';
TRUNCATE TABLE gold.fact_sales;
GO

PRINT 'Loading data into: gold.fact_sales';
BULK INSERT gold.fact_sales
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.fact_sales.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
GO


PRINT 'Gold Layer Creation and Data Load Completed Successfully';