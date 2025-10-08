-- Find the employees, who are also customers.

SELECT
	FirstName,
	LastName
FROM Sales.Employees

INTERSECT

SELECT
	FirstName,
	LastName
FROM Sales.Customers