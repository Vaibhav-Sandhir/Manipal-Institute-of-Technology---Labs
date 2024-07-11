SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER inst_check
BEFORE INSERT OR UPDATE ON instructor
FOR EACH ROW
DECLARE
    pl_budget department.budget%TYPE;
    badname EXCEPTION;
    badsalary EXCEPTION;
BEGIN
    SELECT budget INTO pl_budget
    FROM department
    WHERE dept_name = :NEW.dept_name;

    IF :NEW.name LIKE '%0%' THEN      --all conditions need to be there
        RAISE badname;
    END IF;

    IF :NEW.salary <= 0 OR :NEW.salary > pl_budget THEN
        RAISE badsalary;
    END IF;

    EXCEPTION   
        WHEN badname THEN
            DBMS_OUTPUT.PUT_LINE('Invalid Name');
        WHEN badsalary THEN
            DBMS_OUTPUT.PUT_LINE('Salary Exceeding Budget');
END;
/                    
