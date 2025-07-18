DISPLAY "Relatório de Clientes"
 WITH FRAME f-abc CENTERED.

DEFINE FRAME f-dados
 customer.CustNum LABEL "Codigo" AT 5
 customer.Name AT 5 LABEL "Nome" 
 customer.Address AT 5 LABEL "Endereco"  SKIP(1)
 WITH SIDE-LABELS OVERLAY DOWN
 KEEP-TAB-ORDER NO-VALIDATE.
 
FOR EACH customer:
 DISPLAY customer.CustNum customer.NAME customer.Address
 WITH FRAME f-dados.
END.
