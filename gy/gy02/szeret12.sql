/* -- konstrukci�s halmaz (minden n�v minden gy�m�lcs????)
SELECT distinct NEV
FROM SZERET; -- 5 nevet kilist�zza

SELECT distinct GYUMOLCS
FROM SZERET; -- 4 gy�mit kilist�zza

SELECT distinct s1.NEV, s2.GYUMOLCS
FROM SZERET s1, SZERET s2 -- 20 sor (�ssze-vissza...)
MINUS
SELECT *
FROM SZERET; -- teljes t�bl�t kivonom a 20 sorb�l, azok maradnak meg akik nem mindennel szerepelnek

SELECT distinct NEV
FROM
(SELECT distinct s1.NEV, s2.GYUMOLCS
FROM SZERET s1, SZERET s2
MINUS
SELECT *
FROM SZERET); -- akik nem minden gy�mit szeretnek
*/

SELECT distinct NEV
FROM SZERET
MINUS
SELECT distinct NEV
FROM
(SELECT distinct s1.NEV, s2.GYUMOLCS
FROM SZERET s1, SZERET s2 -- 20 sor
MINUS
SELECT *
FROM SZERET); -- Malacka (j� v�lasz)