-- THIS SQL FILE CONSISTS OF BASIC CRUD OPERATIONS
-- Creating a database
CREATE DATABASE BASICS;
USE BASICS;

-- DDL SQL Statements
-- CREATE, ALTER, DROP, TRUNCATE
-- CREATE
CREATE TABLE Departments (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);
CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    DeptID INT NOT NULL,
    HireDate DATE NOT NULL,
    Gender CHAR(1),
    Salary INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- ALTER
ALTER TABLE Employees 
ADD DOB DATE;

-- DROP
DROP TABLE Employees;

-- TRUNCATE
TRUNCATE TABLE Employees;

-- DML SQL Statements
-- UPDATE, INSERT, DELETE
-- INSERT
INSERT INTO Departments VALUES ('A'), ('B');
INSERT INTO Employees (EmpName, DeptID, HireDate, Salary) VALUES ('XYZ', 1, '2024-03-12', 2500000);
INSERT INTO Employees (EmpName, DeptID, HireDate, Salary) VALUES ('XYZ1', 2, '2024-01-02', 1500000);

-- UPDATE
UPDATE Employees SET Gender = 'M' WHERE Employees.EmpID = 1
UPDATE Employees SET Gender = 'F' WHERE Employees.EmpID = 2

-- DELETE
DELETE FROM Employees WHERE Employees.Gender = 'M';

-- DQL SQL Statements
-- SELECT
SELECT * FROM Departments;
SELECT * FROM Employees WHERE Employees.Gender = 'M';

-- DCL SQL Statements
-- GRANT, REVOKE
GRANT ALL ON Employees TO sa;
REVOKE DROP ON Employees TO sa;

-- TCL SQL Statements
-- BEGIN, COMMIT, SAVEPOINT, ROLLBACK
BEGIN TRANSACTION A
INSERT INTO Employees (EmpName, DeptID, HireDate, Salary) VALUES ('XYZ1', 2, '2024-01-02', 1500000);
COMMIT TRANSACTION A
BEGIN TRANSACTION B
UPDATE Employees SET Gender = 'M' WHERE Employees.EmpID = 1
ROLLBACK TRANSACTION B