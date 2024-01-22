DECLARE
  CURSOR sal_plus_comm_emp_cursor IS
      SELECT NVL(e.sal,0) + NVL(e.comm,0) as sal_plus_commision , e.empno , e.ename
      FROM Emp e
      WHERE NVL(e.sal, 0) + NVL(e.comm, 0) > 2000;

  v_sal_plus_comm emp.sal%TYPE;
  v_empno emp.empno%TYPE;
  v_ename emp.ename%TYPE;
BEGIN
    FOR employee_record IN sal_plus_comm_emp_cursor LOOP
        v_sal_plus_comm := employee_record.sal_plus_commision;
        v_empno := employee_record.empno;
        v_ename := employee_record.ename;
  
        INSERT INTO Temp (num_col1, num_col2, char_col)
        VALUES (v_sal_plus_comm, v_empno, v_ename);
    END LOOP;
   COMMIT;
END;
/
