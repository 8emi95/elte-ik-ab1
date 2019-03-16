SET serveroutput ON
ACCEPT részleg PROMPT 'A részleg neve: '

DECLARE 
  összfiz   emp.sal%TYPE;   -- Hivatkozási típus deklarálása
  létszám   NUMBER;
BEGIN
  SELECT SUM(sal), COUNT(sal)
    INTO összfiz, létszám
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&részleg')  AND
          emp.deptno = dept.deptno;
  DBMS_OUTPUT.PUT_LINE('A ' ||'&részleg'||'-i létszám:     '|| létszám);
  DBMS_OUTPUT.PUT_LINE('A ' ||'&részleg'||'-i összfizetés: '|| összfiz);
END;
/
