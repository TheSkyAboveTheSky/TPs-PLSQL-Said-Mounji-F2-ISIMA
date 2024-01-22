SET SERVEROUTPUT ON;
DECLARE
  empno_base emp.empno%TYPE;
  emp_record emp%ROWTYPE;
  v_sal      emp.sal%TYPE;
  v_ename    emp.ename%TYPE;
BEGIN
  empno_base := 7902;

  WHILE TRUE LOOP
    BEGIN
      SELECT * INTO emp_record
      FROM emp
      WHERE empno = (SELECT mgr FROM emp WHERE empno = empno_base);

      IF emp_record.sal > 4000 THEN
        v_sal   := emp_record.sal;
        v_ename := emp_record.ename;
        INSERT INTO Temp (num_col1, char_col) VALUES (v_sal, v_ename);
      END IF;

      empno_base := emp_record.empno;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        EXIT; 
    END;
  END LOOP;
END;
/
