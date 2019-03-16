/*
SELECT GYUMOLCS
FROM SZERET
WHERE NEV != 'Micimackó'; -- csak gyümiket listáz...

SELECT *
FROM SZERET
WHERE NEV != 'Micimackó'; -- Micimackósakon kívüli sorokat listázza
*/

SELECT distinct GYUMOLCS
FROM SZERET
MINUS
SELECT distinct GYUMOLCS
FROM SZERET
WHERE NEV = 'Micimackó';