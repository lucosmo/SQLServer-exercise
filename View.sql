USE AdventureWorks2019;
GO
--VIEW SHOWING DETAILS OF EMPLOYEE
CREATE VIEW vLKEmployeeDetail
AS
SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName,
	e.LoginID,
	e.JobTitle,
	a.City
FROM [Person].[Person] p
JOIN [HumanResources].[Employee] e ON p.BusinessEntityID = e.BusinessEntityID
JOIN [Person].[BusinessEntityAddress] bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN [Person].[Address] a ON a.[AddressID] = bea.[AddressID]

--USE OF VIEW
SELECT * FROM vLKEmployeeDetail
ORDER BY LastName