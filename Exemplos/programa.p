CURRENT-WINDOW:WIDTH = 251.
 
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-prox LABEL ">".
DEF BUTTON bt-ult LABEL ">>".
DEF BUTTON bt-add LABEL "Novo".
DEF BUTTON bt-save LABEL "Salvar".
DEF BUTTON bt-canc LABEL "Cancelar".
DEF BUTTON bt-edit LABEL "Editar".
DEF BUTTON bt-del LABEL "Deletar".
DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
 
DEFINE VARIABLE cAction  AS CHARACTER   NO-UNDO.
 
DEF QUERY qCust FOR customer, salesrep SCROLLING.
 
DEF BUFFER bCust  FOR customer.
DEF BUFFER bSales FOR salesrep.
 
 
DEF FRAME f-cust
    bt-pri AT 10
    bt-ant 
    bt-prox 
    bt-ult SPACE(7) 
    bt-add
    bt-save 
    bt-edit
    bt-del
    bt-canc SPACE(7)
    bt-sair  SKIP(1)
    customer.custnum  COLON 20
    customer.NAME     COLON 20
    customer.salesrep COLON 20 salesrep.repname NO-LABEL  
    customer.address  COLON 20
    customer.comments VIEW-AS EDITOR SIZE 70 BY 3 SCROLLBAR-VERTICAL COLON 20
    WITH SIDE-LABELS THREE-D SIZE 120 BY 20.
 
ON 'choose' OF bt-pri DO:
    GET FIRST qCust.
    RUN piMostra.
END.
 
ON 'choose' OF bt-ant DO:
    GET PREV qCust.
    RUN piMostra.
END.
 
ON 'choose' OF bt-prox DO:
    GET NEXT qCust.
    RUN piMostra.
END.
 
ON 'choose' OF bt-ult DO:
    GET LAST qCust.
    RUN piMostra.
END.
 
ON 'choose' OF bt-add DO:
    ASSIGN cAction = "add".
    RUN piHabilitaBotoes (INPUT FALSE).
    RUN piHabilitaCampos (INPUT TRUE).
    CLEAR FRAME f-cust.
    DISPLAY NEXT-VALUE(NextCustNum) @ customer.custnum WITH FRAME f-cust.
    ASSIGN customer.comments:SCREEN-VALUE = "". 
END.
 
ON 'choose' OF bt-edit DO:
    RUN piHabilitaCampos (INPUT TRUE).
    DISABLE bt-add WITH FRAME f-cust.
    ENABLE bt-save WITH FRAME f-cust.

END.
 
ON 'leave' OF customer.salesrep DO:
    DEFINE VARIABLE lValid AS LOGICAL     NO-UNDO.
    RUN piValidaSalesrep (INPUT customer.salesrep:SCREEN-VALUE, 
                          OUTPUT lValid).
    IF  lValid = NO THEN DO:
        RETURN NO-APPLY.
    END.
    DISP bSales.RepName @ salesrep.RepName WITH FRAME f-cust.
END.
 
ON 'choose' OF bt-del DO:
    FIND customer WHERE customer.custnum = INPUT customer.custnum.
    DELETE customer.
    MESSAGE "Usuario deletado com sucesso!" VIEW-AS ALERT-BOX INFORMATION.
    RUN piOpenQuery.
    RUN piHabilitaBotoes (INPUT TRUE).
    APPLY "choose" TO bt-pri.

END.
 
ON 'choose' OF bt-save DO:
   DEFINE VARIABLE lValid AS LOGICAL     NO-UNDO.
      RUN piValidaSalesrep (INPUT customer.salesrep:SCREEN-VALUE, 
                            OUTPUT lValid).
      IF  lValid = NO THEN DO:
          RETURN NO-APPLY.
      END.
      FIND bcust WHERE bcust.custnum = INPUT customer.custnum.
      IF AVAIL bcust THEN DO:
             ASSIGN bCust.NAME     = INPUT customer.NAME
                    bCust.salesrep = INPUT customer.salesrep
                    bCust.address  = INPUT customer.address
                    bCust.comments = INPUT customer.comments.
             MESSAGE "Usu�rio do ID: " bcust.custnum " foi editado com sucesso!" VIEW-AS ALERT-BOX INFORMATION.
             DISP customer.custnum customer.NAME customer.salesrep
                  salesrep.repname customer.address customer.comments
                  WITH FRAME f-cust.     
      END.
      ELSE DO:
      CREATE bCust.
      ASSIGN bCust.custNum  = INPUT customer.CustNum
             bCust.NAME     = INPUT customer.NAME
             bCust.salesrep = INPUT customer.salesrep
             bCust.address  = INPUT customer.address
             bCust.comments = INPUT customer.comments.
              RUN piOpenQuery.
            APPLY "choose" TO bt-ult.
      END.
      RUN piHabilitaBotoes (INPUT TRUE).
      RUN piHabilitaCampos (INPUT FALSE).
END.
 
ON 'choose' OF bt-canc DO:
    RUN piHabilitaBotoes (INPUT TRUE).
    RUN piHabilitaCampos (INPUT FALSE).
    RUN piMostra.
END.
 
RUN piOpenQuery.
RUN piHabilitaBotoes (INPUT TRUE).
APPLY "choose" TO bt-pri.
 
WAIT-FOR ENDKEY OF FRAME f-cust.
 
PROCEDURE piMostra:
    IF AVAIL customer THEN DO:
        DISP customer.custnum customer.NAME customer.salesrep
             salesrep.repname customer.address customer.comments
             WITH FRAME f-cust.
    END.
    ELSE DO:
        CLEAR FRAME f-cust.
        ASSIGN customer.comments:SCREEN-VALUE IN FRAME f-cust = "".
    END.
END PROCEDURE.
 
PROCEDURE piOpenQuery:
    OPEN QUERY qCust 
        FOR EACH customer, 
           FIRST salesrep WHERE salesrep.salesrep = customer.salesrep.
END PROCEDURE.
 
PROCEDURE piHabilitaBotoes:
    DEF INPUT PARAM pEnable AS LOGICAL NO-UNDO.
 
    DO WITH FRAME f-cust:
       ASSIGN bt-pri:SENSITIVE  = pEnable
              bt-ant:SENSITIVE  = pEnable
              bt-prox:SENSITIVE = pEnable
              bt-ult:SENSITIVE  = pEnable
              bt-sair:SENSITIVE = pEnable
              bt-del:SENSITIVE  = pEnable
              bt-add:SENSITIVE  = pEnable
              bt-edit:SENSITIVE = pEnable
              bt-save:SENSITIVE = NOT pEnable
              bt-canc:SENSITIVE = NOT pEnable.
    END.
END PROCEDURE.
 
PROCEDURE piHabilitaCampos:
    DEF INPUT PARAM pEnable AS LOGICAL NO-UNDO.
 
    DO WITH FRAME f-cust:
       ASSIGN customer.NAME:SENSITIVE     = pEnable
              customer.salesrep:SENSITIVE = pEnable
              customer.address:SENSITIVE  = pEnable
              customer.comments:SENSITIVE = pEnable.
    END.
END PROCEDURE.
 
PROCEDURE piValidaSalesrep:
    DEF INPUT PARAM pSalesrep AS CHAR NO-UNDO.
    DEF OUTPUT PARAM pValid AS LOGICAL NO-UNDO INITIAL NO.
    FIND FIRST bSales
        WHERE bSales.salesrep = pSalesrep
        NO-LOCK NO-ERROR.
    IF  NOT AVAIL bSales THEN DO:
        MESSAGE "SalesRep" pSalesrep "nao existe!!!"
                VIEW-AS ALERT-BOX ERROR.
        ASSIGN pValid = NO.
    END.
    ELSE 
       ASSIGN pValid = YES.
END PROCEDURE.
