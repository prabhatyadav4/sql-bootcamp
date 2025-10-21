-- Find the female employees whose salaries are greater than the salaries of any male employees.

-- Main Query
SELECT 
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE 
	Gender = 'F' AND 
	-- Sub Query
	Salary > ANY (
		SELECT 
		Salary
		FROM Sales.Employees
		WHERE Gender = 'M'
	)