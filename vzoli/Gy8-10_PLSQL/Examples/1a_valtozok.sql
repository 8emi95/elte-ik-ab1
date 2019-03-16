-- A DBMS_OUTPUT.PUT_LINE elj�r�ssal t�rt�n� 
-- PL/SQL ki�rat�s enged�lyez�se:
SET serveroutput ON
-- Felhaszn�l� �ltal megadott v�ltoz� defini�l�sa 
-- �s �rt�k�nek bek�r�se:
ACCEPT valtozo_I PROMPT "K�rem adjon meg egy eg�sz sz�mot: "
-- Hozz�rendelt (gazdak�rnyezeti) v�ltoz� deklar�l�sa:
VARIABLE valtozo_II  NUMBER
-- A PL/SQL blokk deklar�ci�s szegmense:
-- V�ltoz� deklar�l�sa:
DECLARE
  valtozo_III  NUMBER;
-- A PL/SQL blokk v�grehajt�si szegmense:
BEGIN
-- �rt�kad�s:
  valtozo_III := &valtozo_I;
-- Felt�teles utas�t�s:
  IF valtozo_III > 100 
  THEN
    -- PL/SQL fut�s-k�zbeni ki�rat�s
    DBMS_OUTPUT.PUT_LINE('A megadott sz�m: '|| valtozo_III);
  ELSE 
    -- Hozz�rendelt v�ltoz� felveszi a PL/SQL v�ltoz� �rt�k�t
   :valtozo_II := valtozo_III;
  END IF;
-- A PL/SQL blokk v�ge
end;
-- A PL/SQL blokk futtat�sa:
/

PROMPT --> A hozz�rendelt v�ltoz� ki�rat�sa a gazdak�rnyezetben:
PRINT  valtozo_II

PROMPT --> A hozz�rendelt v�ltoz�k lek�rdez�se a gazdak�rnyezetben:
-- (Ezeket nem kell t�r�lni,
--  mivel az SQL*Plus-b�l val� kil�p�skor t�rl�dnek)
VARIABLE

PROMPT --> A gazdak�rnyezeti �s helyettes�t� v�ltoz�k lek�rdez�se:
-- (Ezek is t�rl�dnek az SQL*Plus-b�l val� kil�p�skor,
--  de ezek t�r�lhet�k is UNDEFINE utas�t�ssal)
DEFINE

PROMPT --> A helyettes�t� v�ltoz�k t�rl�se:
UNDEFINE  valtozo_I

PROMPT --> A gazdak�rnyezeti �s helyettes�t� v�ltoz�k lek�rdez�se:
DEFINE
