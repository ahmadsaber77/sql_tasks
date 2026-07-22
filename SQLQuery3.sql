insert into custemer values ('ahmad','saber' ,'ahmad@gmail.com' );
CREATE TABLE customers (
    customerID INT IDENTITY(1,1),
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT PK_customers PRIMARY KEY (customerID)
);
GO
INSERT INTO customers (firstname, lastname, email)
VALUES ('Rama', 'Daraghmeh', 'rama1@email.com');
GO
select * from customers ;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    EmployeeID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(30) DEFAULT 'Pending',

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    Category NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(20),
    JobTitle NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    Department NVARCHAR(50)
);

SELECT DB_NAME() AS CurrentDatabase;

SELECT
    TABLE_CATALOG AS DatabaseName,
    TABLE_SCHEMA AS SchemaName,
    TABLE_NAME AS TableName
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'orders';