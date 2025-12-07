-- CTE'S
USE SQL;
-- Find the second highest salary among employees
WITH CTE AS (
    SELECT MAX(Salary) AS MAX_SALARY
    FROM Employees
)
SELECT * 
FROM Employees
WHERE Employees.Salary IN (
    SELECT MAX(Salary) AS SECOND_HIGHEST_SALARY
    FROM Employees
    WHERE Employees.Salary < (SELECT MAX_SALARY FROM CTE)
);

-- List all projects with the names of employees working on them.
-- CTE
WITH CTE AS (
    SELECT EmployeeProjects.EmpID AS EmpID, Projects.ProjectName AS ProjectName, Projects.ProjectID
    FROM EmployeeProjects INNER JOIN Projects
    ON EmployeeProjects.ProjectID = Projects.ProjectID
)
SELECT CTE.ProjectID AS ProjectID, CTE.ProjectName AS ProjectName, Employees.EmpID AS EmpID, Employees.EmpName AS EmpName, Employees.Gender AS Gender
FROM CTE INNER JOIN Employees
ON CTE.EmpID = Employees.EmpID
ORDER BY ProjectID;

-- MULTIPLE CTE'S
-- Retrieve the employee(s) with the highest salary in each department.
WITH CTE1 AS (
    SELECT Employees.DeptID AS DEPT_ID, MAX(Employees.Salary) AS MAX_SALARY
    FROM Employees
    GROUP BY Employees.DeptID
),
CTE2 AS (
    SELECT Employees.EmpName AS Employee_with_max_salary, CTE1.DEPT_ID AS DEPT, CTE1.MAX_SALARY AS MAX_SALARY
    FROM CTE1 INNER JOIN Employees
    ON CTE1.DEPT_ID = Employees.DeptID
    WHERE Employees.Salary = CTE1.MAX_SALARY
)
SELECT CTE2.Employee_with_max_salary AS EMPLOYEE_WITH_MAX_SALARY, Departments.DeptName AS DEPARTMENT, CTE2.MAX_SALARY AS EMPLOYEE_MAX_SALARY
FROM CTE2 INNER JOIN Departments
ON CTE2.DEPT = Departments.DeptID
ORDER BY CTE2.MAX_SALARY DESC;

-- RECURSIVE CTE'S
-- Using a recursive CTE, generate the last 10 calendar dates
WITH CTE AS(
    SELECT CAST(GETDATE() AS DATE) AS DT
    UNION ALL
    SELECT DATEADD(DAY, -1, DT)
    FROM CTE
    WHERE DT > DATEADD(DAY, -9, CAST(GETDATE() AS DATE))
)
SELECT *
FROM CTE;