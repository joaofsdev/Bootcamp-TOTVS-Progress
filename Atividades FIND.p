/* Atividades Find *

FIND FIRST customer 
 WHERE customer.CreditLimit > 15000 
 NO-LOCK NO-ERROR.
 IF AVAILABLE customer THEN
 DISPLAY customer EXCEPT customer.comments WITH 1 COLUMN.
 
 PAUSE.
 
 FIND NEXT customer 
 WHERE customer.CreditLimit > 15000 
 NO-LOCK NO-ERROR.
 IF AVAILABLE customer THEN
 DISPLAY customer EXCEPT customer.comments WITH 1 COLUMN.

 */
/* For Each dentro de For Each */

CURRENT-WINDOW:WIDTH = 200.

FOR EACH order NO-LOCK:
        DISPLAY order WITH WIDTH 190.
        FOR EACH orderline NO-LOCK
                WHERE orderline.ordernum = order.ordernum:
                DISP orderline WITH WIDTH 190.
        END.
END.
