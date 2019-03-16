SET serveroutput ON
ACCEPT részleg PROMPT 'A részleg neve: '
-- Nézet létrehozása a dolgozói sorszám meghatározásohoz
CREATE OR REPLACE VIEW RészlegLista
AS
  SELECT ROWNUM      AS sorszám,
         ename,
         sal,
         loc
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&részleg')  AND
          emp.deptno = dept.deptno;
SELECT * FROM RészlegLista;

DECLARE 
  név        RészlegLista.ename%TYPE;
  fizetés    RészlegLista.sal%TYPE;
  létszám    NUMBER;
  lindex     létszám%TYPE;
  részleg    RészlegLista.loc%TYPE;
  összfiz    fizetés%TYPE;
BEGIN
  SELECT COUNT(*), loc
    INTO létszám, részleg
    FROM RészlegLista
    GROUP BY loc;
  DBMS_OUTPUT.PUT_LINE('A ' || részleg ||'-i létszám: '|| létszám);
-- CIKLUS --
  lindex  := 1;
  összfiz := 0;
  WHILE lindex <= létszám
  LOOP
    SELECT ename, sal
       INTO név, fizetés
       FROM RészlegLista
       WHERE sorszám = lindex;
    DBMS_OUTPUT.PUT_LINE(név ||' fizetése: '|| fizetés );
    lindex  := lindex + 1;
    összfiz := összfiz + fizetés;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('A ' || részleg ||'-i összfizetés: '|| összfiz);
END;
/
