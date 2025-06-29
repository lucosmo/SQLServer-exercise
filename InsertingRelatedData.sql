USE AdventureWorks2019;

--INSERT CAYMAN DOLLAR
  INSERT INTO [AdventureWorks2019].[Sales].[Currency]([CurrencyCode], [Name])
  VALUES('KYD', 'Cayman dollar')

--INSERTING RELATED DATA
--MAKE SURE FK EXISTS
INSERT INTO [Sales].[CountryRegionCurrency]([CountryRegionCode],[CurrencyCode])
VALUES ('KY', 'KYD')

--INSERT NEW SALES TERRITORY - JAMAICA
INSERT INTO [Sales].[SalesTerritory]([Name], [CountryRegionCode], [Group])
VALUES ('Jamaica', 'JM', 'LATAM')

	--WITH NEW ID
INSERT INTO [Sales].[SalesTerritory]([Name], [CountryRegionCode], [Group], [rowguid])
VALUES ('Jamaica', 'JM', 'LATAM', NEWID())

DELETE FROM [Sales].[SalesTerritory]
WHERE [Name] = 'Jamaica'

DELETE FROM [Sales].[CountryRegionCurrency]
WHERE [CurrencyCode] = 'KYD'

DELETE FROM [Sales].[Currency]
WHERE [CurrencyCode] = 'KYD'
