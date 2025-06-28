/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,ISNULL([Title], '') TITLE
      ,[FirstName]
      ,COALESCE([MiddleName], 'N/A') MIDDLENAME
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      
  FROM [AdventureWorks2019].[Person].[Person]

  -- DIFFERENCE BETWEEN COALESCE AND ISNULL
  DECLARE @string VARCHAR(3);
  SELECT 'COALESCE', COALESCE(@string, 'LONGER')
  UNION ALL
  SELECT 'ISNULL', ISNULL(@string, 'LONGER');

  -- (No column name)	(No column name)
  --		COALESCE	LONGER
  --			ISNULL	LON