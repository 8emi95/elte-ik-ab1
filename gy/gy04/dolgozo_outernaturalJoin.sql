-- outer join

SELECT ONEV, ROUND(AVG(FIZETES + NVL(JUTALEK, 0)))
FROM DOLGOZO D, OSZTALY O
WHERE D.OAZON = O.OAZON (+) -- (+) nélkül nem marad meg mindne sor (null értékes sorok)
GROUP BY ONEV;