CURRENT-WINDOW:WIDTH = 200.

FOR EACH customer NO-LOCK WHERE customer.Country BEGINS "F" AND customer.postalcode  BEGINS "7":
        DISPLAY customer.custnum
                       customer.NAME
                       customer.country 
                       customer.postalCode WITH WIDTH 180.
END.
