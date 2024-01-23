CREATE OR REPLACE TRIGGER checksal_mounji
BEFORE UPDATE ON EMP
FOR EACH ROW
DECLARE
  v_new_salary NUMBER;
  v_lsal SalIntervalle_mounji.lsal%TYPE;
  v_hsal SalIntervalle_mounji.hsal%TYPE;
BEGIN
  IF :NEW.job != :OLD.job THEN
    v_new_salary := :NEW.sal + 100;

    IF :NEW.job != 'PRESIDENT' THEN
      SELECT lsal, hsal INTO v_lsal, v_hsal
      FROM SalIntervalle_mounji
      WHERE job = :NEW.job;

      IF v_new_salary > v_hsal THEN
        :NEW.sal := v_hsal;
      ELSIF v_new_salary < v_lsal THEN
        :NEW.sal := v_lsal;
      ELSE
        mounji_package.raisesalary_mounji(:NEW.empno, 100);
      END IF;
    END IF;
  END IF;
END checksal_mounji;
/
-------------------------------------------------------------------
INSERT INTO EMP VALUES (8000, 'John', 'CLERK', NULL, SYSDATE, 1100, NULL, 10);
UPDATE EMP SET job = 'MANAGER' WHERE empno = 8000;