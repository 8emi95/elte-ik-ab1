/*
	Adatb�zisok 1, PC rel�ci�k megold�sai SQL-ben
	Eredeti megold�sok: IVGRAAI.ELTE - Iv�n Gerg�
	SQL-es -||- : GUJQAAI.ELTE - Gubicza J�zsef
*/

/* PC rel�ci�k */

/* A */
select modell
from PC
where sebess�g >= 3.0;

/* B */
-- m.o. 1
select distinct Gy�rt�
from (select * from term�k
	  right join 
		(select modell from Laptop where merevlemez >= 100) p
	   on
			term�k.modell = p.modell);
      
-- m.o. 2
select gy�rt�
from term�k natural join laptop
where merevlemez >= 100;

/* C */
-- m. o. 1
select modell, �r
from ((select modell
	  from Term�k
	  where Gy�rt� like 'B') natural join PC)
union 
select modell, �r
from ((select modell
	  from Term�k
	  where Gy�rt� like 'B') natural join Laptop)
union
select modell, �r
from ((select modell
	  from Term�k
	  where Gy�rt� like 'B') natural join Nyomtat�);

-- m. o. 2
select modell, �r
from (term�k natural join (select modell, �r from pc union select modell, �r from nyomtat� union select modell, �r from laptop))
where gy�rt� like 'B';

/* D */
select modell
from Nyomtat�
where sz�nes like 'igen' and t�pus like 'l�zer';

/* E */

select gy�rt� from term�k where t�pus like 'laptop'
minus
select gy�rt� from term�k where t�pus like 'pc';

/* F */
select distinct merevlemez1 as merevl
from (select merevlemez as merevlemez1, modell as modell1 from pc) pc1,(select merevlemez as merevlemez2, modell as modell2 from pc) pc2
where pc1.modell1 != pc2.modell2 and pc1.merevlemez1 = pc2.merevlemez2;

/* G */
-- !! modell < modell2

select modell, modell2
from pc,(select modell as modell2, mem�ria as mem�ria2, sebess�g as sebess�g2 from pc)
where sebess�g = sebess�g2 and mem�ria = mem�ria2 and modell < modell2;

/* H */
-- seg�dt�bla, ezt direktszorozzuk
select * 
from ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join Term�k
where sebess�g >= 2.80;

-- �gy is lehet
select * from
(select *
from ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop))
where sebess�g >= 2.80) natural join Term�k;

-- m. o.
select distinct e1.gy�rt� from 
  (select modell, gy�rt� 
  from ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join Term�k
  where sebess�g >= 2.80) e1,
      (select modell, gy�rt� 
      from ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join Term�k
      where sebess�g >= 2.80) e2
where
   e1.gy�rt� = e2.gy�rt� and e1.modell < e2.modell;   
   
/* i */

-- PC vagy laptop MAX
select distinct gy�rt�
from
  (select distinct modell, sebess�g from pc
  minus
    select distinct p2.modell, p2.sebess�g 
    from pc p1, pc p2 
    where p1.sebess�g > p2.sebess�g) natural join term�k;
    
select distinct gy�rt�
from
  (select distinct modell, sebess�g from laptop
  minus
    select distinct p2.modell, p2.sebess�g 
    from laptop p1, laptop p2 
    where p1.sebess�g > p2.sebess�g) natural join term�k;
    
    
-- most egybe
select distinct gy�rt�
from
 ( select modell, sebess�g, gy�rt�
  from
  ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join term�k
  
  minus
  
    select e2.modell, e2.sebess�g, e2.gy�rt�
    from
        (select modell, sebess�g, gy�rt�
        from
        ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join term�k) e1
        ,
        (select modell, sebess�g, gy�rt�
        from
        ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop)) natural join term�k) e2
        
    where e1.sebess�g > e2.sebess�g);
    
    
-- m�sik megold�s (natural join csak k�v�l van!)

select distinct gy�rt�
from
  ( select *
  from
  ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop))
  
  minus
  
    select e2.modell, e2.sebess�g
    from
        (select *
        from
        ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop))) e1
        ,
        (select *
        from
        ((select modell, sebess�g from pc) union (select modell, sebess�g from laptop))) e2
        
    where e1.sebess�g > e2.sebess�g)
    
    natural join Term�k;
    
    
/* j */
select distinct e1.gy�rt� from

  (select modell, sebess�g, gy�rt�
  from pc natural join term�k) e1,
  (select modell, sebess�g, gy�rt�
  from pc natural join term�k) e2,
  (select modell, sebess�g, gy�rt�
  from pc natural join term�k) e3
      
where
 e1.gy�rt� = e2.gy�rt� and e2.gy�rt� = e3.gy�rt� and
 e1.sebess�g != e2. sebess�g and e2.sebess�g != e3.sebess�g and e1.sebess�g != e3.sebess�g and
 e1.modell != e2.modell and e2.modell != e3.modell and e1.modell != e3.modell;
 
/* k */
select distinct e1.gy�rt� from

  (select modell, gy�rt�
  from pc natural join term�k) e1,
  (select modell, gy�rt�
  from pc natural join term�k) e2,
  (select modell, gy�rt�
  from pc natural join term�k) e3
      
where
 e1.gy�rt� = e2.gy�rt� and e2.gy�rt� = e3.gy�rt� and
 e1.modell != e2.modell and e2.modell != e3.modell and e1.modell != e3.modell;