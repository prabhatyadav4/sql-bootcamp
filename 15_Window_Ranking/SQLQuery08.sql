-- Divide Orders into Groups Based on Sales.

SELECT
	OrderID,
	ProductID,
	Sales,
	NTILE(1) OVER(ORDER BY Sales DESC) AS OneBucket,
	NTILE(2) OVER(ORDER BY Sales DESC) AS TwoBucket,
	NTILE(3) OVER(ORDER BY Sales DESC) AS ThreeBucket,
	NTILE(4) OVER(ORDER BY Sales DESC) AS FourBucket,
	NTILE(2) OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS TwoBucketByProducts
FROM Sales.Orders