CURRENT-WINDOW:WIDTH = 200.

DEF VAR i-CustNum AS INTEGER NO-UNDO.
        PROMPT-FOR i-CustNum.
        FIND FIRST customer WHERE customer.custnum = INPUT i-CustNum NO-LOCK NO-ERROR.
        IF AVAIL customer THEN DO:
            DISPLAY customer WITH 1 COL WIDTH 180.
        END.
