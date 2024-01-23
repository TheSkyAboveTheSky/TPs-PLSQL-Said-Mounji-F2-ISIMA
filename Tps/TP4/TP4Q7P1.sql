CREATE OR REPLACE TRIGGER stat_mounji
AFTER INSERT OR UPDATE OR DELETE ON EMP
FOR EACH ROW
DECLARE
  v_typemaj VARCHAR2(10);
BEGIN
  IF INSERTING THEN
    v_typemaj := 'INSERT';
  ELSIF UPDATING THEN
    v_typemaj := 'UPDATE';
  ELSIF DELETING THEN
    v_typemaj := 'DELETE';
  END IF;

  UPDATE STATS_mounji
  SET NbMaj = NbMaj + 1,
      Date_derniere_Maj = SYSDATE
  WHERE TypeMaj = v_typemaj;  
END stat_mounji;
/
--------------------------------------------------------------
INSERT INTO EMP VALUES (8000, 'John', 'Manager', NULL, SYSDATE, 3500, NULL, 10);
UPDATE EMP SET sal = 3500 WHERE empno = 7000;
DELETE FROM EMP WHERE empno = 8000;

SELECT * FROM STATS_mounji;
