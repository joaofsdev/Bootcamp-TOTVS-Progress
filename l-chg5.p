CURRENT-WINDOW:WIDTH = 200.

        PROMPT-FOR customer.CustNum.
        FIND FIRST customer WHERE customer.custnum = INPUT customer.CustNum NO-ERROR.
        IF AVAIL customer THEN DO:
            DISPLAY customer WITH 1 COL WIDTH 180.
            UPDATE customer.
        END.
