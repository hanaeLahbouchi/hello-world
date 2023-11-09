
PROMPT Creating Trigger Logic for Table 'SUIVI_PERSONNEL_COMPETENCE'
PROMPT Creating Before Insert Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIS_SUIVI_PERSONNEL_COMPETE
BEFORE INSERT ON SUIVI_PERSONNEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIR_SUIVI_PERSONNEL_COMPETE
BEFORE INSERT ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$ind cg$SUIVI_PERSONNEL_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.DATE_DEBUT := :new.DATE_DEBUT;
    cg$ind.DATE_DEBUT := TRUE;
    -- Warning: Column COMMENTAIRE is of type CLOB and not allowed in triggers
	cg$ind.COMMENTAIRE := FALSE;
    cg$rec.DATE_FIN := :new.DATE_FIN;
    cg$ind.DATE_FIN := TRUE;

    if not (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) then
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_arc(cg$rec);
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_domain(cg$rec);

        cg$SUIVI_PERSONNEL_COMPETENCE.ins(cg$rec, cg$ind, FALSE);
        cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package := FALSE;
    end if;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).ID_SPC := cg$rec.ID_SPC;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).ID_SPC := cg$ind.ID_SPC;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).CODE_MCP := cg$rec.CODE_MCP;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).CODE_MCP := cg$ind.CODE_MCP;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_DEBUT := cg$rec.DATE_DEBUT;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_DEBUT := cg$ind.DATE_DEBUT;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_FIN := cg$rec.DATE_FIN;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_FIN := cg$ind.DATE_FIN;

    cg$SUIVI_PERSONNEL_COMPETENCE.idx := cg$SUIVI_PERSONNEL_COMPETENCE.idx + 1;

    :new.ID_SPC := cg$rec.ID_SPC;
    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.DATE_DEBUT := cg$rec.DATE_DEBUT;
    -- Warning: Column COMMENTAIRE is of type CLOB and not allowed in triggers
    :new.DATE_FIN := cg$rec.DATE_FIN;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_SUIVI_PERSONNEL_COMPETE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_SUIVI_PERSONNEL_COMPETE
AFTER INSERT ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_SUIVI_PERSONNEL_COMPETE
/

PROMPT Creating After Insert Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AIS_SUIVI_PERSONNEL_COMPETE
AFTER INSERT ON SUIVI_PERSONNEL_COMPETENCE
DECLARE
    idx      BINARY_INTEGER := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$old_rec   cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_SPC := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).ID_SPC;
            cg$rec.CODE_MCP := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).CODE_MCP;
            cg$rec.NO_ETUDIANT_NAT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.DATE_DEBUT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_DEBUT;
            cg$rec.COMMENTAIRE := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).COMMENTAIRE;
            cg$rec.DATE_FIN := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_FIN;

            cg$SUIVI_PERSONNEL_COMPETENCE.validate_foreign_keys_ins(cg$rec);

            cg$SUIVI_PERSONNEL_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUS_SUIVI_PERSONNEL_COMPETE
BEFORE UPDATE ON SUIVI_PERSONNEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUR_SUIVI_PERSONNEL_COMPETE
BEFORE UPDATE ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec     cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$ind     cg$SUIVI_PERSONNEL_COMPETENCE.cg$ind_type;
    cg$old_rec cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).ID_SPC := :old.ID_SPC;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP :=    (:new.CODE_MCP IS NULL AND :old.CODE_MCP IS NOT NULL )
                        OR (:new.CODE_MCP IS NOT NULL AND :old.CODE_MCP IS NULL)
                        OR NOT(:new.CODE_MCP = :old.CODE_MCP) ;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).CODE_MCP := :old.CODE_MCP;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.DATE_DEBUT := :new.DATE_DEBUT;
    cg$ind.DATE_DEBUT :=    (:new.DATE_DEBUT IS NULL AND :old.DATE_DEBUT IS NOT NULL )
                        OR (:new.DATE_DEBUT IS NOT NULL AND :old.DATE_DEBUT IS NULL)
                        OR NOT(:new.DATE_DEBUT = :old.DATE_DEBUT) ;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_DEBUT := :old.DATE_DEBUT;
    -- Warning: Column COMMENTAIRE is of type CLOB and not allowed in triggers
	cg$ind.COMMENTAIRE := FALSE;
    cg$rec.DATE_FIN := :new.DATE_FIN;
    cg$ind.DATE_FIN :=    (:new.DATE_FIN IS NULL AND :old.DATE_FIN IS NOT NULL )
                        OR (:new.DATE_FIN IS NOT NULL AND :old.DATE_FIN IS NULL)
                        OR NOT(:new.DATE_FIN = :old.DATE_FIN) ;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).DATE_FIN := :old.DATE_FIN;


    cg$SUIVI_PERSONNEL_COMPETENCE.idx := cg$SUIVI_PERSONNEL_COMPETENCE.idx + 1;

    if not (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) then
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_arc(cg$rec);
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_domain(cg$rec, cg$ind);
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_domain_cascade_update(cg$old_rec);   

        cg$SUIVI_PERSONNEL_COMPETENCE.upd(cg$rec, cg$ind, FALSE);
        cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package := FALSE;
    end if;

    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.DATE_DEBUT := cg$rec.DATE_DEBUT;
    -- Warning: Column COMMENTAIRE is of type CLOB and not allowed in triggers
    :new.DATE_FIN := cg$rec.DATE_FIN;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_SUIVI_PERSONNEL_COMPETE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_SUIVI_PERSONNEL_COMPETE
AFTER UPDATE ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_SUIVI_PERSONNEL_COMPETE
/






PROMPT Creating After Update Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AUS_SUIVI_PERSONNEL_COMPETE
AFTER UPDATE ON SUIVI_PERSONNEL_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.FIRST;
    cg$old_rec cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$rec     cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$ind     cg$SUIVI_PERSONNEL_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_SPC := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).ID_SPC;
        cg$old_rec.CODE_MCP := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).CODE_MCP;
        cg$old_rec.NO_ETUDIANT_NAT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.DATE_DEBUT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_DEBUT;
        cg$old_rec.COMMENTAIRE := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).COMMENTAIRE;
        cg$old_rec.DATE_FIN := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_FIN;

    IF NOT (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) THEN
        idx := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.NEXT(idx);
        cg$rec.ID_SPC := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.CODE_MCP := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).CODE_MCP;
        cg$ind.CODE_MCP := updating('CODE_MCP');
        cg$rec.NO_ETUDIANT_NAT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.DATE_DEBUT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_DEBUT;
        cg$ind.DATE_DEBUT := updating('DATE_DEBUT');
        cg$rec.COMMENTAIRE := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');
        cg$rec.DATE_FIN := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_FIN;
        cg$ind.DATE_FIN := updating('DATE_FIN');

        cg$SUIVI_PERSONNEL_COMPETENCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$SUIVI_PERSONNEL_COMPETENCE.upd_denorm2( cg$rec,
                                       cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx)
                                     );
        cg$SUIVI_PERSONNEL_COMPETENCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx)
								                  );
        cg$SUIVI_PERSONNEL_COMPETENCE.cascade_update(cg$rec, cg$old_rec);
        cg$SUIVI_PERSONNEL_COMPETENCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package := FALSE;
	END IF;
        idx := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.NEXT(idx);
    END LOOP;

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDS_SUIVI_PERSONNEL_COMPETE
BEFORE DELETE ON SUIVI_PERSONNEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind.DELETE;
    cg$SUIVI_PERSONNEL_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDR_SUIVI_PERSONNEL_COMPETE
BEFORE DELETE ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$pk cg$SUIVI_PERSONNEL_COMPETENCE.cg$pk_type;
    cg$rec cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$ind cg$SUIVI_PERSONNEL_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_SPC  := :old.ID_SPC;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).ID_SPC := :old.ID_SPC;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.CODE_MCP := :old.CODE_MCP;
    cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(cg$SUIVI_PERSONNEL_COMPETENCE.idx).CODE_MCP := :old.CODE_MCP;


    cg$SUIVI_PERSONNEL_COMPETENCE.idx := cg$SUIVI_PERSONNEL_COMPETENCE.idx + 1;

    if not (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) then
        cg$SUIVI_PERSONNEL_COMPETENCE.validate_domain_cascade_delete(cg$rec);   
        cg$SUIVI_PERSONNEL_COMPETENCE.del(cg$pk, FALSE);
        cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_SUIVI_PERSONNEL_COMPETE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_SUIVI_PERSONNEL_COMPETE
AFTER DELETE ON SUIVI_PERSONNEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_SUIVI_PERSONNEL_COMPETE
/

PROMPT Creating After Delete Statement Trigger on 'SUIVI_PERSONNEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$ADS_SUIVI_PERSONNEL_COMPETE
AFTER DELETE ON SUIVI_PERSONNEL_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
    cg$old_rec   cg$SUIVI_PERSONNEL_COMPETENCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$SUIVI_PERSONNEL_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_SPC := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).ID_SPC;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.CODE_MCP := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).CODE_MCP;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).CODE_MCP := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.DATE_DEBUT := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_DEBUT;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).DATE_DEBUT := TRUE;
            cg$rec.COMMENTAIRE := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).COMMENTAIRE;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).COMMENTAIRE := TRUE;
            cg$rec.DATE_FIN := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table(idx).DATE_FIN;
            cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx).DATE_FIN := TRUE;

            cg$SUIVI_PERSONNEL_COMPETENCE.validate_foreign_keys_del(cg$rec);
            cg$SUIVI_PERSONNEL_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SUIVI_PERSONNEL_COMPETENCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$SUIVI_PERSONNEL_COMPETENCE.cascade_delete(cg$rec);
            cg$SUIVI_PERSONNEL_COMPETENCE.domain_cascade_delete(cg$rec);             

            idx := cg$SUIVI_PERSONNEL_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



