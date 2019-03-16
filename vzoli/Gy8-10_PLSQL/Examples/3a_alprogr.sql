-- Nehany egyszeru pelda a pl/sql fuggvenyek
-- es procedurak hasznalatara vonatkozoan

SET SERVEROUTPUT ON


-- Az alabbi blokk alprogramjai nem taroltak, azok csak 
-- a blokk utasitasaiban hivhatok 
DECLARE
  szam number(6);

  FUNCTION fv_plusz_1(szam number) RETURN number IS
    lokalis_valtozo NUMBER(6);
  BEGIN
    lokalis_valtozo := szam + 1;
    return(lokalis_valtozo);
  END;

  PROCEDURE pr_plusz_1(szam number) is
    lokalis_valtozo NUMBER(6);
  BEGIN
    lokalis_valtozo := szam + 1;
    dbms_output.put_line(TO_CHAR(lokalis_valtozo));
  END;


BEGIN
  szam := fv_plusz_1(100);

  pr_plusz_1(szam);
END;
/

-- Az alabbi alprogramok viszont taroltak, azok az adatbazisban
-- tarolodnak es a kesobbiekben barmikor hivhatok.
-- A fv SQL utasitasban is hasznalhato (a procedura csak PL/SQL-ben).

CREATE OR REPLACE FUNCTION fv_plusz_2(szam number) RETURN number IS
  lokalis_valtozo NUMBER(6);
BEGIN
  lokalis_valtozo := szam + 2;
  return(lokalis_valtozo);
END;
/      

SELECT fv_plusz_2(1000) FROM dual;


CREATE OR REPLACE PROCEDURE pr_plusz_2(szam number) is
  lokalis_valtozo NUMBER(6);
BEGIN
  lokalis_valtozo := szam + 2;
  dbms_output.put_line(TO_CHAR(lokalis_valtozo));
END;
/

BEGIN
  pr_plusz_2(2000);
END;
/

-- Vagy a fentivel ekvivalens meghivasi mod SQLPLUS-bol

EXECUTE pr_plusz_2(2000);




