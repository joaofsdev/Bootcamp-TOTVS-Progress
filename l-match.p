/*
Escreva um programa l-match.p que pe�a uma string (utilize o campo nome do 
cliente) e mostre o c�digo, nome e representante de todo os clientes que 
possuam em qualquer posi��o do nome a string informada. A tela deve 
assemelhar-se a que segue
*/
CURRENT-WINDOW:WIDTH = 200.

DEF VAR letras AS CHARACTER NO-UNDO.
PROMPT letras.

FOR EACH customer WHERE customer.NAME MATCHES "*" + INPUT letras + "*" NO-LOCK:
DISP customer.custnum
         customer.NAME 
         customer.salesrep WITH WIDTH 190.
END.


