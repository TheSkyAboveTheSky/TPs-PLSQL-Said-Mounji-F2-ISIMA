CREATE OR REPLACE TRIGGER noweek_mounji
BEFORE INSERT OR UPDATE ON emp
FOR EACH ROW
DECLARE
  v_day VARCHAR2(9);
BEGIN
  SELECT TO_CHAR(SYSDATE, 'DAY') INTO v_day FROM dual;
  IF v_day IN ('SATURDAY', 'SUNDAY') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Modifications not allowed on weekends.');
  END IF;
END noweek_mounji;
/
