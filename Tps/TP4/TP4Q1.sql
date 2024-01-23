CREATE OR REPLACE TRIGGER raise_mounji
BEFORE UPDATE OF sal ON emp
FOR EACH ROW
BEGIN
  IF :NEW.sal < :OLD.sal THEN
    :NEW.sal := :OLD.sal;
  END IF;
END raise_mounji;
/
-----------------------------------------------------
UPDATE emp SET sal = sal - 100 WHERE empno = 7000;
------------------------------------------------------
UPDATE emp SET sal = sal + 100 WHERE empno = 7000;