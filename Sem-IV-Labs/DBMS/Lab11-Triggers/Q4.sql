DROP TABLE client_master;
DROP TABLE audit_client;

CREATE TABLE client_master(
    client_no NUMERIC(5),
    name VARCHAR(15),
    address VARCHAR(15),
    bal_due NUMERIC(5)
);

CREATE TABLE audit_client(
    client_no NUMERIC(5),
    name VARCHAR(15),
    bal_due NUMERIC(5),
    operation VARCHAR(10),
    userid VARCHAR(10),
    opdate DATE
);

SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER check_audit
BEFORE UPDATE OR DELETE ON client_master
FOR EACH ROW 
BEGIN
    CASE
        WHEN UPDATING THEN
            INSERT INTO audit_client VALUES(:OLD.client_no,:OLD.name,:OLD.bal_due,'Update','8345',SYSDATE);
        WHEN DELETING THEN
            INSERT INTO audit_client VALUES(:OLD.client_no,:OLD.name,:OLD.bal_due,'Delete','8345',SYSDATE);  
    END CASE;
END;
/            