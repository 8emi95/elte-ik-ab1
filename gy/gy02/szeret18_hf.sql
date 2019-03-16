-- 18. Kiknek van a legtöbb csupor mézük?

/*
create view t (a1,a2,a3,a4) as
	select distinct m1.n,m1.c,m2.n,m2.c 
	from me m1, me m2
	where m1.c>=m2.c;
create view me2 (a3,a4) as
	select * from me;
create view rsz18 as
	select distinct t.a1,t.a2,me2.a3,me2.a4 from t, me2 
			minus
	select * from r;
create view m18h (a1,a2) as
	select distinct a1,a2 from t
		minus
	select distinct a1,a2 from rsz18;
create view m18 as
	select distinct a1 from m18h;
select * from m18;
*/