-- 15. Kik szeretik pontosan azokat a gyümölcsöket, amiket Micimackó szeret?

/*
	create view m15 as 
		select * from m13
			intersect
		select * from m14;
	select * from m15;
*/