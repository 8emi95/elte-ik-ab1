SET serveroutput ON
ACCEPT A NUMBER PROMPT'Egyik: '
ACCEPT B PROMPT 'M�sik: '

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
    DBMS_OUTPUT.PUT_LINE(CA||'+'||CB||'='||C|| ',  P�RATLAN');
  ELSE
    DBMS_OUTPUT.PUT_LINE(CA||'+'||CB||'='||C|| ',  P�ROS');
  END IF;
END;
/
