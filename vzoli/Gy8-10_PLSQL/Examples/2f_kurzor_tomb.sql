-- pelda tomb (pl/sql tabla) hasznalatara

SET SERVEROUTPUT ON

DECLARE 
  v_nev VARCHAR2(20);
  CURSOR emp_cur IS 
  SELECT deptno, ename FROM emp;
  rec emp_cur%ROWTYPE;
  TYPE tab_tip IS TABLE OF emp_cur%ROWTYPE INDEX BY BINARY_INTEGER;
  tabla tab_tip;
  i  NUMBER(4);
BEGIN
  OPEN emp_cur;
  LOOP
    FETCH emp_cur INTO rec;
    EXIT WHEN emp_cur%NOTFOUND;
    i:= emp_cur%ROWCOUNT;
    tabla(i) := rec;
    dbms_output.put_line(to_char(tabla(i).deptno)||' - '||tabla(i).ename);
  END LOOP;
  CLOSE emp_cur;
END;
/
