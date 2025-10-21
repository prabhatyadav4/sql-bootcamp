-- STEP 1: Find the total Sales Per Customer (Standalone CTE).

-- CTE Query 1
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)

-- STEP 2: Find the last order date for each customer (Multiple Standalone CTE).

-- CTE Query 2
, CTE_Last_Order AS
(
SELECT
	CustomerID,
	MAX(OrderDate) AS LastOrder
FROM Sales.Orders
GROUP BY CustomerID
)

-- STEP 3: Rank Customers based on Total Sales per customer (Nested CTE).

-- CTE Query 3
, CTE_Rank_Customer AS
(
SELECT 
	CustomerID,
	TotalSales,
	RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)

-- STEP 4: Segment customers based on their total sales (Nested CTE).

-- CTE Query 4
, CTE_Customer_Segments AS
(
SELECT
	CustomerID,
	CASE 
		WHEN TotalSales > 100 THEN 'High'
		WHEN TotalSales > 80 THEN 'Medium'
		ELSE 'Low'
	END AS CustomerSegments
FROM CTE_Total_Sales
)
-- Main Query
SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.TotalSales,
	clo.LastOrder,
	crc.CustomerRank,
	ccs.CustomerSegments
FROM Sales.Customers AS c
LEFT JOIN CTE_Total_Sales AS cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order AS clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Rank_Customer AS crc
ON crc.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segments AS ccs
ON ccs.CustomerID = c.CustomerID