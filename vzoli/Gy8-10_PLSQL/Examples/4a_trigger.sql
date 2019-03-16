CREATE OR REPLACE TRIGGER NeNy�ljHozz�
BEFORE DELETE OR INSERT OR UPDATE ON emp
BEGIN
  IF TO_CHAR(sysdate, 'HH24:MI') NOT BETWEEN '08:00' AND '16:30'
  THEN
    IF DELETING THEN
      RAISE_APPLICATION_ERROR(-20211,
        'Csak munkaid�ben szabad adatot t�r�lni!');
    ELSIF INSERTING THEN
      RAISE_APPLICATION_ERROR(-20212,
        'Csak munkaid�ben szabad adatot bevinni!');
    ELSE
      RAISE_APPLICATION_ERROR(-20213,
        'Csak munkaid�ben szabad adatot m�dos�tani!');
    END IF;
  END IF;
END;
/
SHOW ERRORS

-- Ellen�rz�s 
-- DELETE FROM emp WHERE UPPER(ename) = UPPER('Smith');