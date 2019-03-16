-- hibás! 

DROP TABLE dolgozó;

CREATE TABLE dolgozó
AS  SELECT * FROM emp;

SET serveroutput ON

DECLARE
  CURSOR egydolgozó IS
    SELECT empno, ename, sal
      FROM dolgozó
      WHERE UPPER(job) = 'CLERK';

  azonosító  dolgozó.empno%TYPE;
  név        dolgozó.ename%TYPE;
  fizetés    dolgozó.sal%TYPE;

BEGIN 
  OPEN egydolgozó;
  LOOP
    FETCH egydolgozó
      INTO azonosító, név, fizetés;
    EXIT WHEN egydolgozó%NOTFOUND;
    fizetés := fizetés * 0.2;
    UPDATE dolgozó
      SET sal = fizetés
      WHERE UPPER(job) = 'CLERK';
    DBMS_OUTPUT.PUT_LINE(név||'   '||fizetés);
  END LOOP;
  CLOSE egydolgozó;
 END;
/

SET numwidth 6
SELECT * FROM dolgozó;
SET numwidth 10
