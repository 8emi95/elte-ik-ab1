DROP TABLE dolgozo;

CREATE TABLE dolgozo
AS  SELECT * FROM emp;

SET serveroutput ON

DECLARE
  CURSOR egydolgozo IS
    SELECT empno, ename, sal
      FROM dolgozo
      WHERE UPPER(job) = 'CLERK'
      FOR UPDATE NOWAIT;

  azonosito  dolgozo.empno%TYPE;
  nev        dolgozo.ename%TYPE;
  fizetes    dolgozo.sal%TYPE;

BEGIN 
  OPEN egydolgozo;
  LOOP
    FETCH egydolgozo
      INTO azonosito, nev, fizetes;
    EXIT  WHEN egydolgozo%NOTFOUND;
    fizetes := fizetes *1.2;

    UPDATE dolgozo
      SET sal = fizetes
      WHERE CURRENT OF egydolgozo;

    DBMS_OUTPUT.PUT_LINE( nev||'   '||fizetes);
  END LOOP;
  CLOSE egydolgozo;
END;
/

SET numwidth 6
SELECT * FROM dolgozo;
SET numwidth 10
