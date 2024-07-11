SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT * FROM StudentTable FOR UPDATE;
    pl_grade VARCHAR(2);

BEGIN
    FOR s IN C
    LOOP
        UPDATE StudentTable SET letter_grade = 'F' WHERE CURRENT OF C;
    END LOOP;

    FOR s IN C
    LOOP
        IF s.gpa BETWEEN 0 AND 4 THEN
            pl_grade := 'F';
        ELSIF s.gpa BETWEEN 4 AND 5 THEN
            pl_grade := 'E';     
        ELSIF s.gpa BETWEEN 5 AND 6 THEN
            pl_grade := 'D'; 
        ELSIF s.gpa BETWEEN 6 AND 7 THEN
            pl_grade := 'C';
        ELSIF s.gpa BETWEEN 7 AND 8 THEN   
            pl_grade := 'B';
        ELSIF s.gpa BETWEEN 8 AND 9 THEN 
            pl_grade := 'A';
        ELSIF s.gpa BETWEEN 9 AND 10 THEN
            pl_grade := 'A+';                       
        END IF;
        UPDATE StudentTable SET letter_grade = pl_grade WHERE CURRENT OF C;
    END LOOP;
END;
/        
