USE [DbFake]
--Orders table:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);
GO

--OrderHistory table to store the historical records:
CREATE TABLE OrderHistory (
    HistoryID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    Action VARCHAR(10),
    ActionDate DATETIME,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);
GO
--ADD COLUMNS
ALTER TABLE [dbo].[Orders]
ADD Action NVARCHAR

ALTER TABLE [dbo].[Orders]
ADD ActionDate DATETIME2

-- create the AFTER trigger:
CREATE OR ALTER TRIGGER trg_OrderHistory
ON Orders
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Insert or Update action
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            -- Update action
            INSERT INTO OrderHistory (OrderID, CustomerName, OrderDate, TotalAmount, Action, ActionDate)
            SELECT d.OrderID, i.CustomerName, i.OrderDate, i.TotalAmount, 'UPDATE', GETDATE()
            FROM inserted i
            INNER JOIN deleted d ON i.OrderID = d.OrderID;
        END
        ELSE
        BEGIN
            -- Insert action
            INSERT INTO OrderHistory (OrderID, CustomerName, OrderDate, TotalAmount, Action, ActionDate)
            SELECT OrderID, CustomerName, OrderDate, TotalAmount, 'INSERT', GETDATE()
            FROM inserted;
        END
    END
    ELSE
    BEGIN
        -- Delete action
        INSERT INTO OrderHistory (OrderID, CustomerName, OrderDate, TotalAmount, Action, ActionDate)
        SELECT OrderID, CustomerName, OrderDate, TotalAmount, 'DELETE', GETDATE()
        FROM deleted;
    END
END

INSERT INTO Orders ([OrderID],[CustomerName],[OrderDate],[TotalAmount])
VALUES (5, 'JDOHNNY WRDOWN', '2023-08-12', 100.00)

UPDATE Orders
SET CustomerName = 'Ben Mick'
WHERE OrderID = 2