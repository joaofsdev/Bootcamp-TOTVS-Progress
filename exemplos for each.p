CURRENT-WINDOW:WIDTH = 200.
/*
FOR EACH customer NO-LOCK
  WHERE customer.NAME BEGINS "c" AND customer.custnum > 2000:
  DISPLAY customer.custnum
                 customer.NAME WITH FONT 2 WIDTH 180.
END. 
*/

/*
FOR EACH customer NO-LOCK
        WHERE customer.salesrep = "bbb" AND customer.NAME BEGINS "c":
        DISPLAY customer.custnum
                       customer.salesrep
                       customer.NAME 
                       WITH FONT 2 WIDTH 180.
END.
*/

/*
FOR EACH customer EXCLUSIVE-LOCK:
        DISPLAY customer.CustNum customer.creditlimit WITH SIDE-LABELS FONT 2 WIDTH 180.
        IF customer.creditlimit > 15000 THEN DO:
             UPDATE customer.Name 
             customer.Address.
             MESSAGE "Registro Alterado".
        END.
END.
*/

// Desvio de  Execucao
FOR EACH customer NO-LOCK:
         DISPLAY customer.CustNum customer.CreditLimit customer.NAME customer.address WITH WIDTH 120 FONT 1 .
            IF customer.CreditLimit >= 15000 THEN
                NEXT.
            IF customer.CreditLimit = 10000 THEN
                LEAVE.
         FIND CURRENT customer EXCLUSIVE-LOCK NO-ERROR. 
         UPDATE customer.Name 
                        customer.Address.
 END.
 
