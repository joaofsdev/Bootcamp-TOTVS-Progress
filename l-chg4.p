CURRENT-WINDOW:WIDTH = 200.

DEF VAR i-CustNum AS INTEGER NO-UNDO.
REPEAT:
        PROMPT-FOR i-CustNum.
        FIND FIRST customer WHERE customer.custnum = INPUT i-CustNum EXCLUSIVE-LOCK NO-ERROR.
        IF AVAIL customer THEN DO:
            DISPLAY customer WITH 1 COL WIDTH 180.
            PROMPT-FOR customer.
            ASSIGN customer.
            MESSAGE "Alterado com Sucesso"
            VIEW-AS ALERT-BOX.
        END.
END.
