create or replace TRIGGER cg$BUS_ENTREPRISE
BEFORE UPDATE ON ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$ENTREPRISE.cg$table.DELETE;
    cg$ENTREPRISE.cg$tableind.DELETE;
    cg$ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/