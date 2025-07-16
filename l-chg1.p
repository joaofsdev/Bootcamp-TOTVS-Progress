CURRENT-WINDOW:WIDTH = 200.

FOR EACH customer EXCLUSIVE-LOCK:
        DISP customer WITH 1 COL WIDTH 180.
        UPDATE customer.
END.
