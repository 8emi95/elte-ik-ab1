CREATE OR REPLACE TRIGGER KivéveAzElnök
BEFORE DELETE OR INSERT OR UPDATE ON emp
FOR EACH ROW
WHEN (UPPER(OLD.job) = 'PRESIDENT'  OR
      UPPER(NEW.job) = 'PRESIDENT')
BEGIN
  IF DELETING THEN
    RAISE_APPLICATION_ERROR(-20001,'>> Az elnököt nem lehet törölni...');
  ELSIF INSERTING THEN
    RAISE_APPLICATION_ERROR(-20002,'>> Elnököt nem lehet beszúrni...');
  ELSIF UPDATING THEN
    RAISE_APPLICATION_ERROR(-20003,'>> Elnök adatok nem módosíthatók...');
  END IF;
END;
/
SHOW ERRORS


-- Ellenõrzés 

-- A tesztelõ szkript program eleje
SET serveroutput ON
PROMPT Hivatkozási megszorítás felfüggesztése:
ALTER TABLE emp
  DISABLE CONSTRAINT EMP_SELF_KEY;

UPDATE emp
  SET sal = sal - 555
  WHERE deptno = 10;

INSERT INTO emp
  VALUES (1234,'KISS','president',NULL,sysdate,6000,NULL,10);

DELETE FROM emp
  WHERE deptno = 10;

PROMPT Hivatkozási megszorítás engedélyezése:
ALTER TABLE emp
  ENABLE CONSTRAINT EMP_SELF_KEY;
SET numwidth 5
SELECT * FROM emp;
SET numwidth 10
-- A tesztelõ szkript program vége
