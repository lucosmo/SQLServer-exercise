USE AdventureWorks2019

-- subquery
SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	   (SELECT MAX(UnitPrice) FROM [Sales].[SalesOrderDetail]) AS MaxUnitPrice,
	   (SELECT MIN(UnitPrice) FROM [Sales].[SalesOrderDetail]) AS MinUnitPrice	
FROM [Sales].[SalesOrderDetail]

-- OVER

SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	MAX(UnitPrice) OVER() AS MaxUnitPrice,
	MIN(UnitPrice) OVER() AS MinUnitPrice
FROM [Sales].[SalesOrderDetail]

-- PARTITION

SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	MAX(UnitPrice) OVER(PARTITION BY SalesOrderID) AS MaxUnitPrice,
	MIN(UnitPrice) OVER(PARTITION BY SalesOrderID) AS MinUnitPrice
FROM [Sales].[SalesOrderDetail]

-- SUM BY SALES ORDER

SELECT SalesOrderID,CarrierTrackingNumber, OrderQty,
	SUM(UnitPrice) OVER(PARTITION BY SalesOrderID) AS Total
FROM [Sales].[SalesOrderDetail]