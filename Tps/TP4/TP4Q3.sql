CREATE OR REPLACE TRIGGER dept_mounji
BEFORE INSERT OR UPDATE ON emp
FOR EACH ROW
DECLARE
  v_department_exists NUMBER;
  v_dname VARCHAR2(100);
  v_loc VARCHAR2(100);
BEGIN
  SELECT COUNT(*) INTO v_department_exists FROM dept WHERE deptno = :NEW.deptno;
  IF v_department_exists = 0 THEN
    v_dname :='&Enter_department_name';
    v_loc :='&Enter_location';
    INSERT INTO dept(deptno, dname, loc)
    VALUES (:NEW.deptno, v_dname, v_loc);
  END IF;
END dept_mounji;
/
----------------------------------------------------------------------------
UPDATE emp SET deptno = 64 WHERE empno = 7000;