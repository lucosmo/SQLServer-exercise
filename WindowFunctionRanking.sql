-- assign a unique row number to each employee ordered by LoginID

SELECT E1.BusinessEntityID, 
	   E1.LoginID,
	   E1.JobTitle,
	   E1.VacationHours,
	   ROW_NUMBER() OVER(ORDER BY E1.LoginID) AS [RowCount]
FROM [HumanResources].[Employee] E1

---Rank employee by vacation hours in the department
SELECT E1.BusinessEntityID, 
	   E1.LoginID,
	   E1.JobTitle,
	   E1.VacationHours,
	   RANK() OVER(PARTITION BY E1.JobTitle ORDER BY E1.VacationHours) AS [Rank]
FROM [HumanResources].[Employee] E1