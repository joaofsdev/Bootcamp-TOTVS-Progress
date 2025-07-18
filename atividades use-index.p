/*
Busca por indice, verificar no dicionario
*/
CURRENT-WINDOW:WIDTH = 200.

FOR EACH customer NO-LOCK
 USE-INDEX NAME:
 DISPLAY customer.custnum
 customer.Balance 
 customer.Name 
 customer.Phone WITH WIDTH 190.
 END.

