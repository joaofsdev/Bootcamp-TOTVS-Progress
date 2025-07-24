DEF FRAME f-x   
   customer.custnum
   customer.name
   WITH DOWN FRAME f-x.

FOR EACH customer:
    DISPLAY customer.custnum
      customer.name
      WITH FRAME f-x.
      DOWN WITH FRAME f-x.
    PROCESS EVENTS. 
    RUN pi-mostra-pedidos.
END.

PROCEDURE pi-mostra-pedidos:
   FOR EACH order OF customer:
   DISPLAY order.ordernum WITH DOWN FRAME f-y.
END.
END PROCEDURE.

