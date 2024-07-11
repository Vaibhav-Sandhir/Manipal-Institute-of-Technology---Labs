SET SERVEROUTPUT ON

DECLARE
    CURSOR C1 IS SELECT * FROM advisor;
    CURSOR C2(stu_id takes.id%TYPE) IS SELECT teaches.ID AS te_id, takes.ID AS st_id, takes.course_ID
                                       FROM teaches
                                       JOIN takes
                                       ON teaches.course_id = takes.course_id AND takes.ID = stu_id;
    pl_name student.name%TYPE;                               

BEGIN
    FOR i1 IN C1
    LOOP
        FOR i2 IN C2(i1.s_id) 
        LOOP
            IF i1.i_id = i2.te_id THEN
                SELECT name INTO pl_name
                FROM student
                WHERE id = i1.s_id;
                DBMS_OUTPUT.PUT_LINE(pl_name);
            END IF;
        END LOOP;
    END LOOP;            
END;
/    

