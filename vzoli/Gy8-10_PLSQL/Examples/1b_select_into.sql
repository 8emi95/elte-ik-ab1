SET serveroutput ON

ACCEPT részleg PROMPT 'A részleg helye: '

DECLARE 
  v_össz_bér   NUMBER;
BEGIN
  SELECT SUM(sal)
    INTO v_össz_bér
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&részleg')  AND
          emp.deptno = dept.deptno;
  DBMS_OUTPUT.PUT_LINE('A(z) '||'&részleg'||
                       ' részlegen dolgozók havi bére összesen: '||
                       v_össz_bér);
END;
/
