-- pt 1.7 �rassa ki minden jutal�kkal rendelkez� alkalmazott nev�t, jutal�k�t, f�n�k�nek azonos�t�j�t. 
-- Legyen a lista rendezett a f�n�k azonos�t�ja, �s az alkalmazottak neve szerint. 

SELECT DNEV AS "Dolgoz� neve", JUTALEK, FONOKE AS "F�n�k azonos�t�ja"
FROM DOLGOZO
WHERE JUTALEK IS NOT NULL -- not like null NEM J�
ORDER BY 1;
