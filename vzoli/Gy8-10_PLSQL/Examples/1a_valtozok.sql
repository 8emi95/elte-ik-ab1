-- A DBMS_OUTPUT.PUT_LINE eljárással történõ 
-- PL/SQL kiíratás engedélyezése:
SET serveroutput ON
-- Felhasználó által megadott változó definiálása 
-- és értékének bekérése:
ACCEPT valtozo_I PROMPT "Kérem adjon meg egy egész számot: "
-- Hozzárendelt (gazdakörnyezeti) változó deklarálása:
VARIABLE valtozo_II  NUMBER
-- A PL/SQL blokk deklarációs szegmense:
-- Változó deklarálása:
DECLARE
  valtozo_III  NUMBER;
-- A PL/SQL blokk végrehajtási szegmense:
BEGIN
-- Értékadás:
  valtozo_III := &valtozo_I;
-- Feltételes utasítás:
  IF valtozo_III > 100 
  THEN
    -- PL/SQL futás-közbeni kiíratás
    DBMS_OUTPUT.PUT_LINE('A megadott szám: '|| valtozo_III);
  ELSE 
    -- Hozzárendelt változó felveszi a PL/SQL változó értékét
   :valtozo_II := valtozo_III;
  END IF;
-- A PL/SQL blokk vége
end;
-- A PL/SQL blokk futtatása:
/

PROMPT --> A hozzárendelt változó kiíratása a gazdakörnyezetben:
PRINT  valtozo_II

PROMPT --> A hozzárendelt változók lekérdezése a gazdakörnyezetben:
-- (Ezeket nem kell törölni,
--  mivel az SQL*Plus-ból való kilépéskor törlõdnek)
VARIABLE

PROMPT --> A gazdakörnyezeti és helyettesítõ változók lekérdezése:
-- (Ezek is törlõdnek az SQL*Plus-ból való kilépéskor,
--  de ezek törölhetõk is UNDEFINE utasítással)
DEFINE

PROMPT --> A helyettesítõ változók törlése:
UNDEFINE  valtozo_I

PROMPT --> A gazdakörnyezeti és helyettesítõ változók lekérdezése:
DEFINE
