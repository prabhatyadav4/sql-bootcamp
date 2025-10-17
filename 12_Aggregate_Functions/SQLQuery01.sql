-- Find the total number of customers

SELECT COUNT(*) AS total_orders
FROM Sales.Orders

-- Find the total sales of all orders

SELECT SUM(Sales) AS total_sales
FROM Sales.Orders 

-- Find the average sales of all orders

SELECT AVG(Sales) AS avg_sales
FROM Sales.Orders

-- Find the highest sales of all orders

SELECT MAX(Sales) AS highest_sales
FROM Sales.Orders

-- Find the lowest sales of all orders

SELECT MIN(Sales) AS lowest_sales
FROM Sales.Orders