SELECT NEV
FROM SZERET
MINUS
SELECT distinct s1.NEV
FROM SZERET s1, SZERET s2
WHERE s1.NEV = s2.NEV AND s1.GYUMOLCS != s2.GYUMOLCS;
-- pontosan egyet szeret�k (�sszes - legal�bb kett�t)