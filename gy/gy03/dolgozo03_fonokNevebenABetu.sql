SELECT *
FROM DOLGOZO
WHERE FONOKE IN (SELECT DKOD FROM DOLGOZO WHERE DNEV LIKE '%A%');  -- procedur�lisan elrakn�m ezt egy v�ltoz�ba, subselect