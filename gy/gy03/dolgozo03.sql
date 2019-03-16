SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD;

/*
SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D2.FONOKE = D1.DKOD; -- bal oldal f�n�k�k, jobb oldal beosztottak
-- where-ben atomi felt�tel, rel�ci�s algebr�ban:
-- DOLGOZO(DKOD, DNEV, ...)
-- r�_D1(DOLGOZO); r�_D2(DOLGOZO)
-- produktum_ (szigma_D1.DKOD = D2.FONOKE(D1 x D2))

SELECT D1.*, D2.*
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD; -- 14 a 15 helyett mert null mindig false lesz

SELECT D1.DNEV
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD AND D2.NEV = 'KING'; -- nem j�

SELECT *
FROM DOLGOZO D1, DOLGOZO D2
WHERE D1.FONOKE = D2.DKOD; -- bal oldali dolgoz� mellett a k�zvetlen f�n�ke szerepel, d1 beosztott d2 f�n�k

-- saj�t fos
SELECT DNEV
FROM DOLGOZO
WHERE DNEV = KING; -- FONOKE = 7839;*/