CURRENT-WINDOW:WIDTH = 251.
 
DEF BUTTON bt-pri   LABEL "<<".
DEF BUTTON bt-ant   LABEL "<".
DEF BUTTON bt-prox  LABEL ">".
DEF BUTTON bt-ult   LABEL ">>".
DEF BUTTON bt-add   LABEL "Adicionar".
DEF BUTTON bt-save   LABEL "Salvar".
DEF BUTTON bt-cancel   LABEL "Cancelar".
DEF BUTTON bt-sair  LABEL "Sair" AUTO-ENDKEY.

DEFINE VARIABLE cAction AS CHARACTER   NO-UNDO.
 
DEF QUERY qCust FOR customer, salesrep SCROLLING.

DEF BUFFER bCust FOR customer.
DEF BUFFER bSales FOR salesrep.
 
DEF FRAME f-cust
    bt-pri              AT 10
    bt-ant  
    bt-prox 
    bt-ult SPACE(10)
    bt-add
    bt-save
    bt-cancel
    bt-sair        SKIP(1)
    customer.custnum    COLON 20
    customer.NAME       COLON 20
    customer.salesrep   COLON 20 salesrep.repname NO-LABEL
    customer.address    COLON 20
    WITH SIDE-LABELS THREE-D SIZE 100 BY 20.

    ON 'choose' OF bt-pri DO:
        GET FIRST qCust.
        DISP customer.custnum   
             customer.NAME      
             customer.salesrep
             salesrep.repname
             customer.address 
             WITH FRAME f-cust.
    END.
    ON 'choose' OF bt-ant DO:
        GET PREV qCust.
        IF AVAIL customer THEN DO:
            DISP customer.custnum   
             customer.NAME      
             customer.salesrep
             salesrep.repname
             customer.address 
             WITH FRAME f-cust.    
        END.
        ELSE DO:
        APPLY "choose" TO bt-pri.
        END.
    END.
    ON 'choose' OF bt-prox DO:
        GET NEXT qCust.
        IF AVAIL customer THEN DO:
            DISP customer.custnum   
             customer.NAME      
             customer.salesrep
             salesrep.repname
             customer.address 
             WITH FRAME f-cust.    
        END.
        ELSE DO:
        APPLY "choose" TO bt-pri.
        END.
    END.
    ON 'choose' OF bt-ult DO:
        GET LAST qCust.
        DISP customer.custnum   
             customer.NAME      
             customer.salesrep
             salesrep.repname
             customer.address 
             WITH FRAME f-cust.
    END.
    ON 'choose' OF bt-add DO:
        ASSIGN cAction = "add"
               bt-pri:SENSITIVE IN FRAME f-cust = FALSE
               bt-prox:SENSITIVE IN FRAME f-cust = FALSE
               bt-ant:SENSITIVE IN FRAME f-cust = FALSE
               bt-ult:SENSITIVE IN FRAME f-cust = FALSE.
               bt-save:SENSITIVE IN FRAME f-cust = TRUE.
               bt-cancel:SENSITIVE IN FRAME f-cust = TRUE.
               CLEAR FRAME f-cust.        
        ENABLE  
               customer.NAME       
               customer.salesrep    
               customer.address   
               WITH FRAME f-cust.
         DISP NEXT-VALUE(NextCustNum) @ customer.custnum WITH FRAME f-cust.
    END.
    
    ON 'leave' OF customer.salesrep DO:
      FIND FIRST bSales
        WHERE bSales.salesrep = INPUT customer.salesrep NO-LOCK NO-ERROR.
      IF NOT AVAIL bSales THEN
      DO:
        MESSAGE "SalesRep" INPUT customer.salesrep "nao existe!!!"
                        VIEW-AS ALERT-BOX ERROR.
        RETURN NO-APPLY.
      END.
      DISP bSales.RepName @ salesrep.RepName WITH FRAME f-cust.
    END.
    
    ON 'choose' OF bt-save DO:
      IF cAction = "add"  THEN
      DO:
        CREATE bCust.
        ASSIGN bCust.custNum = INPUT customer.custnum
                       bCust.NAME = INPUT customer.NAME
                       bCust.salesrep = INPUT customer.salesrep
                       bCust.address = INPUT customer.address.
        DISABLE bt-save bt-cancel
                        customer.NAME customer.salesrep customer.address WITH FRAME f-cust.
        ENABLE bt-pri bt-ant bt-prox bt-ult bt-sair bt-add WITH FRAME f-cust. 
      END.
    END.
    ON 'choose' OF bt-cancel DO:
        ASSIGN customer.custnum:SENSITIVE IN FRAME f-cust = FALSE
               customer.NAME:SENSITIVE IN FRAME f-cust = FALSE
               customer.salesrep:SENSITIVE IN FRAME f-cust = FALSE
               customer.address:SENSITIVE IN FRAME f-cust = FALSE
               salesrep.repname:SENSITIVE IN FRAME f-cust = FALSE
               bt-save:SENSITIVE IN FRAME f-cust = FALSE
               bt-cancel:SENSITIVE IN FRAME f-cust = FALSE.
        IF AVAIL customer THEN
        DO:
             DISP customer.custnum   
             customer.NAME      
             customer.salesrep
             salesrep.repname
             customer.address
             WITH FRAME f-cust.  
        END.
        ELSE DO:
          APPLY "choose" TO bt-pri.
        END.
        ENABLE bt-pri bt-ant bt-prox bt-ult bt-sair bt-add WITH FRAME f-cust.
    END.
 
    
OPEN QUERY qCust FOR EACH customer, FIRST salesrep 
WHERE salesrep.salesrep = customer.salesrep.
 
ENABLE bt-pri bt-ant bt-prox bt-ult bt-sair bt-add WITH FRAME f-cust.
WAIT-FOR "choose" OF bt-sair.
