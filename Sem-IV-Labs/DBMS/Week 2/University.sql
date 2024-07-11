--Q9-------------------------------------------------------------
SELECT ID, name, dept_name
  FROM student;
-----------------------------------------------------------------

--Q10------------------------------------------------------------
SELECT ID, name , dept_name
  FROM instructor
  WHERE dept_name = 'Comp. Sci.'
-----------------------------------------------------------------

--Q11------------------------------------------------------------
SELECT *
  FROM course
  WHERE dept_name = 'Comp. Sci.' AND credits = 3;
-----------------------------------------------------------------

--Q12------------------------------------------------------------
 SELECT course_id, title
  FROM course, student
  WHERE student.id = 12345;
-----------------------------------------------------------------

--Q13------------------------------------------------------------
 SELECT ID, name, salary
  FROM instructor
  WHERE salary BETWEEN 40000 AND 90000;
----------------------------------------------------------------

--Q14-----------------------------------------------------------
SELECT instructor.id
FROM instructor 
WHERE instructor.id NOT IN (SELECT teaches.id FROM teaches);
---------------------------------------------------------------

--Q15----------------------------------------------------------
SELECT stu.name,c.title,t.year
  FROM student stu, course c, takes t, section s
  WHERE s.room_number = 303 AND stu.id = t.id AND c.course_id = s.course_
id;
--------------------------------------------------------------

--Q16---------------------------------------------------------
SELECT s.name,t.course_id,c.title c_name
FROM student s,course c,takes t
WHERE t.id=s.id and c.course_id=t.course_id and t.year=2015;
--------------------------------------------------------------

--Q17---------------------------------------------------------
SELECT name,salary inst_salary
  FROM instructor
  WHERE salary > (
  SELECT MIN(salary)
  FROM instructor
  WHERE dept_name = 'Comp. Sci.');
--------------------------------------------------------------

--Q18---------------------------------------------------------
SELECT name
  FROM instructor
  WHERE dept_name LIKE '%ch%';
-------------------------------------------------------------

--Q19--------------------------------------------------------
SELECT name,length(name) name_length
  FROM student;
-------------------------------------------------------------

--Q20--------------------------------------------------------
SELECT dept_name, SUBSTR(dept_name,3,3) char_3
  FROM department;
-------------------------------------------------------------

--Q21--------------------------------------------------------
 SELECT upper(name)
  FROM instructor;
-------------------------------------------------------------

--Q22--------------------------------------------------------
UPDATE department SET budget=10000
 WHERE budget=NULL;
-------------------------------------------------------------

--Q23--------------------------------------------------------
SELECT salary, round(salary/3,-2) rounded 
FROM instructor;
-------------------------------------------------------------

