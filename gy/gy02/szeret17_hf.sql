-- 17. Melyek azok a (név,név) párok, akiknek pontosan ugyanaz az ízlésük, azaz pontosan ugyanazokat a gyümölcsöket szeretik?

/*
	create view nn (a1,a3) as
		select distinct s1.n,s2.n
		from s s1, s s2;
	create view m17 as
		select * from nn
			minus
		select * from m16;
	select * from m17;
*/