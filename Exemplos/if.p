DEF VAR l-cont AS LOGICAL NO-UNDO.
DEF VAR c-nome AS CHAR NO-UNDO LABEL "Nome".
REPEAT:
    UPDATE c-nome.
    IF c-nome = "" THEN DO:
       MESSAGE "O nome esta em branco, deseja sair ? " UPDATE l-cont
                VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO-CANCEL.
       IF l-cont = YES THEN
       LEAVE.
    END.
    ELSE DO:
        FOR EACH customer NO-LOCK WHERE customer.NAME BEGINS c-nome:
            DISP customer.custnum
            customer.NAME.
        END.
    END.    
END.
