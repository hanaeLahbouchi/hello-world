
PROMPT Creating Trigger Logic for Table 'CAPACITE'
PROMPT Creating Before Insert Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BIS_CAPACITE
BEFORE INSERT ON CAPACITE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CAPACITE.cg$table.DELETE;
    cg$CAPACITE.cg$tableind.DELETE;
    cg$CAPACITE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BIR_CAPACITE
BEFORE INSERT ON CAPACITE FOR EACH ROW
DECLARE
    cg$rec cg$CAPACITE.cg$row_type;
    cg$ind cg$CAPACITE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CAP := :new.ID_CAP;
    cg$ind.ID_CAP := TRUE;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$CAPACITE.called_from_package) then
        cg$CAPACITE.validate_arc(cg$rec);
        cg$CAPACITE.validate_domain(cg$rec);

        cg$CAPACITE.ins(cg$rec, cg$ind, FALSE);
        cg$CAPACITE.called_from_package := FALSE;
    end if;

    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_CAP := cg$rec.ID_CAP;
    cg$CAPACITE.cg$tableind(cg$CAPACITE.idx).ID_CAP := cg$ind.ID_CAP;

    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_FC := cg$rec.ID_FC;
    cg$CAPACITE.cg$tableind(cg$CAPACITE.idx).ID_FC := cg$ind.ID_FC;

    cg$CAPACITE.cg$table(cg$CAPACITE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$CAPACITE.cg$tableind(cg$CAPACITE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ORDRE := cg$rec.ORDRE;
    cg$CAPACITE.cg$tableind(cg$CAPACITE.idx).ORDRE := cg$ind.ORDRE;

    cg$CAPACITE.cg$table(cg$CAPACITE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$CAPACITE.cg$tableind(cg$CAPACITE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$CAPACITE.idx := cg$CAPACITE.idx + 1;

    :new.ID_CAP := cg$rec.ID_CAP;
    :new.ID_FC := cg$rec.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_CAPACITE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CAPACITE
AFTER INSERT ON CAPACITE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CAPACITE
/

PROMPT Creating After Insert Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$AIS_CAPACITE
AFTER INSERT ON CAPACITE
DECLARE
    idx      BINARY_INTEGER := cg$CAPACITE.cg$table.FIRST;
    cg$rec   cg$CAPACITE.cg$row_type;
    cg$old_rec   cg$CAPACITE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CAPACITE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CAP := cg$CAPACITE.cg$table(idx).ID_CAP;
            cg$rec.ID_FC := cg$CAPACITE.cg$table(idx).ID_FC;
            cg$rec.DESIGNATION := cg$CAPACITE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$CAPACITE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$CAPACITE.cg$table(idx).DESCRIPTION;

            cg$CAPACITE.validate_foreign_keys_ins(cg$rec);

            cg$CAPACITE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CAPACITE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$CAPACITE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BUS_CAPACITE
BEFORE UPDATE ON CAPACITE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CAPACITE.cg$table.DELETE;
    cg$CAPACITE.cg$tableind.DELETE;
    cg$CAPACITE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BUR_CAPACITE
BEFORE UPDATE ON CAPACITE FOR EACH ROW
DECLARE
    cg$rec     cg$CAPACITE.cg$row_type;
    cg$ind     cg$CAPACITE.cg$ind_type;
    cg$old_rec cg$CAPACITE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_CAP := :new.ID_CAP;
    cg$ind.ID_CAP :=    (:new.ID_CAP IS NULL AND :old.ID_CAP IS NOT NULL )
                        OR (:new.ID_CAP IS NOT NULL AND :old.ID_CAP IS NULL)
                        OR NOT(:new.ID_CAP = :old.ID_CAP) ;
    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_CAP := :old.ID_CAP;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_FC := :old.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$CAPACITE.idx := cg$CAPACITE.idx + 1;

    if not (cg$CAPACITE.called_from_package) then
        cg$CAPACITE.validate_arc(cg$rec);
        cg$CAPACITE.validate_domain(cg$rec, cg$ind);
        cg$CAPACITE.validate_domain_cascade_update(cg$old_rec);   

        cg$CAPACITE.upd(cg$rec, cg$ind, FALSE);
        cg$CAPACITE.called_from_package := FALSE;
    end if;

    :new.ID_FC := cg$rec.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_CAPACITE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CAPACITE
AFTER UPDATE ON CAPACITE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CAPACITE
/






PROMPT Creating After Update Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$AUS_CAPACITE
AFTER UPDATE ON CAPACITE
DECLARE
    idx        BINARY_INTEGER := cg$CAPACITE.cg$table.FIRST;
    cg$old_rec cg$CAPACITE.cg$row_type;
    cg$rec     cg$CAPACITE.cg$row_type;
    cg$ind     cg$CAPACITE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_CAP := cg$CAPACITE.cg$table(idx).ID_CAP;
        cg$old_rec.ID_FC := cg$CAPACITE.cg$table(idx).ID_FC;
        cg$old_rec.DESIGNATION := cg$CAPACITE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$CAPACITE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$CAPACITE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$CAPACITE.called_from_package) THEN
        idx := cg$CAPACITE.cg$table.NEXT(idx);
        cg$rec.ID_CAP := cg$CAPACITE.cg$table(idx).ID_CAP;
        cg$ind.ID_CAP := updating('ID_CAP');
        cg$rec.ID_FC := cg$CAPACITE.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.DESIGNATION := cg$CAPACITE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$CAPACITE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$CAPACITE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$CAPACITE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$CAPACITE.upd_denorm2( cg$rec,
                                       cg$CAPACITE.cg$tableind(idx)
                                     );
        cg$CAPACITE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$CAPACITE.cg$tableind(idx)
								                  );
        cg$CAPACITE.cascade_update(cg$rec, cg$old_rec);
        cg$CAPACITE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$CAPACITE.called_from_package := FALSE;
	END IF;
        idx := cg$CAPACITE.cg$table.NEXT(idx);
    END LOOP;

    cg$CAPACITE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BDS_CAPACITE
BEFORE DELETE ON CAPACITE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CAPACITE.cg$table.DELETE;
    cg$CAPACITE.cg$tableind.DELETE;
    cg$CAPACITE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$BDR_CAPACITE
BEFORE DELETE ON CAPACITE FOR EACH ROW
DECLARE
    cg$pk cg$CAPACITE.cg$pk_type;
    cg$rec cg$CAPACITE.cg$row_type;
    cg$ind cg$CAPACITE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_CAP  := :old.ID_CAP;
    cg$rec.ID_CAP := :old.ID_CAP;
    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_CAP := :old.ID_CAP;
    cg$rec.ID_FC := :old.ID_FC;
    cg$CAPACITE.cg$table(cg$CAPACITE.idx).ID_FC := :old.ID_FC;


    cg$CAPACITE.idx := cg$CAPACITE.idx + 1;

    if not (cg$CAPACITE.called_from_package) then
        cg$CAPACITE.validate_domain_cascade_delete(cg$rec);   
        cg$CAPACITE.del(cg$pk, FALSE);
        cg$CAPACITE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CAPACITE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CAPACITE
AFTER DELETE ON CAPACITE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CAPACITE
/

PROMPT Creating After Delete Statement Trigger on 'CAPACITE'
CREATE OR REPLACE TRIGGER cg$ADS_CAPACITE
AFTER DELETE ON CAPACITE
DECLARE
    idx        BINARY_INTEGER := cg$CAPACITE.cg$table.FIRST;
    cg$rec   cg$CAPACITE.cg$row_type;
    cg$old_rec   cg$CAPACITE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CAPACITE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_CAP := cg$CAPACITE.cg$table(idx).ID_CAP;
            cg$CAPACITE.cg$tableind(idx).ID_CAP := TRUE;
            cg$rec.ID_FC := cg$CAPACITE.cg$table(idx).ID_FC;
            cg$CAPACITE.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.DESIGNATION := cg$CAPACITE.cg$table(idx).DESIGNATION;
            cg$CAPACITE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$CAPACITE.cg$table(idx).ORDRE;
            cg$CAPACITE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$CAPACITE.cg$table(idx).DESCRIPTION;
            cg$CAPACITE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$CAPACITE.validate_foreign_keys_del(cg$rec);
            cg$CAPACITE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CAPACITE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$CAPACITE.cascade_delete(cg$rec);
            cg$CAPACITE.domain_cascade_delete(cg$rec);             

            idx := cg$CAPACITE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



