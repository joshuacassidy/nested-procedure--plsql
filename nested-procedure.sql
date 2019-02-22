SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE calc(fudge_factor IN NUMBER) 
IS 
    sub_total NUMBER := 0;
    
    PROCEDURE complete_running_total(increment_in IN PLS_INTEGER)
    IS
    BEGIN 
        sub_total := sub_total + increment_in * fudge_factor;
    END;
    BEGIN
        FOR i in 1..12
        LOOP
            complete_running_total(i);
        END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total ' || sub_total);
END;

/

EXECUTE calc(1);
EXECUTE calc(3);