USE AdventureWorks2019;

--PARTIAL INSERT (WITHOUT DATE)
INSERT INTO [Production].[UnitMeasure] ([UnitMeasureCode], [Name])
VALUES ('DDX', 'Dddsax')

--DELETE INSERTED ROW
DELETE FROM [Production].[UnitMeasure]
WHERE [UnitMeasureCode] = 'DDX'