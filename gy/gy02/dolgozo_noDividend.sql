/*
SELECT DNEV AS "Dolgoz� N�v", JUTALEK
FROM DOLGOZO
WHERE JUTALEK > 1000; -- 1k feletti jutal�k

SELECT DNEV AS "Dolgoz� N�v", JUTALEK
FROM DOLGOZO
WHERE JUTALEK <= 1000 OR JUTALEK IS NULL; -- 1000 alatti jutal�k (is null n�lk�l nem j�)

SELECT DNEV AS "Dolgoz� N�v", 'Nincs jutal�ka'
FROM DOLGOZO
WHERE JUTALEK IS NULL; -- (null) helyett "nincs jutal�ka" minden sorban (fix konstans '...' megh�v�dik)
*/

SELECT DNEV AS "Dolgoz� N�v", NVL(JUTALEK, '-1') -- null helyett -1
FROM DOLGOZO;
-- NVL(JUTALEK, 'nincs') nem j�, t�pusegyez�si hiba
-- '0'-t tudja konvert�lni
-- '-1' is j�