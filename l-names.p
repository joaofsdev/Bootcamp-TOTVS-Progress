/*
Escreva um programa l-names.p que pe�a o nome do cliente, encontre o
primeiro cliente cujo nome inicie com o informado e mostre o c�digo, o nome e
o pa�s. Ent�o o programa dever� mostrar todos os outros clientes que tenha o
c�digo maior que o cliente encontrado. Tente n�o utilizar vari�veis nem o
comando FOR EACH. A tela deve se assemelhar a que segue:
*/
CURRENT-WINDOW:WIDTH = 200.

        PROMPT-FOR customer.NAME.
        FIND FIRST customer WHERE customer.NAME BEGINS INPUT customer.NAME NO-LOCK NO-ERROR.
                  DISPLAY customer.NAME
                                 customer.country
                                 customer.CustNum WITH WIDTH 180 3 COL.
        IF AVAIL customer THEN
        DO:
                         REPEAT:
                               FIND NEXT customer WHERE customer.CustNum > INPUT customer.custNum.
                               DISPLAY customer.CustNum
                                               customer.NAME
                                               customer.country WITH WIDTH 180 3 COL.

                          END.
        END.
        ELSE DO:
                 MESSAGE "Usuario Nao Encontrado"
                 VIEW-AS ALERT-BOX.
                 MESSAGE "Tente Novamente"
                 VIEW-AS ALERT-BOX.
        END.
