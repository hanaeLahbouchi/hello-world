
PROMPT Creating Trigger Logic for Table 'COMPETENCE'
PROMPT Creating Before Insert Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIS_COMPETENCE
BEFORE INSERT ON COMPETENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$COMPETENCE.cg$table.DELETE;
    cg$COMPETENCE.cg$tableind.DELETE;
    cg$COMPETENCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIR_COMPETENCE
BEFORE INSERT ON COMPETENCE FOR EACH ROW
DECLARE
    cg$rec cg$COMPETENCE.cg$row_type;
    cg$ind cg$COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT := TRUE;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE := TRUE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$COMPETENCE.called_from_package) then
        cg$COMPETENCE.validate_arc(cg$rec);
        cg$COMPETENCE.validate_domain(cg$rec);

        cg$COMPETENCE.ins(cg$rec, cg$ind, FALSE);
        cg$COMPETENCE.called_from_package := FALSE;
    end if;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_CPT := cg$rec.ID_CPT;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).ID_CPT := cg$ind.ID_CPT;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_FC := cg$rec.ID_FC;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).ID_FC := cg$ind.ID_FC;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).TYPE_COMPETENCE := cg$ind.TYPE_COMPETENCE;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ORDRE := cg$rec.ORDRE;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).ORDRE := cg$ind.ORDRE;

    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$COMPETENCE.cg$tableind(cg$COMPETENCE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$COMPETENCE.idx := cg$COMPETENCE.idx + 1;

    :new.ID_CPT := cg$rec.ID_CPT;
    :new.ID_FC := cg$rec.ID_FC;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_COMPETENCE
AFTER INSERT ON COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_COMPETENCE
/

PROMPT Creating After Insert Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AIS_COMPETENCE
AFTER INSERT ON COMPETENCE
DECLARE
    idx      BINARY_INTEGER := cg$COMPETENCE.cg$table.FIRST;
    cg$rec   cg$COMPETENCE.cg$row_type;
    cg$old_rec   cg$COMPETENCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CPT := cg$COMPETENCE.cg$table(idx).ID_CPT;
            cg$rec.ID_FC := cg$COMPETENCE.cg$table(idx).ID_FC;
            cg$rec.TYPE_COMPETENCE := cg$COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$rec.DESIGNATION := cg$COMPETENCE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$COMPETENCE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$COMPETENCE.cg$table(idx).DESCRIPTION;

            cg$COMPETENCE.validate_foreign_keys_ins(cg$rec);

            cg$COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPETENCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUS_COMPETENCE
BEFORE UPDATE ON COMPETENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$COMPETENCE.cg$table.DELETE;
    cg$COMPETENCE.cg$tableind.DELETE;
    cg$COMPETENCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUR_COMPETENCE
BEFORE UPDATE ON COMPETENCE FOR EACH ROW
DECLARE
    cg$rec     cg$COMPETENCE.cg$row_type;
    cg$ind     cg$COMPETENCE.cg$ind_type;
    cg$old_rec cg$COMPETENCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT :=    (:new.ID_CPT IS NULL AND :old.ID_CPT IS NOT NULL )
                        OR (:new.ID_CPT IS NOT NULL AND :old.ID_CPT IS NULL)
                        OR NOT(:new.ID_CPT = :old.ID_CPT) ;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_FC := :old.ID_FC;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE :=    (:new.TYPE_COMPETENCE IS NULL AND :old.TYPE_COMPETENCE IS NOT NULL )
                        OR (:new.TYPE_COMPETENCE IS NOT NULL AND :old.TYPE_COMPETENCE IS NULL)
                        OR NOT(:new.TYPE_COMPETENCE = :old.TYPE_COMPETENCE) ;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).TYPE_COMPETENCE := :old.TYPE_COMPETENCE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$COMPETENCE.idx := cg$COMPETENCE.idx + 1;

    if not (cg$COMPETENCE.called_from_package) then
        cg$COMPETENCE.validate_arc(cg$rec);
        cg$COMPETENCE.validate_domain(cg$rec, cg$ind);
        cg$COMPETENCE.validate_domain_cascade_update(cg$old_rec);   

        cg$COMPETENCE.upd(cg$rec, cg$ind, FALSE);
        cg$COMPETENCE.called_from_package := FALSE;
    end if;

    :new.ID_FC := cg$rec.ID_FC;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_COMPETENCE
AFTER UPDATE ON COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_COMPETENCE
/






PROMPT Creating After Update Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AUS_COMPETENCE
AFTER UPDATE ON COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$COMPETENCE.cg$table.FIRST;
    cg$old_rec cg$COMPETENCE.cg$row_type;
    cg$rec     cg$COMPETENCE.cg$row_type;
    cg$ind     cg$COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_CPT := cg$COMPETENCE.cg$table(idx).ID_CPT;
        cg$old_rec.ID_FC := cg$COMPETENCE.cg$table(idx).ID_FC;
        cg$old_rec.TYPE_COMPETENCE := cg$COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$old_rec.DESIGNATION := cg$COMPETENCE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$COMPETENCE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$COMPETENCE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$COMPETENCE.called_from_package) THEN
        idx := cg$COMPETENCE.cg$table.NEXT(idx);
        cg$rec.ID_CPT := cg$COMPETENCE.cg$table(idx).ID_CPT;
        cg$ind.ID_CPT := updating('ID_CPT');
        cg$rec.ID_FC := cg$COMPETENCE.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.TYPE_COMPETENCE := cg$COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$ind.TYPE_COMPETENCE := updating('TYPE_COMPETENCE');
        cg$rec.DESIGNATION := cg$COMPETENCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$COMPETENCE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$COMPETENCE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$COMPETENCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$COMPETENCE.upd_denorm2( cg$rec,
                                       cg$COMPETENCE.cg$tableind(idx)
                                     );
        cg$COMPETENCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$COMPETENCE.cg$tableind(idx)
								                  );
        cg$COMPETENCE.cascade_update(cg$rec, cg$old_rec);
        cg$COMPETENCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$COMPETENCE.called_from_package := FALSE;
	END IF;
        idx := cg$COMPETENCE.cg$table.NEXT(idx);
    END LOOP;

    cg$COMPETENCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDS_COMPETENCE
BEFORE DELETE ON COMPETENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$COMPETENCE.cg$table.DELETE;
    cg$COMPETENCE.cg$tableind.DELETE;
    cg$COMPETENCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDR_COMPETENCE
BEFORE DELETE ON COMPETENCE FOR EACH ROW
DECLARE
    cg$pk cg$COMPETENCE.cg$pk_type;
    cg$rec cg$COMPETENCE.cg$row_type;
    cg$ind cg$COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_CPT  := :old.ID_CPT;
    cg$rec.ID_CPT := :old.ID_CPT;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_FC := :old.ID_FC;
    cg$COMPETENCE.cg$table(cg$COMPETENCE.idx).ID_FC := :old.ID_FC;


    cg$COMPETENCE.idx := cg$COMPETENCE.idx + 1;

    if not (cg$COMPETENCE.called_from_package) then
        cg$COMPETENCE.validate_domain_cascade_delete(cg$rec);   
        cg$COMPETENCE.del(cg$pk, FALSE);
        cg$COMPETENCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_COMPETENCE
AFTER DELETE ON COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_COMPETENCE
/

PROMPT Creating After Delete Statement Trigger on 'COMPETENCE'
CREATE OR REPLACE TRIGGER cg$ADS_COMPETENCE
AFTER DELETE ON COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$COMPETENCE.cg$table.FIRST;
    cg$rec   cg$COMPETENCE.cg$row_type;
    cg$old_rec   cg$COMPETENCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CPT := cg$COMPETENCE.cg$table(idx).ID_CPT;
            cg$COMPETENCE.cg$tableind(idx).ID_CPT := TRUE;
            cg$rec.ID_FC := cg$COMPETENCE.cg$table(idx).ID_FC;
            cg$COMPETENCE.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.TYPE_COMPETENCE := cg$COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$COMPETENCE.cg$tableind(idx).TYPE_COMPETENCE := TRUE;
            cg$rec.DESIGNATION := cg$COMPETENCE.cg$table(idx).DESIGNATION;
            cg$COMPETENCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$COMPETENCE.cg$table(idx).ORDRE;
            cg$COMPETENCE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$COMPETENCE.cg$table(idx).DESCRIPTION;
            cg$COMPETENCE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$COMPETENCE.validate_foreign_keys_del(cg$rec);
            cg$COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPETENCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$COMPETENCE.cascade_delete(cg$rec);
            cg$COMPETENCE.domain_cascade_delete(cg$rec);             

            idx := cg$COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



