SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION highest_instr (dname department.dept_name%TYPE)
RETURN instructor.name%TYPE AS pl_name instructor.name%TYPE;
pl_max instructor.salary%TYPE;

BEGIN
    SELECT MAX(salary) INTO pl_max 
    FROM instructor
    WHERE dept_name = dname;
    
    SELECT name INTO pl_name
    FROM instructor
    WHERE salary = pl_max AND dept_name = dname;

    RETURN pl_name;
END;
/  

DECLARE 
    CURSOR C IS SELECT dept_name FROM department;

BEGIN
    FOR i IN C
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.dept_name || ' ' || highest_instr(i.dept_name));
    END LOOP;
END;
/