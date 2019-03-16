/*
SELECT GYUMOLCS
FROM SZERET
WHERE NEV != 'Micimack�'; -- csak gy�miket list�z...

SELECT *
FROM SZERET
WHERE NEV != 'Micimack�'; -- Micimack�sakon k�v�li sorokat list�zza
*/

SELECT distinct GYUMOLCS
FROM SZERET
MINUS
SELECT distinct GYUMOLCS
FROM SZERET
WHERE NEV = 'Micimack�';