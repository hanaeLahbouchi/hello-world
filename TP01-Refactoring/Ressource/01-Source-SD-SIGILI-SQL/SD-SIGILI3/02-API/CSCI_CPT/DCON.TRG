
PROMPT Creating Trigger Logic for Table 'DOMAINE_CONNAISSANCE'
PROMPT Creating Before Insert Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BIS_DOMAINE_CONNAISSANCE
BEFORE INSERT ON DOMAINE_CONNAISSANCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$DOMAINE_CONNAISSANCE.cg$table.DELETE;
    cg$DOMAINE_CONNAISSANCE.cg$tableind.DELETE;
    cg$DOMAINE_CONNAISSANCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BIR_DOMAINE_CONNAISSANCE
BEFORE INSERT ON DOMAINE_CONNAISSANCE FOR EACH ROW
DECLARE
    cg$rec cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$ind cg$DOMAINE_CONNAISSANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_DCO := :new.ID_DCO;
    cg$ind.ID_DCO := TRUE;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION := TRUE;

    if not (cg$DOMAINE_CONNAISSANCE.called_from_package) then
        cg$DOMAINE_CONNAISSANCE.validate_arc(cg$rec);
        cg$DOMAINE_CONNAISSANCE.validate_domain(cg$rec);

        cg$DOMAINE_CONNAISSANCE.ins(cg$rec, cg$ind, FALSE);
        cg$DOMAINE_CONNAISSANCE.called_from_package := FALSE;
    end if;

    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_DCO := cg$rec.ID_DCO;
    cg$DOMAINE_CONNAISSANCE.cg$tableind(cg$DOMAINE_CONNAISSANCE.idx).ID_DCO := cg$ind.ID_DCO;

    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_FC := cg$rec.ID_FC;
    cg$DOMAINE_CONNAISSANCE.cg$tableind(cg$DOMAINE_CONNAISSANCE.idx).ID_FC := cg$ind.ID_FC;

    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$DOMAINE_CONNAISSANCE.cg$tableind(cg$DOMAINE_CONNAISSANCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ORDRE := cg$rec.ORDRE;
    cg$DOMAINE_CONNAISSANCE.cg$tableind(cg$DOMAINE_CONNAISSANCE.idx).ORDRE := cg$ind.ORDRE;

    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$DOMAINE_CONNAISSANCE.cg$tableind(cg$DOMAINE_CONNAISSANCE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$DOMAINE_CONNAISSANCE.idx := cg$DOMAINE_CONNAISSANCE.idx + 1;

    :new.ID_DCO := cg$rec.ID_DCO;
    :new.ID_FC := cg$rec.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_DOMAINE_CONNAISSANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_DOMAINE_CONNAISSANCE
AFTER INSERT ON DOMAINE_CONNAISSANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_DOMAINE_CONNAISSANCE
/

PROMPT Creating After Insert Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$AIS_DOMAINE_CONNAISSANCE
AFTER INSERT ON DOMAINE_CONNAISSANCE
DECLARE
    idx      BINARY_INTEGER := cg$DOMAINE_CONNAISSANCE.cg$table.FIRST;
    cg$rec   cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$old_rec   cg$DOMAINE_CONNAISSANCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$DOMAINE_CONNAISSANCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_DCO := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_DCO;
            cg$rec.ID_FC := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_FC;
            cg$rec.DESIGNATION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESCRIPTION;

            cg$DOMAINE_CONNAISSANCE.validate_foreign_keys_ins(cg$rec);

            cg$DOMAINE_CONNAISSANCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DOMAINE_CONNAISSANCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$DOMAINE_CONNAISSANCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BUS_DOMAINE_CONNAISSANCE
BEFORE UPDATE ON DOMAINE_CONNAISSANCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$DOMAINE_CONNAISSANCE.cg$table.DELETE;
    cg$DOMAINE_CONNAISSANCE.cg$tableind.DELETE;
    cg$DOMAINE_CONNAISSANCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BUR_DOMAINE_CONNAISSANCE
BEFORE UPDATE ON DOMAINE_CONNAISSANCE FOR EACH ROW
DECLARE
    cg$rec     cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$ind     cg$DOMAINE_CONNAISSANCE.cg$ind_type;
    cg$old_rec cg$DOMAINE_CONNAISSANCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_DCO := :new.ID_DCO;
    cg$ind.ID_DCO :=    (:new.ID_DCO IS NULL AND :old.ID_DCO IS NOT NULL )
                        OR (:new.ID_DCO IS NOT NULL AND :old.ID_DCO IS NULL)
                        OR NOT(:new.ID_DCO = :old.ID_DCO) ;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_DCO := :old.ID_DCO;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_FC := :old.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
	cg$ind.DESIGNATION := FALSE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ORDRE := :old.ORDRE;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION :=    (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL )
                        OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
                        OR NOT(:new.DESCRIPTION = :old.DESCRIPTION) ;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).DESCRIPTION := :old.DESCRIPTION;


    cg$DOMAINE_CONNAISSANCE.idx := cg$DOMAINE_CONNAISSANCE.idx + 1;

    if not (cg$DOMAINE_CONNAISSANCE.called_from_package) then
        cg$DOMAINE_CONNAISSANCE.validate_arc(cg$rec);
        cg$DOMAINE_CONNAISSANCE.validate_domain(cg$rec, cg$ind);
        cg$DOMAINE_CONNAISSANCE.validate_domain_cascade_update(cg$old_rec);   

        cg$DOMAINE_CONNAISSANCE.upd(cg$rec, cg$ind, FALSE);
        cg$DOMAINE_CONNAISSANCE.called_from_package := FALSE;
    end if;

    :new.ID_FC := cg$rec.ID_FC;
    -- Warning: Column DESIGNATION is of type CLOB and not allowed in triggers
    :new.ORDRE := cg$rec.ORDRE;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_DOMAINE_CONNAISSANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_DOMAINE_CONNAISSANCE
AFTER UPDATE ON DOMAINE_CONNAISSANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_DOMAINE_CONNAISSANCE
/






PROMPT Creating After Update Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$AUS_DOMAINE_CONNAISSANCE
AFTER UPDATE ON DOMAINE_CONNAISSANCE
DECLARE
    idx        BINARY_INTEGER := cg$DOMAINE_CONNAISSANCE.cg$table.FIRST;
    cg$old_rec cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$rec     cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$ind     cg$DOMAINE_CONNAISSANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_DCO := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_DCO;
        cg$old_rec.ID_FC := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_FC;
        cg$old_rec.DESIGNATION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$DOMAINE_CONNAISSANCE.called_from_package) THEN
        idx := cg$DOMAINE_CONNAISSANCE.cg$table.NEXT(idx);
        cg$rec.ID_DCO := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_DCO;
        cg$ind.ID_DCO := updating('ID_DCO');
        cg$rec.ID_FC := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.DESIGNATION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$DOMAINE_CONNAISSANCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$DOMAINE_CONNAISSANCE.upd_denorm2( cg$rec,
                                       cg$DOMAINE_CONNAISSANCE.cg$tableind(idx)
                                     );
        cg$DOMAINE_CONNAISSANCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx)
								                  );
        cg$DOMAINE_CONNAISSANCE.cascade_update(cg$rec, cg$old_rec);
        cg$DOMAINE_CONNAISSANCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$DOMAINE_CONNAISSANCE.called_from_package := FALSE;
	END IF;
        idx := cg$DOMAINE_CONNAISSANCE.cg$table.NEXT(idx);
    END LOOP;

    cg$DOMAINE_CONNAISSANCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BDS_DOMAINE_CONNAISSANCE
BEFORE DELETE ON DOMAINE_CONNAISSANCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$DOMAINE_CONNAISSANCE.cg$table.DELETE;
    cg$DOMAINE_CONNAISSANCE.cg$tableind.DELETE;
    cg$DOMAINE_CONNAISSANCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$BDR_DOMAINE_CONNAISSANCE
BEFORE DELETE ON DOMAINE_CONNAISSANCE FOR EACH ROW
DECLARE
    cg$pk cg$DOMAINE_CONNAISSANCE.cg$pk_type;
    cg$rec cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$ind cg$DOMAINE_CONNAISSANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_DCO  := :old.ID_DCO;
    cg$rec.ID_DCO := :old.ID_DCO;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_DCO := :old.ID_DCO;
    cg$rec.ID_FC := :old.ID_FC;
    cg$DOMAINE_CONNAISSANCE.cg$table(cg$DOMAINE_CONNAISSANCE.idx).ID_FC := :old.ID_FC;


    cg$DOMAINE_CONNAISSANCE.idx := cg$DOMAINE_CONNAISSANCE.idx + 1;

    if not (cg$DOMAINE_CONNAISSANCE.called_from_package) then
        cg$DOMAINE_CONNAISSANCE.validate_domain_cascade_delete(cg$rec);   
        cg$DOMAINE_CONNAISSANCE.del(cg$pk, FALSE);
        cg$DOMAINE_CONNAISSANCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_DOMAINE_CONNAISSANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_DOMAINE_CONNAISSANCE
AFTER DELETE ON DOMAINE_CONNAISSANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_DOMAINE_CONNAISSANCE
/

PROMPT Creating After Delete Statement Trigger on 'DOMAINE_CONNAISSANCE'
CREATE OR REPLACE TRIGGER cg$ADS_DOMAINE_CONNAISSANCE
AFTER DELETE ON DOMAINE_CONNAISSANCE
DECLARE
    idx        BINARY_INTEGER := cg$DOMAINE_CONNAISSANCE.cg$table.FIRST;
    cg$rec   cg$DOMAINE_CONNAISSANCE.cg$row_type;
    cg$old_rec   cg$DOMAINE_CONNAISSANCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$DOMAINE_CONNAISSANCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_DCO := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_DCO;
            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx).ID_DCO := TRUE;
            cg$rec.ID_FC := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ID_FC;
            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.DESIGNATION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESIGNATION;
            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$DOMAINE_CONNAISSANCE.cg$table(idx).ORDRE;
            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$DOMAINE_CONNAISSANCE.cg$table(idx).DESCRIPTION;
            cg$DOMAINE_CONNAISSANCE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$DOMAINE_CONNAISSANCE.validate_foreign_keys_del(cg$rec);
            cg$DOMAINE_CONNAISSANCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DOMAINE_CONNAISSANCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$DOMAINE_CONNAISSANCE.cascade_delete(cg$rec);
            cg$DOMAINE_CONNAISSANCE.domain_cascade_delete(cg$rec);             

            idx := cg$DOMAINE_CONNAISSANCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



