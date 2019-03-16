SET serveroutput ON
SET echo OFF
SET verify OFF

ACCEPT darabsz�m PROMPT "K�rem az el��ll�tand� darabsz�mot: "

DECLARE
  els�     NUMBER;
  m�sodik  NUMBER;
  �j       NUMBER;
  darab    NUMBER;
  sz�ml�l  NUMBER;
BEGIN
  darab := &darabsz�m;
  els�  := 0;
  m�sodik := 1;
  sz�ml�l := 2;
  DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(1,3) || '. elem:' ||
                       LPAD(els�,6));
  DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(2,3) || '. elem:' ||
                       LPAD(m�sodik,6));

  LOOP
    �j := els� + m�sodik;
    sz�ml�l := sz�ml�l + 1;
    DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(sz�ml�l,3) || '. elem:' ||
                         LPAD(�j,6));
    EXIT WHEN sz�ml�l = darab;
    els� := m�sodik;
    m�sodik := �j;
  END LOOP;
end;
/
