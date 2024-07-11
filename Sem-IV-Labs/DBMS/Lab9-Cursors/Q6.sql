SET SERVEROUTPUT ON

DECLARE
    CURSOR C (c_id teaches.course_id%TYPE) IS SELECT name, id, course_id FROM teaches NATURAL JOIN instructor WHERE course_id = c_id;
    pl_course_id teaches.course_id%TYPE;

BEGIN
    pl_course_id := '&Course_ID';
    FOR info IN C(pl_course_id) 
    LOOP
       DBMS_OUTPUT.PUT_LINE('Name : ' || info.name);
    END LOOP;
END;
/        

