SELECT NEV
FROM SZERET
WHERE GYUMOLCS = 'alma'
UNION ALL
SELECT NEV
FROM SZERET
WHERE GYUMOLCS = 'körte'; -- nevek többször, ALL nélkül névsorban egyszer