SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT * FROM takes WHERE course_id = 'CS-101';
    credits student.tot_cred%TYPE;
    stu_id student.ID%TYPE;

BEGIN
    FOR s IN C 
    LOOP
        SELECT tot_cred INTO credits
        FROM student 
        WHERE student.id = s.id;
        IF credits < 30 THEN
            DBMS_OUTPUT.PUT_LINE('Student with ID ' || s.id || ' is deregestired');
            DELETE FROM takes WHERE id = s.id AND course_id = 'CS-101';
        END IF;
    END LOOP;
END;
/                       