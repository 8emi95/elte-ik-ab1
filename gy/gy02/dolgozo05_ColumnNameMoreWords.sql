/*
-- �sszes adat
SELECT *
FROM DOLGOZO
WHERE OAZON = 10 OR OAZON = 20; -- 10-es �s 20-as oszt�lyon dolgoz�k

SELECT *
FROM DOLGOZO
WHERE OAZON = 10
UNION
SELECT *
FROM DOLGOZO
WHERE OAZON = 20; -- OR helyett UNION

-- csak a nevek
SELECT DNEV
FROM DOLGOZO
WHERE OAZON = 10
UNION
SELECT DNEV
FROM DOLGOZO
WHERE OAZON = 20;

-- nevek oszlop felirata "DOLGOZ�N�V"
SELECT DNEV AS DOLGOZ�N�V
FROM DOLGOZO
WHERE OAZON = 10
UNION
SELECT DNEV
FROM DOLGOZO
WHERE OAZON = 20;

-- oszlopfelirat t�bb sz�ban
SELECT DNEV AS Dolgoz� Neve -- Dolgoz� N�v LOL melyik n�v dolgozik?
FROM DOLGOZO
WHERE OAZON = 10
UNION
SELECT DNEV
FROM DOLGOZO
WHERE OAZON = 20; -- hiba
*/

SELECT DNEV AS "Dolgoz� Neve"
FROM DOLGOZO
WHERE OAZON = 10
UNION
SELECT DNEV
FROM DOLGOZO
WHERE OAZON = 20;