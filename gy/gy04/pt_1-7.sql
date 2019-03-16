-- pt 1.7 Írassa ki minden jutalékkal rendelkezõ alkalmazott nevét, jutalékát, fõnökének azonosítóját. 
-- Legyen a lista rendezett a fõnök azonosítója, és az alkalmazottak neve szerint. 

SELECT DNEV AS "Dolgozó neve", JUTALEK, FONOKE AS "Fõnök azonosítója"
FROM DOLGOZO
WHERE JUTALEK IS NOT NULL -- not like null NEM JÓ
ORDER BY 1;
