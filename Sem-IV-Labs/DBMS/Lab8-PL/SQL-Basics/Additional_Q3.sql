SET SERVEROUTPUT ON

DECLARE 
    i NUMERIC(2) := 1;

BEGIN
    WHILE i = i LOOP
        DBMS_OUTPUT.PUT_LINE('Number is : ' || i);
        i := i + 1;
        IF i = 16 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/                