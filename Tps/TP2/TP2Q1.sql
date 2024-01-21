SET SERVEROUTPUT ON;

DECLARE
   v_ename   emp.ename%TYPE;
   v_sal     emp.sal%TYPE;
   v_comm    emp.comm%TYPE;
   v_dname   dept.dname%TYPE;
BEGIN
   SELECT e.ename, e.sal, e.comm, d.dname
   INTO v_ename, v_sal, v_comm, v_dname
   FROM emp e
   JOIN dept d ON e.deptno = d.deptno
   WHERE e.ename = 'MILLER';

   DBMS_OUTPUT.PUT_LINE('- Nom de l''employe : ' || v_ename);
   DBMS_OUTPUT.PUT_LINE('- Salaire de l''employe : ' || v_sal);

   IF v_comm IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('- Commission de l''employe : ' || v_comm);
   ELSE
      DBMS_OUTPUT.PUT_LINE('- Pas de commission pour cet employe.');
   END IF;

   DBMS_OUTPUT.PUT_LINE('- Nom du departement : ' || v_dname);
END;
/

