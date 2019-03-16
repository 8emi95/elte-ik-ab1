-- (Explicit kurzorral �s CURRENT OF hivatkoz�ssal)
DROP TABLE dolgoz�;
CREATE TABLE dolgoz�
AS  SELECT * FROM emp;
ALTER TABLE dolgoz�
  ADD (sorsz�m  NUMBER(2));

DECLARE
  v_sorsz�m  dolgoz�.sorsz�m%TYPE := 1;
  CURSOR dolg_kurzor IS
    SELECT *
      FROM dolgoz�
      ORDER BY ename
      FOR UPDATE OF sorsz�m NOWAIT;

BEGIN
  FOR drekord IN dolg_kurzor
  LOOP
    UPDATE dolgoz�
      SET sorsz�m = v_sorsz�m
      WHERE CURRENT OF dolg_kurzor;
    v_sorsz�m := v_sorsz�m + 1;
  END LOOP;
END;
/

SET numwidth 5
SELECT * 
  FROM dolgoz�
  ORDER BY ename;
SET numwidth 10
