--Q1-------------------------------------
SELECT Bdate, Address
  FROM employee
  WHERE fname = 'John' AND minit = 'B' AND lname = 'Smith';
SELECT Fname,minit,lname,address,dname
  FROM department d,employee e
  WHERE d.mgr_ssn = e.ssn AND dname = 'Research';
-----------------------------------------

--Q2-------------------------------------
SELECT pnumber,dnumber,lname,address,bdate
 FROM employee e, department d,project p
 WHERE e.dno=d.dnumber and p.dnum=d.dnumber and d.mgr_ssn = employee.ssn AND plocation='Stanford';
-----------------------------------------

--Q3-------------------------------------
SELECT distinct(salary)
  FROM employee;
-----------------------------------------

--Q4-------------------------------------
SELECT e1.fname,e1.lname,e2.fname Manager
FROM employee e1,employee e2
WHERE e1.super_ssn = e2.ssn;
-----------------------------------------

--Q5-------------------------------------
SELECT essn,pno,fname,lname
  FROM works_on w,employee e
  WHERE w.essn = e.ssn AND lname = 'Smith';
-----------------------------------------

--Q6-------------------------------------
SELECT fname,lname,address
  FROM employee
  WHERE address LIKE '%Houston%';
-----------------------------------------

--Q7-------------------------------------
SELECT fname,salary*1.1 Salary
  FROM project,employee
  WHERE pname = 'ProductX' AND dno = dnum;
-----------------------------------------

--Q8-------------------------------------
SELECT fname,lname,salary
  FROM employee
  WHERE dno = 5 AND salary BETWEEN 30000 AND 40000;
-----------------------------------------

--Q9-------------------------------------
SELECT pno,dno,fname,lname
  FROM works_on,employee
  WHERE essn = ssn ORDER BY dno,fname,lname;
-----------------------------------------

--Q10------------------------------------
SELECT ssn,fname,lname
  FROM employee
  WHERE super_ssn IS NULL;
-----------------------------------------

--Q11------------------------------------
SELECT fname,minit,lname
 FROM employee e,dependent d
 WHERE e.fname=d.dependent_name and e.sex=d.sex;
-----------------------------------------

--Q12------------------------------------
SELECT fname,lname,ssn
FROM employee
WHERE ssn NOT IN (
SELECT essn
FROM dependent);
-----------------------------------------

--Q13------------------------------------
SELECT distinct fname
FROM employee,department,dependent
WHERE ssn = mgr_ssn AND ssn = essn;
-----------------------------------------

--Q14------------------------------------
SELECT pnumber,ssn
  FROM project,employee
  WHERE pnumber IN(1,2,3) AND dnum = dno ORDER BY pnumber;
-----------------------------------------

--Q15------------------------------------
SELECT sum(salary) SUM,max(salary) MAX,min(salary) MIN,avg(salary) AVG
  FROM employee;
-----------------------------------------

--Q16------------------------------------
SELECT sum(salary) SUM,max(salary) MAX,min(salary) MIN,avg(salary) AVG
  FROM department,employee
  WHERE dname = 'Research' AND dnumber = dno;
-----------------------------------------

--Q17------------------------------------
 CREATE VIEW nums AS
  SELECT pno,count(essn) count
  FROM works_on
  GROUP BY pno;
SELECT pname,pno,count
  FROM project,nums
  WHERE pno = pnumber;
-----------------------------------------

--Q18-----------------------------------
SELECT pname,pno,count
  FROM project,nums
  WHERE pno = pnumber AND count > 2;
----------------------------------------

--Q19-----------------------------------
CREATE VIEW nums2 AS
  SELECT dno,count(ssn) no_emps
  FROM employee
  GROUP BY dno;
CREATE VIEW num3 AS
  SELECT dno
  FROM nums2
  WHERE no_emps > 4;
SELECT dno,count(ssn)
FROM nums2 NATURAL JOIN employee
WHERE salary > 40000
GROUP BY dno;
----------------------------------------    
