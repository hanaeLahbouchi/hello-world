create or replace TRIGGER cg$BIS_ENTREPRISE
BEFORE INSERT ON ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$ENTREPRISE.cg$table.DELETE;
    cg$ENTREPRISE.cg$tableind.DELETE;
    cg$ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/