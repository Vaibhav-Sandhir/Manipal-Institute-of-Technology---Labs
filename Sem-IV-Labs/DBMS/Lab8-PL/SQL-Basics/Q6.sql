SET SERVEROUTPUT ON 

DECLARE
    pl_max StudentTable.gpa%TYPE;
    pl_gpa StudentTable.gpa%TYPE;
    i NUMERIC(1) := 1;

BEGIN
    SELECT gpa INTO pl_max
    FROM StudentTable
    WHERE roll_no = i;

    WHILE i <= 5 LOOP
        SELECT gpa INTO pl_gpa
        FROM StudentTable
        WHERE roll_no = i;

        IF pl_gpa > pl_max THEN
            pl_max := pl_gpa;
        END IF;

        i := i + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('The max GPA is : ' || pl_max);
END;
/    