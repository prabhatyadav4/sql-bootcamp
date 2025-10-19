-- Find the Total Number of Customers.
-- Find the Total Number of Scores for Customers.
-- Find the Total Number of Countries.

SELECT 
	*,
	COUNT(*) OVER() AS TotalCustomersStar,
	COUNT(1) OVER() AS TotalCustomersOne,
	COUNT(Score) OVER() AS TotalScore,
	COUNT(Country) OVER() AS TotalCountry
FROM Sales.Customers