SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT* FROM student ORDER BY tot_cred ASC;
    i NUMERIC(2) := 1;

BEGIN
    FOR j IN C
    LOOP
        DBMS_OUTPUT.PUT_LINE(j.id || ' ' ||  j.name  || ' ' || j.dept_name || ' ' || j.tot_cred);
        i := i + 1;
        IF i > 10 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/                  
