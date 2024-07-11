DROP VIEW advisor_student;

CREATE VIEW advisor_student AS 
SELECT advisor.s_id, advisor.i_id, student.name s_name, instructor.name i_name
FROM advisor, student, instructor WHERE advisor.s_id = student.id AND advisor.i_id = instructor.id;

CREATE OR REPLACE TRIGGER del_advisor
INSTEAD OF DELETE ON advisor_student
BEGIN 
    DELETE FROM advisor WHERE s_id = :OLD.s_id AND i_id = :OLD.i_id;
END;
/