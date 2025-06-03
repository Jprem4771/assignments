use contact_management;

-- Create the Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

-- Create the Contact table
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,  -- Format: YYYY-MM-DD
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- Create the ContactEmployee junction table
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,  -- Format: YYYY-MM-DD
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 4
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley';

-- 5
update Company
set CompanyName = 'Urban Outfitters'
where CompanyName = 'Urban Outfitters, Inc.';

-- 6
delete from ContactEmployee
where ContactEmployeeID = 1;


select * from ContactEmployee;

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES 
(3, 'lee', 'Bland', 70000.00, '2021-06-01', 'HR Manager', 'lbland@example.com', '215-555-1234');

-- 7
SELECT DISTINCT E.FirstName, E.LastName
FROM Employee E
JOIN ContactEmployee CE ON E.EmployeeID = CE.EmployeeID
JOIN Contact C ON CE.ContactID = C.ContactID
JOIN Company CO ON C.CompanyID = CO.CompanyID
WHERE CO.CompanyName = 'Toll Brothers';



/*(9) What is Normalization in Databases?
Normalization is the process of organizing data in a database so that There’s no duplication (repeated data), Data is stored efficiently, and Relationships between tables are clear.
It breaks big tables into smaller ones and connects them using keys
*/

/*(10) What is a JOIN in MySQL?
A JOIN in MySQL is used to combine data from two or more tables based on a related column between them.
*/

/*(11) What are DDL, DCL, and DML in MySQL?

DDL – Data Definition Language
it is used to define or change the structure of a database (like creating tables)

CREATE, ALTER and DROP are used in ddl comands

DML – Data Manipulation Language
it is used to work,manuplate the data inside the tables:

SELECT, INSERT, UPDATE, DELETE

DCL – Data Control Language
it is Used to control the access and give permissions:

GRANT, REVOKE
*/