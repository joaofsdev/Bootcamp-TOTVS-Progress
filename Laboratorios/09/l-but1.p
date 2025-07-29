/* Escreva um programa l-but1.p que crie 3 botões que tenha os labels 
Detail, Next e Exit. Os botões devem ser colocados em uma única frame. 
Inclua o evento de choose que quando ele ocorrer o label do botão 
selecionado seja mostrado na linha de mensagens. A seleção do botão Exit 
deve encerrar o programa. A tela deve assemelhar-se a que segue: */
CURRENT-WINDOW:WIDTH = 251.

DEF BUTTON bt-next LABEL "Next".
DEF BUTTON bt-detail LABEL "Detail".
DEF BUTTON bt-exit LABEL "Exit" AUTO-ENDKEY.

DEF FRAME f-botao
                  bt-next
                  bt-detail
                  bt-exit
                  WITH SIDE-LABELS WIDTH 250.

ON 'choose' OF bt-next 
DO:
  MESSAGE "Next".
END.

ON 'choose' OF bt-detail 
DO:
  MESSAGE "Detail".
END.

ENABLE ALL WITH FRAME f-botao.

DISPLAY WITH FRAME f-botao.

WAIT-FOR "choose" OF bt-exit.
