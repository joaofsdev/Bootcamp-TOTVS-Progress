DEF VAR iCustNum AS INTEGER NO-UNDO LABEL "Customer".
PROMPT-FOR iCustNum WITH SIDE-LABELS.
FIND customer
WHERE customer.custNum = INPUT iCustNum
EXCLUSIVE-LOCK NO-ERROR.
IF AVAIL customer THEN DO:
  DELETE customer.
END.
ELSE DO:
 MESSAGE "customer" INPUT iCustNum "nao encontrado"
 VIEW-AS ALERT-BOX ERROR.
END.
