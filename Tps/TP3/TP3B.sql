CREATE TABLE mounji (id NUMBER(5));
INSERT INTO mounji VALUES (1);
INSERT INTO mounji VALUES (2);
INSERT INTO mounji VALUES (3);
-------------------------------------------
SELECT table_name FROM user_tables;
-------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  v_table_name VARCHAR2(30);
  v_backup_table_name VARCHAR2(30);
  v_table_exists NUMBER;
BEGIN
  FOR table_rec IN (SELECT table_name FROM user_tables WHERE table_name LIKE '%_OLD') LOOP
    v_table_name := table_rec.table_name;
    SELECT COUNT(*) INTO v_table_exists FROM user_tables WHERE table_name = v_table_name;
    IF v_table_exists > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ' || v_table_name;
      DBMS_OUTPUT.PUT_LINE('Backup Table ' || v_table_name || ' supprimee.');
    END IF;
    COMMIT;
  END LOOP;
  FOR table_rec IN (SELECT table_name from user_tables) LOOP
    v_table_name := table_rec.table_name;
    v_backup_table_name := v_table_name || '_OLD';
    EXECUTE IMMEDIATE 'CREATE TABLE ' || v_backup_table_name || ' AS SELECT * FROM ' || v_table_name;
    DBMS_OUTPUT.PUT_LINE('Backup Table ' || v_backup_table_name || ' creee.');
  END LOOP
  COMMIT;
END;
/
------------------------------
SET SERVEROUTPUT ON;
DECLARE
  v_table_name VARCHAR2(30);
BEGIN
  FOR table_rec IN (SELECT table_name FROM user_tables WHERE table_name LIKE '%_old') 
  LOOP
    v_table_name := table_rec.table_name;        
    DBMS_OUTPUT.PUT_LINE('Table ' || v_table_name);
  END LOOP;
END;
/
