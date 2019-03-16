SET serveroutput ON
ACCEPT részleg PROMPT 'A részleg neve: '

DECLARE 
  név        RészlegLista.ename%TYPE;
  fizetés    RészlegLista.sal%TYPE;
  létszám    NUMBER;
  részleg    RészlegLista.loc%TYPE;
  összfiz    fizetés%TYPE;
BEGIN
  SELECT COUNT(*), loc
    INTO létszám, részleg
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&részleg')  AND
          emp.deptno = dept.deptno
    GROUP BY loc;
  DBMS_OUTPUT.PUT_LINE('A ' || részleg ||'-i létszám: '|| létszám);
-- CIKLUS --
  összfiz := 0;
FOR lindex IN (SELECT ROWNUM      AS sorszám,
                      ename,
                      sal,
                      loc
                 FROM emp, dept
                 WHERE UPPER(loc) = UPPER('&részleg')  AND
                       emp.deptno = dept.deptno)
  LOOP
    név     := lindex.ename;
    fizetés := lindex.sal;
    DBMS_OUTPUT.PUT_LINE(név ||' fizetése: '|| fizetés );
    összfiz := összfiz + fizetés;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('A ' || részleg ||'-i összfizetés: '|| összfiz);
END;
/
