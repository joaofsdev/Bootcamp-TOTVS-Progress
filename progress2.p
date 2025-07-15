PROMPT-FOR Salesrep.SalesRep.
FIND Salesrep
  WHERE Salesrep.SalesRep = INPUT Salesrep.SalesRep NO-ERROR.
    IF AVAILABLE Salesrep THEN
    DISPLAY Salesrep
    WITH 1 COL.
    ELSE
    MESSAGE "Erro nao Encontrado"
    VIEW-AS ALERT-BOX ERROR.
    
