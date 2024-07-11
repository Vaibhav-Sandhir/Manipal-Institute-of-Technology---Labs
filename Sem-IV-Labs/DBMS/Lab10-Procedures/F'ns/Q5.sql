SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION num_sqr (x NUMBER)
RETURN NUMBER AS sqr_number NUMBER;
BEGIN
    sqr_number := x * x;
    RETURN sqr_number;
END;
/

DECLARE 
    x NUMBER;
BEGIN
    x := '&Number';
    DBMS_OUTPUT.PUT_LINE('Square of ' || x || ' is ' || num_sqr(x));
END;
/

        