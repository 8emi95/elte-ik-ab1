SELECT D1.DNEV
FROM DOLGOZO D1, DOLGOZO D2, DOLGOZO D3
WHERE D1.FONOKE = D2.DKOD
AND D2.FONOKE = D3.DKOD
AND D3.DNEV = 'KING';