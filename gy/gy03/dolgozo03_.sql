SELECT *
FROM DOLGOZO
WHERE FONOKE = (SELECT DKOD FROM DOLGOZO WHERE DNEV = 'KING');  -- procedur�lisan elrakn�m ezt egy v�ltoz�ba, subselect