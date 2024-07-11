DROP TABLE salary_raise;

CREATE TABLE salary_raise (
    inst_id NUMERIC(10),
    raise_date DATE,
    raise_amt NUMERIC(10)
);

SET SERVEROUTPUT ON

DECLARE 
    CURSOR C(dname instructor.dept_name%TYPE) IS SELECT * FROM instructor WHERE dept_name = dname FOR UPDATE;
    pl_dept_name instructor.dept_name%TYPE;

BEGIN 
    pl_dept_name := '&Dept_Name';
    FOR i IN C(pl_dept_name) 
    LOOP
        UPDATE instructor SET salary = salary * 1.05 WHERE CURRENT OF C;
        INSERT INTO salary_raise VALUES(i.id,SYSDATE,i.salary * 0.05);
    END LOOP;            
END;
/   

SELECT * FROM salary_raise;

