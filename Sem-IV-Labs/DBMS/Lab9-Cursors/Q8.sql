SET SERVEROUTPUT ON

DECLARE
    CURSOR C IS SELECT * FROM instructor WHERE dept_name = 'Biology' FOR UPDATE;
    pl_budget department.budget%TYPE;
    pl_sum NUMERIC(20) := 0;

BEGIN
    SAVEPOINT a;
    SELECT budget INTO pl_budget
    FROM department
    WHERE dept_name = 'Biology';

    FOR s IN C
    LOOP
        UPDATE instructor SET salary = salary * 1.2 WHERE CURRENT OF C;
        pl_sum := pl_sum + s.salary * 1.2;
    END LOOP;

    IF pl_sum > pl_budget THEN
        ROLLBACK TO SAVEPOINT a;
    ELSE
        COMMIT;
    END IF;
END;
/           



