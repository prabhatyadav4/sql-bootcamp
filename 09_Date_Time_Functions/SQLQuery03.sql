/* TASK 3:
   Aggregate orders by year using DATETRUNC on CreationTime.
*/

SELECT 
	DATETRUNC(YEAR, CreationTime) AS Creation,
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(YEAR, CreationTime)
