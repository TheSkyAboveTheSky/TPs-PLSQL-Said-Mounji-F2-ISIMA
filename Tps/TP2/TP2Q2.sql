DECLARE
   v_num_col1 Temp.num_col1%TYPE;
   v_num_col2 Temp.num_col2%TYPE;
   v_char_col Temp.char_col%TYPE;
BEGIN
   FOR i IN 1..100 LOOP
      v_num_col1 := i;
      v_num_col2 := i * 100;
      v_char_col := CASE WHEN MOD(i, 2) = 0 THEN i || ' est paire' ELSE i || ' est impair' END;
      INSERT INTO Temp (num_col1, num_col2, char_col)
      VALUES (v_num_col1, v_num_col2, v_char_col);
   END LOOP;
   COMMIT;
END;
/
