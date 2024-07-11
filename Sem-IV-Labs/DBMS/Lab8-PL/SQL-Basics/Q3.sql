SET SERVEROUTPUT ON

DECLARE
    issue_date DATE;
    return_date DATE;
    diff NUMERIC(10);
    fine NUMBER(10);

BEGIN
    issue_date := TO_DATE('&issue_date','DD-MM-YY');
    return_date := TO_DATE('&return_date','DD-MM-YY');
    diff := (return_date - issue_date);

    IF diff <= 7 THEN
        fine := 0;
    ELSIF diff BETWEEN 8 AND 15 THEN
        fine := diff;
    ELSIF diff BETWEEN 16 AND 30 THEN
        fine := diff * 2;
    ELSIF diff >= 30 THEN
        fine := diff * 5;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Fine is :' || fine);
END;
/                            