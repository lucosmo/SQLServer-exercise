SELECT [Title], [FirstName], [LastName],
		CASE([Title])
			WHEN 'Mr.' THEN 'Mister'
			WHEN 'Mrs.' THEN 'Mistress'
			ELSE 'N/A'
		END
		AS Title
FROM [Person].[Person]