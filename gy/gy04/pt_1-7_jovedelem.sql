-- pt 1.7 j�vedelme kisebb mint a f�n�k j�vedelme (fizu + jut)

SELECT D1.DNEV "F?n�k azonos�t�ja", D2.DNEV "Dolgoz� neve"
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.DKOD = D2.FONOKE
AND D2.FIZETES + D2.JUTALEK < D1.FIZETES + NVL(D1.JUTALEK, 0)
AND D2.JUTALEK IS NOT NULL -- mehetne nvl-be �s akk itt nem kell
ORDER BY 1,2;