create table SalIntervalle_mounji (job varchar2(9), lsal number(7,2), hsal number(7,2)); 
insert into SalIntervalle_mounji  values ('ANALYST', 2500, 3000) ; 
insert into SalIntervalle_mounji   values ('CLERK', 900, 1300) ; 
insert into SalIntervalle_mounji   values ('MANAGER', 2400, 3000) ; 
insert into SalIntervalle_mounji   values ('PRESIDENT', 4500, 4900) ; 
insert into SalIntervalle_mounji   values ('SALESMAN', 1200, 1700) ;
-----------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION salok_mounji (
    p_job     IN VARCHAR2,
    p_salaire IN NUMBER
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM SalIntervalle_mounji im
    WHERE im.job = p_job 
    AND p_salaire BETWEEN im.lsal AND im.hsal;

    RETURN CASE WHEN v_count > 0 THEN 1 ELSE 0 END;
END;
/
---------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
    result NUMBER;
BEGIN
    result := salok_mounji('CLERK', 5000);
    DBMS_OUTPUT.PUT_LINE('Resultat: ' || result);
END;
/
---------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
    result NUMBER;
BEGIN
    result := salok_mounji('CLERK', 900);
    DBMS_OUTPUT.PUT_LINE('Resultat: ' || result);
END;
/
