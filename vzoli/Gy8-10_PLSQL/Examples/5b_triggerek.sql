CREATE OR REPLACE TRIGGER Kiv�veAzEln�k
BEFORE DELETE OR INSERT OR UPDATE ON emp
FOR EACH ROW
WHEN (UPPER(OLD.job) = 'PRESIDENT'  OR
      UPPER(NEW.job) = 'PRESIDENT')
BEGIN
  IF DELETING THEN
    RAISE_APPLICATION_ERROR(-20001,'>> Az eln�k�t nem lehet t�r�lni...');
  ELSIF INSERTING THEN
    RAISE_APPLICATION_ERROR(-20002,'>> Eln�k�t nem lehet besz�rni...');
  ELSIF UPDATING THEN
    RAISE_APPLICATION_ERROR(-20003,'>> Eln�k adatok nem m�dos�that�k...');
  END IF;
END;
/
SHOW ERRORS


-- Ellen�rz�s 

-- A tesztel� szkript program eleje
SET serveroutput ON
PROMPT Hivatkoz�si megszor�t�s felf�ggeszt�se:
ALTER TABLE emp
  DISABLE CONSTRAINT EMP_SELF_KEY;

UPDATE emp
  SET sal = sal - 555
  WHERE deptno = 10;

INSERT INTO emp
  VALUES (1234,'KISS','president',NULL,sysdate,6000,NULL,10);

DELETE FROM emp
  WHERE deptno = 10;

PROMPT Hivatkoz�si megszor�t�s enged�lyez�se:
ALTER TABLE emp
  ENABLE CONSTRAINT EMP_SELF_KEY;
SET numwidth 5
SELECT * FROM emp;
SET numwidth 10
-- A tesztel� szkript program v�ge
