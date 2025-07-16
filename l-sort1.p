CURRENT-WINDOW:WIDTH = 200.

FOR EACH customer NO-LOCK WHERE BY customer.country BY customer.NAME :
        DISPLAY customer.custnum                        
                       customer.NAME
                       customer.country 
                       customer.creditLimit WITH WIDTH 180.
END.
