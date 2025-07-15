/* 
CURRENT-WINDOW:WIDTH = 121.
REPEAT WITH 1 COL WIDTH 120 SIDE-LABELS:
        CREATE customer.
        UPDATE customer.
END.
*/

DEF VAR i-CustNum AS INTEGER NO-UNDO.
REPEAT:
        PROMPT-FOR i-CustNum.
        FIND FIRST customer
                  WHERE customer.custnum = INPUT i-CustNum
                  NO-LOCK NO-ERROR.
        IF NOT AVAIL customer THEN DO:
               MESSAGE "nao existe um registro com este codigo ' "
                  INPUT i-CustNum // Input pega informacao do prompt-for e mostra na tela
                  " ', tente novamente"
                  VIEW-AS ALERT-BOX.
        END.
        ELSE DO:
                 
                MESSAGE "encontrei o registro com este codigo ' "
                      INPUT i-CustNum customer.NAME
                      " ', "
                      VIEW-AS ALERT-BOX.
                MESSAGE "tecle enter para continuar"
                      VIEW-AS ALERT-BOX.
        END.
END.
