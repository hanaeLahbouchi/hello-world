create or replace TRIGGER cg$BDR_ENTREPRISE
BEFORE DELETE ON ENTREPRISE FOR EACH ROW
DECLARE
    cg$pk cg$ENTREPRISE.cg$pk_type;
    cg$rec cg$ENTREPRISE.cg$row_type;
    cg$ind cg$ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ENTREPRISE  := :old.NO_ENTREPRISE;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.LOGIN_CREA := :old.LOGIN_CREA;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_CREA := :old.LOGIN_CREA;
    cg$rec.LOGIN_MAJ := :old.LOGIN_MAJ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_MAJ := :old.LOGIN_MAJ;


    cg$ENTREPRISE.idx := cg$ENTREPRISE.idx + 1;

    if not (cg$ENTREPRISE.called_from_package) then
        cg$ENTREPRISE.validate_domain_cascade_delete(cg$rec);   
        cg$ENTREPRISE.del(cg$pk, FALSE);
        cg$ENTREPRISE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/