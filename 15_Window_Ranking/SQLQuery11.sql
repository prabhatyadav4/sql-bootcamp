-- Find the products that fall within the highest 40% of the prices (Using CUME_DIST).

SELECT
	Product,
    Price,
    DistRank,
	CONCAT(DistRank * 100, '%') AS DistRankPerc
FROM(
SELECT
	Product,
	Price,
	CUME_DIST() OVER(ORDER BY Price DESC) AS DistRank
FROM Sales.Products
)t
WHERE DistRank <= 0.4;