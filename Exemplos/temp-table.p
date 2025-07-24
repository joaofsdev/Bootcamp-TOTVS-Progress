DEF TEMP-TABLE tt-cliente NO-UNDO
 //2LIKE customer 
 FIELD SalesRep AS CHAR FORMAT "x(4)" 
 FIELD RepName AS character FORMAT "x(5)" LABEL "Representante"
 FIELD Region LIKE state.Region
 FIELD comments AS CHAR
 INDEX i-repres IS PRIMARY SalesRep.
REPEAT:
INSERT tt-cliente EXCEPT Comments 
 WITH 1 COLUMN.
END.
FOR EACH tt-cliente NO-LOCK:
 DISP tt-cliente EXCEPT Comments
 WITH SIDE-LABELS 1 COL.
END.
