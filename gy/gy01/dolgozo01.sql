/*
select *
from v5version;

select <select_lista> -- projekci�
from t1, t2 -- direkt sorozat
where <where_lista> -- szelekci�

SELECT *
FROM DOLGOZO D, OSZTALY O
WHERE D.OAZON = O.OAZON;
*/

SELECT *
FROM DOLGOZO NATURAL JOIN OSZTALY; -- ugyanaz, OAZON egyszer