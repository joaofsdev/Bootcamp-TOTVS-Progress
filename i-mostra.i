// i-mostra.i 
FOR EACH {&table}:
        DISPLAY {&table}.{&field}
                &IF "{&field2}" <> "" &THEN
                        {&table}.{&field2}
                &ENDIF
                .
END.
