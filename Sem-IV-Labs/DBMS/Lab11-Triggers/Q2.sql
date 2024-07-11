DROP TABLE old_data_instructor;

CREATE TABLE old_data_instructor(
    id VARCHAR(5),
    name VARCHAR(20),
    dept_name VARCHAR(20),
    salary NUMERIC(8,2)
);

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER old_fetch
BEFORE UPDATE OF salary ON instructor
FOR EACH ROW
BEGIN
    CASE
        WHEN UPDATING THEN
            INSERT INTO old_data_instructor VALUES(:OLD.id,:OLD.name,:OLD.dept_name,:OLD.salary);
    END CASE;        
END;
/        
