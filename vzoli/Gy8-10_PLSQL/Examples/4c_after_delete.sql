Adj meg egy olyan triggert, amely t�rli a hallgat� �sszes adat�t az index t�bl�b�l miut�n 
t�r�lt�k a hallgat�t a hallgato t�bl�b�l! 

/**********************************************************/
/* S�m�t, l�sd h�tul, megszor�t�sok n�lk�l hozzuk l�re, norm�lisan a hallgato t�bla ehakod 
oszlop�nak PRIMARY KEY megszor�t�st adn�nk, �s az indexk t�bla ehakod oszlopa 
FOREIGN KEY idegen kulcs lenne az al�bbi hivatkoz�si integrit�si megszor�t�ssal: 
REFERENCES hallgato (ehakod) ON DELETE CASCADE 
Ez t�bbek k�z�tt azt is biztos�tja, hogy a hallgato sz�l�t�bla egy sor�nak t�rl�sekor 
a rendszer l�pcs�zetesen az indexk gyermekt�bla f�gg� sorait is t�r�lje. */
/**********************************************************/

/*  trigger l�trehoz�sa  */

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

/*  Ellen�rz�s: j�l m�k�dik-e a trigger? */
SAVEPOINT A;
PROMPT Az eredeti t�bl�k list�z�sa:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;
PROMPT T�rl�si pr�ba:
DELETE FROM hallgato 
WHERE UPPER(CIM) = 'BUDAPEST';
PROMPT A m�dos�tott t�bl�k list�z�sa:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;

/*  Takar�t�s: Adatvissza�ll�t�s �s a trigger t�rl�se */ 
ROLLBACK TO A;
DROP TRIGGER HallgatoKaszkadTorles;
PROMPT �jra az eredeti t�bl�k list�z�sa:
SELECT * FROM hallgato ORDER BY ehakod;
SELECT * FROM indexk ORDER BY ehakod;

/**********************************************************/
/*   T�bl�k (a 3a miatt megszor�t�sok n�lk�l val�) l�trehoz�sa �s p�r adat bevitele: */ 

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

insert into hallgato values ('1', 'P�ter', 'Budapest');
insert into hallgato values ('2', 'P�l', 'Eger');
insert into hallgato values ('3', 'Andr�s', 'Budapest');
insert into hallgato values ('4', 'Jakab', 'Debrecen');
insert into hallgato values ('5', 'J�nos', 'P�cs');
insert into hallgato values ('6', 'M�t�', 'Szeged');
insert into hallgato values ('7', 'M�rk', 'Budapest');

insert into indexk values ('1', 'adatb�zis1', 4, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('1', 'adatb�zis2', 1, SYSDATE);
insert into indexk values ('1', 'h�l�zatok', 1, TO_DATE('2007.05.21','YYYY.MM.DD'));
insert into indexk values ('2', 'adatb�zis1', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('2', 'adatb�zis2', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('2', 'h�l�zatok', 3, SYSDATE);
insert into indexk values ('3', 'adatb�zis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('3', 'adatb�zis2', 4, SYSDATE);
insert into indexk values ('3', 'h�l�zatok', 5, SYSDATE);
insert into indexk values ('4', 'adatb�zis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('4', 'adatb�zis2', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('4', 'h�l�zatok', 1, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'adatb�zis1', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'adatb�zis2', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('5', 'h�l�zatok', 5, TO_DATE('2007.06.27','YYYY.MM.DD'));
insert into indexk values ('6', 'h�l�zatok', 2, SYSDATE);

commit;

select * from hallgato order by ehakod;
select * from indexk order by ehakod;

