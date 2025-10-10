-- Format CreationTime into various string representations.

SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime, 'MM-dd-YYYY') AS USA_Format,
	FORMAT(CreationTime, 'dd-MM-YYYY') AS EURO_Format,
	FORMAT(CreationTime, 'dd') AS dd,
	FORMAT(CreationTime, 'ddd') AS ddd,
	FORMAT(CreationTime, 'dddd') AS dddd,
	FORMAT(CreationTime, 'MM') AS MM,
	FORMAT(CreationTime, 'MMM') AS MMM,
	FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders
