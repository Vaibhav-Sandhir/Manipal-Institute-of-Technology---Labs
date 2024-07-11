SET SERVEROUTPUT ON

DECLARE
    issue_date NUMERIC(2);
    issue_month NUMERIC(2);
    issue_year NUMERIC(4);
    return_date NUMERIC(2);
    return_month NUMERIC(2);
    return_year NUMERIC(4);

BEGIN
    issue_date := '&Issued_Date';
    issue_month := '&Issued_Month';
    issue_year := '&Issued_Year';

    return_date := MOD(issue_date + 3,30);

    IF issue_date BETWEEN 28 AND 30 THEN
        return_month := MOD(issue_month + 1,12);
    ELSE
        return_month := issue_month;
    END IF;

    IF issue_date BETWEEN 28 AND 30 AND issue_month = 12 THEN
        return_year := issue_year + 1;
    ELSE
        return_year := issue_year;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Return Date: ' || return_date);
    DBMS_OUTPUT.PUT_LINE('Return Month: ' || return_month);
    DBMS_OUTPUT.PUT_LINE('Return Year: ' || return_year);    
END;
/            
