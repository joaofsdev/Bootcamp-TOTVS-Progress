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


