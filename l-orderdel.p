/* l-Orderdel.p */
define variable l-resp as logical no-undo.
for each Order with 1 column 1 down:
    display Order.
    message "Deseja eliminar o Pedido?" VIEW-AS ALERT-BOX BUTTONS YES-NO UPDATE l-resp.
    if l-resp = YES  then do:
        for each OrderLine of Order:
            delete OrderLine.
        end. 
        delete Order.
        message "Pedido Eliminado".
    end.
    ELSE IF l-resp = NO THEN
    DO:
          LEAVE. 
    END.
end.
