CREATE DATABASE CompanyManagementSystem;

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);

CREATE TABLE Employes
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),

    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,

    BirthDate DATE NOT NULL,

    Phone NVARCHAR(20) NOT NULL,

    NationalID NVARCHAR(20) UNIQUE NOT NULL,

    Nationality NVARCHAR(50) NOT NULL,

    MaritalStatus NVARCHAR(20) NOT NULL,

    Photo NVARCHAR(255),

    HireDate DATE NOT NULL,

    Password NVARCHAR(255) NOT NULL,

    Role NVARCHAR(20) NOT NULL,

    DepartmentID INT NOT NULL,

    CONSTRAINT FK_Employee_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

CREATE TABLE Tasks
(
    TaskID INT PRIMARY KEY IDENTITY(1,1),

    Title NVARCHAR(100) NOT NULL,

    StartDate DATE NOT NULL,

    DueDate DATE NOT NULL,

    Description NVARCHAR(MAX),

    Importance NVARCHAR(20) NOT NULL,

    EmployeeID INT NOT NULL,

    CONSTRAINT FK_Task_Employee
    FOREIGN KEY(EmployeeID)
    REFERENCES Employes(EmployeeID)
);

CREATE TABLE ContactMessages
(
    MessageID INT PRIMARY KEY IDENTITY(1,1),

    Name NVARCHAR(100) NOT NULL,

    Email NVARCHAR(100) NOT NULL,

    Subject NVARCHAR(150),

    Message NVARCHAR(MAX) NOT NULL,

    SentDate DATETIME DEFAULT GETDATE()
);

SELECT *
FROM INFORMATION_SCHEMA.TABLES;

INSERT INTO Departments (DepartmentName, Description)
VALUES
('Human Resources', 'HR Department'),
('Information Technology', 'IT Department'),
('Finance', 'Finance Department'),
('Sales', 'Sales Department');

SELECT * FROM Departments;

INSERT INTO Employes
(
    FirstName,
    LastName,
    BirthDate,
    Phone,
    NationalID,
    Nationality,
    MaritalStatus,
    Photo,
    HireDate,
    Password,
    Role,
    DepartmentID
)
VALUES
('Ahmad','Saber','2002-04-12','0791111111','1111111111','Jordanian','Single','ahmad.jpg','2025-01-10','123456','Manager',2),

('Ali','Khaled','1999-08-20','0792222222','2222222222','Jordanian','Married','ali.jpg','2025-02-15','123456','Employee',2),

('Sara','Ahmad','2000-01-05','0793333333','3333333333','Jordanian','Single','sara.jpg','2025-03-01','123456','Employee',1),

('Omar','Yousef','1998-11-18','0794444444','4444444444','Jordanian','Married','omar.jpg','2025-04-20','123456','Employee',3);

SELECT * FROM Employes;

INSERT INTO Tasks
(
    Title,
    StartDate,
    DueDate,
    Description,
    Importance,
    EmployeeID
)
VALUES
('Build Login Page',
'2026-07-01',
'2026-07-05',
'Create Login Page',
'High',
2),

('Fix Bugs',
'2026-07-02',
'2026-07-07',
'Fix Reported Bugs',
'Medium',
2),

('Prepare Monthly Report',
'2026-07-03',
'2026-07-10',
'Prepare Sales Report',
'High',
4),

('Update Employee Data',
'2026-07-04',
'2026-07-08',
'Update Employees Information',
'Low',
3);

SELECT * FROM Tasks;

INSERT INTO ContactMessages
(
    Name,
    Email,
    Subject,
    Message
)
VALUES
('Mohammad',
'mohammad@gmail.com',
'Complaint',
'There is an issue with the website.'),

('Lina',
'lina@gmail.com',
'Suggestion',
'Please add dark mode.'),

('Yousef',
'yousef@gmail.com',
'Support',
'I cannot login to my account.');

SELECT * FROM ContactMessages;
