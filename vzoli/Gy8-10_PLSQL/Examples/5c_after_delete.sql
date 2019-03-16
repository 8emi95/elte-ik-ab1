Adj meg egy olyan triggert, amely törli a hallgató összes adatát az index táblából miután 
töröltük a hallgatót a hallgato táblából! 

/**********************************************************/
/* Sémát, lásd hátul, megszorítások nélkül hozzuk lére, normálisan a hallgato tábla ehakod 
oszlopának PRIMARY KEY megszorítást adnánk, és az indexk tábla ehakod oszlopa 
FOREIGN KEY idegen kulcs lenne az alábbi hivatkozási integritási megszorítással: 
REFERENCES hallgato (ehakod) ON DELETE CASCADE 
Ez többek között azt is biztosítja, hogy a hallgato szülõtábla egy sorának törlésekor 
a rendszer lépcsõzetesen az indexk gyermektábla függõ sorait is törölje. */
/**********************************************************/

/*  trigger létrehozása  */

CREATE OR REPLACE TRIGGER HallgatoKaszkadTorles 
	AFTER DELETE 
		ON hallgato
		FOR EACH ROW
BEGIN
	IF DELETING THEN 
		DELETE FROM indexk
			WHERE ehakod = :OLD.ehakod;
END IF;
END;
/
SHOW ERRORS;

/*  Ellenõrzés: jól mûködik-e a trigger? */
SAVEPOINT A;
PROMPT Az eredeti táblák listázása:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;
PROMPT Törlési próba:
DELETE FROM hallgato 
WHERE UPPER(CIM) = 'BUDAPEST';
PROMPT A módosított táblák listázása:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;

/*  Takarítás: Adatvisszaállítás és a trigger törlése */ 
ROLLBACK TO A;
DROP TRIGGER HallgatoKaszkadTorles;
PROMPT Újra az eredeti táblák listázása:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;

/**********************************************************/
/*   Táblák (a 3a miatt megszorítások nélkül való) létrehozása és pár adat bevitele: */ 

drop table indexk cascade constraints;
drop table hallgato cascade constraints;

create table hallgato
       (ehakod varchar2(35),
        nev varchar2(35), 
        cim varchar2(35));

create table indexk
       (ehakod varchar2(35),
        targy varchar2(35), 
        jegy number(5),
        datum date);

insert into hallgato values ('1', 'Péter', 'Budapest');
insert into hallgato values ('2', 'Pál', 'Eger');
insert into hallgato values ('3', 'András', 'Budapest');
insert into hallgato values ('4', 'Jakab', 'Debrecen');
insert into hallgato values ('5', 'János', 'Pécs');
insert into hallgato values ('6', 'Máté', 'Szeged');
insert into hallgato values ('7', 'Márk', 'Budapest');

insert into indexk values ('1', 'adatbázis1', 4, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('1', 'adatbázis2', 1, SYSDATE);
insert into indexk values ('1', 'hálózatok', 1, TO_DATE('2007.05.21','YYYY.MM.DD'));
insert into indexk values ('2', 'adatbázis1', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('2', 'adatbázis2', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('2', 'hálózatok', 3, SYSDATE);
insert into indexk values ('3', 'adatbázis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('3', 'adatbázis2', 4, SYSDATE);
insert into indexk values ('3', 'hálózatok', 5, SYSDATE);
insert into indexk values ('4', 'adatbázis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('4', 'adatbázis2', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('4', 'hálózatok', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'adatbázis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'adatbázis2', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'hálózatok', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('6', 'hálózatok', 2, SYSDATE);

commit;

select * from hallgato order by ehakod;
select * from indexk order by ehakod;

