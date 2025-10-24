/* ==============================================================================
   2. Improve the Readability
=================================================================================

The following SQL Server query is long and hard to understand. 
Do the following:
	- Improve its readability.
	- Remove any redundancy in the query and consolidate it.
	- Include comments but avoid commenting on obvious parts.	
	- Explain each improvement to understand the reasoning behind it.
*/
-- Bad Formated Query
WITH CTE_Total_Sales_By_Customer AS (
    SELECT 
        c.CustomerID, 
        c.FirstName + ' ' + c.LastName AS FullName,  SUM(o.Sales) AS TotalSales
    FROM  Sales.Customers c
    INNER JOIN 
        Sales.Orders o ON c.CustomerID = o.CustomerID GROUP BY  c.CustomerID, c.FirstName, c.LastName
),CTE_Highest_Order_Product AS (
    SELECT 
        o.CustomerID, 
        p.Product, ROW_NUMBER() OVER (PARTITION BY o.CustomerID ORDER BY o.Sales DESC) AS rn
    FROM Sales.Orders o
    INNER JOIN Sales.Products p ON o.ProductID = p.ProductID
),
CTE_Highest_Category AS (  SELECT 
        o.CustomerID,  p.Category, 
        ROW_NUMBER() OVER (PARTITION BY o.CustomerID ORDER BY SUM(o.Sales) DESC) AS rn
    FROM Sales.Orders o
    INNER JOIN Sales.Products p ON o.ProductID = p.ProductID GROUP BY  o.CustomerID, p.Category
),
CTE_Last_Order_Date AS (
    SELECT 
        CustomerID, 
        MAX(OrderDate) AS LastOrderDate
    FROM  Sales.Orders
    GROUP BY CustomerID
),
CTE_Total_Discounts_By_Customer AS (
    SELECT o.CustomerID,  SUM(o.Quantity * p.Price * 0.1) AS TotalDiscounts
    FROM  Sales.Orders o INNER JOIN Sales.Products p ON o.ProductID = p.ProductID
    GROUP BY o.CustomerID
)
SELECT 
    ts.CustomerID, ts.FullName,
    ts.TotalSales,hop.Product AS HighestOrderProduct,hc.Category AS HighestCategory,
    lod.LastOrderDate,
    td.TotalDiscounts
FROM CTE_Total_Sales_By_Customer ts
LEFT JOIN (SELECT CustomerID, Product FROM CTE_Highest_Order_Product WHERE rn = 1) hop ON ts.CustomerID = hop.CustomerID
LEFT JOIN (SELECT CustomerID, Category FROM CTE_Highest_Category WHERE rn = 1) hc ON ts.CustomerID = hc.CustomerID
LEFT JOIN CTE_Last_Order_Date lod ON ts.CustomerID = lod.CustomerID
LEFT JOIN  CTE_Total_Discounts_By_Customer td ON ts.CustomerID = td.CustomerID
WHERE  ts.TotalSales > 0
ORDER BY  ts.TotalSales DESC

------------------------------------------------------------------------------
--	#RESULT
------------------------------------------------------------------------------

-- CTE 1: CustomerRankings - Pre-calculates the necessary SUM (intermediate aggregate)
WITH CustomerRankings AS (
    SELECT
        o.CustomerID,
        p.Product,
        p.Category,
        o.Sales AS OrderSales,
        
        -- Calculate the total sales for this specific category and customer
        SUM(o.Sales) OVER (PARTITION BY o.CustomerID, p.Category) AS CategoryTotalSales,
        
        -- Apply the simple rank based on individual order sales
        ROW_NUMBER() OVER (
            PARTITION BY o.CustomerID 
            ORDER BY o.Sales DESC
        ) AS ProductRank
        
    FROM
        Sales.Orders o
    INNER JOIN Sales.Products p ON o.ProductID = p.ProductID
),

-- CTE 2: FinalRanking - Uses the pre-calculated CategoryTotalSales for ranking
FinalRanking AS (
    SELECT DISTINCT
        CustomerID,
        Product,
        CategoryTotalSales,
        ProductRank,
        
        -- Now, FIRST_VALUE/ROW_NUMBER uses the pre-calculated CategoryTotalSales
        -- This avoids nesting and resolves Msg 4109
        FIRST_VALUE(Category) OVER (
            PARTITION BY CustomerID 
            ORDER BY CategoryTotalSales DESC
        ) AS HighestCategory,
        
        -- To use FIRST_VALUE for Product, we use the simple rank from CTE 1
        FIRST_VALUE(Product) OVER (
            PARTITION BY CustomerID 
            ORDER BY ProductRank ASC -- Since Rank 1 is the highest
        ) AS HighestOrderProduct
        
    FROM 
        CustomerRankings
)

-- Final SELECT: Join with a separate CTE (not shown here for brevity) that has the total aggregates (TotalSales, LastOrderDate, etc.)
SELECT DISTINCT
    fr.CustomerID,
    -- ... other aggregate fields like TotalSales, FullName, etc.
    fr.HighestOrderProduct,
    fr.HighestCategory
FROM
    FinalRanking fr
-- ORDER BY TotalSales DESC (assuming TotalSales is available from another joined CTE)