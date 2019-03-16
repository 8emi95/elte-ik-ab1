create table dolgozo as select * from nikovits.dolgozo;

select * from dolgozo;
select dnev from dolgozo where belepes >= to_date('01-01-1982', 'dd-mm-yyyy');
select dnev from dolgozo where substr(dnev,2,1)='A'; --substr 2. feladat
select dnev from dolgozo where instr(dnev, 'L', 1, 2)>0; --3. feladat
select dnev, substr(dnev, -3) from dolgozo; --4. feladat
select fizetes, sqrt(fizetes), round(sqrt(fizetes), 2) from dolgozo; -- 5. feladat

select d1.dnev, f.dnev fonok from dolgozo d1, dolgozo f
where d1.fonoke = f.dkod; --utolso feladat
select d1.dnev, f.dnev fonok from dolgozo d1, dolgozo f
where d1.fonoke = f.dkod and length(d1.dnev) = length(f.dnev); --utolso feladat

--2. feladat pdf utolsó


drop table dolgozo;

--vissza az elõzõ órai feladatokra

create table szeret as select * from nikovits.szeret;

select nev from szeret
  minus
select distinct sz1.nev from szeret sz1, szeret sz2, szeret sz3
  where sz1.nev = sz2.nev
    and sz2.nev = sz3.nev
    and sz1.gyumolcs <> sz2.gyumolcs
    and sz2.gyumolcs <> sz3.gyumolcs
    and sz1.gyumolcs <> sz3.gyumolcs;
    
drop table szeret;