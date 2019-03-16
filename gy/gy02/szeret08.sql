/*
SELECT *
FROM SZERET, SZERET; -- direktszorzat?? nem �rtelmezi eddig, alias-ozni kell

SELECT *
FROM SZERET s1, SZERET s2; -- minden sort minden sorral

SELECT *
FROM SZERET s1, SZERET s2
WHERE s1.NEV = s2.NEV AND s1.GYUMOLCS != s2.GYUMOLCS; -- sok sor
*/

SELECT distinct s1.NEV -- s2.NEV is j�, mert egyenl�ek
FROM SZERET s1, SZERET s2
WHERE s1.NEV = s2.NEV AND s1.GYUMOLCS != s2.GYUMOLCS;