-- natural join (nem direktszorzat)

SELECT *
FROM DOLGOZO NATURAL JOIN OSZTALY; -- k�z�s attrib�tumok csak 1x

/*
SELECT *
FROM DOLGOZO D, OSZTALY O
WHERE D.OAZON = O.OAZON; -- k�z�s attrib�tumok csak 2x
*/