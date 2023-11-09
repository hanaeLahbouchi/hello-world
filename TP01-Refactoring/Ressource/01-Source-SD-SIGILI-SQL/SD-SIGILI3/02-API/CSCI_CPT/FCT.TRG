
PROMPT Creating Trigger Logic for Table 'FAMILLE_COMPETENCE_TRANSVERSAL'
PROMPT Creating Before Insert Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BIS_FAMILLE_COMPETENCE_TRAN
BEFORE INSERT ON FAMILLE_COMPETENCE_TRANSVERSAL
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BIR_FAMILLE_COMPETENCE_TRAN
BEFORE INSERT ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
DECLARE
    cg$rec cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$ind cg$FAMILLE_COMPETENCE_TRANSVER.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FCT := :new.ID_FCT;
    cg$ind.ID_FCT := TRUE;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP := TRUE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) then
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_arc(cg$rec);
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_domain(cg$rec);

        cg$FAMILLE_COMPETENCE_TRANSVER.ins(cg$rec, cg$ind, FALSE);
        cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package := FALSE;
    end if;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ID_FCT := cg$rec.ID_FCT;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ID_FCT := cg$ind.ID_FCT;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).CODE_MCP := cg$rec.CODE_MCP;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(cg$FAMILLE_COMPETENCE_TRANSVER.idx).CODE_MCP := cg$ind.CODE_MCP;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(cg$FAMILLE_COMPETENCE_TRANSVER.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ORDRE := cg$rec.ORDRE;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ORDRE := cg$ind.ORDRE;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(cg$FAMILLE_COMPETENCE_TRANSVER.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$FAMILLE_COMPETENCE_TRANSVER.idx := cg$FAMILLE_COMPETENCE_TRANSVER.idx + 1;

    :new.ID_FCT := cg$rec.ID_FCT;
    :new.CODE_MCP := cg$rec.CODE_MCP;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_FAMILLE_COMPETENCE_TRAN, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_FAMILLE_COMPETENCE_TRAN
AFTER INSERT ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_FAMILLE_COMPETENCE_TRAN
/

PROMPT Creating After Insert Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$AIS_FAMILLE_COMPETENCE_TRAN
AFTER INSERT ON FAMILLE_COMPETENCE_TRANSVERSAL
DECLARE
    idx      BINARY_INTEGER := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.FIRST;
    cg$rec   cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$old_rec   cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FCT := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ID_FCT;
            cg$rec.CODE_MCP := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).CODE_MCP;
            cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESCRIPTION;

            cg$FAMILLE_COMPETENCE_TRANSVER.validate_foreign_keys_ins(cg$rec);

            cg$FAMILLE_COMPETENCE_TRANSVER.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BUS_FAMILLE_COMPETENCE_TRAN
BEFORE UPDATE ON FAMILLE_COMPETENCE_TRANSVERSAL
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BUR_FAMILLE_COMPETENCE_TRAN
BEFORE UPDATE ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
DECLARE
    cg$rec     cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$ind     cg$FAMILLE_COMPETENCE_TRANSVER.cg$ind_type;
    cg$old_rec cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FCT := :new.ID_FCT;
    cg$ind.ID_FCT :=    (:new.ID_FCT IS NULL AND :old.ID_FCT IS NOT NULL )
                        OR (:new.ID_FCT IS NOT NULL AND :old.ID_FCT IS NULL)
                        OR NOT(:new.ID_FCT = :old.ID_FCT) ;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ID_FCT := :old.ID_FCT;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP :=    (:new.CODE_MCP IS NULL AND :old.CODE_MCP IS NOT NULL )
                        OR (:new.CODE_MCP IS NOT NULL AND :old.CODE_MCP IS NULL)
                        OR NOT(:new.CODE_MCP = :old.CODE_MCP) ;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).CODE_MCP := :old.CODE_MCP;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$FAMILLE_COMPETENCE_TRANSVER.idx := cg$FAMILLE_COMPETENCE_TRANSVER.idx + 1;

    if not (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) then
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_arc(cg$rec);
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_domain(cg$rec, cg$ind);
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_domain_cascade_update(cg$old_rec);   

        cg$FAMILLE_COMPETENCE_TRANSVER.upd(cg$rec, cg$ind, FALSE);
        cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package := FALSE;
    end if;

    :new.CODE_MCP := cg$rec.CODE_MCP;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_FAMILLE_COMPETENCE_TRAN, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_FAMILLE_COMPETENCE_TRAN
AFTER UPDATE ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_FAMILLE_COMPETENCE_TRAN
/






PROMPT Creating After Update Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$AUS_FAMILLE_COMPETENCE_TRAN
AFTER UPDATE ON FAMILLE_COMPETENCE_TRANSVERSAL
DECLARE
    idx        BINARY_INTEGER := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.FIRST;
    cg$old_rec cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$rec     cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$ind     cg$FAMILLE_COMPETENCE_TRANSVER.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_FCT := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ID_FCT;
        cg$old_rec.CODE_MCP := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).CODE_MCP;
        cg$old_rec.DESIGNATION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESCRIPTION;

    IF NOT (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) THEN
        idx := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.NEXT(idx);
        cg$rec.ID_FCT := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ID_FCT;
        cg$ind.ID_FCT := updating('ID_FCT');
        cg$rec.CODE_MCP := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).CODE_MCP;
        cg$ind.CODE_MCP := updating('CODE_MCP');
        cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$FAMILLE_COMPETENCE_TRANSVER.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$FAMILLE_COMPETENCE_TRANSVER.upd_denorm2( cg$rec,
                                       cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx)
                                     );
        cg$FAMILLE_COMPETENCE_TRANSVER.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx)
								                  );
        cg$FAMILLE_COMPETENCE_TRANSVER.cascade_update(cg$rec, cg$old_rec);
        cg$FAMILLE_COMPETENCE_TRANSVER.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package := FALSE;
	END IF;
        idx := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.NEXT(idx);
    END LOOP;

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BDS_FAMILLE_COMPETENCE_TRAN
BEFORE DELETE ON FAMILLE_COMPETENCE_TRANSVERSAL
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE_TRANSVER.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$BDR_FAMILLE_COMPETENCE_TRAN
BEFORE DELETE ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
DECLARE
    cg$pk cg$FAMILLE_COMPETENCE_TRANSVER.cg$pk_type;
    cg$rec cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$ind cg$FAMILLE_COMPETENCE_TRANSVER.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_FCT  := :old.ID_FCT;
    cg$rec.ID_FCT := :old.ID_FCT;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).ID_FCT := :old.ID_FCT;
    cg$rec.CODE_MCP := :old.CODE_MCP;
    cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(cg$FAMILLE_COMPETENCE_TRANSVER.idx).CODE_MCP := :old.CODE_MCP;


    cg$FAMILLE_COMPETENCE_TRANSVER.idx := cg$FAMILLE_COMPETENCE_TRANSVER.idx + 1;

    if not (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) then
        cg$FAMILLE_COMPETENCE_TRANSVER.validate_domain_cascade_delete(cg$rec);   
        cg$FAMILLE_COMPETENCE_TRANSVER.del(cg$pk, FALSE);
        cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_FAMILLE_COMPETENCE_TRAN, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_FAMILLE_COMPETENCE_TRAN
AFTER DELETE ON FAMILLE_COMPETENCE_TRANSVERSAL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_FAMILLE_COMPETENCE_TRAN
/

PROMPT Creating After Delete Statement Trigger on 'FAMILLE_COMPETENCE_TRANSVERSAL'
CREATE OR REPLACE TRIGGER cg$ADS_FAMILLE_COMPETENCE_TRAN
AFTER DELETE ON FAMILLE_COMPETENCE_TRANSVERSAL
DECLARE
    idx        BINARY_INTEGER := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.FIRST;
    cg$rec   cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
    cg$old_rec   cg$FAMILLE_COMPETENCE_TRANSVER.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$FAMILLE_COMPETENCE_TRANSVER.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FCT := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ID_FCT;
            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx).ID_FCT := TRUE;
            cg$rec.CODE_MCP := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).CODE_MCP;
            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx).CODE_MCP := TRUE;
            cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESIGNATION;
            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).ORDRE;
            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table(idx).DESCRIPTION;
            cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$FAMILLE_COMPETENCE_TRANSVER.validate_foreign_keys_del(cg$rec);
            cg$FAMILLE_COMPETENCE_TRANSVER.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FAMILLE_COMPETENCE_TRANSVER.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$FAMILLE_COMPETENCE_TRANSVER.cascade_delete(cg$rec);
            cg$FAMILLE_COMPETENCE_TRANSVER.domain_cascade_delete(cg$rec);             

            idx := cg$FAMILLE_COMPETENCE_TRANSVER.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



