DROP TABLE log_change_takes;

CREATE TABLE log_change_takes(
    time_of_change DATE,
    type_of_change VARCHAR(20),
    course_id VARCHAR(20)
);

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER row_change
BEFORE INSERT OR UPDATE OR DELETE ON takes
FOR EACH ROW
BEGIN
    CASE
        WHEN INSERTING THEN
            INSERT INTO log_change_takes VALUES(CURRENT_TIMESTAMP,'Insertion',:NEW.course_id);
        WHEN DELETING THEN
            INSERT INTO log_change_takes VALUES(CURRENT_TIMESTAMP,'Deleting',:OLD.course_id);
        WHEN UPDATING THEN
            INSERT INTO log_change_takes VALUEs(CURRENT_TIMESTAMP,'Updating',:NEW.course_id);
    END CASE;
END;
/                    