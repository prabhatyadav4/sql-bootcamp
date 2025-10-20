-- Assign Unique IDs to the Rows of the 'Order Archive'.

SELECT
	ROW_NUMBER() OVER(ORDER BY OrderID, OrderDate) AS UniqueID,
	*
FROM Sales.OrdersArchive