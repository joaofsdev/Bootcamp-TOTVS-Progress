DISPLAY "Relatório de Clientes"
            WITH FRAME f-abc CENTERED.
 
DEFINE FRAME f-dados
    customer.CustNum LABEL "Código"    AT ROW 1 COL 10 
    customer.Name    NO-LABEL          AT ROW 1 COL 25  
    customer.Address LABEL "Endereço"  AT ROW 2 COL 10
    WITH SIDE-LABELS OVERLAY 1 DOWN THREE-D
    KEEP-TAB-ORDER NO-VALIDATE.
DEF FRAME f-order
    order.ordernum
    order.orderdate FORMAT "99/99/9999" LABEL "Data"
    WITH OVERLAY DOWN THREE-D.
FOR EACH customer WITH FRAME f-dados:
     DISPLAY customer.custnum
             customer.NAME
             customer.address.
      FOR EACH order OF customer NO-LOCK:
        DISP order.ordernum
                 order.orderdate
                 WITH FRAME f-order.
      END.
END.
