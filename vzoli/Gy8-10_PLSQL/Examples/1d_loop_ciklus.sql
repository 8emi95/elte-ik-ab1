SET serveroutput ON
SET echo OFF
SET verify OFF

ACCEPT darabszám PROMPT "Kérem az elõállítandó darabszámot: "

DECLARE
  elsõ     NUMBER;
  második  NUMBER;
  új       NUMBER;
  darab    NUMBER;
  számlál  NUMBER;
BEGIN
  darab := &darabszám;
  elsõ  := 0;
  második := 1;
  számlál := 2;
  DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(1,3) || '. elem:' ||
                       LPAD(elsõ,6));
  DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(2,3) || '. elem:' ||
                       LPAD(második,6));

  LOOP
    új := elsõ + második;
    számlál := számlál + 1;
    DBMS_OUTPUT.PUT_LINE('A(z)' || LPAD(számlál,3) || '. elem:' ||
                         LPAD(új,6));
    EXIT WHEN számlál = darab;
    elsõ := második;
    második := új;
  END LOOP;
end;
/
