
ALTER TABLE StudentTable DROP COLUMN letter_grade;
ALTER TABLE StudentTable ADD letter_grade VARCHAR(2);

SET SERVEROUTPUT ON

DECLARE
    pl_gpa StudentTable.gpa%TYPE;
    pl_grade VARCHAR(2);
    i NUMERIC(1) := 1;
    out_of_bounds EXCEPTION;

BEGIN
    WHILE i <= 5 LOOP
        SELECT gpa INTO pl_gpa
        FROM StudentTable
        WHERE roll_no = i;

        IF pl_gpa BETWEEN 0 AND 4 THEN
            pl_grade := 'F';
        ELSIF pl_gpa BETWEEN 4 AND 5 THEN
            pl_grade := 'E';     
        ELSIF pl_gpa BETWEEN 5 AND 6 THEN
            pl_grade := 'D'; 
        ELSIF pl_gpa BETWEEN 6 AND 7 THEN
            pl_grade := 'C';
        ELSIF pl_gpa BETWEEN 7 AND 8 THEN   
            pl_grade := 'B';
        ELSIF pl_gpa BETWEEN 8 AND 9 THEN 
            pl_grade := 'A';
        ELSIF pl_gpa BETWEEN 9 AND 10 THEN
            pl_grade := 'A+';
        ELSIF pl_gpa > 10 THEN
            RAISE out_of_bounds;                           
        END IF;
            
        UPDATE StudentTable SET letter_grade = pl_grade
        WHERE roll_no = i;

        i := i + 1;
    END LOOP;

    EXCEPTION
        WHEN out_of_bounds THEN
            DBMS_OUTPUT.PUT_LINE('The gpa is greater than 10');
END;
/            

