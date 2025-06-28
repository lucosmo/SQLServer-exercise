USE AdventureWorks2019;

-- The script lets you compare each product's safety stock level with the levels of the products 
-- directly before and after it in the sequence ordered by ProductID

SELECT ProductID,Name,ProductNumber, SafetyStockLevel,
LEAD(SafetyStockLevel,1,0) OVER (ORDER BY ProductID) as NextStockLevel,
LAG(SafetyStockLevel,1,0) OVER (ORDER BY ProductID) as PrevStockLevel
FROM [Production].[Product]
