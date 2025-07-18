/*
Escreva um programa l-cred2.p que pe�a o c�digo do cliente e mostre o n�mero, o nome, e 
limite de cr�dito. Ent�o o programa dever� mostrar os mesmos dados para todos os clientes 
cujo limite de cr�dito seja igual ou maior que o informado, classificado em ordem decrescente 
por limite de cr�dito.
Dica: Depois de encontrar o cliente original, grave o limite de cr�dito em uma vari�vel. Use esta vari�vel quando 
for localizar os outros clientes
*/
CURRENT-WINDOW:WIDTH = 300.

DEFINE VARIABLE credito AS INTEGER NO-UNDO.
PROMPT-FOR customer.custnum.

FIND customer WHERE customer.custnum = INPUT customer.custnum NO-LOCK NO-ERROR.
        DISPLAY customer.custnum
                       customer.NAME
                       customer.CreditLimit WITH WIDTH 150 3 COL.
                       
credito = INPUT customer.creditlimit.

REPEAT:
        FIND NEXT  customer WHERE customer.creditlimit >= credito.
        DISPLAY customer.custnum
                       customer.NAME
                       customer.CreditLimit WITH WIDTH 150 3 COL.
END.





