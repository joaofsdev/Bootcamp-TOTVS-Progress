CURRENT-WINDOW:WIDTH = 200.

FOR EACH customer NO-LOCK WHERE customer.Country BEGINS "F":
        DISPLAY customer.custnum
                       customer.NAME
                       customer.country WITH WIDTH 180.
END.
