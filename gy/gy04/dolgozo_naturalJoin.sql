-- natural join (nem direktszorzat)

SELECT *
FROM DOLGOZO NATURAL JOIN OSZTALY; -- közös attribútumok csak 1x

/*
SELECT *
FROM DOLGOZO D, OSZTALY O
WHERE D.OAZON = O.OAZON; -- közös attribútumok csak 2x
*/