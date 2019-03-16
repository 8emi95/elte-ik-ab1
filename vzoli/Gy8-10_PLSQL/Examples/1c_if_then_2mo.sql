SET serveroutput ON
ACCEPT A NUMBER PROMPT'Egyik: '
ACCEPT B PROMPT 'Másik: '

DECLARE 
  C   NUMBER;
  CA  NUMBER;
  CB  NUMBER;
BEGIN
  CA := &A;
  CB := &B;
  C  := CA + CB;

  IF MOD(C,2) = 1
  THEN
    DBMS_OUTPUT.PUT_LINE(CA||'+'||CB||'='||C|| ',  PÁRATLAN');
  ELSE
    DBMS_OUTPUT.PUT_LINE(CA||'+'||CB||'='||C|| ',  PÁROS');
  END IF;
END;
/
