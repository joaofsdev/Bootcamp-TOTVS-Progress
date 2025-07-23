CURRENT-WINDOW:WIDTH = 300.
 
DEF QUERY q-cust FOR customer, order SCROLLING.
DEF BROWSE b-cust QUERY q-cust DISPLAY
     customer.CustNum   customer.Name
     customer.City      customer.Country
     order.orderNum     order.orderdate 
     WITH SEPARATORS 20 DOWN.
DEF FRAME f-dados 
          b-cust
          WITH NO-LABELS.
 
OPEN QUERY q-cust 
        FOR EACH customer, EACH order OF customer.
UPDATE b-cust WITH FRAME f-dados WIDTH 301.
