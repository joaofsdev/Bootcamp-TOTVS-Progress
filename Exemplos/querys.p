 CURRENT-WINDOW:WIDTH = 200.
 DEFINE QUERY qr-cust 
 FOR customer SCROLLING.
 OPEN QUERY qr-cust FOR EACH customer.
 GET FIRST qr-cust.
 REPEAT:
 DISP customer WITH WIDTH 199 1 COL .
 GET NEXT qr-cust.
 END.
