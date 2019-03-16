/************** külső változók használata *************/
Variable v number;
begin
 :v := mod(121,3);
END;
/
print v;


/************** képernyőre írás *************/
set serveroutput on
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

/*
 A SET SERVEROUTPUT ON  utasítás kiadása SQL*Plus-ban azzal egyenértékű, mintha kiadnánk a 
 DBMS_OUTPUT.ENABLE (buffer_size => NULL); utasítást. DBMS_OUTPUT.DISABLE esetén nem ír a pufferbe.
 A PL/SQL program nem tud a képernyőre írni! A futtató környezet (sqlplus, SqlDeveloper) ír a képernyőre,
 úgy, hogy kiolvassa a pufferből a sorokat a GET_LINE procedúrával, mint az alábbi program.
*/

SET SERVEROUTPUT ON
DECLARE
  v_status  INTEGER := 0;
  v_line    VARCHAR2(100); 
  v_buff    VARCHAR2(1000);
BEGIN 
  DBMS_OUTPUT.PUT_LINE('bubu'); DBMS_OUTPUT.PUT_LINE('bibi'); DBMS_OUTPUT.PUT_LINE('baba');
  WHILE v_status = 0 LOOP
    DBMS_OUTPUT.GET_LINE (v_line, v_status);
    v_buff := v_buff || v_line;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_buff);
END;
/
EREDMÉNY:
---------
bububibibaba


/*************** érvényesség, láthatóság *************/
<<cimke1>>
DECLARE
  a  NUMBER;
BEGIN
  a:=2;
  <<cimke2>>
  DECLARE
    a number;
  BEGIN
    a:=4;
    dbms_output.put_line(cimke1.a);
    dbms_output.put_line(cimke2.a);
    dbms_output.put_line(a);
  END;
  dbms_output.put_line(a);
END;
/
EREDMÉNY:
---------
2
4
4
2


/****************** rekordok ****************/
set serveroutput on
DECLARE
  TYPE rek_type IS RECORD(f1 INTEGER DEFAULT 10, f2 osztaly%ROWTYPE);  -- beágyazott rekord
  rec rek_type;
  TYPE tab_type IS TABLE OF INTEGER INDEX BY BINARY_INTEGER;
  TYPE rek_type2 IS RECORD(f1 INTEGER, f2 tab_type);           -- mezőbe ágyazott tömb
  rec2 rek_type2;
  rec_oszt osztaly%ROWTYPE;     -- ez is rekord
BEGIN
 rec_oszt.onev := 'SALES';
 dbms_output.put_line(rec.f1);                          -- default érték  
 SELECT * INTO rec.f2 FROM osztaly WHERE oazon = 10;
 dbms_output.put_line(rec.f2.telephely);
 rec2.f2(1) := 100; rec2.f2(2) := 200; rec2.f2(3) := 300;
 FOR i IN rec2.f2.FIRST .. rec2.f2.LAST LOOP
   dbms_output.put_line(rec2.f2(i));
 END LOOP;
END;
/
EREDMÉNY:
---------
10
NEW YORK
100
200
300


/****************** kollekciók (tömbök) ****************/
set serveroutput on
DECLARE
 TYPE t_oazon_bt IS TABLE OF dolgozo.oazon%TYPE;                             -- beágyazott tábla
 TYPE t_nev_dt  IS VARRAY(10) OF dolgozo.dnev%TYPE;                          -- dinamikus tömb
 TYPE t_fiz_at  IS TABLE OF dolgozo.fizetes%TYPE INDEX BY dolgozo.dnev%TYPE; -- asszociatív tömb
 TYPE t_nev_at  IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;            -- asszociatív tömb
 v_oazon_bt t_oazon_bt := t_oazon_bt(10,20,30,40);        -- inicializáció
 v_nev_dt   t_nev_dt   := t_nev_dt('név1', 'név2');       -- inicializáció
 v_fiz_at   t_fiz_at;                                     -- ezt nem lehet inicializálni
 v_nev_at   t_nev_at;                                     -- ezt nem lehet inicializálni
BEGIN
  SELECT fizetes INTO v_fiz_at('KING') FROM dolgozo WHERE dnev='KING';   -- értékadások
  FOR i IN 1 .. 3 LOOP
    v_nev_at(i) := 'Bubu'||to_char(i);
  END LOOP;
  v_nev_at(1) := 'első'; v_oazon_bt(1) := 1; v_nev_dt(1) := 'egy';     
  v_nev_dt.EXTEND(2); v_nev_dt(4) := 'négy';                           -- bővíteni kell 2 elemmel
  
  dbms_output.put_line('KING fizetése: '||v_fiz_at('KING'));           -- elemek elérése
  FOR i IN v_oazon_bt.FIRST .. v_oazon_bt.LAST LOOP
    dbms_output.put_line('oazon: '||v_oazon_bt(i));
  END LOOP;
  FOR i IN v_nev_at.FIRST .. v_nev_at.LAST LOOP
    dbms_output.put_line('szöveg: '||v_nev_at(i));
  END LOOP;
  FOR i IN v_nev_dt.FIRST .. v_nev_dt.LAST LOOP
    dbms_output.put_line('nev: '||v_nev_dt(i));
  END LOOP;
END;
/
EREDMÉNY
--------
KING fizetése: 5000
oazon: 1
oazon: 20
oazon: 30
oazon: 40
szöveg: első
szöveg: Bubu2
szöveg: Bubu3
nev: egy
nev: név2
nev:
nev: négy

/****************** beágyazott tábla és dinamikus tömb ****************/
-- Ezeket inicializálni kell mielőtt hivatkoznánk rájuk.
-- Ezek tulajdonképpen objektumok
 
set serveroutput on
DECLARE
 TYPE t_bt IS TABLE OF INTEGER;  -- VARRAY(10) is lehetne TABLE helyett
  v_bt t_bt;        
BEGIN
  -- v_bt(1) := 10;   -- nem létező elemre nem lehet hivatkozni
  IF v_bt IS NULL THEN dbms_output.put_line('még null az egész kollekció'); END IF;
  -- dbms_output.put_line(v_bt.count);  -- még így sem lehet hivatkozni rá
  
  v_bt := t_bt();  -- inicializálás
  IF v_bt IS NOT NULL THEN dbms_output.put('már nem null, '); END IF;
  dbms_output.put_line('de elemszám: '||v_bt.count);
  -- v_bt(1) := 10;   még mindig nem lehet 
  
  v_bt.EXTEND(2);  -- kibővítjük két null elemmel
  dbms_output.put_line('elemszám: '||v_bt.count);
  IF v_bt(1) IS NULL THEN dbms_output.put_line('az eleme null'); END IF;
  v_bt := t_bt(10,20,30);
  FOR i IN v_bt.FIRST .. v_bt.LAST LOOP
    dbms_output.put_line(to_char(i)||'. elem: '||v_bt(i));
  END LOOP;
END;
/
EREDMÉNY
--------
még null az egész kollekció
már nem null, de elemszám: 0
elemszám: 2
az eleme null 
1. elem: 10
2. elem: 20
3. elem: 30


/****************** BULK COLLECT és FORALL ****************/
DECLARE
  TYPE t_dolgozo_bt IS TABLE OF dolgozo%ROWTYPE;
  v_dolgozo_bt t_dolgozo_bt;
  TYPE t_oazon_bt IS TABLE OF dolgozo.oazon%TYPE;          
  v_oazon_bt t_oazon_bt := t_oazon_bt(10,20,30,40);
BEGIN
  SELECT * BULK COLLECT INTO v_dolgozo_bt FROM dolgozo WHERE oazon = 10;
  FOR i IN v_dolgozo_bt.FIRST .. v_dolgozo_bt.LAST LOOP
    dbms_output.put_line(v_dolgozo_bt(i).dnev);
  END LOOP;

  FORALL i IN 1..v_oazon_bt.COUNT 
    UPDATE dolgozo set fizetes=fizetes+1 WHERE oazon = v_oazon_bt(i);
  dbms_output.put_line('összes sor: '||SQL%ROWCOUNT);
-- lekérdezhetjük az egyes iterációkban érintett sorok számát	
  FOR i IN 1..v_oazon_bt.COUNT LOOP
    dbms_output.put_line('módosított sorok száma: '||SQL%BULK_ROWCOUNT(i));
  END LOOP;
END;
/


/****************** túlterhelés ****************/
DECLARE
  PROCEDURE elj(p IN NUMBER) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('number param');
  END elj;

  PROCEDURE elj(p IN VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('varchar2 param');
  END elj;
BEGIN
  elj(100);
  elj('100');
END;
/
EREDMÉNY:
---------
number param
varchar2 param


/****************** előre deklaráció ****************/
DECLARE
  PROCEDURE elj2(p IN NUMBER);

  PROCEDURE elj1(p IN NUMBER) IS
  BEGIN
    IF p < 10 THEN  DBMS_OUTPUT.PUT_LINE(p); elj2(p+1);  END IF;
  END elj1;

  PROCEDURE elj2(p IN NUMBER) IS
  BEGIN
    IF p < 10 THEN  DBMS_OUTPUT.PUT_LINE(p); elj1(p*2);  END IF;
  END elj2;
BEGIN
  elj1(0);
END;
/
EREDMÉNY:
---------
0; 1; 2; 3; 6; 7;
