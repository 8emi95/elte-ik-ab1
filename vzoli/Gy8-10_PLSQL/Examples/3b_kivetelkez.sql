SET serveroutput ON
DROP TABLE dolgozó;
CREATE TABLE dolgozó
AS  SELECT * FROM emp;

-- JutalmazóProgram 
ACCEPT neve  PROMPT 'Adja meg a jutalmazandó dolgozó nevét: '

-- A fõprogram deklarációs szegmense
DECLARE
  v_neve        dolgozó.ename%TYPE;
  v_jutalma     dolgozó.sal%TYPE;
  NincsJutalom  EXCEPTION;

-- Az alprogram deklaráció
PROCEDURE Jutalmazás (p_neve     IN   dolgozó.ename%TYPE,
                      p_jutalma  OUT  dolgozó.sal%TYPE)
IS
-- Lokális deklaráció
  p_fizetése  dolgozó.sal%TYPE;
BEGIN
  SELECT sal
    INTO p_fizetése
    FROM dolgozó
    WHERE UPPER(ename) = UPPER(p_neve);
  IF p_fizetése >= 3000
  THEN
    RAISE NincsJutalom;
  ELSE
    p_jutalma := 0.1 * p_fizetése;
    DBMS_OUTPUT.PUT_LINE('>>');
    DBMS_OUTPUT.PUT_LINE('>> ' || p_neve ||' jutalma: '|| 
                                  p_jutalma ||' USD');
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('>>');
      DBMS_OUTPUT.PUT_LINE('>> NINCS ilyen nevû dolgozó...');
  WHEN NincsJutalom
    THEN
      DBMS_OUTPUT.PUT_LINE('>>');
      DBMS_OUTPUT.PUT_LINE('>> Boldog Karácsonyt Kedves ' || 
                           p_neve || '!');
END Jutalmazás;
-- Az alprogram deklarációjának vége

-- Fõprogram blokkja
BEGIN
  v_neve := '&neve';
  Jutalmazás(v_neve, v_jutalma);
  UPDATE dolgozó
    SET comm = NVL(comm,0) + v_jutalma
    WHERE UPPER(ename) = UPPER(v_neve);
END; -- JutalmazóProgram
/

-- PROMPT Listázás:
SELECT ename        AS "Név",
       job          AS "Munkakör",
       sal          AS "Fizetés",
       NVL(comm,0)  AS "Jutalék+Jutalom"
  FROM dolgozó
  WHERE UPPER(ename) = UPPER('&neve');
