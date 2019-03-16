select A, avg(D) from R cross join S where B >= 2 group by A;

select A
from R natural join S
group by A
having AVG(D) > 10;

select * from szeret;

select nev 
from 
    (select nev, count(gyumolcs) c1 from szeret group by nev) T1
  cross join 
    (select count(distinct gyumolcs) as cnt from szeret) T2
where T1.c1 = T2.cnt;

select count(distinct gyumolcs) as nevc from szeret;