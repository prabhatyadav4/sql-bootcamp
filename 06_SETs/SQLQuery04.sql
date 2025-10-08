-- Find the customers who are not employees at the same time

SELECT
	FirstName,
	LastName
FROM Sales.Customers

EXCEPT

SELECT
	FirstName,
	LastName
FROM Sales.Employees