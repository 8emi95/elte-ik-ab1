SET serveroutput ON
ACCEPT r�szleg PROMPT 'A r�szleg neve: '

DECLARE 
  �sszfiz   emp.sal%TYPE;   -- Hivatkoz�si t�pus deklar�l�sa
  l�tsz�m   NUMBER;
BEGIN
  SELECT SUM(sal), COUNT(sal)
    INTO �sszfiz, l�tsz�m
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&r�szleg')  AND
          emp.deptno = dept.deptno;
  DBMS_OUTPUT.PUT_LINE('A ' ||'&r�szleg'||'-i l�tsz�m:     '|| l�tsz�m);
  DBMS_OUTPUT.PUT_LINE('A ' ||'&r�szleg'||'-i �sszfizet�s: '|| �sszfiz);
END;
/
