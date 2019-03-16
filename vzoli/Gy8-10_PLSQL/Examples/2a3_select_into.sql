SET serveroutput ON
ACCEPT r�szleg PROMPT 'A r�szleg neve: '

DECLARE 
  n�v        R�szlegLista.ename%TYPE;
  fizet�s    R�szlegLista.sal%TYPE;
  l�tsz�m    NUMBER;
  r�szleg    R�szlegLista.loc%TYPE;
  �sszfiz    fizet�s%TYPE;
BEGIN
  SELECT COUNT(*), loc
    INTO l�tsz�m, r�szleg
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&r�szleg')  AND
          emp.deptno = dept.deptno
    GROUP BY loc;
  DBMS_OUTPUT.PUT_LINE('A ' || r�szleg ||'-i l�tsz�m: '|| l�tsz�m);
-- CIKLUS --
  �sszfiz := 0;
FOR lindex IN (SELECT ROWNUM      AS sorsz�m,
                      ename,
                      sal,
                      loc
                 FROM emp, dept
                 WHERE UPPER(loc) = UPPER('&r�szleg')  AND
                       emp.deptno = dept.deptno)
  LOOP
    n�v     := lindex.ename;
    fizet�s := lindex.sal;
    DBMS_OUTPUT.PUT_LINE(n�v ||' fizet�se: '|| fizet�s );
    �sszfiz := �sszfiz + fizet�s;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('A ' || r�szleg ||'-i �sszfizet�s: '|| �sszfiz);
END;
/
