SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD;

/*
SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D2.FONOKE = D1.DKOD; -- bal oldal fõnökök, jobb oldal beosztottak
-- where-ben atomi feltétel, relációs algebrában:
-- DOLGOZO(DKOD, DNEV, ...)
-- ró_D1(DOLGOZO); ró_D2(DOLGOZO)
-- produktum_ (szigma_D1.DKOD = D2.FONOKE(D1 x D2))

SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD; -- 14 a 15 helyett mert null mindig false lesz

SELECT D1.DNEV
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD AND D2.NEV = 'KING'; -- nem jó

SELECT *
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD; -- bal oldali dolgozó mellett a közvetlen fõnöke szerepel, d1 beosztott d2 fõnök

-- saját fos
SELECT DNEV
FROM DOLGOZO
WHERE DNEV = KING; -- FONOKE = 7839;*/