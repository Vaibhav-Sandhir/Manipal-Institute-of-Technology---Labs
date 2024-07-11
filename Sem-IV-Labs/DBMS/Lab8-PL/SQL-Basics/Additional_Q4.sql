SET SERVEROUTPUT ON

DECLARE 
    i NUMERIC(2) := 1;
    rem NUMERIC(1);

BEGIN
    WHILE i <= 10 LOOP
        rem := MOD(i,2);
        IF rem = 1 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
        i := i + 1;
    END LOOP;
END;
/                