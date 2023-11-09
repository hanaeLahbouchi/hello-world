
PROMPT Creating Trigger Logic for Table 'EC'
PROMPT Creating Before Insert Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BIS_EC
BEFORE INSERT ON EC
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$EC.cg$table.DELETE;
    cg$EC.cg$tableind.DELETE;
    cg$EC.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BIR_EC
BEFORE INSERT ON EC FOR EACH ROW
DECLARE
    cg$rec cg$EC.cg$row_type;
    cg$ind cg$EC.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC := TRUE;
    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE := TRUE;
    cg$rec.SIGLE_EC := :new.SIGLE_EC;
    cg$ind.SIGLE_EC := TRUE;
    cg$rec.NO_EC := :new.NO_EC;
    cg$ind.NO_EC := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.ECTS := :new.ECTS;
    cg$ind.ECTS := TRUE;

    if not (cg$EC.called_from_package) then
        cg$EC.validate_arc(cg$rec);
        cg$EC.validate_domain(cg$rec);

        cg$EC.ins(cg$rec, cg$ind, FALSE);
        cg$EC.called_from_package := FALSE;
    end if;

    cg$EC.cg$table(cg$EC.idx).ID_EC := cg$rec.ID_EC;
    cg$EC.cg$tableind(cg$EC.idx).ID_EC := cg$ind.ID_EC;

    cg$EC.cg$table(cg$EC.idx).ID_UE := cg$rec.ID_UE;
    cg$EC.cg$tableind(cg$EC.idx).ID_UE := cg$ind.ID_UE;

    cg$EC.cg$table(cg$EC.idx).SIGLE_EC := cg$rec.SIGLE_EC;
    cg$EC.cg$tableind(cg$EC.idx).SIGLE_EC := cg$ind.SIGLE_EC;

    cg$EC.cg$table(cg$EC.idx).NO_EC := cg$rec.NO_EC;
    cg$EC.cg$tableind(cg$EC.idx).NO_EC := cg$ind.NO_EC;

    cg$EC.cg$table(cg$EC.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$EC.cg$tableind(cg$EC.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$EC.cg$table(cg$EC.idx).ECTS := cg$rec.ECTS;
    cg$EC.cg$tableind(cg$EC.idx).ECTS := cg$ind.ECTS;

    cg$EC.idx := cg$EC.idx + 1;

    :new.ID_EC := cg$rec.ID_EC;
    :new.ID_UE := cg$rec.ID_UE;
    :new.SIGLE_EC := cg$rec.SIGLE_EC;
    :new.NO_EC := cg$rec.NO_EC;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ECTS := cg$rec.ECTS;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_EC, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_EC
AFTER INSERT ON EC FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_EC
/

PROMPT Creating After Insert Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$AIS_EC
AFTER INSERT ON EC
DECLARE
    idx      BINARY_INTEGER := cg$EC.cg$table.FIRST;
    cg$rec   cg$EC.cg$row_type;
    cg$old_rec   cg$EC.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$EC.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_EC := cg$EC.cg$table(idx).ID_EC;
            cg$rec.ID_UE := cg$EC.cg$table(idx).ID_UE;
            cg$rec.SIGLE_EC := cg$EC.cg$table(idx).SIGLE_EC;
            cg$rec.NO_EC := cg$EC.cg$table(idx).NO_EC;
            cg$rec.DESIGNATION := cg$EC.cg$table(idx).DESIGNATION;
            cg$rec.ECTS := cg$EC.cg$table(idx).ECTS;

            cg$EC.validate_foreign_keys_ins(cg$rec);

            cg$EC.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EC.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$EC.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BUS_EC
BEFORE UPDATE ON EC
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$EC.cg$table.DELETE;
    cg$EC.cg$tableind.DELETE;
    cg$EC.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BUR_EC
BEFORE UPDATE ON EC FOR EACH ROW
DECLARE
    cg$rec     cg$EC.cg$row_type;
    cg$ind     cg$EC.cg$ind_type;
    cg$old_rec cg$EC.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC :=    (:new.ID_EC IS NULL AND :old.ID_EC IS NOT NULL )
                        OR (:new.ID_EC IS NOT NULL AND :old.ID_EC IS NULL)
                        OR NOT(:new.ID_EC = :old.ID_EC) ;
    cg$EC.cg$table(cg$EC.idx).ID_EC := :old.ID_EC;
    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE :=    (:new.ID_UE IS NULL AND :old.ID_UE IS NOT NULL )
                        OR (:new.ID_UE IS NOT NULL AND :old.ID_UE IS NULL)
                        OR NOT(:new.ID_UE = :old.ID_UE) ;
    cg$EC.cg$table(cg$EC.idx).ID_UE := :old.ID_UE;
    cg$rec.SIGLE_EC := :new.SIGLE_EC;
    cg$ind.SIGLE_EC :=    (:new.SIGLE_EC IS NULL AND :old.SIGLE_EC IS NOT NULL )
                        OR (:new.SIGLE_EC IS NOT NULL AND :old.SIGLE_EC IS NULL)
                        OR NOT(:new.SIGLE_EC = :old.SIGLE_EC) ;
    cg$EC.cg$table(cg$EC.idx).SIGLE_EC := :old.SIGLE_EC;
    cg$rec.NO_EC := :new.NO_EC;
    cg$ind.NO_EC :=    (:new.NO_EC IS NULL AND :old.NO_EC IS NOT NULL )
                        OR (:new.NO_EC IS NOT NULL AND :old.NO_EC IS NULL)
                        OR NOT(:new.NO_EC = :old.NO_EC) ;
    cg$EC.cg$table(cg$EC.idx).NO_EC := :old.NO_EC;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$EC.cg$table(cg$EC.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.ECTS := :new.ECTS;
    cg$ind.ECTS :=    (:new.ECTS IS NULL AND :old.ECTS IS NOT NULL )
                        OR (:new.ECTS IS NOT NULL AND :old.ECTS IS NULL)
                        OR NOT(:new.ECTS = :old.ECTS) ;
    cg$EC.cg$table(cg$EC.idx).ECTS := :old.ECTS;


    cg$EC.idx := cg$EC.idx + 1;

    if not (cg$EC.called_from_package) then
        cg$EC.validate_arc(cg$rec);
        cg$EC.validate_domain(cg$rec, cg$ind);
        cg$EC.validate_domain_cascade_update(cg$old_rec);   

        cg$EC.upd(cg$rec, cg$ind, FALSE);
        cg$EC.called_from_package := FALSE;
    end if;

    :new.ID_UE := cg$rec.ID_UE;
    :new.SIGLE_EC := cg$rec.SIGLE_EC;
    :new.NO_EC := cg$rec.NO_EC;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ECTS := cg$rec.ECTS;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_EC, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_EC
AFTER UPDATE ON EC FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_EC
/






PROMPT Creating After Update Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$AUS_EC
AFTER UPDATE ON EC
DECLARE
    idx        BINARY_INTEGER := cg$EC.cg$table.FIRST;
    cg$old_rec cg$EC.cg$row_type;
    cg$rec     cg$EC.cg$row_type;
    cg$ind     cg$EC.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_EC := cg$EC.cg$table(idx).ID_EC;
        cg$old_rec.ID_UE := cg$EC.cg$table(idx).ID_UE;
        cg$old_rec.SIGLE_EC := cg$EC.cg$table(idx).SIGLE_EC;
        cg$old_rec.NO_EC := cg$EC.cg$table(idx).NO_EC;
        cg$old_rec.DESIGNATION := cg$EC.cg$table(idx).DESIGNATION;
        cg$old_rec.ECTS := cg$EC.cg$table(idx).ECTS;

    IF NOT (cg$EC.called_from_package) THEN
        idx := cg$EC.cg$table.NEXT(idx);
        cg$rec.ID_EC := cg$EC.cg$table(idx).ID_EC;
        cg$ind.ID_EC := updating('ID_EC');
        cg$rec.ID_UE := cg$EC.cg$table(idx).ID_UE;
        cg$ind.ID_UE := updating('ID_UE');
        cg$rec.SIGLE_EC := cg$EC.cg$table(idx).SIGLE_EC;
        cg$ind.SIGLE_EC := updating('SIGLE_EC');
        cg$rec.NO_EC := cg$EC.cg$table(idx).NO_EC;
        cg$ind.NO_EC := updating('NO_EC');
        cg$rec.DESIGNATION := cg$EC.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ECTS := cg$EC.cg$table(idx).ECTS;
        cg$ind.ECTS := updating('ECTS');

        cg$EC.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$EC.upd_denorm2( cg$rec,
                                       cg$EC.cg$tableind(idx)
                                     );
        cg$EC.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$EC.cg$tableind(idx)
								                  );
        cg$EC.cascade_update(cg$rec, cg$old_rec);
        cg$EC.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$EC.called_from_package := FALSE;
	END IF;
        idx := cg$EC.cg$table.NEXT(idx);
    END LOOP;

    cg$EC.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BDS_EC
BEFORE DELETE ON EC
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$EC.cg$table.DELETE;
    cg$EC.cg$tableind.DELETE;
    cg$EC.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$BDR_EC
BEFORE DELETE ON EC FOR EACH ROW
DECLARE
    cg$pk cg$EC.cg$pk_type;
    cg$rec cg$EC.cg$row_type;
    cg$ind cg$EC.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_EC  := :old.ID_EC;
    cg$rec.ID_EC := :old.ID_EC;
    cg$EC.cg$table(cg$EC.idx).ID_EC := :old.ID_EC;
    cg$rec.ID_UE := :old.ID_UE;
    cg$EC.cg$table(cg$EC.idx).ID_UE := :old.ID_UE;


    cg$EC.idx := cg$EC.idx + 1;

    if not (cg$EC.called_from_package) then
        cg$EC.validate_domain_cascade_delete(cg$rec);   
        cg$EC.del(cg$pk, FALSE);
        cg$EC.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_EC, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_EC
AFTER DELETE ON EC FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_EC
/

PROMPT Creating After Delete Statement Trigger on 'EC'
CREATE OR REPLACE TRIGGER cg$ADS_EC
AFTER DELETE ON EC
DECLARE
    idx        BINARY_INTEGER := cg$EC.cg$table.FIRST;
    cg$rec   cg$EC.cg$row_type;
    cg$old_rec   cg$EC.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$EC.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_EC := cg$EC.cg$table(idx).ID_EC;
            cg$EC.cg$tableind(idx).ID_EC := TRUE;
            cg$rec.ID_UE := cg$EC.cg$table(idx).ID_UE;
            cg$EC.cg$tableind(idx).ID_UE := TRUE;
            cg$rec.SIGLE_EC := cg$EC.cg$table(idx).SIGLE_EC;
            cg$EC.cg$tableind(idx).SIGLE_EC := TRUE;
            cg$rec.NO_EC := cg$EC.cg$table(idx).NO_EC;
            cg$EC.cg$tableind(idx).NO_EC := TRUE;
            cg$rec.DESIGNATION := cg$EC.cg$table(idx).DESIGNATION;
            cg$EC.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ECTS := cg$EC.cg$table(idx).ECTS;
            cg$EC.cg$tableind(idx).ECTS := TRUE;

            cg$EC.validate_foreign_keys_del(cg$rec);
            cg$EC.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EC.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$EC.cascade_delete(cg$rec);
            cg$EC.domain_cascade_delete(cg$rec);             

            idx := cg$EC.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



