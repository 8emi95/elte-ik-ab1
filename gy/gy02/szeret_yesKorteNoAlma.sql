(SELECT NEV
FROM SZERET
WHERE GYUMOLCS = 'alma'
UNION
SELECT NEV
FROM SZERET
WHERE GYUMOLCS = 'k�rte')
MINUS
(SELECT distinct NEV
FROM SZERET
WHERE GYUMOLCS = 'alma'
INTERSECT
SELECT distinct NEV
FROM SZERET
WHERE GYUMOLCS = 'k�rte');