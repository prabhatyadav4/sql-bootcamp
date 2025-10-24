/* ===========================================================================
   8. Documentations & Comments
==============================================================================

The following SQL Server query lacks comments and documentation.
Do the following:
	Insert a leading comment at the start of the query describing its overall purpose.
	Add comments only where clarification is necessary, avoiding obvious statements.
	Create a separate document explaining the business rules implemented by the query.	
	Create another separate document describing how the query works.
*/

WITH CTE_Total_Sales AS 
(
SELECT 
    CustomerID,
    SUM(Sales) AS TotalSales
FROM Sales.Orders 
GROUP BY CustomerID
),
CTE_Customer_Segements AS (
SELECT 
	CustomerID,
	CASE 
		WHEN TotalSales > 100 THEN 'High Value'
		WHEN TotalSales BETWEEN 50 AND 100 THEN 'Medium Value'
		ELSE 'Low Value'
	END CustomerSegment
FROM CTE_Total_Sales
)

SELECT 
c.CustomerID, 
c.FirstName,
c.LastName,
cts.TotalSales,
ccs.CustomerSegment
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segements ccs
ON ccs.CustomerID = c.CustomerID

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
SQL Query Documentation and Business Analysis
============================================================================== */

-- 1. SQL Query:

-- Query Purpose:
-- This query calculates the total lifetime sales for every customer and assigns them to a specific segmentation bucket (High, Medium, or Low Value) based on their sales total.

WITH CTE_Total_Sales AS (
    -- Calculate the aggregated total sales (Monetary Value component) for each customer.
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSales
    FROM
        Sales.Orders
    GROUP BY
        CustomerID
),
CTE_Customer_Segements AS (
    SELECT
        CustomerID,
        -- Apply defined business rules to classify customers based on their TotalSales.
        CASE
            WHEN TotalSales > 100               THEN 'High Value'
            WHEN TotalSales BETWEEN 50 AND 100  THEN 'Medium Value'
            ELSE 'Low Value'
        END AS CustomerSegment
    FROM
        CTE_Total_Sales
)
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cts.TotalSales,
    ccs.CustomerSegment
FROM
    Sales.Customers c
-- Join to retrieve the calculated total sales amount (ensures all customers are listed, even those with no orders).
LEFT JOIN
    CTE_Total_Sales cts ON cts.CustomerID = c.CustomerID
-- Join to retrieve the final customer segmentation label.
LEFT JOIN
    CTE_Customer_Segements ccs ON ccs.CustomerID = c.CustomerID
ORDER BY
    cts.TotalSales DESC;

/*
------------------------------------------------------------------------------
2. Business Rules Implemented by the Query:

- **Overall Purpose:** The query implements the **Monetary (M) component** of an RFM analysis by classifying customers into strategic value tiers based on their total generated revenue.
- **High Value Customer (BR-001):** Assigned if Lifetime Total Sales is **> 100**.
- **Medium Value Customer (BR-002):** Assigned if Lifetime Total Sales is **>= 50 AND <= 100**.
- **Low Value Customer (BR-003):** Assigned if Lifetime Total Sales is **< 50**.

------------------------------------------------------------------------------
3. Query Workflow Description (How the Query Works):

- **Stage 1: CTE_Total_Sales (Aggregation):** This CTE first joins all orders and uses `GROUP BY CustomerID` with `SUM(Sales)` to compute the **TotalSales** for every customer.
- **Stage 2: CTE_Customer_Segments (Segmentation):** This CTE takes the result from Stage 1 and applies a `CASE` expression to assign a **CustomerSegment** label based on the predefined sales thresholds.
- **Stage 3: Main Query (Final Join):** The final SELECT starts with the primary `Sales.Customers` table and uses **LEFT JOINs** to attach the calculated **TotalSales** (from the first CTE) and the final **CustomerSegment** label (from the second CTE). This ensures a complete list of customers is returned, even those with NULL sales data.
*/