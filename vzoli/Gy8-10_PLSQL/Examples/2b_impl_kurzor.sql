-- (Rejtett kurzorral)
DROP TABLE dolgozó;
CREATE TABLE dolgozó
AS  SELECT * FROM emp;
ALTER TABLE dolgozó
  ADD (sorszám  NUMBER(2));

DECLARE
  v_sorszám  dolgozó.sorszám%TYPE := 1;
BEGIN
  FOR drekord IN (SELECT *
                    FROM dolgozó
                    ORDER BY ename)
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
