select dnev dolgnev, fizetes from nikovits.dolgozo;

create table husidolgozo as select * from nikovits.dolgozo;

select * from husidolgozo;
drop table husidolgozo;

create table husidolgozo as select dnev dolgnev, fizetes from nikovits.dolgozo;
select * from husidolgozo;
drop table husidolgozo;

create table husiszeret as select * from nikovits.szeret;
select * from husiszeret;

select gyumolcs from husiszeret where nev like 'Micimackó'; -- 1. feladat
select gyumolcs from husiszeret
  minus
select gyumolcs from husiszeret where nev like 'Micimackó'; -- 2. feladat
select nev from husiszeret where gyumolcs like 'alma'; -- 3. feladat
select nev from husiszeret where gyumolcs not like 'körte'; -- 4. feladat
select distinct nev from husiszeret where gyumolcs not like 'körte' or gyumolcs like 'alma'; -- 5. feladat
select distinct nev from husiszeret where gyumolcs not like 'körte' 
  union
select distinct nev from husiszeret where gyumolcs not like 'alma';  -- 5. feladat
select distinct nev from husiszeret where gyumolcs like 'alma' 
  minus
select distinct nev from husiszeret where gyumolcs like 'kört';  -- 7. feladat

select distinct szeret1.nev
from husiszeret szeret1, husiszeret szeret2
where szeret1.nev = szeret2.nev and szeret1.gyumolcs <> szeret2.gyumolcs; -- 8. feladat

drop table husiszeret;
--select o1, o2 from t1, t2 where
--hf: rest