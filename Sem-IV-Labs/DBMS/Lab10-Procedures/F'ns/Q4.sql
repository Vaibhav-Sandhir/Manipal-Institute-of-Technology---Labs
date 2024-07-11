SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE list(dname department.dept_name%TYPE) IS
CURSOR C1 (dname department.dept_name%TYPE) IS SELECT * FROM student WHERE dept_name = dname;
CURSOR C2 (dname department.dept_name%TYPE) IS SELECT * FROM course WHERE dept_name = dname;

BEGIN
    FOR i IN C1(dname) 
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.name || ' is from ' || i.dept_name);
    END LOOP;

    FOR j IN C2(dname)
    LOOP
        DBMS_OUTPUT.PUT_LINE(j.title || ' is offered by ' || j.dept_name);
    END LOOP;
END;
/

DECLARE 
    CURSOR C3 IS SELECT dept_name FROM department;
BEGIN
    FOR k IN C3
    LOOP
        list(k.dept_name);
    END LOOP;
END;
/        

