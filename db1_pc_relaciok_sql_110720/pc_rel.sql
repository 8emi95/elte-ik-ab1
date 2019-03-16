/*
	Adatbázisok 1, PC relációk megoldásai SQL-ben
	Eredeti megoldások: IVGRAAI.ELTE - Iván Gergõ
	SQL-es -||- : GUJQAAI.ELTE - Gubicza József
*/

/* PC relációk */

/* A */
select modell
from PC
where sebesség >= 3.0;

/* B */
-- m.o. 1
select distinct Gyártó
from (select * from termék
	  right join 
		(select modell from Laptop where merevlemez >= 100) p
	   on
			termék.modell = p.modell);
      
-- m.o. 2
select gyártó
from termék natural join laptop
where merevlemez >= 100;

/* C */
-- m. o. 1
select modell, ár
from ((select modell
	  from Termék
	  where Gyártó like 'B') natural join PC)
union 
select modell, ár
from ((select modell
	  from Termék
	  where Gyártó like 'B') natural join Laptop)
union
select modell, ár
from ((select modell
	  from Termék
	  where Gyártó like 'B') natural join Nyomtató);

-- m. o. 2
select modell, ár
from (termék natural join (select modell, ár from pc union select modell, ár from nyomtató union select modell, ár from laptop))
where gyártó like 'B';

/* D */
select modell
from Nyomtató
where színes like 'igen' and típus like 'lézer';

/* E */

select gyártó from termék where típus like 'laptop'
minus
select gyártó from termék where típus like 'pc';

/* F */
select distinct merevlemez1 as merevl
from (select merevlemez as merevlemez1, modell as modell1 from pc) pc1,(select merevlemez as merevlemez2, modell as modell2 from pc) pc2
where pc1.modell1 != pc2.modell2 and pc1.merevlemez1 = pc2.merevlemez2;

/* G */
-- !! modell < modell2

select modell, modell2
from pc,(select modell as modell2, memória as memória2, sebesség as sebesség2 from pc)
where sebesség = sebesség2 and memória = memória2 and modell < modell2;

/* H */
-- segédtábla, ezt direktszorozzuk
select * 
from ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join Termék
where sebesség >= 2.80;

-- így is lehet
select * from
(select *
from ((select modell, sebesség from pc) union (select modell, sebesség from laptop))
where sebesség >= 2.80) natural join Termék;

-- m. o.
select distinct e1.gyártó from 
  (select modell, gyártó 
  from ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join Termék
  where sebesség >= 2.80) e1,
      (select modell, gyártó 
      from ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join Termék
      where sebesség >= 2.80) e2
where
   e1.gyártó = e2.gyártó and e1.modell < e2.modell;   
   
/* i */

-- PC vagy laptop MAX
select distinct gyártó
from
  (select distinct modell, sebesség from pc
  minus
    select distinct p2.modell, p2.sebesség 
    from pc p1, pc p2 
    where p1.sebesség > p2.sebesség) natural join termék;
    
select distinct gyártó
from
  (select distinct modell, sebesség from laptop
  minus
    select distinct p2.modell, p2.sebesség 
    from laptop p1, laptop p2 
    where p1.sebesség > p2.sebesség) natural join termék;
    
    
-- most egybe
select distinct gyártó
from
 ( select modell, sebesség, gyártó
  from
  ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join termék
  
  minus
  
    select e2.modell, e2.sebesség, e2.gyártó
    from
        (select modell, sebesség, gyártó
        from
        ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join termék) e1
        ,
        (select modell, sebesség, gyártó
        from
        ((select modell, sebesség from pc) union (select modell, sebesség from laptop)) natural join termék) e2
        
    where e1.sebesség > e2.sebesség);
    
    
-- másik megoldás (natural join csak kívül van!)

select distinct gyártó
from
  ( select *
  from
  ((select modell, sebesség from pc) union (select modell, sebesség from laptop))
  
  minus
  
    select e2.modell, e2.sebesség
    from
        (select *
        from
        ((select modell, sebesség from pc) union (select modell, sebesség from laptop))) e1
        ,
        (select *
        from
        ((select modell, sebesség from pc) union (select modell, sebesség from laptop))) e2
        
    where e1.sebesség > e2.sebesség)
    
    natural join Termék;
    
    
/* j */
select distinct e1.gyártó from

  (select modell, sebesség, gyártó
  from pc natural join termék) e1,
  (select modell, sebesség, gyártó
  from pc natural join termék) e2,
  (select modell, sebesség, gyártó
  from pc natural join termék) e3
      
where
 e1.gyártó = e2.gyártó and e2.gyártó = e3.gyártó and
 e1.sebesség != e2. sebesség and e2.sebesség != e3.sebesség and e1.sebesség != e3.sebesség and
 e1.modell != e2.modell and e2.modell != e3.modell and e1.modell != e3.modell;
 
/* k */
select distinct e1.gyártó from

  (select modell, gyártó
  from pc natural join termék) e1,
  (select modell, gyártó
  from pc natural join termék) e2,
  (select modell, gyártó
  from pc natural join termék) e3
      
where
 e1.gyártó = e2.gyártó and e2.gyártó = e3.gyártó and
 e1.modell != e2.modell and e2.modell != e3.modell and e1.modell != e3.modell;