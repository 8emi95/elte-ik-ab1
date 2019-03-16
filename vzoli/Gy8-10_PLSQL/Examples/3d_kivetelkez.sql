SET serveroutput ON
DROP TABLE dolgoz�;
CREATE TABLE dolgoz�
AS  SELECT * FROM emp;

-- Jutalmaz�Program 
ACCEPT neve  PROMPT 'Adja meg a jutalmazand� dolgoz� nev�t: '

-- A f�program deklar�ci�s szegmense
DECLARE
  v_neve        dolgoz�.ename%TYPE;
  v_jutalma     dolgoz�.sal%TYPE;
  NincsJutalom  EXCEPTION;

-- Az alprogram deklar�ci�
PROCEDURE Jutalmaz�s (p_neve     IN   dolgoz�.ename%TYPE,
                      p_jutalma  OUT  dolgoz�.sal%TYPE)
IS
-- Lok�lis deklar�ci�
  p_fizet�se  dolgoz�.sal%TYPE;
BEGIN
  SELECT sal
    INTO p_fizet�se
    FROM dolgoz�
    WHERE UPPER(ename) = UPPER(p_neve);
  IF p_fizet�se >= 3000
  THEN
    RAISE NincsJutalom;
  ELSE
    p_jutalma := 0.1 * p_fizet�se;
    DBMS_OUTPUT.PUT_LINE('>>');
    DBMS_OUTPUT.PUT_LINE('>> ' || p_neve ||' jutalma: '|| 
                                  p_jutalma ||' USD');
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('>>');
      DBMS_OUTPUT.PUT_LINE('>> NINCS ilyen nev� dolgoz�...');
  WHEN NincsJutalom
    THEN
      DBMS_OUTPUT.PUT_LINE('>>');
      DBMS_OUTPUT.PUT_LINE('>> Boldog Kar�csonyt Kedves ' || 
                           p_neve || '!');
END Jutalmaz�s;
-- Az alprogram deklar�ci�j�nak v�ge

-- F�program blokkja
BEGIN
  v_neve := '&neve';
  Jutalmaz�s(v_neve, v_jutalma);
  UPDATE dolgoz�
    SET comm = NVL(comm,0) + v_jutalma
    WHERE UPPER(ename) = UPPER(v_neve);
END; -- Jutalmaz�Program
/

-- PROMPT List�z�s:
SELECT ename        AS "N�v",
       job          AS "Munkak�r",
       sal          AS "Fizet�s",
       NVL(comm,0)  AS "Jutal�k+Jutalom"
  FROM dolgoz�
  WHERE UPPER(ename) = UPPER('&neve');
