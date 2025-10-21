-- Find male employees whose salaries are greater than the salaries of all female employee.

-- Main Query
SELECT
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'M' AND
	Salary > ALL (
		SELECT
			Salary
		FROM Sales.Employees
		WHERE Gender = 'F'
	)