CURRENT-WINDOW:WIDTH = 300.

DEF BUFFER bCustomer FOR customer.
DEF BUFFER bCustomer2 FOR customer.

FIND FIRST customer
         WHERE customer.creditLimit > 15000
         NO-LOCK NO-ERROR.
DISP customer.CustNum
        customer.NAME
        customer.creditLimit SKIP(1)
        WITH SIDE-LABELS 1 COL.

FIND NEXT bCustomer
         WHERE bCustomer.custnum > customer.custnum 
         AND bCustomer.creditLimit > 15000
         NO-LOCK NO-ERROR.
DISP bCustomer.CustNum
        bCustomer.NAME
        bCustomer.creditLimit SKIP(1)
        WITH SIDE-LABELS 1 COL.

FIND LAST bCustomer2
         WHERE bCustomer2.creditLimit > 15000
         NO-LOCK NO-ERROR.
DISP bCustomer2.CustNum
        bCustomer2.NAME
        bCustomer2.creditLimit
        WITH SIDE-LABELS 1 COL.
        
