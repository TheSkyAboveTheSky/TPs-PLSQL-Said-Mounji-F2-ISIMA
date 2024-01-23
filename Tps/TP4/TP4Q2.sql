CREATE OR REPLACE TRIGGER numdept_mounji
BEFORE INSERT OR UPDATE OF deptno ON emp
FOR EACH ROW
BEGIN
  IF :NEW.deptno IS NOT NULL AND (:NEW.deptno < 61 OR :NEW.deptno > 69) THEN
    :NEW.deptno := NVL(:OLD.deptno, :NEW.deptno);
  END IF;
END numdept_mounji;
/
-----------------------------------------------------------------
UPDATE emp SET deptno = 70 WHERE empno = 7000;
-----------------------------------------------------------------
INSERT INTO dept (deptno, dname, loc) VALUES (65, 'Devops', 'Chicago');
UPDATE emp SET deptno = 65 WHERE empno = 7000;
