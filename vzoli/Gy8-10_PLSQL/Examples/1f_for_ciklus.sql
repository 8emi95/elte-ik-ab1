SET serveroutput ON
SET verify OFF

ACCEPT Aszám PROMPT "Kérem az egyik számot: "
ACCEPT Bszám PROMPT "Kérem a másik számot:  "

VARIABLE négyzetösszeg  NUMBER

DECLARE
  v_Aszám  NUMBER;
  v_Bszám  NUMBER;
  segéd    NUMBER;
  szumma   NUMBER;
BEGIN
  v_Aszám := &Aszám;
  v_Bszám := &Bszám;
  szumma  := 0;
  IF v_Aszám > v_Bszám
  THEN
    segéd   := v_Aszám;
    v_Aszám := v_Bszám;
    v_Bszám := segéd;
  END IF;

  FOR ciklusváltozó IN v_Aszám .. v_Bszám
  LOOP
    IF MOD(ciklusváltozó, 2) != 0
    THEN
      segéd := POWER(ciklusváltozó,2);
      DBMS_OUTPUT.PUT_LINE('A(z) '|| ciklusváltozó ||
                           ' négyzete: '|| segéd);
      szumma := szumma + segéd;
    END IF;

    :négyzetösszeg := szumma;
  END LOOP;
END;
/

PROMPT A megadott tartomány páratlan számainak négyzetösszege:
PRINT négyzetösszeg
