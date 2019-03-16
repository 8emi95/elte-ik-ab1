-- hib�s! 

DROP TABLE dolgoz�;

CREATE TABLE dolgoz�
AS  SELECT * FROM emp;

SET serveroutput ON

DECLARE
  CURSOR egydolgoz� IS
    SELECT empno, ename, sal
      FROM dolgoz�
      WHERE UPPER(job) = 'CLERK';

  azonos�t�  dolgoz�.empno%TYPE;
  n�v        dolgoz�.ename%TYPE;
  fizet�s    dolgoz�.sal%TYPE;

BEGIN 
  OPEN egydolgoz�;
  LOOP
    FETCH egydolgoz�
      INTO azonos�t�, n�v, fizet�s;
    EXIT WHEN egydolgoz�%NOTFOUND;
    fizet�s := fizet�s * 0.2;
    UPDATE dolgoz�
      SET sal = fizet�s
      WHERE UPPER(job) = 'CLERK';
    DBMS_OUTPUT.PUT_LINE(n�v||'   '||fizet�s);
  END LOOP;
  CLOSE egydolgoz�;
 END;
/

SET numwidth 6
SELECT * FROM dolgoz�;
SET numwidth 10
