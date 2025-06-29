USE AdventureWorks2019;

--FULL INSERT

--WITH COLUMN NAMES
INSERT INTO [Production].[UnitMeasure] ([UnitMeasureCode], [Name], [ModifiedDate])
VALUES ('CXX', 'Cexxc', GETDATE())

--WITHOUT COLUMN NAMES
INSERT INTO [Production].[UnitMeasure]
VALUES 
	('CX1', 'Cexxc1', GETDATE()),
	('CX2', 'Cexxc2', GETDATE()),
	('CX3', 'Cexxc3', GETDATE())

--DELETE ADDED RECORDS
DELETE FROM [Production].[UnitMeasure]
WHERE UnitMeasureCode IN ('CX1', 'CX2', 'CX3', 'CXX');
