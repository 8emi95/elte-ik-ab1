-- pt 1.7 jövedelme kisebb mint a fõnök jövedelme (fizu + jut)

SELECT D1.DNEV "F?nök azonosítója", D2.DNEV "Dolgozó neve"
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.DKOD = D2.FONOKE
AND D2.FIZETES + D2.JUTALEK < D1.FIZETES + NVL(D1.JUTALEK, 0)
AND D2.JUTALEK IS NOT NULL -- mehetne nvl-be és akk itt nem kell
ORDER BY 1,2;