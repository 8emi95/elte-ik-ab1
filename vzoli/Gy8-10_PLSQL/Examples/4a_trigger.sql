CREATE OR REPLACE TRIGGER NeNyúljHozzá
BEFORE DELETE OR INSERT OR UPDATE ON emp
BEGIN
  IF TO_CHAR(sysdate, 'HH24:MI') NOT BETWEEN '08:00' AND '16:30'
  THEN
    IF DELETING THEN
      RAISE_APPLICATION_ERROR(-20211,
        'Csak munkaidõben szabad adatot törölni!');
    ELSIF INSERTING THEN
      RAISE_APPLICATION_ERROR(-20212,
        'Csak munkaidõben szabad adatot bevinni!');
    ELSE
      RAISE_APPLICATION_ERROR(-20213,
        'Csak munkaidõben szabad adatot módosítani!');
    END IF;
  END IF;
END;
/
SHOW ERRORS

-- Ellenõrzés 
-- DELETE FROM emp WHERE UPPER(ename) = UPPER('Smith');