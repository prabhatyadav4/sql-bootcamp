-- Combine the data from employees and customers into one table, including duplicates.

SELECT
	FirstName,
	LastName
FROM Sales.Employees

UNION ALL

SELECT
	FirstName,
	LastName
FROM Sales.Customers