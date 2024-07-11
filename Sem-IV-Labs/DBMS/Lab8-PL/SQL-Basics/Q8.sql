DROP TABLE StudentTable

--Populate With University

SET SERVEROUTPUT ON

DECLARE
    pl_id instructor.id%TYPE;
    pl_name instructor.name%TYPE;
    pl_dept_name instructor.dept_name%TYPE;
    pl_salary instructor.salary%TYPE;
    frequency NUMERIC(2);
    exc_name EXCEPTION;
    no_name EXCEPTION;

BEGIN
    pl_name := '&Name';

    SELECT COUNT(*)
    INTO frequency
    FROM instructor
    WHERE name = pl_name;

    IF frequency > 1 THEN 
        RAISE exc_name;
    ELSIF frequency = 0 THEN
        RAISE no_name;    
    END IF;

    SELECT id, dept_name, salary
    INTO pl_id, pl_dept_name, pl_salary
    FROM Instructor
    WHERE name = pl_name;

    DBMS_OUTPUT.PUT_LINE('Name : ' || pl_name);
    DBMS_OUTPUT.PUT_LINE('ID : ' || pl_id);
    DBMS_OUTPUT.PUT_LINE('Dept Name : ' || pl_dept_name);
    DBMS_OUTPUT.PUT_LINE('Salary : ' || pl_salary);

    EXCEPTION
        WHEN exc_name THEN
            DBMS_OUTPUT.PUT_LINE('Multiple Instructors');
        WHEN no_name THEN 
            DBMS_OUTPUT.PUT_LINE('No Name in the records');
END;
/                
