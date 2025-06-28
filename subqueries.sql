-- employees who have more vacation than the average, by name
USE [AdventureWorks2019];
SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName,
	e.VacationHours,
	AvgData.AvgV
FROM [HumanResources].[Employee] e
INNER JOIN [Person].[Person] p ON p.BusinessEntityID = e.BusinessEntityID
CROSS JOIN (SELECT AVG(VacationHours) AvgV FROM [HumanResources].[Employee]) AvgData
WHERE e.VacationHours > AvgData.AvgV
ORDER BY p.FirstName, p.LastName, e.VacationHours;

--SELECT
--  E1.BusinessEntityID,
--  E1.LoginID,
--  E1.JobTitle,
--  E1.VacationHours,
--  Sub.AverageVacation --Drawn from the subquery
--FROM HumanResources.Employee E1
--JOIN (SELECT
--      JobTitle,
--      AVG(VacationHours) AverageVacation
--      FROM HumanResources.Employee E2
--      GROUP BY JobTitle) sub
--ON E1.JobTitle = Sub.JobTitle
--WHERE E1.VacationHours > Sub.AverageVacation
--ORDER BY E1.JobTitle

-- employees have more vacation hours than average for their job title
SELECT 
	E.BusinessEntityID [ID],
	P.FirstName+' '+P.LastName [NAME],
	E.JobTitle,
	E.VacationHours,
	S.VAvg [AVERAGE HOURS]
FROM [HumanResources].[Employee] E
JOIN [Person].[Person] P
ON E.BusinessEntityID = P.BusinessEntityID
JOIN (SELECT
		JobTitle,
		AVG(VacationHours) VAvg
		FROM [HumanResources].[Employee]
		GROUP BY JobTitle) S
ON E.JobTitle = S.JobTitle
WHERE E.VacationHours > S.VAvg
ORDER BY E.JobTitle

