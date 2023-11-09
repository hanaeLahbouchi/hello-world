
PROMPT Creating Trigger Logic for Table 'COMPETENCE_TRANSVERSALE'
PROMPT Creating Before Insert Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BIS_COMPETENCE_TRANSVERSALE
BEFORE INSERT ON COMPETENCE_TRANSVERSALE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$COMPETENCE_TRANSVERSALE.cg$table.DELETE;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind.DELETE;
    cg$COMPETENCE_TRANSVERSALE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BIR_COMPETENCE_TRANSVERSALE
BEFORE INSERT ON COMPETENCE_TRANSVERSALE FOR EACH ROW
DECLARE
    cg$rec cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$ind cg$COMPETENCE_TRANSVERSALE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT := TRUE;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP := TRUE;
    cg$rec.ID_FCT := :new.ID_FCT;
    cg$ind.ID_FCT := TRUE;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.CODE_COMPETENCE := :new.CODE_COMPETENCE;
    cg$ind.CODE_COMPETENCE := TRUE;
    cg$rec.STD_PERSO := :new.STD_PERSO;
    cg$ind.STD_PERSO := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$COMPETENCE_TRANSVERSALE.called_from_package) then
        cg$COMPETENCE_TRANSVERSALE.validate_arc(cg$rec);
        cg$COMPETENCE_TRANSVERSALE.validate_domain(cg$rec);

        cg$COMPETENCE_TRANSVERSALE.ins(cg$rec, cg$ind, FALSE);
        cg$COMPETENCE_TRANSVERSALE.called_from_package := FALSE;
    end if;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_CPTT := cg$rec.ID_CPTT;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).ID_CPTT := cg$ind.ID_CPTT;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).CODE_MCP := cg$rec.CODE_MCP;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).CODE_MCP := cg$ind.CODE_MCP;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_FCT := cg$rec.ID_FCT;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).ID_FCT := cg$ind.ID_FCT;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_SPC := cg$rec.ID_SPC;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).ID_SPC := cg$ind.ID_SPC;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).CODE_COMPETENCE := cg$rec.CODE_COMPETENCE;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).CODE_COMPETENCE := cg$ind.CODE_COMPETENCE;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).STD_PERSO := cg$rec.STD_PERSO;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).STD_PERSO := cg$ind.STD_PERSO;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ORDRE := cg$rec.ORDRE;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).ORDRE := cg$ind.ORDRE;

    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind(cg$COMPETENCE_TRANSVERSALE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$COMPETENCE_TRANSVERSALE.idx := cg$COMPETENCE_TRANSVERSALE.idx + 1;

    :new.ID_CPTT := cg$rec.ID_CPTT;
    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.ID_FCT := cg$rec.ID_FCT;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.CODE_COMPETENCE := cg$rec.CODE_COMPETENCE;
    :new.STD_PERSO := cg$rec.STD_PERSO;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_COMPETENCE_TRANSVERSALE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_COMPETENCE_TRANSVERSALE
AFTER INSERT ON COMPETENCE_TRANSVERSALE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_COMPETENCE_TRANSVERSALE
/

PROMPT Creating After Insert Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$AIS_COMPETENCE_TRANSVERSALE
AFTER INSERT ON COMPETENCE_TRANSVERSALE
DECLARE
    idx      BINARY_INTEGER := cg$COMPETENCE_TRANSVERSALE.cg$table.FIRST;
    cg$rec   cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$old_rec   cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$COMPETENCE_TRANSVERSALE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CPTT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_CPTT;
            cg$rec.CODE_MCP := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_MCP;
            cg$rec.ID_FCT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_FCT;
            cg$rec.ID_SPC := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_SPC;
            cg$rec.CODE_COMPETENCE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_COMPETENCE;
            cg$rec.STD_PERSO := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).STD_PERSO;
            cg$rec.DESIGNATION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESCRIPTION;

            cg$COMPETENCE_TRANSVERSALE.validate_foreign_keys_ins(cg$rec);

            cg$COMPETENCE_TRANSVERSALE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$COMPETENCE_TRANSVERSALE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BUS_COMPETENCE_TRANSVERSALE
BEFORE UPDATE ON COMPETENCE_TRANSVERSALE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$COMPETENCE_TRANSVERSALE.cg$table.DELETE;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind.DELETE;
    cg$COMPETENCE_TRANSVERSALE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BUR_COMPETENCE_TRANSVERSALE
BEFORE UPDATE ON COMPETENCE_TRANSVERSALE FOR EACH ROW
DECLARE
    cg$rec     cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$ind     cg$COMPETENCE_TRANSVERSALE.cg$ind_type;
    cg$old_rec cg$COMPETENCE_TRANSVERSALE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT :=    (:new.ID_CPTT IS NULL AND :old.ID_CPTT IS NOT NULL )
                        OR (:new.ID_CPTT IS NOT NULL AND :old.ID_CPTT IS NULL)
                        OR NOT(:new.ID_CPTT = :old.ID_CPTT) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_CPTT := :old.ID_CPTT;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP :=    (:new.CODE_MCP IS NULL AND :old.CODE_MCP IS NOT NULL )
                        OR (:new.CODE_MCP IS NOT NULL AND :old.CODE_MCP IS NULL)
                        OR NOT(:new.CODE_MCP = :old.CODE_MCP) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).CODE_MCP := :old.CODE_MCP;
    cg$rec.ID_FCT := :new.ID_FCT;
    cg$ind.ID_FCT :=    (:new.ID_FCT IS NULL AND :old.ID_FCT IS NOT NULL )
                        OR (:new.ID_FCT IS NOT NULL AND :old.ID_FCT IS NULL)
                        OR NOT(:new.ID_FCT = :old.ID_FCT) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_FCT := :old.ID_FCT;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_SPC := :old.ID_SPC;
    cg$rec.CODE_COMPETENCE := :new.CODE_COMPETENCE;
    cg$ind.CODE_COMPETENCE :=    (:new.CODE_COMPETENCE IS NULL AND :old.CODE_COMPETENCE IS NOT NULL )
                        OR (:new.CODE_COMPETENCE IS NOT NULL AND :old.CODE_COMPETENCE IS NULL)
                        OR NOT(:new.CODE_COMPETENCE = :old.CODE_COMPETENCE) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).CODE_COMPETENCE := :old.CODE_COMPETENCE;
    cg$rec.STD_PERSO := :new.STD_PERSO;
    cg$ind.STD_PERSO :=    (:new.STD_PERSO IS NULL AND :old.STD_PERSO IS NOT NULL )
                        OR (:new.STD_PERSO IS NOT NULL AND :old.STD_PERSO IS NULL)
                        OR NOT(:new.STD_PERSO = :old.STD_PERSO) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).STD_PERSO := :old.STD_PERSO;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$COMPETENCE_TRANSVERSALE.idx := cg$COMPETENCE_TRANSVERSALE.idx + 1;

    if not (cg$COMPETENCE_TRANSVERSALE.called_from_package) then
        cg$COMPETENCE_TRANSVERSALE.validate_arc(cg$rec);
        cg$COMPETENCE_TRANSVERSALE.validate_domain(cg$rec, cg$ind);
        cg$COMPETENCE_TRANSVERSALE.validate_domain_cascade_update(cg$old_rec);   

        cg$COMPETENCE_TRANSVERSALE.upd(cg$rec, cg$ind, FALSE);
        cg$COMPETENCE_TRANSVERSALE.called_from_package := FALSE;
    end if;

    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.ID_FCT := cg$rec.ID_FCT;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.CODE_COMPETENCE := cg$rec.CODE_COMPETENCE;
    :new.STD_PERSO := cg$rec.STD_PERSO;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_COMPETENCE_TRANSVERSALE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_COMPETENCE_TRANSVERSALE
AFTER UPDATE ON COMPETENCE_TRANSVERSALE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_COMPETENCE_TRANSVERSALE
/






PROMPT Creating After Update Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$AUS_COMPETENCE_TRANSVERSALE
AFTER UPDATE ON COMPETENCE_TRANSVERSALE
DECLARE
    idx        BINARY_INTEGER := cg$COMPETENCE_TRANSVERSALE.cg$table.FIRST;
    cg$old_rec cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$rec     cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$ind     cg$COMPETENCE_TRANSVERSALE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_CPTT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_CPTT;
        cg$old_rec.CODE_MCP := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_MCP;
        cg$old_rec.ID_FCT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_FCT;
        cg$old_rec.ID_SPC := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_SPC;
        cg$old_rec.CODE_COMPETENCE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_COMPETENCE;
        cg$old_rec.STD_PERSO := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).STD_PERSO;
        cg$old_rec.DESIGNATION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$COMPETENCE_TRANSVERSALE.called_from_package) THEN
        idx := cg$COMPETENCE_TRANSVERSALE.cg$table.NEXT(idx);
        cg$rec.ID_CPTT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_CPTT;
        cg$ind.ID_CPTT := updating('ID_CPTT');
        cg$rec.CODE_MCP := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_MCP;
        cg$ind.CODE_MCP := updating('CODE_MCP');
        cg$rec.ID_FCT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_FCT;
        cg$ind.ID_FCT := updating('ID_FCT');
        cg$rec.ID_SPC := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.CODE_COMPETENCE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_COMPETENCE;
        cg$ind.CODE_COMPETENCE := updating('CODE_COMPETENCE');
        cg$rec.STD_PERSO := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).STD_PERSO;
        cg$ind.STD_PERSO := updating('STD_PERSO');
        cg$rec.DESIGNATION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$COMPETENCE_TRANSVERSALE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$COMPETENCE_TRANSVERSALE.upd_denorm2( cg$rec,
                                       cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx)
                                     );
        cg$COMPETENCE_TRANSVERSALE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx)
								                  );
        cg$COMPETENCE_TRANSVERSALE.cascade_update(cg$rec, cg$old_rec);
        cg$COMPETENCE_TRANSVERSALE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$COMPETENCE_TRANSVERSALE.called_from_package := FALSE;
	END IF;
        idx := cg$COMPETENCE_TRANSVERSALE.cg$table.NEXT(idx);
    END LOOP;

    cg$COMPETENCE_TRANSVERSALE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BDS_COMPETENCE_TRANSVERSALE
BEFORE DELETE ON COMPETENCE_TRANSVERSALE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$COMPETENCE_TRANSVERSALE.cg$table.DELETE;
    cg$COMPETENCE_TRANSVERSALE.cg$tableind.DELETE;
    cg$COMPETENCE_TRANSVERSALE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$BDR_COMPETENCE_TRANSVERSALE
BEFORE DELETE ON COMPETENCE_TRANSVERSALE FOR EACH ROW
DECLARE
    cg$pk cg$COMPETENCE_TRANSVERSALE.cg$pk_type;
    cg$rec cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$ind cg$COMPETENCE_TRANSVERSALE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_CPTT  := :old.ID_CPTT;
    cg$rec.ID_CPTT := :old.ID_CPTT;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_CPTT := :old.ID_CPTT;
    cg$rec.CODE_MCP := :old.CODE_MCP;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).CODE_MCP := :old.CODE_MCP;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_SPC := :old.ID_SPC;
    cg$rec.ID_FCT := :old.ID_FCT;
    cg$COMPETENCE_TRANSVERSALE.cg$table(cg$COMPETENCE_TRANSVERSALE.idx).ID_FCT := :old.ID_FCT;


    cg$COMPETENCE_TRANSVERSALE.idx := cg$COMPETENCE_TRANSVERSALE.idx + 1;

    if not (cg$COMPETENCE_TRANSVERSALE.called_from_package) then
        cg$COMPETENCE_TRANSVERSALE.validate_domain_cascade_delete(cg$rec);   
        cg$COMPETENCE_TRANSVERSALE.del(cg$pk, FALSE);
        cg$COMPETENCE_TRANSVERSALE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_COMPETENCE_TRANSVERSALE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_COMPETENCE_TRANSVERSALE
AFTER DELETE ON COMPETENCE_TRANSVERSALE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_COMPETENCE_TRANSVERSALE
/

PROMPT Creating After Delete Statement Trigger on 'COMPETENCE_TRANSVERSALE'
CREATE OR REPLACE TRIGGER cg$ADS_COMPETENCE_TRANSVERSALE
AFTER DELETE ON COMPETENCE_TRANSVERSALE
DECLARE
    idx        BINARY_INTEGER := cg$COMPETENCE_TRANSVERSALE.cg$table.FIRST;
    cg$rec   cg$COMPETENCE_TRANSVERSALE.cg$row_type;
    cg$old_rec   cg$COMPETENCE_TRANSVERSALE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$COMPETENCE_TRANSVERSALE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CPTT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_CPTT;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).ID_CPTT := TRUE;
            cg$rec.CODE_MCP := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_MCP;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).CODE_MCP := TRUE;
            cg$rec.ID_FCT := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_FCT;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).ID_FCT := TRUE;
            cg$rec.ID_SPC := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ID_SPC;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.CODE_COMPETENCE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).CODE_COMPETENCE;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).CODE_COMPETENCE := TRUE;
            cg$rec.STD_PERSO := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).STD_PERSO;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).STD_PERSO := TRUE;
            cg$rec.DESIGNATION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESIGNATION;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).ORDRE;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$COMPETENCE_TRANSVERSALE.cg$table(idx).DESCRIPTION;
            cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$COMPETENCE_TRANSVERSALE.validate_foreign_keys_del(cg$rec);
            cg$COMPETENCE_TRANSVERSALE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPETENCE_TRANSVERSALE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$COMPETENCE_TRANSVERSALE.cascade_delete(cg$rec);
            cg$COMPETENCE_TRANSVERSALE.domain_cascade_delete(cg$rec);             

            idx := cg$COMPETENCE_TRANSVERSALE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



