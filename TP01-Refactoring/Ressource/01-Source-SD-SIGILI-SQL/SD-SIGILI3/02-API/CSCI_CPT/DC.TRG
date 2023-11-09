
PROMPT Creating Trigger Logic for Table 'DOMAINE_COMPETENCE'
PROMPT Creating Before Insert Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIS_DOMAINE_COMPETENCE
BEFORE INSERT ON DOMAINE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$DOMAINE_COMPETENCE.cg$table.DELETE;
    cg$DOMAINE_COMPETENCE.cg$tableind.DELETE;
    cg$DOMAINE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIR_DOMAINE_COMPETENCE
BEFORE INSERT ON DOMAINE_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$ind cg$DOMAINE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC := TRUE;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP := TRUE;
    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE := TRUE;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$DOMAINE_COMPETENCE.called_from_package) then
        cg$DOMAINE_COMPETENCE.validate_arc(cg$rec);
        cg$DOMAINE_COMPETENCE.validate_domain(cg$rec);

        cg$DOMAINE_COMPETENCE.ins(cg$rec, cg$ind, FALSE);
        cg$DOMAINE_COMPETENCE.called_from_package := FALSE;
    end if;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_DC := cg$rec.ID_DC;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).ID_DC := cg$ind.ID_DC;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).CODE_MCP := cg$rec.CODE_MCP;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).CODE_MCP := cg$ind.CODE_MCP;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_UE := cg$rec.ID_UE;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).ID_UE := cg$ind.ID_UE;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).TYPE_COMPETENCE := cg$ind.TYPE_COMPETENCE;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ORDRE := cg$rec.ORDRE;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).ORDRE := cg$ind.ORDRE;

    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$DOMAINE_COMPETENCE.cg$tableind(cg$DOMAINE_COMPETENCE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$DOMAINE_COMPETENCE.idx := cg$DOMAINE_COMPETENCE.idx + 1;

    :new.ID_DC := cg$rec.ID_DC;
    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.ID_UE := cg$rec.ID_UE;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_DOMAINE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_DOMAINE_COMPETENCE
AFTER INSERT ON DOMAINE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_DOMAINE_COMPETENCE
/

PROMPT Creating After Insert Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AIS_DOMAINE_COMPETENCE
AFTER INSERT ON DOMAINE_COMPETENCE
DECLARE
    idx      BINARY_INTEGER := cg$DOMAINE_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$old_rec   cg$DOMAINE_COMPETENCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$DOMAINE_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_DC := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_DC;
            cg$rec.CODE_MCP := cg$DOMAINE_COMPETENCE.cg$table(idx).CODE_MCP;
            cg$rec.ID_UE := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_UE;
            cg$rec.TYPE_COMPETENCE := cg$DOMAINE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$rec.DESIGNATION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$DOMAINE_COMPETENCE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESCRIPTION;

            cg$DOMAINE_COMPETENCE.validate_foreign_keys_ins(cg$rec);

            cg$DOMAINE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DOMAINE_COMPETENCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$DOMAINE_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUS_DOMAINE_COMPETENCE
BEFORE UPDATE ON DOMAINE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$DOMAINE_COMPETENCE.cg$table.DELETE;
    cg$DOMAINE_COMPETENCE.cg$tableind.DELETE;
    cg$DOMAINE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUR_DOMAINE_COMPETENCE
BEFORE UPDATE ON DOMAINE_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec     cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$ind     cg$DOMAINE_COMPETENCE.cg$ind_type;
    cg$old_rec cg$DOMAINE_COMPETENCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC :=    (:new.ID_DC IS NULL AND :old.ID_DC IS NOT NULL )
                        OR (:new.ID_DC IS NOT NULL AND :old.ID_DC IS NULL)
                        OR NOT(:new.ID_DC = :old.ID_DC) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_DC := :old.ID_DC;
    cg$rec.CODE_MCP := :new.CODE_MCP;
    cg$ind.CODE_MCP :=    (:new.CODE_MCP IS NULL AND :old.CODE_MCP IS NOT NULL )
                        OR (:new.CODE_MCP IS NOT NULL AND :old.CODE_MCP IS NULL)
                        OR NOT(:new.CODE_MCP = :old.CODE_MCP) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).CODE_MCP := :old.CODE_MCP;
    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE :=    (:new.ID_UE IS NULL AND :old.ID_UE IS NOT NULL )
                        OR (:new.ID_UE IS NOT NULL AND :old.ID_UE IS NULL)
                        OR NOT(:new.ID_UE = :old.ID_UE) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_UE := :old.ID_UE;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE :=    (:new.TYPE_COMPETENCE IS NULL AND :old.TYPE_COMPETENCE IS NOT NULL )
                        OR (:new.TYPE_COMPETENCE IS NOT NULL AND :old.TYPE_COMPETENCE IS NULL)
                        OR NOT(:new.TYPE_COMPETENCE = :old.TYPE_COMPETENCE) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).TYPE_COMPETENCE := :old.TYPE_COMPETENCE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$DOMAINE_COMPETENCE.idx := cg$DOMAINE_COMPETENCE.idx + 1;

    if not (cg$DOMAINE_COMPETENCE.called_from_package) then
        cg$DOMAINE_COMPETENCE.validate_arc(cg$rec);
        cg$DOMAINE_COMPETENCE.validate_domain(cg$rec, cg$ind);
        cg$DOMAINE_COMPETENCE.validate_domain_cascade_update(cg$old_rec);   

        cg$DOMAINE_COMPETENCE.upd(cg$rec, cg$ind, FALSE);
        cg$DOMAINE_COMPETENCE.called_from_package := FALSE;
    end if;

    :new.CODE_MCP := cg$rec.CODE_MCP;
    :new.ID_UE := cg$rec.ID_UE;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_DOMAINE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_DOMAINE_COMPETENCE
AFTER UPDATE ON DOMAINE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_DOMAINE_COMPETENCE
/






PROMPT Creating After Update Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AUS_DOMAINE_COMPETENCE
AFTER UPDATE ON DOMAINE_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$DOMAINE_COMPETENCE.cg$table.FIRST;
    cg$old_rec cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$rec     cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$ind     cg$DOMAINE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_DC := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_DC;
        cg$old_rec.CODE_MCP := cg$DOMAINE_COMPETENCE.cg$table(idx).CODE_MCP;
        cg$old_rec.ID_UE := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_UE;
        cg$old_rec.TYPE_COMPETENCE := cg$DOMAINE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$old_rec.DESIGNATION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$DOMAINE_COMPETENCE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$DOMAINE_COMPETENCE.called_from_package) THEN
        idx := cg$DOMAINE_COMPETENCE.cg$table.NEXT(idx);
        cg$rec.ID_DC := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_DC;
        cg$ind.ID_DC := updating('ID_DC');
        cg$rec.CODE_MCP := cg$DOMAINE_COMPETENCE.cg$table(idx).CODE_MCP;
        cg$ind.CODE_MCP := updating('CODE_MCP');
        cg$rec.ID_UE := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_UE;
        cg$ind.ID_UE := updating('ID_UE');
        cg$rec.TYPE_COMPETENCE := cg$DOMAINE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$ind.TYPE_COMPETENCE := updating('TYPE_COMPETENCE');
        cg$rec.DESIGNATION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$DOMAINE_COMPETENCE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$DOMAINE_COMPETENCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$DOMAINE_COMPETENCE.upd_denorm2( cg$rec,
                                       cg$DOMAINE_COMPETENCE.cg$tableind(idx)
                                     );
        cg$DOMAINE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$DOMAINE_COMPETENCE.cg$tableind(idx)
								                  );
        cg$DOMAINE_COMPETENCE.cascade_update(cg$rec, cg$old_rec);
        cg$DOMAINE_COMPETENCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$DOMAINE_COMPETENCE.called_from_package := FALSE;
	END IF;
        idx := cg$DOMAINE_COMPETENCE.cg$table.NEXT(idx);
    END LOOP;

    cg$DOMAINE_COMPETENCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDS_DOMAINE_COMPETENCE
BEFORE DELETE ON DOMAINE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$DOMAINE_COMPETENCE.cg$table.DELETE;
    cg$DOMAINE_COMPETENCE.cg$tableind.DELETE;
    cg$DOMAINE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDR_DOMAINE_COMPETENCE
BEFORE DELETE ON DOMAINE_COMPETENCE FOR EACH ROW
DECLARE
    cg$pk cg$DOMAINE_COMPETENCE.cg$pk_type;
    cg$rec cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$ind cg$DOMAINE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_DC  := :old.ID_DC;
    cg$rec.ID_DC := :old.ID_DC;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_DC := :old.ID_DC;
    cg$rec.CODE_MCP := :old.CODE_MCP;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).CODE_MCP := :old.CODE_MCP;
    cg$rec.ID_UE := :old.ID_UE;
    cg$DOMAINE_COMPETENCE.cg$table(cg$DOMAINE_COMPETENCE.idx).ID_UE := :old.ID_UE;


    cg$DOMAINE_COMPETENCE.idx := cg$DOMAINE_COMPETENCE.idx + 1;

    if not (cg$DOMAINE_COMPETENCE.called_from_package) then
        cg$DOMAINE_COMPETENCE.validate_domain_cascade_delete(cg$rec);   
        cg$DOMAINE_COMPETENCE.del(cg$pk, FALSE);
        cg$DOMAINE_COMPETENCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_DOMAINE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_DOMAINE_COMPETENCE
AFTER DELETE ON DOMAINE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_DOMAINE_COMPETENCE
/

PROMPT Creating After Delete Statement Trigger on 'DOMAINE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$ADS_DOMAINE_COMPETENCE
AFTER DELETE ON DOMAINE_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$DOMAINE_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$DOMAINE_COMPETENCE.cg$row_type;
    cg$old_rec   cg$DOMAINE_COMPETENCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$DOMAINE_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_DC := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_DC;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).ID_DC := TRUE;
            cg$rec.CODE_MCP := cg$DOMAINE_COMPETENCE.cg$table(idx).CODE_MCP;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).CODE_MCP := TRUE;
            cg$rec.ID_UE := cg$DOMAINE_COMPETENCE.cg$table(idx).ID_UE;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).ID_UE := TRUE;
            cg$rec.TYPE_COMPETENCE := cg$DOMAINE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).TYPE_COMPETENCE := TRUE;
            cg$rec.DESIGNATION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESIGNATION;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$DOMAINE_COMPETENCE.cg$table(idx).ORDRE;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$DOMAINE_COMPETENCE.cg$table(idx).DESCRIPTION;
            cg$DOMAINE_COMPETENCE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$DOMAINE_COMPETENCE.validate_foreign_keys_del(cg$rec);
            cg$DOMAINE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DOMAINE_COMPETENCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$DOMAINE_COMPETENCE.cascade_delete(cg$rec);
            cg$DOMAINE_COMPETENCE.domain_cascade_delete(cg$rec);             

            idx := cg$DOMAINE_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



