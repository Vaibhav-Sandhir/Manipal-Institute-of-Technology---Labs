SET SERVEROUTPUT ON

DECLARE
    num NUMERIC(5);
    rev_num NUMERIC(5);
    string VARCHAR(20);
    rev_string VARCHAR(20);

BEGIN
    num := '&Number';
    string := TO_CHAR(num);
    FOR i IN REVERSE 1..LENGTH(string) LOOP
        rev_string := rev_string || SUBSTR(string,i,1);
    END LOOP;
    rev_num := TO_NUMBER(rev_string);    
    DBMS_OUTPUT.PUT_LINE('Reversed String is : ' || rev_num);
END;
/    