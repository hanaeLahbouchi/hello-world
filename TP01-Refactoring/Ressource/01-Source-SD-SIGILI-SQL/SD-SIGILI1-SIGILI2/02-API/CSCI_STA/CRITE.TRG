
PROMPT Creating Trigger Logic for Table 'CRITERE_ENTREPRISE'
PROMPT Creating Before Insert Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIS_CRITERE_ENTREPRISE
BEFORE INSERT ON CRITERE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CRITERE_ENTREPRISE.cg$table.DELETE;
    cg$CRITERE_ENTREPRISE.cg$tableind.DELETE;
    cg$CRITERE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIR_CRITERE_ENTREPRISE
BEFORE INSERT ON CRITERE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$ind cg$CRITERE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CRITE_ID := :new.CRITE_ID;
    cg$ind.CRITE_ID := TRUE;
    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION := TRUE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.POIDS := :new.POIDS;
    cg$ind.POIDS := TRUE;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTIF := FALSE;

    if not (cg$CRITERE_ENTREPRISE.called_from_package) then
        cg$CRITERE_ENTREPRISE.validate_arc(cg$rec);
        cg$CRITERE_ENTREPRISE.validate_domain(cg$rec);

        cg$CRITERE_ENTREPRISE.ins(cg$rec, cg$ind, FALSE);
        cg$CRITERE_ENTREPRISE.called_from_package := FALSE;
    end if;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).CRITE_ID := cg$rec.CRITE_ID;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).CRITE_ID := cg$ind.CRITE_ID;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).NO_EVALUATION := cg$rec.NO_EVALUATION;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).NO_EVALUATION := cg$ind.NO_EVALUATION;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).ORDRE := cg$rec.ORDRE;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).ORDRE := cg$ind.ORDRE;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).POIDS := cg$rec.POIDS;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).POIDS := cg$ind.POIDS;

    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).DESCRIPTIF := cg$rec.DESCRIPTIF;
    cg$CRITERE_ENTREPRISE.cg$tableind(cg$CRITERE_ENTREPRISE.idx).DESCRIPTIF := cg$ind.DESCRIPTIF;

    cg$CRITERE_ENTREPRISE.idx := cg$CRITERE_ENTREPRISE.idx + 1;

    :new.CRITE_ID := cg$rec.CRITE_ID;
    :new.NO_EVALUATION := cg$rec.NO_EVALUATION;
    :new.ORDRE := cg$rec.ORDRE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.POIDS := cg$rec.POIDS;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_CRITERE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CRITERE_ENTREPRISE
AFTER INSERT ON CRITERE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CRITERE_ENTREPRISE
/

PROMPT Creating After Insert Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AIS_CRITERE_ENTREPRISE
AFTER INSERT ON CRITERE_ENTREPRISE
DECLARE
    idx      BINARY_INTEGER := cg$CRITERE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$CRITERE_ENTREPRISE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CRITERE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CRITE_ID := cg$CRITERE_ENTREPRISE.cg$table(idx).CRITE_ID;
            cg$rec.NO_EVALUATION := cg$CRITERE_ENTREPRISE.cg$table(idx).NO_EVALUATION;
            cg$rec.ORDRE := cg$CRITERE_ENTREPRISE.cg$table(idx).ORDRE;
            cg$rec.DESIGNATION := cg$CRITERE_ENTREPRISE.cg$table(idx).DESIGNATION;
            cg$rec.POIDS := cg$CRITERE_ENTREPRISE.cg$table(idx).POIDS;
            cg$rec.DESCRIPTIF := cg$CRITERE_ENTREPRISE.cg$table(idx).DESCRIPTIF;

            cg$CRITERE_ENTREPRISE.validate_foreign_keys_ins(cg$rec);

            cg$CRITERE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CRITERE_ENTREPRISE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$CRITERE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUS_CRITERE_ENTREPRISE
BEFORE UPDATE ON CRITERE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CRITERE_ENTREPRISE.cg$table.DELETE;
    cg$CRITERE_ENTREPRISE.cg$tableind.DELETE;
    cg$CRITERE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUR_CRITERE_ENTREPRISE
BEFORE UPDATE ON CRITERE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec     cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$ind     cg$CRITERE_ENTREPRISE.cg$ind_type;
    cg$old_rec cg$CRITERE_ENTREPRISE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CRITE_ID := :new.CRITE_ID;
    cg$ind.CRITE_ID :=    (:new.CRITE_ID IS NULL AND :old.CRITE_ID IS NOT NULL )
                        OR (:new.CRITE_ID IS NOT NULL AND :old.CRITE_ID IS NULL)
                        OR NOT(:new.CRITE_ID = :old.CRITE_ID) ;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).CRITE_ID := :old.CRITE_ID;
    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION :=    (:new.NO_EVALUATION IS NULL AND :old.NO_EVALUATION IS NOT NULL )
                        OR (:new.NO_EVALUATION IS NOT NULL AND :old.NO_EVALUATION IS NULL)
                        OR NOT(:new.NO_EVALUATION = :old.NO_EVALUATION) ;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).NO_EVALUATION := :old.NO_EVALUATION;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).ORDRE := :old.ORDRE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.POIDS := :new.POIDS;
    cg$ind.POIDS :=    (:new.POIDS IS NULL AND :old.POIDS IS NOT NULL )
                        OR (:new.POIDS IS NOT NULL AND :old.POIDS IS NULL)
                        OR NOT(:new.POIDS = :old.POIDS) ;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).POIDS := :old.POIDS;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTIF := FALSE;


    cg$CRITERE_ENTREPRISE.idx := cg$CRITERE_ENTREPRISE.idx + 1;

    if not (cg$CRITERE_ENTREPRISE.called_from_package) then
        cg$CRITERE_ENTREPRISE.validate_arc(cg$rec);
        cg$CRITERE_ENTREPRISE.validate_domain(cg$rec, cg$ind);
        cg$CRITERE_ENTREPRISE.validate_domain_cascade_update(cg$old_rec);   

        cg$CRITERE_ENTREPRISE.upd(cg$rec, cg$ind, FALSE);
        cg$CRITERE_ENTREPRISE.called_from_package := FALSE;
    end if;

    :new.NO_EVALUATION := cg$rec.NO_EVALUATION;
    :new.ORDRE := cg$rec.ORDRE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.POIDS := cg$rec.POIDS;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_CRITERE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CRITERE_ENTREPRISE
AFTER UPDATE ON CRITERE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CRITERE_ENTREPRISE
/






PROMPT Creating After Update Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AUS_CRITERE_ENTREPRISE
AFTER UPDATE ON CRITERE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$CRITERE_ENTREPRISE.cg$table.FIRST;
    cg$old_rec cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$rec     cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$ind     cg$CRITERE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.CRITE_ID := cg$CRITERE_ENTREPRISE.cg$table(idx).CRITE_ID;
        cg$old_rec.NO_EVALUATION := cg$CRITERE_ENTREPRISE.cg$table(idx).NO_EVALUATION;
        cg$old_rec.ORDRE := cg$CRITERE_ENTREPRISE.cg$table(idx).ORDRE;
        cg$old_rec.DESIGNATION := cg$CRITERE_ENTREPRISE.cg$table(idx).DESIGNATION;
        cg$old_rec.POIDS := cg$CRITERE_ENTREPRISE.cg$table(idx).POIDS;
        cg$old_rec.DESCRIPTIF := cg$CRITERE_ENTREPRISE.cg$table(idx).DESCRIPTIF;

    IF NOT (cg$CRITERE_ENTREPRISE.called_from_package) THEN
        idx := cg$CRITERE_ENTREPRISE.cg$table.NEXT(idx);
        cg$rec.CRITE_ID := cg$CRITERE_ENTREPRISE.cg$table(idx).CRITE_ID;
        cg$ind.CRITE_ID := updating('CRITE_ID');
        cg$rec.NO_EVALUATION := cg$CRITERE_ENTREPRISE.cg$table(idx).NO_EVALUATION;
        cg$ind.NO_EVALUATION := updating('NO_EVALUATION');
        cg$rec.ORDRE := cg$CRITERE_ENTREPRISE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESIGNATION := cg$CRITERE_ENTREPRISE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.POIDS := cg$CRITERE_ENTREPRISE.cg$table(idx).POIDS;
        cg$ind.POIDS := updating('POIDS');
        cg$rec.DESCRIPTIF := cg$CRITERE_ENTREPRISE.cg$table(idx).DESCRIPTIF;
        cg$ind.DESCRIPTIF := updating('DESCRIPTIF');

        cg$CRITERE_ENTREPRISE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$CRITERE_ENTREPRISE.upd_denorm2( cg$rec,
                                       cg$CRITERE_ENTREPRISE.cg$tableind(idx)
                                     );
        cg$CRITERE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$CRITERE_ENTREPRISE.cg$tableind(idx)
								                  );
        cg$CRITERE_ENTREPRISE.cascade_update(cg$rec, cg$old_rec);
        cg$CRITERE_ENTREPRISE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$CRITERE_ENTREPRISE.called_from_package := FALSE;
	END IF;
        idx := cg$CRITERE_ENTREPRISE.cg$table.NEXT(idx);
    END LOOP;

    cg$CRITERE_ENTREPRISE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDS_CRITERE_ENTREPRISE
BEFORE DELETE ON CRITERE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CRITERE_ENTREPRISE.cg$table.DELETE;
    cg$CRITERE_ENTREPRISE.cg$tableind.DELETE;
    cg$CRITERE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDR_CRITERE_ENTREPRISE
BEFORE DELETE ON CRITERE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$pk cg$CRITERE_ENTREPRISE.cg$pk_type;
    cg$rec cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$ind cg$CRITERE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CRITE_ID  := :old.CRITE_ID;
    cg$rec.CRITE_ID := :old.CRITE_ID;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).CRITE_ID := :old.CRITE_ID;
    cg$rec.NO_EVALUATION := :old.NO_EVALUATION;
    cg$CRITERE_ENTREPRISE.cg$table(cg$CRITERE_ENTREPRISE.idx).NO_EVALUATION := :old.NO_EVALUATION;


    cg$CRITERE_ENTREPRISE.idx := cg$CRITERE_ENTREPRISE.idx + 1;

    if not (cg$CRITERE_ENTREPRISE.called_from_package) then
        cg$CRITERE_ENTREPRISE.validate_domain_cascade_delete(cg$rec);   
        cg$CRITERE_ENTREPRISE.del(cg$pk, FALSE);
        cg$CRITERE_ENTREPRISE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CRITERE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CRITERE_ENTREPRISE
AFTER DELETE ON CRITERE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CRITERE_ENTREPRISE
/

PROMPT Creating After Delete Statement Trigger on 'CRITERE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$ADS_CRITERE_ENTREPRISE
AFTER DELETE ON CRITERE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$CRITERE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$CRITERE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$CRITERE_ENTREPRISE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CRITERE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CRITE_ID := cg$CRITERE_ENTREPRISE.cg$table(idx).CRITE_ID;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).CRITE_ID := TRUE;
            cg$rec.NO_EVALUATION := cg$CRITERE_ENTREPRISE.cg$table(idx).NO_EVALUATION;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).NO_EVALUATION := TRUE;
            cg$rec.ORDRE := cg$CRITERE_ENTREPRISE.cg$table(idx).ORDRE;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESIGNATION := cg$CRITERE_ENTREPRISE.cg$table(idx).DESIGNATION;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.POIDS := cg$CRITERE_ENTREPRISE.cg$table(idx).POIDS;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).POIDS := TRUE;
            cg$rec.DESCRIPTIF := cg$CRITERE_ENTREPRISE.cg$table(idx).DESCRIPTIF;
            cg$CRITERE_ENTREPRISE.cg$tableind(idx).DESCRIPTIF := TRUE;

            cg$CRITERE_ENTREPRISE.validate_foreign_keys_del(cg$rec);
            cg$CRITERE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CRITERE_ENTREPRISE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$CRITERE_ENTREPRISE.cascade_delete(cg$rec);
            cg$CRITERE_ENTREPRISE.domain_cascade_delete(cg$rec);             

            idx := cg$CRITERE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



