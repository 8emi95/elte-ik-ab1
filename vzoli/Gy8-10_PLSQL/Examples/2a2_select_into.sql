SET serveroutput ON
ACCEPT r�szleg PROMPT 'A r�szleg neve: '
-- N�zet l�trehoz�sa a dolgoz�i sorsz�m meghat�roz�sohoz
CREATE OR REPLACE VIEW R�szlegLista
AS
  SELECT ROWNUM      AS sorsz�m,
         ename,
         sal,
         loc
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&r�szleg')  AND
          emp.deptno = dept.deptno;
SELECT * FROM R�szlegLista;

DECLARE 
  n�v        R�szlegLista.ename%TYPE;
  fizet�s    R�szlegLista.sal%TYPE;
  l�tsz�m    NUMBER;
  lindex     l�tsz�m%TYPE;
  r�szleg    R�szlegLista.loc%TYPE;
  �sszfiz    fizet�s%TYPE;
BEGIN
  SELECT COUNT(*), loc
    INTO l�tsz�m, r�szleg
    FROM R�szlegLista
    GROUP BY loc;
  DBMS_OUTPUT.PUT_LINE('A ' || r�szleg ||'-i l�tsz�m: '|| l�tsz�m);
-- CIKLUS --
  lindex  := 1;
  �sszfiz := 0;
  WHILE lindex <= l�tsz�m
  LOOP
    SELECT ename, sal
       INTO n�v, fizet�s
       FROM R�szlegLista
       WHERE sorsz�m = lindex;
    DBMS_OUTPUT.PUT_LINE(n�v ||' fizet�se: '|| fizet�s );
    lindex  := lindex + 1;
    �sszfiz := �sszfiz + fizet�s;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('A ' || r�szleg ||'-i �sszfizet�s: '|| �sszfiz);
END;
/
