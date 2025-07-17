 CURRENT-WINDOW:WIDTH = 200.
/*  Escreva um programa l-disp2.p que solicite o primeiro caracter do nome e o limite de cr�dito 
do cliente. Em seguida deve mostrar o n�mero, o nome e o limite de cr�dito de todos os 
clientes cujo nome comece com a letra informada e que tenha o limite de cr�dito maior do que 
o informado. A tela deve se assemelhar a que segue:
Dica: Use duas vari�veis, uma para caracter e outra para limite de cr�dito. Lembre-se de usar UPDATE para 
entrar com os valores nas vari�veis.
*/

DEFINE VARIABLE letra AS CHARACTER   NO-UNDO.
DEFINE VARIABLE credito AS INTEGER   NO-UNDO.

UPDATE letra.
UPDATE credito.

FOR EACH customer WHERE customer.NAME BEGINS letra AND customer.creditLimit > credito:
        DISPLAY customer.CustNum
                        customer.NAME
                        customer.creditLimit WITH WIDTH 190.
END.



