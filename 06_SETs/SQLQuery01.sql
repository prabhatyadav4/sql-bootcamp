-- Combine the data from employees and customers into one table

SELECT
	FirstName,
	LastName
FROM Sales.Employees

UNION 

SELECT
	FirstName,
	LastName
FROM Sales.Customers