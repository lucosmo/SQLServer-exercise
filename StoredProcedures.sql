CREATE PROC spMaxMin @ID INT
AS
BEGIN     
    
	 PRINT('The max Person ID id:' + CAST(@ID as NVARCHAR));
	 
	 BEGIN
	     SELECT  @ID = MIN(BusinessEntityID) FROM [Person].[Person];
	     PRINT('The min Person ID id:' + CAST(@ID as NVARCHAR));
	 END
END
GO
CREATE OR ALTER PROC spPerson @ID INT, @PT VARCHAR(2)
AS
BEGIN
	SELECT * FROM [Person].[Person]
	WHERE BusinessEntityID = @ID AND PersonType = @PT

	IF @@ROWCOUNT = 0
		PRINT('NO RECORDS')
END
  
EXEC spPerson 18, 'EM'
GO
CREATE OR ALTER PROC spFindMaxPersonIdWithMiddleName
(
	@max INT OUTPUT
)
AS
BEGIN
	SELECT @max=MAX([BusinessEntityID]) FROM [Person].[Person]
	WHERE [MiddleName] IS NOT NULL
END

--EXECUTION
DECLARE @max INT
EXEC spFindMaxPersonIdWithMiddleName @max OUTPUT
PRINT(@max)