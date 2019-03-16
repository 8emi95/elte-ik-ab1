-- 12. Kik szeretik az összes olyan gyümölcsöt, amit valaki szeret?
-- osztás: s / gy

/*
create view gy as
	select distinct g from s;
create view rsz12 as
	select distinct s.n,gy.g from s, gy
		minus
	select * from s;
create view m12 as
	select distinct n from s
		minus
	select distinct n from rsz12;
select * from m12;
*/

SELECT distinct NEV
FROM SZERET
MINUS
SELECT distinct NEV
FROM rsz12;

SELECT distinct s.NEV, gy.GYUMOLCS
FROM SZERET, GYUMOLCS
MINUS
SELECT *
FROM SZERET;