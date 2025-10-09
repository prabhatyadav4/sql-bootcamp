/* TASK 2:
   Extract various parts of CreationTime using DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, and DAY.
*/

SELECT 
	OrderId,
	CreationTime,
	-- DATETRUNC Examples
	DATETRUNC(YEAR, CreationTime) AS Year_dt,
	DATETRUNC(DAY, CreationTime) AS Day_dt,
	DATETRUNC(MINUTE, CreationTime) AS Minute_dt,

	-- DATENAME Examples
	DATENAME(YEAR, CreationTime) AS Year_dn,
	DATENAME(MONTH, CreationTime) AS Month_dn,
	DATENAME(DAY, CreationTime) AS Day_dn,
	DATENAME(WEEKDAY, CreationTime) AS Weekday_dn,

	-- DATEPART Examples
	DATEPART(YEAR, CreationTime) AS Year_dp,
	DATEPART(MONTH, CreationTime) AS Month_dp,
	DATEPART(DAY, CreationTime) AS Day_dp,
	DATEPART(HOUR, CreationTime) AS Hour_dp,
	DATEPART(MINUTE, CreationTime) AS Minute_dp,
	DATEPART(SECOND, CreationTime) AS Second_dp,
	DATEPART(QUARTER, CreationTime) AS Quarter_dp,
	DATEPART(WEEK, CreationTime) AS Weak_dp,
	DATEPART(WEEKDAY, CreationTime) AS Weekday_dp,

	YEAR(CreationTime) AS Year,
	MONTH(CreationTime) AS Month,
	DAY(CreationTime) AS Day
FROM Sales.Orders