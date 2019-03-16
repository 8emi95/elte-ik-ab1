SELECT distinct NEV
FROM SZERET
WHERE GYUMOLCS = 'alma'
UNION
SELECT distinct NEV
FROM SZERET
WHERE GYUMOLCS = 'körte'; -- OR helyettesíthető UNION-nal
-- más a sorrend (mindenképpen halmazzá...)