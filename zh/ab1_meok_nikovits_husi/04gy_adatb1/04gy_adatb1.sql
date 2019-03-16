SELECT * FROM nikovits.dolgozo;
SELECT Max(fizetes) from nikovits.dolgozo;
SELECT sum(fizetes) from nikovits.dolgozo;
Select avg(fizetes) from nikovits.dolgozo where oazon = 20;
Select avg(fizetes) from nikovits.dolgozo group by oazon having oazon = 20; -- same as above
select distinct count(distinct foglalkozas) from nikovits.dolgozo;
select count(fizetes) from nikovits.dolgozo where fizetes > 2000;
select oazon deptno, trunc(avg(fizetes)) avg_sal from nikovits.dolgozo group by oazon;
select oazon deptno, trunc(avg(fizetes)) avg_sal 
  from nikovits.dolgozo dolgozo cross join nikovits.osztaly 
  where nikovits.dolgozo.azon = nikovits.oszaly.azon group by nikovtis.dolgozo.oazon;

select oazon, count(dkod) from nikovits.dolgozo group by oazon;
