-- Az emp, dept és sz TÁBLÁK KÖZVETLEN LÉTREHOZÁSA --

SET echo OFF
SET feedback OFF
DROP TABLE emp;
DROP TABLE dept;

CREATE TABLE dept 
    (deptno              NUMBER(2) NOT NULL,
     dname               VARCHAR2(14),
     loc                 VARCHAR2(13));

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES (40,'OPERATIONS','BOSTON');

ALTER SESSION SET NLS_DATE_LANGUAGE = ENGLISH;
ALTER SESSION SET NLS_DATE_FORMAT ='DD-MON-YYYY';

CREATE TABLE emp
    (empno               NUMBER(4) NOT NULL,
     ename               VARCHAR2(10),
     job                 VARCHAR2(9),
     mgr                 NUMBER(4) ,
     hiredate            DATE,
     sal                 NUMBER(7,2),
     comm                NUMBER(7,2),
     deptno              NUMBER(2) NOT NULL);

INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-1981',5000,NULL,10);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,'1-MAY-1981',2850,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,'9-JUN-1981',2450,NULL,10);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,'2-APR-1981',2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-1981',1250,1400,30);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-1981',1600,300,30);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,'8-SEP-1981',1500,0,30);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,'3-DEC-1981',950,NULL,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-1981',1250,500,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,'3-DEC-1981',3000,NULL,20);
INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,'17-DEC-1980',800,NULL,20);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,'09-DEC-1982',3000,NULL,20);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,'12-JAN-1983',1100,NULL,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,'23-JAN-1982',1300,NULL,10);
INSERT INTO emp VALUES (8000,'PROBA','DOLGOZO',NULL,'27-NOV-1980',6000,NULL,50);

ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MON-DD';

-- -------------------------------------------------------------
DROP TABLE sz;
CREATE TABLE sz
    (n          VARCHAR2(15),
     gy         VARCHAR2(15));

INSERT INTO sz VALUES ('Füles','málna');
INSERT INTO sz VALUES ('Füles','körte');
INSERT INTO sz VALUES ('Füles','alma');
INSERT INTO sz VALUES ('Micimackó','málna');
INSERT INTO sz VALUES ('Micimackó','körte');
INSERT INTO sz VALUES ('Micimackó','dió');
INSERT INTO sz VALUES ('Kanga','körte');
INSERT INTO sz VALUES ('Nyuszi','eper');
INSERT INTO sz VALUES ('Malacka','körte');
INSERT INTO sz VALUES ('Malacka','alma');
INSERT INTO sz VALUES ('Malacka','eper');
INSERT INTO sz VALUES ('Malacka','málna');
INSERT INTO sz VALUES ('Malacka','dió');
INSERT INTO sz VALUES ('Tigris','körte');
INSERT INTO sz VALUES ('Tigris','málna');

drop table szm;
CREATE TABLE szm
    (n          VARCHAR2(15),
     gy         VARCHAR2(15),
     m		NUMBER(2) );

INSERT INTO szm VALUES ('Füles','málna', 5);
INSERT INTO szm VALUES ('Füles','körte', 9);
INSERT INTO szm VALUES ('Füles','alma' , 7);
INSERT INTO szm VALUES ('Micimackó','málna',10);
INSERT INTO szm VALUES ('Micimackó','körte', 4);
INSERT INTO szm VALUES ('Micimackó','dió'  , 2);
INSERT INTO szm VALUES ('Kanga','körte',10);
INSERT INTO szm VALUES ('Nyuszi','eper' , 6);
INSERT INTO szm VALUES ('Malacka','körte', 5);
INSERT INTO szm VALUES ('Malacka','alma' , 7);
INSERT INTO szm VALUES ('Malacka','eper' , 3);
INSERT INTO szm VALUES ('Malacka','málna', 2);
INSERT INTO szm VALUES ('Malacka','dió'  , 5);
INSERT INTO szm VALUES ('Tigris','körte', 7);
INSERT INTO szm VALUES ('Tigris','málna', 3);

-- Az emp, dept és sz struktúrájának lekérdezése
SET linesize 30
DESC emp
DESC dept
DESC SZ
DESC SZM
SET linesize 400

-- ---------------------------------------------------------

drop table Filmek;
create table Filmek
( cím varchar(40),
  év integer,
  hossz integer,
  műfaj varchar(30),
  stúdióNév varchar(30),
  producerAzon number );

INSERT INTO Filmek VALUES ('Csillagok háborúja',1977,124,'Sci-fi','Fox',12345);
INSERT INTO Filmek VALUES ('Galaktikus kaland',1999,104,'vígjáték','DreamWorks',67890);
INSERT INTO Filmek VALUES ('Wayne világa',1992,195,'vígjáték','Paramount',99999);
INSERT INTO Filmek VALUES ('Elfújta a szél',1939,231,'dráma',null,null);

ALTER SESSION SET NLS_DATE_FORMAT ='dd/mm/yy';

drop table FilmSzínész;
create table FilmSzínész
( név varchar(30),
  cím varchar(30),
  nem char(1),
  születésidátum date );

INSERT INTO FilmSzínész VALUES ('Carrie Fisher','123 Maple St., Hollywood','N','9/9/99');
INSERT INTO FilmSzínész VALUES ('Mark Hamill','456 Oak Rd., Brentwood','F','8/8/88');
INSERT INTO FilmSzínész VALUES ('Harrison Ford','789 Palm Dr., Beverly Hills','F','7/7/77');

drop table SzerepelBenne;
create table SzerepelBenne(
filmCím varchar(30),
filmÉv integer,
szinészNév varchar(30));

drop table GyártásIrányító;
create table GyártásIrányító(
név varchar(30),
cím varchar(30),
azon integer,
nettóBevétel integer);

drop table Stúdió;
create table Stúdió(
név varchar(30), 
cím varchar(30), 
elnökAzon integer);

-- ---------------------------------------------------

drop table Termék;
create table Termék(
gyártó varchar(10),
modell integer,
típus varchar(10));

INSERT INTO Termék VALUES ('A',1001,'pc');
INSERT INTO Termék VALUES ('A',1002,'pc');
INSERT INTO Termék VALUES ('A',1003,'pc');
INSERT INTO Termék VALUES ('A',2004,'laptop');
INSERT INTO Termék VALUES ('A',2005,'laptop');
INSERT INTO Termék VALUES ('A',2006,'laptop');
INSERT INTO Termék VALUES ('B',1004,'pc');
INSERT INTO Termék VALUES ('B',1005,'pc');
INSERT INTO Termék VALUES ('B',1006,'pc');
INSERT INTO Termék VALUES ('B',2007,'laptop');
INSERT INTO Termék VALUES ('C',1007,'pc');
INSERT INTO Termék VALUES ('D',1008,'pc');
INSERT INTO Termék VALUES ('D',1009,'pc');
INSERT INTO Termék VALUES ('D',1010,'pc');
INSERT INTO Termék VALUES ('D',3004,'nyomtató');
INSERT INTO Termék VALUES ('D',3005,'nyomtató');
INSERT INTO Termék VALUES ('E',1011,'pc');
INSERT INTO Termék VALUES ('E',1012,'pc');
INSERT INTO Termék VALUES ('E',1013,'pc');
INSERT INTO Termék VALUES ('E',2001,'laptop');
INSERT INTO Termék VALUES ('E',2002,'laptop');
INSERT INTO Termék VALUES ('E',2003,'laptop');
INSERT INTO Termék VALUES ('E',3001,'nyomtató');
INSERT INTO Termék VALUES ('E',3002,'nyomtató');
INSERT INTO Termék VALUES ('E',3003,'nyomtató');
INSERT INTO Termék VALUES ('F',2008,'laptop');
INSERT INTO Termék VALUES ('F',2009,'laptop');
INSERT INTO Termék VALUES ('G',2010,'laptop');
INSERT INTO Termék VALUES ('H',3006,'nyomtató');
INSERT INTO Termék VALUES ('H',3007,'nyomtató');

drop table PC;
create table PC(
modell integer,
sebesség float,
memória integer,
merevlemez integer,
ár integer);

INSERT INTO PC VALUES (1001,2.66,1024,250,2114);
INSERT INTO PC VALUES (1002,2.10,512,250,995);
INSERT INTO PC VALUES (1003,1.42,512,80,478);
INSERT INTO PC VALUES (1004,2.80,1024,250,649);
INSERT INTO PC VALUES (1005,3.20,512,250,630);
INSERT INTO PC VALUES (1006,3.20,1024,320,1049);
INSERT INTO PC VALUES (1007,2.20,1024,200,510);
INSERT INTO PC VALUES (1008,2.20,2048,250,770);
INSERT INTO PC VALUES (1009,2.00,1024,250,650);
INSERT INTO PC VALUES (1010,2.80,2048,300,770);
INSERT INTO PC VALUES (1011,1.86,2048,160,959);
INSERT INTO PC VALUES (1012,2.80,1024,160,649);
INSERT INTO PC VALUES (1013,3.06,512,80,529);

drop table Laptop;
create table Laptop(
modell integer,
sebesség float,
memória integer,
merevlemez integer,
képernyő float,
ár integer);

INSERT INTO Laptop VALUES (2001,2.00,2048,240,20.1,3673);
INSERT INTO Laptop VALUES (2002,1.73,1024,80,17.0,949);
INSERT INTO Laptop VALUES (2003,1.80,512,60,15.4,549);
INSERT INTO Laptop VALUES (2004,2.00,512,60,13.3,1150);
INSERT INTO Laptop VALUES (2005,2.16,1024,120,17.0,2500);
INSERT INTO Laptop VALUES (2006,2.00,2048,80,15.4,1700);
INSERT INTO Laptop VALUES (2007,1.83,1024,120,13.3,1429);
INSERT INTO Laptop VALUES (2008,1.60,1024,100,15.4,900);
INSERT INTO Laptop VALUES (2009,1.60,512,80,14.1,680);
INSERT INTO Laptop VALUES (2010,2.00,2048,160,15.4,2300);

drop table Nyomtató;
create table Nyomtató(
modell integer,
színes varchar(5),
típus varchar(15),
ár integer);

INSERT INTO Nyomtató VALUES (3001,'igen','tintasugaras',3673);
INSERT INTO Nyomtató VALUES (3002,'nem','lézer',949);
INSERT INTO Nyomtató VALUES (3003,'igen','lézer',549);
INSERT INTO Nyomtató VALUES (3004,'igen','tintasugaras',1150);
INSERT INTO Nyomtató VALUES (3005,'nem','lézer',2500);
INSERT INTO Nyomtató VALUES (3006,'igen','tintasugaras',1700);
INSERT INTO Nyomtató VALUES (3007,'igen','lézer',1429);



ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MON-DD';

-- -----------------------------------------------

drop table hajóosztályok;
Create table hajóosztályok
(
	Osztály varchar(15),
	Típus varchar(2),
	Ország varchar(20),
	ágyúkSzáma number,
	kaliber number,
	vízkiszorítás number);
  
INSERT INTO hajóosztályok VALUES ('Bismark','bb','Németország',8,15,42000) ;
INSERT INTO hajóosztályok VALUES ('Iowa','bb','USA',9,16,46000);
INSERT INTO hajóosztályok VALUES ('Kongo','bc','Japán',8,14,32000);
INSERT INTO hajóosztályok VALUES ('North Carolina','bb','USA',9,16,37000);
INSERT INTO hajóosztályok VALUES ('Renown','bc','Nagy Britannia',6,15,32000);
INSERT INTO hajóosztályok VALUES ('Revenge','bb','Nagy Britannia',8,15,29000);
INSERT INTO hajóosztályok VALUES ('Tennessee','bb','USA',12,14,32000);
INSERT INTO hajóosztályok VALUES ('Yamato','bb','Japán',9,18,65000);

drop table csaták;
Create table csaták
      (	Csatanév varchar(15),
	Dátum varchar(15) );

INSERT INTO csaták VALUES ('Denmark Strait','5/24-27/41');
INSERT INTO csaták VALUES ('Guadalcanal','11/15/42');
INSERT INTO csaták VALUES ('North Cape','12/26/43');
INSERT INTO csaták VALUES ('Suriago Strait','10/25/44');

drop table kimenetelek;
Create table kimenetelek
      (	Hajónév varchar(20),
	Csatanév varchar(15),
	Eredmény varchar(15) );

INSERT INTO kimenetelek VALUES ('Arizona','Pearl Harbour','elsüllyedt');
INSERT INTO kimenetelek VALUES ('Bismark','Denmark Strait','elsüllyedt');
INSERT INTO kimenetelek VALUES ('California','Surigao Strait','ok');
INSERT INTO kimenetelek VALUES ('Duke of York','North Cape','ok');
INSERT INTO kimenetelek VALUES ('Fuso','Surigao Strait','elsüllyedt');
INSERT INTO kimenetelek VALUES ('Hood','Denmark Strait','elsüllyedt');
INSERT INTO kimenetelek VALUES ('King George V','Denmark Strait','ok');
INSERT INTO kimenetelek VALUES ('Kirishima','Guadalcanal','elsüllyedt');
INSERT INTO kimenetelek VALUES ('Prince of Wales','Denmark Strait','sérült');
INSERT INTO kimenetelek VALUES ('Rodney','Denmark Strait','ok');
INSERT INTO kimenetelek VALUES ('Scharnhorst','North Cape','elsüllyedt');
INSERT INTO kimenetelek VALUES ('South of Dakota','Guadalcanal','sérült');
INSERT INTO kimenetelek VALUES ('Tennessee','Surigao Strait','Ok');
INSERT INTO kimenetelek VALUES ('Washington','Guadalcanal','ok');
INSERT INTO kimenetelek VALUES ('West Wirginia','Surigao Strait','ok');
INSERT INTO kimenetelek VALUES ('Yamashiro','Surigao Strait','elsüllyedt');


drop table hajók;
Create table hajók
      (	Hajónév varchar(20),
	Osztály varchar(15),
	Felavatva number );

INSERT INTO hajók VALUES ('California','Tennessee',1921);
INSERT INTO hajók VALUES ('Haruna','Kongo',1915);
INSERT INTO hajók VALUES ('Hiei','Kongo',1914);
INSERT INTO hajók VALUES ('Iowa','Iowa',1943);
INSERT INTO hajók VALUES ('Kirishima','Kongo',1915);
INSERT INTO hajók VALUES ('Kongo','Kongo',1913);
INSERT INTO hajók VALUES ('Missuri','Iowa',1944);
INSERT INTO hajók VALUES ('Musashi','Yamato',1942);
INSERT INTO hajók VALUES ('New Jersey','Iowa',1943);
INSERT INTO hajók VALUES ('North Carolina','North Carolina',1941);
INSERT INTO hajók VALUES ('Ramillies','Revenge',1917);
INSERT INTO hajók VALUES ('Renown','Renown',1916);
INSERT INTO hajók VALUES ('Repulse','Renown',1916);
INSERT INTO hajók VALUES ('Resolution','Revenge',1916);
INSERT INTO hajók VALUES ('Revenge','Revenge',1916);
INSERT INTO hajók VALUES ('Royal Oak','Revenge',1916);
INSERT INTO hajók VALUES ('Royal Sovereign','Revenge',1916);
INSERT INTO hajók VALUES ('Tennesse','Tenesse',1920);
INSERT INTO hajók VALUES ('Washington','North Carolina',1941);
INSERT INTO hajók VALUES ('Wisconsin','Iowa',1944);
INSERT INTO hajók VALUES ('Yamato','Yamato',1941);

-- --------------------------------------------------------

-- megadja a mesehősök azonosítóját, nevét, címét és egyenlegét
drop table mesehős;
create table mesehős(
  AZON CHAR(3) primary key,
  NéV  CHAR(25) not null,
  CíM CHAR(25),
  EGYENLEG NUMBER);

insert into mesehős values('M01','Vasorrú Bába','Mézeskalács Ház',2500);
insert into mesehős values('M02','Vadász','Vadászles',0);
insert into mesehős values('M03','Micimackó','Százholdas Pagony',-1000);
insert into mesehős values('M04','Maci Laci','Hollywood', 5030);
insert into mesehős values('M05','Törpilla','Gombaház',null);
insert into mesehős values('M06','Hétfejű sárkány','Sárkánybarlang', 700);
insert into mesehős values('M07','A három nyúl','Nyusziház', -3400);
insert into mesehős values('M08','Okoska','Gombaház',null);
insert into mesehős values('M09','Piroska','Erdőszéli házikó', 6700);
insert into mesehős values('M10','Tapsi Hapsi','Hollywood',9920);
insert into mesehős values('M11','Süsü','Sárkánybarlang', 1130);
insert into mesehős values('M12','Vuk','Rókalyuk', -250);
insert into mesehős values('M13','Törpapa','Gombaház', 400);

-- megadja, hogy az adott cikknek mekkora az egységára
drop table cikk;
create table cikk( 
CIKKNÉV CHAR(20) primary key,
EGYSÉGÁR NUMBER);

insert into cikk values('répa',20);
insert into cikk values('mágnespor', 20);
insert into cikk values('cipő', 300);
insert into cikk values('puskagolyó', 50);
insert into cikk values('mézesbödön', 60);
insert into cikk values('kalács', 90);
insert into cikk values('sütőlapát', 150);
insert into cikk values('kosár', 200);
insert into cikk values('szemfesték', 150);
insert into cikk values('puska', 300);
insert into cikk values('smirgli', 20);
insert into cikk values('saláta', 100);
insert into cikk values('rókacsapda', 300);
insert into cikk values('pipihús', 200);
insert into cikk values('erős paprika', 20);
insert into cikk values('élesztő', 15);

ALTER SESSION SET NLS_DATE_FORMAT ='YY-MON-DD';
-- megadja, hogy az adott rendelési számú rendelést
-- mikor adta fel az adott azonosítójú mesehős
drop table rendelés;
create table rendelés(
RENDSZÁM NUMBER primary key,
MAZON CHAR(3),
DÁTUM DATE);

insert into rendelés values(6,'M07','94-OKT.-07');
insert into rendelés values(13,'M05','93-JAN.-01');
insert into rendelés values(16,'M02','94-MÁRC.-15');
insert into rendelés values(17,'M07','92-JAN.-21');
insert into rendelés values(22,'M01','94-AUG.-25');
insert into rendelés values(23,'M02','96-OKT.-12');
insert into rendelés values(25,'M02','97-FEBR.-28');
insert into rendelés values(34,'M05','95-DEC.-03');
insert into rendelés values(37,'M01','00-JAN.-12');
insert into rendelés values(46,'M01','96-JÚL.-21');
insert into rendelés values(49,'M02','98-MÁRC.-05');
insert into rendelés values(53,'M03','01-JÚN.-02');
insert into rendelés values(61,'M09','03-ÁPR.-05');
insert into rendelés values(66,'M07','93-OKT.-30');
insert into rendelés values(78,'M01','95-JÚL.-02');
insert into rendelés values(80,'M02','94-NOV.-18');
insert into rendelés values(97,'M09','96-OKT.-20');

ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MON-DD';

-- megadja, hogy az adott rendelési számon az adott cikkből
-- mekkora mennyiségben rendeltek
drop table tartalmaz;
create table tartalmaz(
  RENDSZÁM NUMBER,
  CIKKNÉV CHAR(20),
  MENNYISEG NUMBER,
  primary key(RENDSZÁM, CIKKNÉV));

insert into tartalmaz values(6,'cipő',6);
insert into tartalmaz values(13,'szemfesték', 12);
insert into tartalmaz values(16,'rókacsapda', 3);
insert into tartalmaz values(17,'répa', 200);
insert into tartalmaz values(22,'mágnespor', 319);
insert into tartalmaz values(23,'szemfesték', 4);
insert into tartalmaz values(23,'saláta', 6);
insert into tartalmaz values(25,'puska', 2);
insert into tartalmaz values(34,'cipő', 2);
insert into tartalmaz values(37,'smirgli', 17);
insert into tartalmaz values(37,'mézesbödön', 3);
insert into tartalmaz values(37,'élesztő', 20);
insert into tartalmaz values(46,'szemfesték', 8);
insert into tartalmaz values(49,'puskagolyó', 56);
insert into tartalmaz values(53,'mézesbödön', 5);
insert into tartalmaz values(61,'kalács', 1);
insert into tartalmaz values(66,'saláta', 12);
insert into tartalmaz values(78,'sütőlapát', 1);
insert into tartalmaz values(80,'cipő', 2);
insert into tartalmaz values(97,'kosár', 1);

-- ---------------------------------------------------------
DROP TABLE Likes2;
DROP TABLE Serves;
DROP TABLE Frequent;

DROP TABLE Bar;
CREATE TABLE Bar(name VARCHAR(20) PRIMARY KEY,  address VARCHAR(20));

INSERT INTO Bar VALUES('Down Under Pub','802 W. Main Street');
INSERT INTO Bar VALUES('The Edge','108 Morris Street');
INSERT INTO Bar VALUES('James Joyce Pub','912 W. Main Street');
INSERT INTO Bar VALUES('Satisfaction','905 W. Main Street');
INSERT INTO Bar VALUES('Talk of the Town','108 E. Main Street');

drop table bars;
create table Bars(
  name varchar(20) primary key,
  addr varchar(10),
  license varchar(6) );

insert into bars values('Australia Hotel','The Rocks','123456');
insert into bars values('Coogee Bay Hotel','Coogee','966500');
insert into bars values('Lord Nelson','The Rocks','123888');
insert into bars values('Marble Bar','Sydney','122123');
insert into bars values('Regent Hotel','Kingsford','987654');
insert into bars values('Royal Hotel','Randwick','938500');
insert into bars values('Joe''s','Maple St.','938501');
insert into bars values('Sue''s','River Rd.','938502');


DROP TABLE Beer;
CREATE TABLE Beer(name VARCHAR(20) PRIMARY KEY,
                  brewer VARCHAR(20));

INSERT INTO Beer VALUES('Amstel','Amstel Brewery');
INSERT INTO Beer VALUES('Budweiser','Anheuser-Busch Inc.');
INSERT INTO Beer VALUES('Corona','Grupo Modelo');
INSERT INTO Beer VALUES('Dixie','Dixie Brewing');
INSERT INTO Beer VALUES('Erdinger','Erdinger Weissbrau');
INSERT INTO Beer VALUES('Full Sail','Full Sail Brewing');


drop table beers;
create table Beers(
  name varchar(30) primary key,
  manf varchar(30) );

insert into beers values('80/-','Caledonian');
insert into beers values('Bigfoot Barley Wine','Sierra Nevada');
insert into beers values('Burragorang Bock','George IV Inn');
insert into beers values('Crown Lager','Carlton');
insert into beers values('Fosters Lager','Carlton');
insert into beers values('Invalid Stout','Carlton');
insert into beers values('Melbourne Bitter','Carlton');
insert into beers values('New','Toohey''s');
insert into beers values('Old','Toohey''s');
insert into beers values('Old Admiral','Lord Nelson');
insert into beers values('Pale Ale','Sierra Nevada');
insert into beers values('Premium Lager','Cascade');
insert into beers values('Red','Toohey''s');
insert into beers values('Sheaf Stout','Toohey''s');
insert into beers values('Sparkling Ale','Cooper''s');
insert into beers values('Stout','Cooper''s');
insert into beers values('Three Sheets','Lord Nelson');
insert into beers values('Victoria Bitter','Carlton');
insert into beers values('Bud','Anheuser-Busch');
insert into beers values('Bud Lite','Anheuser-Busch');
insert into beers values('Michelob','Anheuser-Busch');
insert into beers values('Spotted cow','New Glarus Brewing Company');
insert into beers values('Spotted badger','New Glarus Brewing Company');
insert into beers values('Spotted deer','New Glarus Brewing Company');

DROP TABLE Drinker;
CREATE TABLE Drinker(name VARCHAR(20) PRIMARY KEY,
                     address VARCHAR(20));

INSERT INTO Drinker VALUES('Amy','100 W. Main Street');
INSERT INTO Drinker VALUES('Ben','101 W. Main Street');
INSERT INTO Drinker VALUES('Coy','200 S. Duke Street');
INSERT INTO Drinker VALUES('Dan','300 N. Duke Street');
INSERT INTO Drinker VALUES('Eve','100 W. Main Street');


drop table drinkers;
create table Drinkers(
  name varchar(20) primary key,
  addr VARCHAR(8),
  phone varchar(9) );

insert into Drinkers values('Adam','Randwick','9385-4444');
insert into Drinkers values('Gernot','Newtown','9415-3378');
insert into Drinkers values('John','Clovelly','9665-1234');
insert into Drinkers values('Justin','Mosman','9845-4321');


CREATE TABLE Frequent(drinker VARCHAR(20) NOT NULL REFERENCES Drinker(name),
                      bar VARCHAR(20) NOT NULL REFERENCES Bar(name),
                      times_a_week SMALLINT CHECK(times_a_week > 0),
                      PRIMARY KEY(drinker, bar));

INSERT INTO Frequent VALUES('Amy','James Joyce Pub', 2);
INSERT INTO Frequent VALUES('Ben','James Joyce Pub', 1);
INSERT INTO Frequent VALUES('Ben','Satisfaction', 2);
INSERT INTO Frequent VALUES('Ben','Talk of the Town', 1);
INSERT INTO Frequent VALUES('Coy','Down Under Pub', 1);
INSERT INTO Frequent VALUES('Coy','The Edge', 1);
INSERT INTO Frequent VALUES('Dan','Down Under Pub', 2);
INSERT INTO Frequent VALUES('Dan','The Edge', 1);
INSERT INTO Frequent VALUES('Dan','James Joyce Pub', 1);
INSERT INTO Frequent VALUES('Dan','Satisfaction', 2);
INSERT INTO Frequent VALUES('Dan','Talk of the Town', 2);
INSERT INTO Frequent VALUES('Eve','James Joyce Pub', 2);

drop table frequents;
create table Frequents(
  drinker varchar(20),
  bar varchar(20),
  primary key(drinker,bar) );

insert into frequents values('Adam','Coogee Bay Hotel');
insert into frequents values('Gernot','Lord Nelson');
insert into frequents values('John','Coogee Bay Hotel');
insert into frequents values('John','Lord Nelson');
insert into frequents values('John','Australia Hotel');
insert into frequents values('Justin','Regent Hotel');
insert into frequents values('Justin','Marble Bar');


CREATE TABLE Serves(bar VARCHAR(20) NOT NULL REFERENCES Bar(name),
                    beer VARCHAR(20) NOT NULL REFERENCES Beer(name),
                    price DECIMAL(5,2) CHECK(price > 0),
                    PRIMARY KEY(bar, beer));

INSERT INTO Serves VALUES('Down Under Pub','Amstel', 2.75);
INSERT INTO Serves VALUES('Down Under Pub','Budweiser', 2.25);
INSERT INTO Serves VALUES('Down Under Pub','Corona', 3.00);
INSERT INTO Serves VALUES('The Edge','Amstel', 2.75);
INSERT INTO Serves VALUES('The Edge','Budweiser', 2.50);
INSERT INTO Serves VALUES('The Edge','Corona', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub','Amstel', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub','Corona', 3.25);
INSERT INTO Serves VALUES('James Joyce Pub','Dixie', 3.00);
INSERT INTO Serves VALUES('James Joyce Pub','Erdinger', 3.50);
INSERT INTO Serves VALUES('Satisfaction','Amstel', 2.75);
INSERT INTO Serves VALUES('Satisfaction','Budweiser', 2.25);
INSERT INTO Serves VALUES('Satisfaction','Corona', 2.75);
INSERT INTO Serves VALUES('Satisfaction','Dixie', 2.75);
INSERT INTO Serves VALUES('Satisfaction','Full Sail', 2.75);
INSERT INTO Serves VALUES('Talk of the Town','Amstel', 2.50);
INSERT INTO Serves VALUES('Talk of the Town','Budweiser', 2.20);

CREATE TABLE Likes2(drinker VARCHAR(20) NOT NULL REFERENCES Drinker(name),
                   beer VARCHAR(20) NOT NULL REFERENCES Beer(name),
                   PRIMARY KEY(drinker, beer));

INSERT INTO Likes2 VALUES('Amy','Amstel');
INSERT INTO Likes2 VALUES('Amy','Corona');
INSERT INTO Likes2 VALUES('Ben','Amstel');
INSERT INTO Likes2 VALUES('Ben','Budweiser');
INSERT INTO Likes2 VALUES('Coy','Dixie');
INSERT INTO Likes2 VALUES('Dan','Amstel');
INSERT INTO Likes2 VALUES('Dan','Budweiser');
INSERT INTO Likes2 VALUES('Dan','Corona');
INSERT INTO Likes2 VALUES('Dan','Dixie');
INSERT INTO Likes2 VALUES('Dan','Erdinger');
INSERT INTO Likes2 VALUES('Eve','Amstel');
INSERT INTO Likes2 VALUES('Eve','Corona');

drop table likes;
CREATE TABLE Likes(drinker VARCHAR(20),
                   beer VARCHAR(20),
                   PRIMARY KEY(drinker, beer));

insert into Likes values('Adam','Crown Lager');
insert into Likes values('Adam','Fosters Lager');
insert into Likes values('Adam','New');
insert into Likes values('Gernot','Premium Lager');
insert into Likes values('Gernot','Sparkling Ale');
insert into Likes values('John','80/-');
insert into Likes values('John','Bigfoot Barley Wine');
insert into Likes values('John','Pale Ale');
insert into Likes values('John','Three Sheets');
insert into Likes values('Justin','Sparkling Ale');
insert into Likes values('Justin','Victoria Bitter');
insert into Likes values('Sally','Bud');
insert into Likes values('Fred','Bud');
insert into Likes values('Jan','Heineke');
insert into Likes values('Jan','Cheers');
insert into Likes values('Jan','Grolsch');
insert into Likes values('Jan','California');
insert into Likes values('Jan','Amstel');
insert into Likes values('Jaap','California');
insert into Likes values('Jan','Leffe');
insert into Likes values('Jaap	','Rock cafe');
insert into Likes values('Cheers','Amstel');
insert into Likes values('Jan','Duvel');
insert into Likes values('Peter','Cheers');
insert into Likes values('Cheers','Leffe');
insert into Likes values('Jaap','Grolsch');
insert into Likes values('Peter','Rock cafe');
insert into Likes values('Jaap','Duvel');
insert into Likes values('Paul','Cheers');
insert into Likes values('Peter','Koning');
insert into Likes values('Paul','Flamingo');
insert into Likes values('Peter','Duvel');
insert into Likes values('Mary','California');
insert into Likes values('Peter','Heineken');
insert into Likes values('Mary','Flamingo');
insert into Likes values('Peter','Leffe');
insert into Likes values('Sue','Rock cafe');
insert into Likes values('Paul','Heineken');
insert into Likes values('Jolande','California');
insert into Likes values('Paul','Duvel');
insert into Likes values('Jolande','Cheers');
insert into Likes values('Paul','Grolsch');
insert into Likes values('Susan','Cheers');
insert into Likes values('Mary','Grolsch');
insert into Likes values('Susan','Old dutch');
insert into Likes values('Sue','Amster');
insert into Likes values('Sue','Koning');
insert into Likes values('Sue','Duvel');
insert into Likes values('Jolande','Heineken');	  			  	  	 
insert into Likes values('Jolande','Grolsch');		  	  	 
insert into Likes values('Jolande','Amstel');	  	  	 
insert into Likes values('Susan','Duvel');		  	  	 
insert into Likes values('Susan','Koning');


drop table sells;
create table Sells(
  bar varchar(20),
  beer varchar(20),
  price number(4,2),
  primary key(bar,beer));

insert into sells values('Australia Hotel','Burragorang Bock',3.50);
insert into sells values('Coogee Bay Hotel','New',2.25);
insert into sells values('Coogee Bay Hotel','Old',2.50);
insert into sells values('Coogee Bay Hotel','Sparkling Ale',2.80);
insert into sells values('Coogee Bay Hotel','Victoria Bitter',2.30);
insert into sells values('Lord Nelson','Three Sheets',3.75);
insert into sells values('Lord Nelson','Old Admiral',3.75);
insert into sells values('Marble Bar','New',2.80);
insert into sells values('Marble Bar','Old',2.80);
insert into sells values('Marble Bar','Victoria Bitter',2.80);
insert into sells values('Regent Hotel','New',2.20);
insert into sells values('Regent Hotel','Victoria Bitter',2.20);
insert into sells values('Royal Hotel','New',2.30);
insert into sells values('Royal Hotel','Old',2.30);
insert into sells values('Royal Hotel','Victoria Bitter',2.30);
insert into sells values('Joe''s','Bud',2.5);
insert into sells values('Joe''s','Miller',2.75);
insert into sells values('Sue''s','Bud',2.5);
insert into sells values('Sue''s','Coors',3);
insert into sells values('Sue''s','Miller',3);


drop table menu;
create table Menu(beer varchar(20), price number(4,2));

-- -----------------------------------------------------------------------

drop table sör;
create table Sör (név varchar(50), ország varchar(50));

insert into sör values('Soproni 1895','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Fekete Démon','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Szűz','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Citrom','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Narancs','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Körte','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Grapefuit','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Zéró Narancs','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Soproni Zéró Grapefruit','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Gösser Spezial','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Gösser NaturZitrone','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Gösser Alkoholfreies Naturbier','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Gösser NaturZitrone 0,0%','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Amstel','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Zlaty Bazant','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Kaiser','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Edelweiss','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Steffl','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Edelweiss','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Buckler','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Storngbow Gold','Magyar Heineken Hungária Sörgyárak Zrt.');
insert into sör values('Kozel','Cseh');
insert into sör values('Dreher Classic','Dreher Sörgyárak Zrt.');
insert into sör values('Dreher Bak barna','Dreher Sörgyárak Zrt.');
insert into sör values('Dreher 24','Dreher Sörgyárak Zrt.');
insert into sör values('Arany Ászok világos','Dreher Sörgyárak Zrt.');
insert into sör values('Arany Ászok félbarna','Dreher Sörgyárak Zrt.');
insert into sör values('Arany Ászok alkoholmentes','Dreher Sörgyárak Zrt.');
insert into sör values('Pilsner Urquell','Dreher Sörgyárak Zrt.');
insert into sör values('Miller Genuine Draft','Dreher Sörgyárak Zrt.');
insert into sör values('Kőbányai Sör','Dreher Sörgyárak Zrt.');
insert into sör values('Kanizsai','Dreher Sörgyárak Zrt.');
insert into sör values('Rocky Cellar','Dreher Sörgyárak Zrt.');
insert into sör values('Goldberger','Dreher Sörgyárak Zrt.');
insert into sör values('Hofbräu Lager','Dreher Sörgyárak Zrt.');
insert into sör values('Nimród','Dreher Sörgyárak Zrt.');
insert into sör values('Dreher','Német');
insert into sör values('Borsodi Sör','Magyar Borsodi Sörgyár Zrt.');
insert into sör values('Borsodi Póló','Magyar Borsodi Sörgyár Zrt.');
insert into sör values('Borsodi Bivaly','Magyar Borsodi Sörgyár Zrt.');
insert into sör values('Borostyán','Magyar Borsodi Sörgyár Zrt.');
insert into sör values('Rákóczi sör','Magyar Borsodi Sörgyár Zrt.');


-- Neuberg, Kewer, Waldert, Ritterhof 	Dreher Sörgyárak Zrt.
-- Szalon (világos, barna, alkoholmentes), Ottakringer Spezial, Paulaner Hefe-Weissbier Naturtrüb, 
-- Paulaner Original Münchner Hell, Radler (bodza, lemon, málna, meggy, szeder) 	Pécsi Sörfőzde Zrt.

drop table bár;
create table Bár (név varchar(10), város varchar(10), tulaj varchar(10));

insert into bár values('Makk 7-es','Budapest','Géza');
insert into bár values('Lórúgás','Győr','Ica');

drop table felszolgál;
create table Felszolgál (sör varchar(10), bár varchar(10), ár number);

insert into felszolgál values('Kozel','Makk 7-es',320);
insert into felszolgál values('Dreher','Makk 7-es',400);
insert into felszolgál values('Soproni','Lórúgás',280);

-- --------------------------------------------------------------

select * from hajóosztályok;
select * from csaták;
select * from kimenetelek;
select * from hajók;
select * from sör;
select * from bár;
select * from Termék;
select * from PC;
select * from Laptop;
select * from Nyomtató;
-- Az emp és dept táblák listázása
SET numwidth 5

SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM sz;
SELECT * FROM szm;

SET numwidth 10
