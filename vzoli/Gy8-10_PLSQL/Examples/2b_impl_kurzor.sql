-- (Rejtett kurzorral)
DROP TABLE dolgoz�;
CREATE TABLE dolgoz�
AS  SELECT * FROM emp;
ALTER TABLE dolgoz�
  ADD (sorsz�m  NUMBER(2));

DECLARE
  v_sorsz�m  dolgoz�.sorsz�m%TYPE := 1;
BEGIN
  FOR drekord IN (SELECT *
                    FROM dolgoz�
                    ORDER BY ename)
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
