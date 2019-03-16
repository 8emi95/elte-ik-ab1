SELECT *
FROM DOLGOZO
WHERE FONOKE IN (SELECT DKOD FROM DOLGOZO WHERE DNEV LIKE '%A%');  -- procedurálisan elraknám ezt egy változóba, subselect