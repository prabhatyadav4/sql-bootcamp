/* ==============================================================================
   1. Solve an SQL Task
=================================================================================

In my SQL Server database, we have two tables:
The first table is `Sales.Orders` with the following columns: order_id, sales, customer_id, product_id.
The second table is `Sales.Customers` with the following columns: customer_id, first_name, last_name, country.
Do the following:
	- Write a query to rank customers based on their sales.
	- The result should include the customer's customer_id, full name, country, total sales, and their rank.
	- Include comments but avoid commenting on obvious parts.
	- Write three different versions of the query to achieve this task.
	- Evaluate and explain which version is best in terms of readability and performance
*/

--=================================================================================--

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

-- Version 1: Using a CTE and RANK()
WITH CustomerTotalSales AS (
    -- Step 1: Calculate the total sales for each customer
    SELECT
        c.CustomerID,
        -- Concatenate first name and last name
        c.FirstName + ' ' + c.LastName AS FullName,
        c.Country,
        -- Sum the 'Sales' column from the Orders table
        SUM(o.Sales) AS TotalSales
    FROM
        Sales.Customers AS c
    -- Join Customers to Orders using the CustomerID key
    JOIN
        Sales.Orders AS o ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID, c.FirstName, c.LastName, c.Country
)
-- Step 2: Select the results and apply the ranking function
SELECT
    CustomerID,
    FullName,
    Country,
    TotalSales,
    -- Rank customers based on TotalSales (Highest Sales = Rank 1)
    RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM
    CustomerTotalSales
ORDER BY
    CustomerRank;

--=================================================================================--

-- Version 2: Using a Subquery and DENSE_RANK()
SELECT
    sub.CustomerID,
    sub.FullName,
    sub.Country,
    sub.TotalSales,
    -- Use DENSE_RANK(). Tied sales get the same rank, and the next rank is consecutive (e.g., 1, 2, 2, 3)
    DENSE_RANK() OVER (ORDER BY sub.TotalSales DESC) AS CustomerRank
FROM
    -- Subquery to aggregate sales and customer details
    (
        SELECT
            c.CustomerID,
            c.FirstName + ' ' + c.LastName AS FullName,
            c.Country,
            SUM(o.Sales) AS TotalSales
        FROM
            Sales.Customers AS c
        JOIN
            Sales.Orders AS o ON c.CustomerID = o.CustomerID
        GROUP BY
            c.CustomerID, c.FirstName, c.LastName, c.Country
    ) AS sub
ORDER BY
    CustomerRank;

--=================================================================================--

-- Version 3: Using a Grouped Join and ROW_NUMBER()
SELECT
    c.CustomerID,
    -- Combine first and last name columns
    c.FirstName + ' ' + c.LastName AS FullName,
    c.Country,
    -- Calculate total sales for the group
    SUM(o.Sales) AS TotalSales,
    -- Use ROW_NUMBER(). Ranks are unique even for ties (e.g., 1, 2, 3, 4)
    ROW_NUMBER() OVER (ORDER BY SUM(o.Sales) DESC) AS CustomerRank
FROM
    Sales.Customers AS c
JOIN
    Sales.Orders AS o ON c.CustomerID = o.CustomerID
-- Aggregate sales by customer details
GROUP BY
    c.CustomerID, c.FirstName, c.LastName, c.Country
ORDER BY
    CustomerRank;