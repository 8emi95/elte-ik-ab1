-- (Explicit kurzorral)
DROP TABLE dolgoz�;
CREATE TABLE dolgoz�
AS  SELECT * FROM emp;
ALTER TABLE dolgoz�
  ADD (sorsz�m  NUMBER(2));

DECLARE
   -- Deklar�lja a sorsz�m oszlophoz a v_sorsz�m v�ltoz�t,
   -- �s ennek kezd��rt�ke legyen egy
  v_sorsz�m  dolgoz�.sorsz�m%TYPE := 1;
    -- A kurzor a t�bla rendezett sorait tartalmazza
  CURSOR dolg_kurzor IS
    SELECT *
      FROM dolgoz�
      ORDER BY ename;

BEGIN
  FOR drekord IN dolg_kurzor
  LOOP
    UPDATE dolgoz�
      SET sorsz�m = v_sorsz�m
      WHERE empno = drekord.empno;
    v_sorsz�m := v_sorsz�m + 1;
  END LOOP;
END;
/

SET numwidth 5
SELECT *
  FROM dolgoz�
  ORDER BY ename;
SET numwidth 10
