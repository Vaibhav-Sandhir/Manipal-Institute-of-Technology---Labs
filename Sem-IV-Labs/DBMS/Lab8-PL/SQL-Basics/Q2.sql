SET SERVEROUTPUT ON

DECLARE 
 pl_gpa StudentTable.gpa%TYPE;
 pl_rollno StudentTable.roll_no%TYPE;
 pl_grade VARCHAR(2);

BEGIN 
    pl_rollno := '&roll_no';
    SELECT gpa 
    INTO pl_gpa 
    FROM StudentTable
    WHERE roll_no = pl_rollno;
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
    END IF;
    DBMS_OUTPUT.PUT_LINE('Grade is : '|| pl_grade);
END;
/    

