--Q1---------------------------
SELECT count(ID),course_id
  FROM takes
  GROUP BY course_id;
-------------------------------   

--Q2---------------------------
 SELECT count(ID),dept_name
  FROM student
  GROUP BY dept_name
  HAVING count(ID) > 2;
-------------------------------

--Q3---------------------------
 SELECT count(course_id),dept_name
  FROM course
  GROUP BY dept_name;
-------------------------------

--Q4---------------------------
 SELECT dept_name,avg(salary)
  FROM instructor
  GROUP BY dept_name
  HAVING avg(salary) > 42000;
-------------------------------

--Q5---------------------------
 SELECT count(ID),course_id,sec_id,semester,year
  FROM section  NATURAL JOIN takes 
  WHERE semester = 'Spring' AND year = 2009
  GROUP BY (course_id,sec_id,semester,year);
-------------------------------

--Q6---------------------------
SELECT *
  FROM prereq
  ORDER BY course_id DESC;
-------------------------------

--Q7---------------------------
SELECT *
  FROM instructor
  ORDER BY salary DESC;
-------------------------------

--Q8---------------------------
SELECT max(total_salary)
  FROM (
  SELECT dept_name,sum(salary) AS total_salary
  FROM instructor
  GROUP BY dept_name);
-------------------------------

--Q9---------------------------
SELECT dept_name,avg_salary
  FROM (
  SELECT dept_name,avg(salary) AS avg_salary
  FROM instructor
  GROUP BY dept_name)
  WHERE avg_salary > 42000;
------------------------------

--Q10-------------------------
 SELECT max(count_id),sec_id
    FROM (
    SELECT course_id,sec_id,semester,year,count(ID) AS count_id
      FROM section  NATURAL JOIN takes
      WHERE semester = 'Spring' AND year = 2009
      GROUP BY (course_id,sec_id,semester,year));
------------------------------

--Q11------------------------- 
SELECT i.name
FROM instructor i
WHERE i.id IN(
SELECT t.id
    FROM teaches t
    WHERE t.course_id IN (
     SELECT ta.course_id
      FROM student s,takes ta
      WHERE s.id = ta.id AND s.dept_name = 'Comp. Sci.'));
------------------------------

--Q12-------------------------
SELECT dept_name,avg_salary,count
FROM(
SELECT dept_name,avg(salary) AS avg_salary,count(id) AS count
FROM instructor
GROUP BY dept_name)
WHERE avg_salary >= 50000 AND count>= 2;
-------------------------------

--Q13--------------------------
WITH max_budget(val) AS (
SELECT max(budget)
FROM department)
SELECT d.dept_name,d.budget
FROM department d,max_budget m
WHERE d.budget = m.val;
------------------------------

--Q14-------------------------
WITH dept_total_salary(dept_name,tot_salary) AS(
SELECT dept_name,sum(salary) AS tot_salary
FROM instructor
GROUP BY dept_name),
avg_salary(val) AS(
SELECT avg(tot_salary)
FROM dept_total_salary)
SELECT d.dept_name
FROM dept_total_salary d,avg_salary A
WHERE d.tot_salary > a.val;
-----------------------------

--Q15------------------------
WITH total_enrol (course_id,sec_id,semester,year,count) AS(
SELECT course_id,sec_id,semester,year,count(id)
FROM takes
WHERE semester = 'Fall' AND year = 2009
GROUP BY course_id,sec_id,semester,year)
SELECT t.course_id,t.sec_id,t.semester,t.year,t.count
FROM total_enrol t
WHERE t.count = (SELECT max(count)
                 FROM total_enrol);
---------------------------

--Q16-----------------------
WITH total_creds(dept_name,total) AS
  (SELECT dept_name,sum(tot_cred)
  FROM student
  GROUP BY dept_name)
  SELECT t.dept_name
  FROM total_creds t
  WHERE t.total > (SELECT total
  FROM total_creds
  WHERE dept_name = 'Finance');
---------------------------

--Q17----------------------
SAVEPOINT s1;
DELETE FROM instructor
 WHERE dept_name = 'Finance';
ROLLBACK;
--------------------------

--Q18---------------------
Savepoint B;
DELETE FROM course
 WHERE dept_name = 'Comp. Sci.';
ROLLBACK;
--------------------------

--Q19--------------------
Savepoint c;
UPDATE student SET dept_name = 'Finance' WHERE dept_name = 'Comp. Sci.';
ROLLBACK;
-------------------------

--Q20---------------------
Savepoint s2;
 UPDATE instructor SET Salary =
  (Case
  WHEN salary > 100000 THEN salary*1.03
  ELSE salary*1.05
  END);
ROLLBACK;
-------------------------

--Q21--------------------
Savepoint s3;
 INSERT INTO STUDENT(
  SELECT id,name,dept_name,0
  FROM instructor
  WHERE id NOT IN (SELECT id FROM student));
ROLLBACK;
-------------------------

--Q22--------------------
Savepoint s4;
DELETE FROM instructor
WHERE salary < (SELECT avg(salary) FROM instructor);
ROLLBACK;
-------------------------

