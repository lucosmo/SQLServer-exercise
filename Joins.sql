INSERT INTO [dbo].[JobTitles]
VALUES
('manager'),('typist'),('clerk'),('barista'),('writer')

INSERT INTO [dbo].[Employees]
VALUES ('Ben',1),
		('Adam',2),
		('George',3)

INSERT INTO [dbo].[Employees]
VALUES ('Craig',1)

SELECT * FROM
[dbo].[JobTitles] jt INNER JOIN [dbo].[Employees] e ON jt.Id=e.JobTitleId

SELECT * FROM
[dbo].[JobTitles] jt RIGHT JOIN [dbo].[Employees] e ON jt.Id=e.JobTitleId

SELECT * FROM
[dbo].[JobTitles] jt LEFT JOIN [dbo].[Employees] e ON jt.Id=e.JobTitleId

SELECT * FROM
[dbo].[JobTitles] jt CROSS JOIN [dbo].[Employees] e 

SELECT * FROM
[dbo].[JobTitles] jt FULL OUTER JOIN [dbo].[Employees] e ON jt.Id=e.JobTitleId
WHERE e.Id is null