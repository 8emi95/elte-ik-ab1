/*
SELECT DNEV AS "Dolgozó Név", JUTALEK
FROM DOLGOZO
WHERE JUTALEK > 1000; -- 1k feletti jutalék

SELECT DNEV AS "Dolgozó Név", JUTALEK
FROM DOLGOZO
WHERE JUTALEK <= 1000 OR JUTALEK IS NULL; -- 1000 alatti jutalék (is null nélkül nem jó)

SELECT DNEV AS "Dolgozó Név", 'Nincs jutaléka'
FROM DOLGOZO
WHERE JUTALEK IS NULL; -- (null) helyett "nincs jutaléka" minden sorban (fix konstans '...' meghívódik)
*/

SELECT DNEV AS "Dolgozó Név", NVL(JUTALEK, '-1') -- null helyett -1
FROM DOLGOZO;
-- NVL(JUTALEK, 'nincs') nem jó, típusegyezési hiba
-- '0'-t tudja konvertálni
-- '-1' is jó