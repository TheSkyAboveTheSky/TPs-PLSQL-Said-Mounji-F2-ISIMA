CREATE OR REPLACE PROCEDURE raisesalary_mounji (
  p_emp_id  IN NUMBER,
  p_amount  IN NUMBER
)
IS
  v_sal_courant emp.sal%TYPE;
  v_sal_nv      emp.sal%TYPE;
  v_emp_job      emp.job%TYPE;
BEGIN
  SELECT sal, job INTO v_sal_courant, v_emp_job
  FROM emp
  WHERE empno = p_emp_id;

  v_sal_nv := v_sal_courant + p_amount;

  IF salok_mounji(v_emp_job, v_sal_nv) = 1 THEN
    UPDATE emp
    SET sal = v_sal_nv, job = v_emp_job
    WHERE empno = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Salaire augmente avec succes.');
    commit;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Erreur : Le nouveau salaire est en dehors de l''intervalle autorise.');
  END IF;
END;
/
-------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
BEGIN
    raisesalary_mounji(7369, 4000);
END;
/
-------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
BEGIN
    raisesalary_mounji(7369, 100);
END;
/
