SET serveroutput ON
DECLARE
  TYPE  dolg_tabla_tipus IS TABLE OF emp%ROWTYPE
          INDEX BY BINARY_INTEGER;
  dolgozo  dolg_tabla_tipus;
BEGIN
  SELECT *
    INTO dolgozo(1)
    FROM emp
    WHERE empno = 7698;

  IF dolgozo.EXISTS(1)
  THEN
    DBMS_OUTPUT.PUT_LINE(dolgozo(1).ename);
  END IF;
END;
/
