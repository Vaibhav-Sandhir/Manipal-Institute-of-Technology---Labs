SET SERVEROUTPUT ON
    
CREATE OR REPLACE PROCEDURE momos IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Good Night to you');
END;
/

BEGIN
    momos;
END;
/    