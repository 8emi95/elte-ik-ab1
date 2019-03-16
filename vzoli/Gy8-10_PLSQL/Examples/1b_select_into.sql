SET serveroutput ON

ACCEPT r�szleg PROMPT 'A r�szleg helye: '

DECLARE 
  v_�ssz_b�r   NUMBER;
BEGIN
  SELECT SUM(sal)
    INTO v_�ssz_b�r
    FROM emp, dept
    WHERE UPPER(loc) = UPPER('&r�szleg')  AND
          emp.deptno = dept.deptno;
  DBMS_OUTPUT.PUT_LINE('A(z) '||'&r�szleg'||
                       ' r�szlegen dolgoz�k havi b�re �sszesen: '||
                       v_�ssz_b�r);
END;
/
