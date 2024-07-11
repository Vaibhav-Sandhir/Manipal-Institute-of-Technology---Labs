SET SERVEROUTPUT ON 

DECLARE
    pl_roll_no StudentTable.roll_no%TYPE;
    pl_gpa StudentTable.gpa%TYPE;

BEGIN
    pl_roll_no := '&roll_no';
    SELECT gpa
    INTO pl_gpa
    FROM StudentTable
    WHERE roll_no = pl_roll_no;
    DBMS_OUTPUT.PUT_LINE('The GPA for roll no ' || pl_roll_no || ' is ' || pl_gpa);
    END;
    /    
