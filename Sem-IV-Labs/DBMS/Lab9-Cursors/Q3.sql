SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT course_id, title, dept_name, credits, tot
                FROM Course NATURAL JOIN (SELECT course_id, count(course_id) AS tot
                                          FROM TAKES
                                          GROUP BY course_id);

BEGIN 
    FOR co IN C 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Course_ID: ' || co.course_id || ' Students: ' || co.tot);
    END LOOP;    
END;
/    
