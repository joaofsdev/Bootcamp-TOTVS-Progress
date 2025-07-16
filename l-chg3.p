CURRENT-WINDOW:WIDTH = 200.

DEF VAR i-CustNum AS INTEGER NO-UNDO.
REPEAT:
        SET i-CustNum.
        FIND FIRST customer WHERE customer.custnum = i-CustNum EXCLUSIVE-LOCK NO-ERROR.
        IF AVAIL customer THEN DO:
            DISPLAY customer WITH 1 COL WIDTH 180.
            SET customer.
            MESSAGE "Alterado com Sucesso"
            VIEW-AS ALERT-BOX.
        END.
END.
