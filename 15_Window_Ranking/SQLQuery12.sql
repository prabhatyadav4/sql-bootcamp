-- Find the products that fall within the highest 40% of the prices (Using PERCENT_RANK).

SELECT
	Product,
	Price,
	DistRank,
	CONCAT(DistRank * 100, '%') AS DistRankPerc
FROM(
	SELECT
		Product,
		Price,
		PERCENT_RANK() OVER(ORDER BY Price) AS DistRank
	FROM Sales.Products
)t
WHERE DistRank <= 0.4;