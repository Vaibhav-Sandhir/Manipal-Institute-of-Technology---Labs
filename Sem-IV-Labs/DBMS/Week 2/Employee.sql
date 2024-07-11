--Q1--------------------------------------------------------------------------------
CREATE TABLE Employee (
  EmpNo numeric(10) PRIMARY KEY,
  EmpName varchar(20) NOT NULL,
  Gender varchar(1) NOT NULL CHECK (Gender = 'M' OR Gender = 'F'),
  Salary numeric(10) NOT NULL,
  Address varchar(20) NOT NULL,
  DNo numeric(5));
-----------------------------------------------------------------------------------

--Q2---------------------------------------------------------------------------------
 CREATE TABLE Department(
  DeptNo numeric(10) PRIMARY KEY,
  DeptName varchar(10) UNIQUE,
  Location varchar(20));
-----------------------------------------------------------------------------------

--Q3---------------------------------------------------------------------------------
ALTER TABLE Employee ADD CONSTRAINT FK_DNo FOREIGN KEY(DNo) REFERENCES Department(DeptNo);
-----------------------------------------------------------------------------------

--Q4---------------------------------------------------------------------------------
 INSERT ALL
  INTO Department VALUES(343, 'Biotech', 'AB2')
  INTO Department VALUES(68, 'Humanities', 'AB3')
  SELECT 1 FROM dual;

 INSERT ALL
  INTO Employee VALUES(1000,'Vishal','M',150000,'Bangalore',343)
  INTO Employee VALUES(1001,'Om','M',250000,'Delhi',68)
  SELECT 1 FROM dual;
-----------------------------------------------------------------------------------

--Q5---------------------------------------------------------------------------------
INSERT INTO Employee VALUES(1003, 'Ram', 'L', 150000, 'Chandigarh', 343); -- Check Constraint Violated 
INSERT INTO Department VALUES(2, 'Biotech', 'AB5'); -- Unique constraint Violated
-------------------------------------------------------------------------------------

--Q6---------------------------------------------------------------------------------
 DELETE FROM Department
  WHERE DeptNo = 343;         -- Child record found
------------------------------------------------------------------------------------

--Q7---------------------------------------------------------------------------------
ALTER TABLE Employee DROP CONSTRAINT FK_DNo;

ALTER TABLE Employee ADD CONSTRAINT FK_DNo FOREIGN KEY(DNo) REFERENCES Department(DeptNo)
ON DELETE CASCADE;
-------------------------------------------------------------------------------------

--Q8---------------------------------------------------------------------------------
 ALTER TABLE Employee MODIFY Salary DEFAULT 10000;
-------------------------------------------------------------------------------------

RENAME Department TO Department1;
