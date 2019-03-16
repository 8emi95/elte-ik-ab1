select * from dolgozo;

select * from dolgozo where fonoke = 7839;
select * from dolgozo where fonoke = (select dkod from dolgozo where dnev = 'KING');

create table dolgozo as select * from nikovits.dolgozo;
create table osztaly as select * from nikovits.osztaly;
create table Fiz_kategoria as select * from nikovits.Fiz_kategoria;
create table Szeret as select * from nikovits.szeret;

select * from Fiz_kategoria;

--select onev, telephely from 
select * from dolgozo where 
  fizetes > (select also from Fiz_kategoria where kategoria = 1)
and 
  fizetes < (select felso from Fiz_kategoria where kategoria = 1); -- szar megoldás
  
select * from osztaly where oazon in 
  (select distinct d.oazon 
  from dolgozo d inner join fiz_kategoria f
  on d.fizetes between f.also and f.felso 
  where kategoria = 1);  -- 1. feladat
  
select * from osztaly where oazon not in 
  (select distinct d.oazon 
  from dolgozo d inner join fiz_kategoria f
  on d.fizetes between f.also and f.felso 
  where kategoria = 1); -- 2. feladat
  
select * from osztaly where oazon not in 
  (select distinct d.oazon 
  from dolgozo d inner join fiz_kategoria f
  on d.fizetes between f.also and f.felso 
  where kategoria = 1); -- 2. feladat
