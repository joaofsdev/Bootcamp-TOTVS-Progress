DEF VAR c-senha AS CHAR NO-UNDO LABEL "senha".
REPEAT:
        UPDATE c-senha.
        CASE c-senha:
                WHEN "sai" THEN LEAVE.
                WHEN "secreta" THEN
                DO:
                        MESSAGE "senha ok!" VIEW-AS ALERT-BOX.
                        LEAVE.
                END.
                 
                OTHERWISE 
                DO:
                  MESSAGE "senha errada, tente novamente!" VIEW-AS ALERT-BOX.
                END.
        END CASE.
END.
