
--Customers clumed by first name, with total number of customers with that first name

--select p.FirstName [First Name], count(p.FirstName) [Total Customers With Name] 
--from [Sales].[Customer] c
--inner join [Person].[Person] p on c.PersonID = p.BusinessEntityID
--group by p.FirstName
--order by p.FirstName

--List of unique first names within customers

--select distinct p.FirstName
--from [Sales].[Customer] c
--join [Person].[Person] p on c.PersonID = p.BusinessEntityID
--order by p.FirstName

--how many customers?

--select count(p.BusinessEntityID)
--from [Sales].[Customer] c
--inner join [Person].[Person] p on p.BusinessEntityID=c.PersonID

-- Total, average, minimum and maximum sales per sale person

select 
	p.FirstName + ' ' + p.LastName [Salespercon Name],
	format(SUM(soh.TotalDue),'c') [Total],
	AVG(soh.TotalDue) [AVG],
	MIN(soh.TotalDue) [MIN],
	MAX(soh.TotalDue) [MAX]

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] soh
inner join [AdventureWorks2019].[Person].[Person] p on p.BusinessEntityID=soh.SalesPersonID
group by p.FirstName, p.LastName
