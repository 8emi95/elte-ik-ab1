-- 13. Kik szeretik az összes olyan gyümölcsöt, amit Micimackó szeret (esetleg mást is szerethetnek)?

/*
	create view rsz13 as
		select distinct s.n,m1.g from s, m1
					minus
		select * from s;
	create view m13 as
		select distinct n from s
					minus
		select distinct n from rsz13;
	select * from m13;
*/

select distinct nev from szeret
			minus
select distinct n from (
	select distinct s.nev,m1.gyumolcs from szeret, m1
				minus
	select * from szeret;
);