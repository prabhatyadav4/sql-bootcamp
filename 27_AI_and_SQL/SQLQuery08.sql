/* ===========================================================================
   7. Styling & Formatting
============================================================================== 

The following SQL Server query hard to understand. 
Do the following:
	Restyle the code to make it easier to read.
	Align column aliases.
	Keep it compact - do not introduce unnecessary new lines.	
	Ensure the formatting follows best practices.
*/
-- Bad Styled Query
with CTE_Total_Sales as 
(Select 
CustomerID, sum(Sales) as TotalSales 
from Sales.Orders 
group by CustomerID),
cte_customer_segments as 
(SELECT CustomerID, 
case when TotalSales > 100 then 'High Value' 
when TotalSales between 50 and 100 then 'Medium Value' 
else 'Low Value' end as CustomerSegment 
from CTE_Total_Sales)
select c.CustomerID, c.FirstName, c.LastName, 
cts.TotalSales, ccs.CustomerSegment 
FROM sales.customers c 
left join CTE_Total_Sales cts 
ON cts.CustomerID = c.CustomerID 
left JOIN cte_customer_segments ccs ON ccs.CustomerID = c.CustomerID

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

/*
==============================================================================
Restyled Query: Customer Segmentation based on Sales
==============================================================================
*/
WITH CTE_Total_Sales AS (
    -- Calculate the total sales for each customer
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSales
    FROM
        Sales.Orders
    GROUP BY
        CustomerID
),
CTE_Customer_Segments AS (
    -- Determine the customer segment based on the calculated total sales
    SELECT
        CustomerID,
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
-- Join to bring in the total sales calculation
LEFT JOIN
    CTE_Total_Sales cts ON cts.CustomerID = c.CustomerID
-- Join to assign the final segment label
LEFT JOIN
    CTE_Customer_Segments ccs ON ccs.CustomerID = c.CustomerID
ORDER BY
    cts.TotalSales DESC;