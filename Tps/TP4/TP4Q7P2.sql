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
---------------------------------------------------
CREATE OR REPLACE TRIGGER stat_mounji
AFTER INSERT OR UPDATE OR DELETE ON EMP
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
---------------------------------------------------
UPDATE EMP SET SAL = SAL * 1.05;