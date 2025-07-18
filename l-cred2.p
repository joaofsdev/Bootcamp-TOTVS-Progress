/*
Escreva um programa l-cred2.p que peça o código do cliente e mostre o número, o nome, e 
limite de crédito. Então o programa deverá mostrar os mesmos dados para todos os clientes 
cujo limite de crédito seja igual ou maior que o informado, classificado em ordem decrescente 
por limite de crédito.
Dica: Depois de encontrar o cliente original, grave o limite de crédito em uma variável. Use esta variável quando 
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





