 CREATE TABLE employee(
    emp_no numeric(2),
    emp_name varchar(20),
    emp_address varchar(20));

INSERT ALL
    INTO employee VALUES(1,'Messi','Rosario')
    INTO employee VALUES(3,'Iniesta','Barcelona')
    INTO employee VALUES(4,'Cryuff','Netherlands')
    INTO employee VALUES(6,'Dr.Rana','Manipal')
    INTO employee VALUES(7,'Keshav','Mangalore')
    SELECT 1 FROM dual;

SELECT emp_name FROM employee;

SELECT emp_name FROM employee
    WHERE emp_address = 'Manipal';

ALTER TABLE employee ADD Salary numeric(10);

 UPDATE employee SET Salary = 1000000
  WHERE emp_name = 'Messi';
 UPDATE employee SET Salary = 10002
  WHERE emp_name = 'Iniesta';
 UPDATE employee SET Salary = 100000
  WHERE emp_name = 'Dr.Rana';
 UPDATE employee SET Salary = 10003
  WHERE emp_name = 'Keshav';
 UPDATE employee set Salary = 10004
  WHERE emp_name = 'Cryuff';

 DESC employee;

 DELETE FROM employee
   WHERE emp_address = 'Mangalore';

 RENAME employee TO employee1;

 DROP TABLE employee1;

 

