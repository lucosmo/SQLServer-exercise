DECLARE @a INT = 0
DECLARE @b INT = 0

WHILE @a <= 10
BEGIN
	IF @a = 0
		BEGIN
			SET @b = @b + @a
			PRINT('A=0, B='+CAST(@b AS NVARCHAR))
			SET @a += 1
		END
	ELSE
		BEGIN
			SET @b = @b + @a
			PRINT('A='+CAST(@a AS NVARCHAR)+' B='+CAST(@b AS NVARCHAR))
			SET @a += 1
		END
END