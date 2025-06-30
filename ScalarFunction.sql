USE AdventureWorks2019;
GO
--SCALAR FUNCTION (RETURN BEST SELL ORDER OF THE YEAR)

CREATE OR ALTER FUNCTION lkfnGetBestSellOfYear
(
	@Year INT
)
RETURNS DECIMAL (10,2)
AS
BEGIN
	DECLARE @BestSell AS DECIMAL(10,2)
	SELECT @BestSell = MAX([LineTotal])
	FROM [Sales].[SalesOrderDetail]
	WHERE YEAR([ModifiedDate]) = @Year
	RETURN @BestSell
END
GO
--USE OF FUNCTION
SELECT [dbo].[lkfnGetBestSellOfYear](2011)