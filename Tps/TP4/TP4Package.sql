SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE mounji_package IS
  CURSOR emp_par_dep_mounji (p_deptno NUMBER) IS
    SELECT empno, ename FROM emp WHERE deptno = p_deptno;

  PROCEDURE raisesalary_mounji (
    p_emp_id  IN NUMBER,
    p_amount  IN NUMBER
  );

  PROCEDURE afficher_emp_mounji(p_deptno NUMBER);
END mounji_package;
/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE BODY mounji_package IS
  PROCEDURE raisesalary_mounji (
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
  END raisesalary_mounji;

  PROCEDURE afficher_emp_mounji(p_deptno NUMBER) IS
    emp_rec emp_par_dep_mounji%ROWTYPE;
  BEGIN
    OPEN emp_par_dep_mounji(p_deptno);
    LOOP
      FETCH emp_par_dep_mounji INTO emp_rec;
      EXIT WHEN emp_par_dep_mounji%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('EmpNo: ' || emp_rec.empno || ', Ename: ' || emp_rec.ename);
    END LOOP;
    CLOSE emp_par_dep_mounji;
  END afficher_emp_mounji;
END mounji_package;
/
