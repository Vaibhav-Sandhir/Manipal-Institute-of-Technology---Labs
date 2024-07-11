SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE listName(dname instructor.dept_name%TYPE) IS

CURSOR C1(dname instructor.dept_name%TYPE) IS SELECT name FROM instructor WHERE dept_name = dname;
CURSOR C2(dname instructor.dept_name%TYPE) IS SELECT title FROM course WHERE dept_name = dname;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Instructors: ');
    FOR i IN C1(dname)
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Courses: ');
    FOR j IN C2(dname)
    LOOP
        DBMS_OUTPUT.PUT_LINE(j.title);
    END LOOP;
END;
/

DECLARE
    pl_dep_name instructor.dept_name%TYPE;

BEGIN
    pl_dep_name := '&Dept_Name';
    listName(pl_dep_name);
END;
/    