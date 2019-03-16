-- 14. Kik szeretnek legfeljebb olyan gyümölcsöket, amiket Micimackó is szeret (azaz olyat nem szeretnek, amit Micimackó sem)?

/*
	create view ns as
		select distinct s1.n, s2.g
		from s s1, s s2
		minus
		select * from s;
	create view rsz14 as
		select distinct ns.n,m2.g from ns, m2 
					minus
		select * from ns;
	create view m14 as
		select distinct n from ns
					minus
		select distinct n from rsz14;
	select * from m14;

*/