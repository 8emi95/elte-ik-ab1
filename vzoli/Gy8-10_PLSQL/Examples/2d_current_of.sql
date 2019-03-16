-- (Explicit kurzorral és CURRENT OF hivatkozással)
DROP TABLE dolgozó;
CREATE TABLE dolgozó
AS  SELECT * FROM emp;
ALTER TABLE dolgozó
  ADD (sorszám  NUMBER(2));

DECLARE
  v_sorszám  dolgozó.sorszám%TYPE := 1;
  CURSOR dolg_kurzor IS
    SELECT *
      FROM dolgozó
      ORDER BY ename
      FOR UPDATE OF sorszám NOWAIT;

BEGIN
  FOR drekord IN dolg_kurzor
  LOOP
    UPDATE dolgozó
      SET sorszám = v_sorszám
      WHERE CURRENT OF dolg_kurzor;
    v_sorszám := v_sorszám + 1;
  END LOOP;
END;
/

SET numwidth 5
SELECT * 
  FROM dolgozó
  ORDER BY ename;
SET numwidth 10
