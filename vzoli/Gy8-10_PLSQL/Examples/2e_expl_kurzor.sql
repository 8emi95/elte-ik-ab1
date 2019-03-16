-- (Explicit kurzorral)
DROP TABLE dolgozó;
CREATE TABLE dolgozó
AS  SELECT * FROM emp;
ALTER TABLE dolgozó
  ADD (sorszám  NUMBER(2));

DECLARE
   -- Deklarálja a sorszám oszlophoz a v_sorszám változót,
   -- és ennek kezdõértéke legyen egy
  v_sorszám  dolgozó.sorszám%TYPE := 1;
    -- A kurzor a tábla rendezett sorait tartalmazza
  CURSOR dolg_kurzor IS
    SELECT *
      FROM dolgozó
      ORDER BY ename;

BEGIN
  FOR drekord IN dolg_kurzor
  LOOP
    UPDATE dolgozó
      SET sorszám = v_sorszám
      WHERE empno = drekord.empno;
    v_sorszám := v_sorszám + 1;
  END LOOP;
END;
/

SET numwidth 5
SELECT *
  FROM dolgozó
  ORDER BY ename;
SET numwidth 10
