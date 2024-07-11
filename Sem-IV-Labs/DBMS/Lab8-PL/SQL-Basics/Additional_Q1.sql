SET SERVEROUTPUT ON

DECLARE
    pl_year NUMERIC(10);
    rem NUMERIC(10);

BEGIN
    pl_year := '&Year';
    rem := MOD(pl_year,4);
    IF rem = 0 THEN
        DBMS_OUTPUT.PUT_LINE('It is leap year');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not a leap year');
    END IF;
END;
/            
