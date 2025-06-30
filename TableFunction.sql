USE AdventureWorks2019;
GO
--TABLE FUNCTION (RETURN BEST SELLER OF THE YEAR)

CREATE OR ALTER FUNCTION lkfnGetBestSellerOfYear
(
	@Year INT
)
RETURNS TABLE
AS
RETURN
	SELECT 
		p.[FirstName],
		p.[LastName],
		SUM(sod.LineTotal) AS TOTAL
	FROM [Sales].[SalesOrderDetail] sod
	JOIN [Sales].[SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
	JOIN [Person].[Person] p ON P.BusinessEntityID = soh.SalesPersonID
	WHERE YEAR(soh.OrderDate) = @Year
	GROUP BY p.[FirstName], p.[LastName]
	HAVING SUM(sod.LineTotal) = (
		SELECT TOP 1 SUM(sod2.LineTotal)
		FROM Sales.SalesOrderDetail sod2
		JOIN Sales.SalesOrderHeader soh2 ON sod2.SalesOrderID = soh2.SalesOrderID
		JOIN Person.Person p2 ON p2.BusinessEntityID = soh2.SalesPersonID
		WHERE YEAR(soh2.OrderDate) = @Year
		GROUP BY p2.BusinessEntityID
		ORDER BY SUM(sod2.LineTotal) DESC
	)

GO
--USE OF FUNCTION
SELECT * FROM dbo.lkfnGetBestSellerOfYear(2011);