/*  Agora que você já conhece os Widgets. Crie um programa l-app1.p
conforme abaixo, contendo três FILL-IN, três TEXT, um EDITOR, um
TOGGLE-BOX, um RADIO-SET, um SELECTION-LIST, um BROWSE de
clientes com o código e nome do cliente e um botão. Ao clicar no botão o
programa deve ser encerrado.*/
CURRENT-WINDOW:WIDTH = 251.

DEF VAR l-tbox AS LOGICAL LABEL "Toggle Box" VIEW-AS TOGGLE-BOX NO-UNDO.

DEF VAR i-radioset AS INTEGER LABEL "Radio Set" VIEW-AS RADIO-SET RADIO-BUTTONS "Animal", 1 , "Mineral", 2 , "Vegetal", 3.

DEFINE VAR c-fill1 AS CHARACTER VIEW-AS FILL-IN LABEL "Campo1" FORMAT "x(15)".

DEFINE VAR c-fill2 AS CHARACTER VIEW-AS FILL-IN LABEL "Campo2" FORMAT "x(15)".

DEFINE VAR c-fill3 AS CHARACTER VIEW-AS FILL-IN LABEL "Campo3" FORMAT "x(15)".

DEFINE VAR c-texto1 AS CHARACTER LABEL "Texto 1" VIEW-AS TEXT NO-UNDO.

DEFINE VAR c-texto2 AS CHARACTER LABEL "Texto 2"  VIEW-AS TEXT NO-UNDO.

DEFINE VAR c-texto3 AS CHARACTER LABEL "Texto 3" VIEW-AS TEXT NO-UNDO.

DEF VAR c-editor AS CHARACTER LABEL "Editor" VIEW-AS EDITOR INNER-LINES 3 INNER-CHARS 10.

DEF VAR c-list AS CHAR LABEL "Lista" VIEW-AS SELECTION-LIST MULTIPLE LIST-ITEMS "Primeiro", "Segundo",  "Terceiro", "Quarto", "Quinto" SCROLLBAR-VERTICAL
INNER-CHARS 15 INNER-LINES 5 SORT.

DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.

DEF QUERY q-cust FOR customer SCROLLING.

DEF BROWSE b-cust QUERY q-cust DISPLAY
            customer.custnum customer.NAME
            WITH SEPARATORS 5 DOWN.
            
DEF FRAME f-cust
                     c-fill1  COLON 10 c-texto1 COLON 40
                     c-fill2  COLON 10 c-texto2 COLON 40
                     c-fill3  COLON 10 c-texto3 COLON 40 SKIP(1)  
                     c-editor COLON 10                     
                     l-tbox COLON 40
                     i-radioset COLON 80 SKIP(1)
                     c-list COLON 10
                     b-cust COLON 50 SKIP (1)
                     bt-sair COLON 1
                     WITH SIDE-LABELS WIDTH 250.
                     
OPEN QUERY q-cust
FOR EACH customer.
ENABLE ALL WITH FRAME f-cust.
WAIT-FOR "choose" OF bt-sair.


                    
