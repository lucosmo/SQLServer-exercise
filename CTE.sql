USE [AdventureWorks2019];

-- show id sales person whos SalesYTD are no smaller than average
WITH CTE_BEST_SALESMEN
AS 
(SELECT [BusinessEntityID] FROM [Sales].[SalesPerson]
WHERE [SalesYTD] >= (SELECT AVG(SalesYTD) FROM [Sales].[SalesPerson])
)
SELECT * FROM CTE_BEST_SALESMEN