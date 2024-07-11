SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT * FROM instructor ORDER BY salary DESC;
    i NUMERIC(2) := 1;

BEGIN
    FOR s IN C
    LOOP
        DBMS_OUTPUT.PUT_LINE('Name : ' || s.name || ' Salary: ' || s.salary);
        i := i + 1;
        IF i > 10 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/                