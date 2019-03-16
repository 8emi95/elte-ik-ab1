SET serveroutput ON
SET verify OFF

ACCEPT Asz�m PROMPT "K�rem az egyik sz�mot: "
ACCEPT Bsz�m PROMPT "K�rem a m�sik sz�mot:  "

VARIABLE n�gyzet�sszeg  NUMBER

DECLARE
  v_Asz�m  NUMBER;
  v_Bsz�m  NUMBER;
  seg�d    NUMBER;
  szumma   NUMBER;
BEGIN
  v_Asz�m := &Asz�m;
  v_Bsz�m := &Bsz�m;
  szumma  := 0;
  IF v_Asz�m > v_Bsz�m
  THEN
    seg�d   := v_Asz�m;
    v_Asz�m := v_Bsz�m;
    v_Bsz�m := seg�d;
  END IF;

  FOR ciklusv�ltoz� IN v_Asz�m .. v_Bsz�m
  LOOP
    IF MOD(ciklusv�ltoz�, 2) != 0
    THEN
      seg�d := POWER(ciklusv�ltoz�,2);
      DBMS_OUTPUT.PUT_LINE('A(z) '|| ciklusv�ltoz� ||
                           ' n�gyzete: '|| seg�d);
      szumma := szumma + seg�d;
    END IF;

    :n�gyzet�sszeg := szumma;
  END LOOP;
END;
/

PROMPT A megadott tartom�ny p�ratlan sz�mainak n�gyzet�sszege:
PRINT n�gyzet�sszeg
