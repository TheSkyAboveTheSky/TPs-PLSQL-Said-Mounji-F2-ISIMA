DECLARE
   CURSOR top_sal_emp_cur IS
      SELECT sal, empno, ename
      FROM (SELECT sal, empno, ename, RANK() OVER (ORDER BY sal DESC) AS ranking
            FROM Emp)
      WHERE ranking <= 5;

   v_sal emp.sal%TYPE;
   v_empno emp.empno%TYPE;
   v_ename emp.ename%TYPE;
BEGIN
   FOR employee_record IN top_sal_emp_cur LOOP
      v_sal := employee_record.sal;
      v_empno := employee_record.empno;
      v_ename := employee_record.ename;

      INSERT INTO Temp (num_col1, num_col2, char_col)
      VALUES (v_sal, v_empno, v_ename);
   END LOOP;
   COMMIT;
END;
/
