/* -- konstrukciós halmaz (minden név minden gyümölcs????)
SELECT distinct NEV
FROM SZERET; -- 5 nevet kilistázza

SELECT distinct GYUMOLCS
FROM SZERET; -- 4 gyümit kilistázza

SELECT distinct s1.NEV, s2.GYUMOLCS
FROM SZERET s1, SZERET s2 -- 20 sor (össze-vissza...)
MINUS
SELECT *
FROM SZERET; -- teljes táblát kivonom a 20 sorból, azok maradnak meg akik nem mindennel szerepelnek

SELECT distinct NEV
FROM
(SELECT distinct s1.NEV, s2.GYUMOLCS
FROM SZERET s1, SZERET s2
MINUS
SELECT *
FROM SZERET); -- akik nem minden gyümit szeretnek
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
FROM SZERET); -- Malacka (jó válasz)