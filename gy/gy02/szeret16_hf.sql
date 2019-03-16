-- 16. Melyek azok a (név,név) párok, akiknek legalább egy gyümölcsben eltér az ízlésük, azaz az egyik szereti ezt a gyümölcsöt, a másik meg nem?


/*
	create view m160 (a1,a2,a3,a4) as
		select distinct s1.n, s2.g, s2.n, s1.g
		from s s1, s s2
			minus
		select distinct s1.n, s1.g, s2.n, s2.g
		from s s1, s s2;
	create view m16 as
		select distinct a1,a3
		from m160;
	select * from m16;
*/