SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE course_popular(dname course.dept_name%TYPE) IS
CURSOR C1 (dname course.dept_name%TYPE) IS SELECT course_id FROM course WHERE dept_name = dname;
CURSOR C2 (c_id course.course_id%TYPE) IS SELECT course_id, COUNT(ID) AS cnt FROM takes GROUP BY course_id HAVING course_id = c_id;
pl_max NUMERIC(5) := 0;
pl_course_id course.course_id%TYPE;

BEGIN
    FOR i IN C1(dname)
    LOOP
        FOR j IN C2(i.course_id)
        LOOP
            IF j.cnt > pl_max THEN
                pl_max := j.cnt;
                pl_course_id := j.course_id;
            END IF;    
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(pl_course_id || '  ' || pl_max);
END;
/                

DECLARE
    CURSOR C3 IS SELECT dept_name FROM department;

BEGIN
    FOR k IN C3
    LOOP
        course_popular(k.dept_name);
    END LOOP;
END;
/    


