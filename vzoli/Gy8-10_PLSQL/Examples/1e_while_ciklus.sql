SET serveroutput ON
SET echo OFF
SET verify OFF

ACCEPT aa  PROMPT 'Adja meg az els� sz�mot:   '
ACCEPT bb  PROMPT 'Adja meg a m�sodik sz�mot: '

VARIABLE lnko  NUMBER

DECLARE
  a          NUMBER;
  b          NUMBER;
  c          NUMBER;
  L�p�sSz�m  NUMBER;
BEGIN
  a := TO_NUMBER(&aa);
  b := TO_NUMBER(&bb);
  L�p�sSz�m := 1;
-- Euklideszi algoritmus:
  WHILE (a<>b)
  LOOP
    IF a<b 
    THEN
      c:=a;
      a:=b;
      b:=c;
    END IF;
    a:=a-b;
    DBMS_OUTPUT.PUT_LINE(L�p�sSz�m || '. l�p�s: '||a);
    L�p�sSz�m := L�p�sSz�m + 1;
  END LOOP;
  :lnko:=a;
  DBMS_OUTPUT.PUT_LINE('A legnagyobb k�z�s oszt�: '||a);
END;
/
PROMPT A legnagyobb k�z�s oszt�:
PRINT lnko
