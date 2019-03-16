begin
  null;
end;

set serveroutput on
begin
  dbms_output.put_line('Hello PLSQL!');
end;

DECLARE
v_rows_deleted VARCHAR2(30);
v_empno employees.employee_id%TYPE := 176;
BEGIN
DELETE FROM employees
WHERE employee_id = v_empno;
v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.');
DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;

-- integritásmegszorítás
DECLARE
v_rows_deleted VARCHAR2(30);
v_empno dolgozo.dkod%TYPE := 7902;
BEGIN
DELETE FROM dolgozo
WHERE dkod = v_empno;
v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.');
DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;

-- good
DECLARE
v_rows_deleted VARCHAR2(30);
v_empno dolgozo.dkod%TYPE := 7934;
BEGIN
DELETE FROM dolgozo
WHERE dkod = v_empno;
v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.');
DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
rollback;
END;

select * from dolgozo;

DECLARE
NUMBER := &SZAM;
J NUMBER;
BEGIN <<KULSO>>
LOOP
  FOR I IN 2..SQRT(N) LOOP
  IF N/I = TRUNC(N/I) THEN
    DBMS_OUTPUT.PUT_LINE(N ||' NEM PRIM, '|| I ||' OSZTJA');
    EXIT KULSO;
  END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(N||' PRIM');
  EXIT;
END LOOP;
END;

-- n faktoriális
/*
DECLARE
N NUMBER;
TEMP NUMBER;
SUM_ NUMBER := 1;
BEGIN
N := &N;
TEMP := N;
WHILE TEMP > 0 LOOP
SUM_ := TEMP * SUM_;
TEMP := TEMP - 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Factorial of' || N || ' is ' || SUM);
END;
/
*/

DECLARE
NUMBER := &SZAM;
J NUMBER;
BEGIN
FOR I IN 2..N LOOP
J := J * I;
END LOOP;
DBMS_OUTPUT.PUT_LINE(N||' != ' || J);
END;

DECLARE
NUMBER := &SZAM;
J NUMBER;
CREATE PROCEDURE p_nfaktor(N IN NUKMBER, J OUT NUMBER)
IS
begin
J := 1;
FOR I IN 2..N
LOOP
J := J * I;
END LOOP;
end;
BEGIN
p_nfaktor(N, J);
DBMS_OUTPUT.PUT_LINE(N||' != ' || J);
END;