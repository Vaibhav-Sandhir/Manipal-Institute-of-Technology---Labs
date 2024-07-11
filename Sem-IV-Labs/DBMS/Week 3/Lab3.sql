--Q1---------------------------------------------  
SELECT course_id, year, semester, title
  FROM section NATURAL JOIN course
  WHERE semester = 'Fall' AND year = 2009
  UNION
  SELECT course_id, year, semester, title
  FROM section NATURAL JOIN course
  WHERE semester = 'Spring' AND year = 2010;
-------------------------------------------------

--Q2---------------------------------------------  
  SELECT course_id, title
  FROM section NATURAL JOIN course
  WHERE semester = 'Fall' AND year = 2009
  INTERSECT
  SELECT course_id, title
  FROM section NATURAL JOIN course
  WHERE semester = 'Spring' AND year = 2010;
------------------------------------------------

--Q3---------------------------------------------  
SELECT course_id,title
  FROM section NATURAL JOIN course
  WHERE semester = 'Fall' AND year = 2009
  MINUS
  SELECT course_id,title
  FROM section NATURAL JOIN course
  WHERE semester = 'Spring' AND year = 2010;
-------------------------------------------------

--Q4---------------------------------------------  
  SELECT title, course_id
  FROM course
  WHERE course_id NOT IN ( 
  SELECT course_id
  FROM takes);
-------------------------------------------------

--Q5---------------------------------------------
 SELECT course_id
  FROM section
  WHERE semester = 'Fall' AND Year = 2009 AND course_id IN (
  SELECT course_id
  FROM section
  WHERE semester = 'Spring' and YEAR = 2010);
-------------------------------------------------

--Q6---------------------------------------------
SELECT count(distinct id)
  FROM takes
  WHERE course_id IN (
  SELECT course_id
  FROM teaches
  WHERE ID = 10101); 
-------------------------------------------------

--Q7---------------------------------------------
 SELECT course_id
  FROM section
  WHERE semester = 'Fall' AND Year = 2009 AND course_id NOT IN (
  SELECT course_id
  FROM section
  WHERE semester = 'Spring' and YEAR = 2010);
------------------------------------------------

--Q8---------------------------------------------
 SELECT name
  FROM student
  WHERE name IN (
  SELECT name
  FROM instructor);
-------------------------------------------------

--Q9---------------------------------------------
 SELECT name, dept_name
  FROM instructor
  WHERE salary > SOME (
  SELECT salary
  FROM instructor
  WHERE dept_name = 'Biology');
-------------------------------------------------

--Q10--------------------------------------------
 SELECT name, dept_name
  FROM instructor
  WHERE salary > ALL (
  SELECT salary
  FROM instructor
  WHERE dept_name = 'Biology');
-------------------------------------------------

--Q11--------------------------------------------
 SELECT dept_name, avg(salary)
  FROM instructor
  GROUP BY dept_name
  HAVING avg(salary) >= ALL (
  SELECT avg(salary)
  FROM instructor
  GROUP BY dept_name);
------------------------------------------------

--Q12-------------------------------------------
 SELECT dept_name
  FROM department
  WHERE budget < (
  SELECT avg(salary)
  FROM instructor);
------------------------------------------------

--Q13-------------------------------------------
SELECT title, course_id
FROM course
WHERE course_id IN (
 SELECT course_id
  FROM section s1
  WHERE semester = 'Fall' AND year = 2009 AND EXISTS(
  SELECT course_id
  FROM section s2
  WHERE semester = 'Spring' AND year = 2010 AND s1.course_id = s2.course_id));
-----------------------------------------------

--Q15-----------------------------------------
SELECT course_id
  FROM course
  WHERE 1>= (
  SELECT count(course_id)
  FROM section
  WHERE course.course_id = section.course_id AND year = 2009);
----------------------------------------------

--Q16-----------------------------------------
SELECT course_id
FROM course c
WHERE 2 <= (
SELECT count(course_id)
FROM section s
WHERE c.course_id = s.course_id AND dept_name = 'Comp. Sci.');
----------------------------------------------

--Q17-----------------------------------------
SELECT avg(salary) Average
  FROM instructor
  GROUP BY dept_name
  HAVING avg(salary) > 42000;
----------------------------------------------

--Q18-----------------------------------------
CREATE VIEW all_courses AS (
  SELECT building, room_number, c.title
  FROM course c, section s
  WHERE s.semester = 'Fall' AND year = 2009);
---------------------------------------------

--Q19----------------------------------------
SELECT title
  FROM all_courses;
---------------------------------------------

--Q20-----------------------------------------
CREATE VIEW department_total_salary AS (
  SELECT dept_name, sum(salary) Total
  FROM instructor
  GROUP BY dept_name);
----------------------------------------------
  
  
