-- outer join

SELECT ONEV, ROUND(AVG(FIZETES + NVL(JUTALEK, 0)))
FROM DOLGOZO D, OSZTALY O
WHERE D.OAZON = O.OAZON (+) -- (+) n�lk�l nem marad meg mindne sor (null �rt�kes sorok)
GROUP BY ONEV;