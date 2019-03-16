-- pt 1.7 f�n�k neve ugynolyan hossz� mint a beosztott neve

SELECT D1.DNEV "F?n�k azonos�t�ja", D2.DNEV "Dolgoz� neve"
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.DKOD = D2.FONOKE AND D2.JUTALEK IS NOT NULL
AND LENGTH(D1.DNEV) = LENGTH(D2.DNEV)
ORDER BY 1,2;