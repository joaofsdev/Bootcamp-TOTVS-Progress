 CURRENT-WINDOW:WIDTH = 200.
/*   Escreva um programa l-xferj.p que permita associar um novo representante a todos os 
clientes de um determinado representante. O programa deve pedir o representante atual e o 
novo representante e buscar todos os clientes que possuam o representante atual. A medida 
que voc� l� os clientes voc� deve mostrar o n�mero e nome do cliente, associar o novo 
representante e mostr�-lo. A tela deve ser assemelhar a que segue:
Dica: Use duas vari�veis, uma para o representante atual e outra para o novo. Lembre-se de usar UPDATE para 
entrar com os valores nas vari�veis */

DEFINE VARIABLE novoRepresentante AS CHARACTER   NO-UNDO.
DEFINE VARIABLE antigoRepresentante AS CHARACTER   NO-UNDO.

UPDATE antigoRepresentante.
UPDATE novoRepresentante. 

FOR EACH customer WHERE customer.salesrep = antigoRepresentante:
UPDATE customer.salesrep = novoRepresentante.
         DISPLAY customer.salesrep
                         customer.NAME
                         customer.CustNum
                         WITH WIDTH 190 3 COL SIDE-LABEL.
END.

