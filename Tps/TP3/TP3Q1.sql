SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE createdept_mounji (
    p_numero_dept IN dept.deptno%TYPE,
    p_dept_name   IN dept.dname%TYPE,
    p_localisation IN dept.loc%TYPE
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Dept WHERE deptno = p_numero_dept;
    IF v_count = 0 THEN
        INSERT INTO Dept (deptno, dname, loc) 
        VALUES (p_numero_dept, p_dept_name, p_localisation);
        DBMS_OUTPUT.PUT_LINE('Departement cree avec succes.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Un departement avec le numero ' || p_numero_dept || ' existe deja.');
    END IF;
END;
/
BEGIN
    createdept_mounji(50, 'IT', 'New York');
END;
/
