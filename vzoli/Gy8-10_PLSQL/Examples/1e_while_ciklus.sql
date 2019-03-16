SET serveroutput ON
SET echo OFF
SET verify OFF

ACCEPT aa  PROMPT 'Adja meg az elsõ számot:   '
ACCEPT bb  PROMPT 'Adja meg a második számot: '

VARIABLE lnko  NUMBER

DECLARE
  a          NUMBER;
  b          NUMBER;
  c          NUMBER;
  LépésSzám  NUMBER;
BEGIN
  a := TO_NUMBER(&aa);
  b := TO_NUMBER(&bb);
  LépésSzám := 1;
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
    DBMS_OUTPUT.PUT_LINE(LépésSzám || '. lépés: '||a);
    LépésSzám := LépésSzám + 1;
  END LOOP;
  :lnko:=a;
  DBMS_OUTPUT.PUT_LINE('A legnagyobb közös osztó: '||a);
END;
/
PROMPT A legnagyobb közös osztó:
PRINT lnko
