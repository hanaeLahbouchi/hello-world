create or replace TRIGGER cg$BDS_ENTREPRISE
BEFORE DELETE ON ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$ENTREPRISE.cg$table.DELETE;
    cg$ENTREPRISE.cg$tableind.DELETE;
    cg$ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/