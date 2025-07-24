DEFINE VARIABLE hprog AS HANDLE      NO-UNDO.
DEFINE VARIABLE ix AS INTEGER     NO-UNDO.
DEF VAR iRetorno AS INTEGER NO-UNDO.

RUN persistente.p PERSISTENT SET hprog.

RUN pi-calcula IN hprog (INPUT "Catolica",
                                         INPUT 5000,
                                         OUTPUT iRetorno).
                                         
MESSAGE iRetorno VIEW-AS ALERT-BOX.
                                         
DO ix =1 TO 2:
        RUN pi-resposta IN hprog.
END.

DELETE PROCEDURE hprog.
