
PROMPT Creating Trigger Logic for Table 'UE'
PROMPT Creating Before Insert Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BIS_UE
BEFORE INSERT ON UE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$UE.cg$table.DELETE;
    cg$UE.cg$tableind.DELETE;
    cg$UE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BIR_UE
BEFORE INSERT ON UE FOR EACH ROW
DECLARE
    cg$rec cg$UE.cg$row_type;
    cg$ind cg$UE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE := TRUE;
    cg$rec.CODE_CRE := :new.CODE_CRE;
    cg$ind.CODE_CRE := TRUE;
    cg$rec.SIGLE_UE := :new.SIGLE_UE;
    cg$ind.SIGLE_UE := TRUE;
    cg$rec.NO_UE := :new.NO_UE;
    cg$ind.NO_UE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.NO_SEMESTRE := :new.NO_SEMESTRE;
    cg$ind.NO_SEMESTRE := TRUE;

    if not (cg$UE.called_from_package) then
        cg$UE.validate_arc(cg$rec);
        cg$UE.validate_domain(cg$rec);

        cg$UE.ins(cg$rec, cg$ind, FALSE);
        cg$UE.called_from_package := FALSE;
    end if;

    cg$UE.cg$table(cg$UE.idx).ID_UE := cg$rec.ID_UE;
    cg$UE.cg$tableind(cg$UE.idx).ID_UE := cg$ind.ID_UE;

    cg$UE.cg$table(cg$UE.idx).CODE_CRE := cg$rec.CODE_CRE;
    cg$UE.cg$tableind(cg$UE.idx).CODE_CRE := cg$ind.CODE_CRE;

    cg$UE.cg$table(cg$UE.idx).SIGLE_UE := cg$rec.SIGLE_UE;
    cg$UE.cg$tableind(cg$UE.idx).SIGLE_UE := cg$ind.SIGLE_UE;

    cg$UE.cg$table(cg$UE.idx).NO_UE := cg$rec.NO_UE;
    cg$UE.cg$tableind(cg$UE.idx).NO_UE := cg$ind.NO_UE;

    cg$UE.cg$table(cg$UE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$UE.cg$tableind(cg$UE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$UE.cg$table(cg$UE.idx).NO_SEMESTRE := cg$rec.NO_SEMESTRE;
    cg$UE.cg$tableind(cg$UE.idx).NO_SEMESTRE := cg$ind.NO_SEMESTRE;

    cg$UE.idx := cg$UE.idx + 1;

    :new.ID_UE := cg$rec.ID_UE;
    :new.CODE_CRE := cg$rec.CODE_CRE;
    :new.SIGLE_UE := cg$rec.SIGLE_UE;
    :new.NO_UE := cg$rec.NO_UE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.NO_SEMESTRE := cg$rec.NO_SEMESTRE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_UE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_UE
AFTER INSERT ON UE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_UE
/

PROMPT Creating After Insert Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$AIS_UE
AFTER INSERT ON UE
DECLARE
    idx      BINARY_INTEGER := cg$UE.cg$table.FIRST;
    cg$rec   cg$UE.cg$row_type;
    cg$old_rec   cg$UE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$UE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_UE := cg$UE.cg$table(idx).ID_UE;
            cg$rec.CODE_CRE := cg$UE.cg$table(idx).CODE_CRE;
            cg$rec.SIGLE_UE := cg$UE.cg$table(idx).SIGLE_UE;
            cg$rec.NO_UE := cg$UE.cg$table(idx).NO_UE;
            cg$rec.DESIGNATION := cg$UE.cg$table(idx).DESIGNATION;
            cg$rec.NO_SEMESTRE := cg$UE.cg$table(idx).NO_SEMESTRE;

            cg$UE.validate_foreign_keys_ins(cg$rec);

            cg$UE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$UE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$UE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BUS_UE
BEFORE UPDATE ON UE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$UE.cg$table.DELETE;
    cg$UE.cg$tableind.DELETE;
    cg$UE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BUR_UE
BEFORE UPDATE ON UE FOR EACH ROW
DECLARE
    cg$rec     cg$UE.cg$row_type;
    cg$ind     cg$UE.cg$ind_type;
    cg$old_rec cg$UE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_UE := :new.ID_UE;
    cg$ind.ID_UE :=    (:new.ID_UE IS NULL AND :old.ID_UE IS NOT NULL )
                        OR (:new.ID_UE IS NOT NULL AND :old.ID_UE IS NULL)
                        OR NOT(:new.ID_UE = :old.ID_UE) ;
    cg$UE.cg$table(cg$UE.idx).ID_UE := :old.ID_UE;
    cg$rec.CODE_CRE := :new.CODE_CRE;
    cg$ind.CODE_CRE :=    (:new.CODE_CRE IS NULL AND :old.CODE_CRE IS NOT NULL )
                        OR (:new.CODE_CRE IS NOT NULL AND :old.CODE_CRE IS NULL)
                        OR NOT(:new.CODE_CRE = :old.CODE_CRE) ;
    cg$UE.cg$table(cg$UE.idx).CODE_CRE := :old.CODE_CRE;
    cg$rec.SIGLE_UE := :new.SIGLE_UE;
    cg$ind.SIGLE_UE :=    (:new.SIGLE_UE IS NULL AND :old.SIGLE_UE IS NOT NULL )
                        OR (:new.SIGLE_UE IS NOT NULL AND :old.SIGLE_UE IS NULL)
                        OR NOT(:new.SIGLE_UE = :old.SIGLE_UE) ;
    cg$UE.cg$table(cg$UE.idx).SIGLE_UE := :old.SIGLE_UE;
    cg$rec.NO_UE := :new.NO_UE;
    cg$ind.NO_UE :=    (:new.NO_UE IS NULL AND :old.NO_UE IS NOT NULL )
                        OR (:new.NO_UE IS NOT NULL AND :old.NO_UE IS NULL)
                        OR NOT(:new.NO_UE = :old.NO_UE) ;
    cg$UE.cg$table(cg$UE.idx).NO_UE := :old.NO_UE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$UE.cg$table(cg$UE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.NO_SEMESTRE := :new.NO_SEMESTRE;
    cg$ind.NO_SEMESTRE :=    (:new.NO_SEMESTRE IS NULL AND :old.NO_SEMESTRE IS NOT NULL )
                        OR (:new.NO_SEMESTRE IS NOT NULL AND :old.NO_SEMESTRE IS NULL)
                        OR NOT(:new.NO_SEMESTRE = :old.NO_SEMESTRE) ;
    cg$UE.cg$table(cg$UE.idx).NO_SEMESTRE := :old.NO_SEMESTRE;


    cg$UE.idx := cg$UE.idx + 1;

    if not (cg$UE.called_from_package) then
        cg$UE.validate_arc(cg$rec);
        cg$UE.validate_domain(cg$rec, cg$ind);
        cg$UE.validate_domain_cascade_update(cg$old_rec);   

        cg$UE.upd(cg$rec, cg$ind, FALSE);
        cg$UE.called_from_package := FALSE;
    end if;

    :new.CODE_CRE := cg$rec.CODE_CRE;
    :new.SIGLE_UE := cg$rec.SIGLE_UE;
    :new.NO_UE := cg$rec.NO_UE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.NO_SEMESTRE := cg$rec.NO_SEMESTRE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_UE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_UE
AFTER UPDATE ON UE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_UE
/






PROMPT Creating After Update Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$AUS_UE
AFTER UPDATE ON UE
DECLARE
    idx        BINARY_INTEGER := cg$UE.cg$table.FIRST;
    cg$old_rec cg$UE.cg$row_type;
    cg$rec     cg$UE.cg$row_type;
    cg$ind     cg$UE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_UE := cg$UE.cg$table(idx).ID_UE;
        cg$old_rec.CODE_CRE := cg$UE.cg$table(idx).CODE_CRE;
        cg$old_rec.SIGLE_UE := cg$UE.cg$table(idx).SIGLE_UE;
        cg$old_rec.NO_UE := cg$UE.cg$table(idx).NO_UE;
        cg$old_rec.DESIGNATION := cg$UE.cg$table(idx).DESIGNATION;
        cg$old_rec.NO_SEMESTRE := cg$UE.cg$table(idx).NO_SEMESTRE;

    IF NOT (cg$UE.called_from_package) THEN
        idx := cg$UE.cg$table.NEXT(idx);
        cg$rec.ID_UE := cg$UE.cg$table(idx).ID_UE;
        cg$ind.ID_UE := updating('ID_UE');
        cg$rec.CODE_CRE := cg$UE.cg$table(idx).CODE_CRE;
        cg$ind.CODE_CRE := updating('CODE_CRE');
        cg$rec.SIGLE_UE := cg$UE.cg$table(idx).SIGLE_UE;
        cg$ind.SIGLE_UE := updating('SIGLE_UE');
        cg$rec.NO_UE := cg$UE.cg$table(idx).NO_UE;
        cg$ind.NO_UE := updating('NO_UE');
        cg$rec.DESIGNATION := cg$UE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.NO_SEMESTRE := cg$UE.cg$table(idx).NO_SEMESTRE;
        cg$ind.NO_SEMESTRE := updating('NO_SEMESTRE');

        cg$UE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$UE.upd_denorm2( cg$rec,
                                       cg$UE.cg$tableind(idx)
                                     );
        cg$UE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$UE.cg$tableind(idx)
								                  );
        cg$UE.cascade_update(cg$rec, cg$old_rec);
        cg$UE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$UE.called_from_package := FALSE;
	END IF;
        idx := cg$UE.cg$table.NEXT(idx);
    END LOOP;

    cg$UE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BDS_UE
BEFORE DELETE ON UE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$UE.cg$table.DELETE;
    cg$UE.cg$tableind.DELETE;
    cg$UE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$BDR_UE
BEFORE DELETE ON UE FOR EACH ROW
DECLARE
    cg$pk cg$UE.cg$pk_type;
    cg$rec cg$UE.cg$row_type;
    cg$ind cg$UE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_UE  := :old.ID_UE;
    cg$rec.ID_UE := :old.ID_UE;
    cg$UE.cg$table(cg$UE.idx).ID_UE := :old.ID_UE;
    cg$rec.CODE_CRE := :old.CODE_CRE;
    cg$UE.cg$table(cg$UE.idx).CODE_CRE := :old.CODE_CRE;


    cg$UE.idx := cg$UE.idx + 1;

    if not (cg$UE.called_from_package) then
        cg$UE.validate_domain_cascade_delete(cg$rec);   
        cg$UE.del(cg$pk, FALSE);
        cg$UE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_UE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_UE
AFTER DELETE ON UE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_UE
/

PROMPT Creating After Delete Statement Trigger on 'UE'
CREATE OR REPLACE TRIGGER cg$ADS_UE
AFTER DELETE ON UE
DECLARE
    idx        BINARY_INTEGER := cg$UE.cg$table.FIRST;
    cg$rec   cg$UE.cg$row_type;
    cg$old_rec   cg$UE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$UE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_UE := cg$UE.cg$table(idx).ID_UE;
            cg$UE.cg$tableind(idx).ID_UE := TRUE;
            cg$rec.CODE_CRE := cg$UE.cg$table(idx).CODE_CRE;
            cg$UE.cg$tableind(idx).CODE_CRE := TRUE;
            cg$rec.SIGLE_UE := cg$UE.cg$table(idx).SIGLE_UE;
            cg$UE.cg$tableind(idx).SIGLE_UE := TRUE;
            cg$rec.NO_UE := cg$UE.cg$table(idx).NO_UE;
            cg$UE.cg$tableind(idx).NO_UE := TRUE;
            cg$rec.DESIGNATION := cg$UE.cg$table(idx).DESIGNATION;
            cg$UE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.NO_SEMESTRE := cg$UE.cg$table(idx).NO_SEMESTRE;
            cg$UE.cg$tableind(idx).NO_SEMESTRE := TRUE;

            cg$UE.validate_foreign_keys_del(cg$rec);
            cg$UE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$UE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$UE.cascade_delete(cg$rec);
            cg$UE.domain_cascade_delete(cg$rec);             

            idx := cg$UE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



