DEF BUTTON bt-cancel LABEL "Cancelar" AUTO-ENDKEY.
DEF BUTTON bt-salva LABEL "Salvar" AUTO-GO.
DEF BUTTON bt-edita LABEL "Editar" SIZE 20 BY 1.
DEF VAR cUsuario AS CHAR NO-UNDO LABEL "Usuario" FORMAT "x(40)".
DEF VAR cSenha AS CHAR NO-UNDO LABEL "Senha" FORMAT "x(20)".
 
DEF FRAME f-dados
    cUsuario           AT ROW 1   COL 20
    cSenha           AT ROW 2   COL 20
    bt-edita     AT ROW 3 COL 10
    bt-salva        
    bt-cancel       
        WITH SIDE-LABELS THREE-D VIEW-AS DIALOG-BOX
            TITLE "Login".

 ON 'choose' OF bt-edita DO:
   ENABLE cUsuario cSenha WITH FRAME f-dados.
 END.
 
 ON 'choose' OF bt-salva DO:
   ASSIGN cUsuario cSenha.
   MESSAGE "Usuario:" cUsuario VIEW-AS ALERT-BOX INFORMATION.
   IF cUsuario = "caio" THEN
          RETURN NO-APPLY.
   DISABLE cUsuario cSenha WITH FRAME f-dados.
 END.
 
VIEW FRAME f-dados.

ENABLE bt-salva
       bt-cancel
       bt-edita
       WITH FRAME f-dados.
WAIT-FOR "choose" OF bt-cancel.
