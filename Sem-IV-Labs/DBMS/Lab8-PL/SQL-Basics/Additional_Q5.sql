SET SERVEROUTPUT ON

DECLARE
    string VARCHAR(50);
    rev_string VARCHAR(50);

BEGIN
    string := '&String';
    FOR i IN REVERSE 1..LENGTH(string) LOOP
        rev_string := rev_string || SUBSTR(string,i,1);
    END LOOP;    
    DBMS_OUTPUT.PUT_LINE('Reversed String is : ' || rev_string);
END;
/    

