SELECT *
FROM DOLGOZO
WHERE FONOKE = (SELECT DKOD FROM DOLGOZO WHERE DNEV = 'KING');  -- procedurálisan elraknám ezt egy változóba, subselect