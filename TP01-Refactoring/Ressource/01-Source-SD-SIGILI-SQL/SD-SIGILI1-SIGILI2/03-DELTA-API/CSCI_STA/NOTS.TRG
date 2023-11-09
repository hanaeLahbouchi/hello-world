
PROMPT Creating Trigger Logic for Table 'NOTATION_STAGE'
PROMPT Creating Before Insert Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$BIS_NOTATION_STAGE
BEFORE INSERT ON NOTATION_STAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$NOTATION_STAGE.cg$table.DELETE;
    cg$NOTATION_STAGE.cg$tableind.DELETE;
    cg$NOTATION_STAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'NOTATION_STAGE'
create or replace TRIGGER CG$BIR_NOTATION_STAGE BEFORE INSERT ON NOTATION_STAGE 
FOR EACH ROW 
DECLARE
    cg$rec cg$NOTATION_STAGE.cg$row_type;
    cg$ind cg$NOTATION_STAGE.cg$ind_type;

BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_BAREME := :NEW.NO_BAREME;
    cg$ind.NO_BAREME := TRUE;
    cg$rec.COEFF_ENT := :NEW.COEFF_ENT;
    cg$ind.COEFF_ENT := TRUE;
    cg$rec.COEFF_RAPPORT := :NEW.COEFF_RAPPORT;
    cg$ind.COEFF_RAPPORT := TRUE;
    cg$rec.COEFF_SOUTENANCE := :NEW.COEFF_SOUTENANCE;
    cg$ind.COEFF_SOUTENANCE := TRUE;
    cg$rec.DATE_CREATION := :NEW.DATE_CREATION;
    cg$ind.DATE_CREATION := TRUE;
    cg$rec.ETAT_BAREME := :NEW.ETAT_BAREME;
    cg$ind.ETAT_BAREME := TRUE;

    if not (cg$NOTATION_STAGE.called_from_package) then
        cg$NOTATION_STAGE.validate_arc(cg$rec);
        cg$NOTATION_STAGE.validate_domain(cg$rec);

        cg$NOTATION_STAGE.ins(cg$rec, cg$ind, FALSE);
        cg$NOTATION_STAGE.called_from_package := FALSE;
    end if;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).NO_BAREME := cg$rec.NO_BAREME;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).NO_BAREME := cg$ind.NO_BAREME;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_ENT := cg$rec.COEFF_ENT;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).COEFF_ENT := cg$ind.COEFF_ENT;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_RAPPORT := cg$rec.COEFF_RAPPORT;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).COEFF_RAPPORT := cg$ind.COEFF_RAPPORT;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_SOUTENANCE := cg$rec.COEFF_SOUTENANCE;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).COEFF_SOUTENANCE := cg$ind.COEFF_SOUTENANCE;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).DATE_CREATION := cg$rec.DATE_CREATION;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).DATE_CREATION := cg$ind.DATE_CREATION;

    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).ETAT_BAREME := cg$rec.ETAT_BAREME;
    cg$NOTATION_STAGE.cg$tableind(cg$NOTATION_STAGE.idx).ETAT_BAREME := cg$ind.ETAT_BAREME;

    cg$NOTATION_STAGE.idx := cg$NOTATION_STAGE.idx + 1;

-- On va chercher le prochain numéro de sequence
--SELECT NOTS_SEQ.nextval INTO :NEW.NO_BAREME FROM DUAL;
    :NEW.NO_BAREME := cg$rec.NO_BAREME;
    :NEW.COEFF_ENT := cg$rec.COEFF_ENT;
    :NEW.COEFF_RAPPORT := cg$rec.COEFF_RAPPORT;
    :NEW.COEFF_SOUTENANCE := cg$rec.COEFF_SOUTENANCE;
    :NEW.DATE_CREATION := SYSDATE;
    :NEW.ETAT_BAREME := cg$rec.ETAT_BAREME;

    -- A l'insertion l'état est a APP
    IF :NEW.ETAT_BAREME = 'APP' THEN
      UPDATE NOTATION_STAGE SET ETAT_BAREME = 'ARC' WHERE ETAT_BAREME = 'APP' AND NO_BAREME != :NEW.NO_BAREME;
    END IF; -- Fin de l'état (de ELA à APP)

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/

-- No application logic defined for Trigger cg$AIR_NOTATION_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_NOTATION_STAGE
AFTER INSERT ON NOTATION_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_NOTATION_STAGE
/

PROMPT Creating After Insert Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$AIS_NOTATION_STAGE
AFTER INSERT ON NOTATION_STAGE
DECLARE
    idx      BINARY_INTEGER := cg$NOTATION_STAGE.cg$table.FIRST;
    cg$rec   cg$NOTATION_STAGE.cg$row_type;
    cg$old_rec   cg$NOTATION_STAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$NOTATION_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_BAREME := cg$NOTATION_STAGE.cg$table(idx).NO_BAREME;
            cg$rec.COEFF_ENT := cg$NOTATION_STAGE.cg$table(idx).COEFF_ENT;
            cg$rec.COEFF_RAPPORT := cg$NOTATION_STAGE.cg$table(idx).COEFF_RAPPORT;
            cg$rec.COEFF_SOUTENANCE := cg$NOTATION_STAGE.cg$table(idx).COEFF_SOUTENANCE;
            cg$rec.DATE_CREATION := cg$NOTATION_STAGE.cg$table(idx).DATE_CREATION;
            cg$rec.ETAT_BAREME := cg$NOTATION_STAGE.cg$table(idx).ETAT_BAREME;

            cg$NOTATION_STAGE.validate_foreign_keys_ins(cg$rec);

            cg$NOTATION_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$NOTATION_STAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$NOTATION_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$BUS_NOTATION_STAGE
BEFORE UPDATE ON NOTATION_STAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$NOTATION_STAGE.cg$table.DELETE;
    cg$NOTATION_STAGE.cg$tableind.DELETE;
    cg$NOTATION_STAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$BUR_NOTATION_STAGE
BEFORE UPDATE ON NOTATION_STAGE FOR EACH ROW
DECLARE
    cg$rec     cg$NOTATION_STAGE.cg$row_type;
    cg$ind     cg$NOTATION_STAGE.cg$ind_type;
    cg$old_rec cg$NOTATION_STAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_BAREME := :new.NO_BAREME;
    cg$ind.NO_BAREME :=    (:new.NO_BAREME IS NULL AND :old.NO_BAREME IS NOT NULL )
                        OR (:new.NO_BAREME IS NOT NULL AND :old.NO_BAREME IS NULL)
                        OR NOT(:new.NO_BAREME = :old.NO_BAREME) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).NO_BAREME := :old.NO_BAREME;
    cg$rec.COEFF_ENT := :new.COEFF_ENT;
    cg$ind.COEFF_ENT :=    (:new.COEFF_ENT IS NULL AND :old.COEFF_ENT IS NOT NULL )
                        OR (:new.COEFF_ENT IS NOT NULL AND :old.COEFF_ENT IS NULL)
                        OR NOT(:new.COEFF_ENT = :old.COEFF_ENT) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_ENT := :old.COEFF_ENT;
    cg$rec.COEFF_RAPPORT := :new.COEFF_RAPPORT;
    cg$ind.COEFF_RAPPORT :=    (:new.COEFF_RAPPORT IS NULL AND :old.COEFF_RAPPORT IS NOT NULL )
                        OR (:new.COEFF_RAPPORT IS NOT NULL AND :old.COEFF_RAPPORT IS NULL)
                        OR NOT(:new.COEFF_RAPPORT = :old.COEFF_RAPPORT) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_RAPPORT := :old.COEFF_RAPPORT;
    cg$rec.COEFF_SOUTENANCE := :new.COEFF_SOUTENANCE;
    cg$ind.COEFF_SOUTENANCE :=    (:new.COEFF_SOUTENANCE IS NULL AND :old.COEFF_SOUTENANCE IS NOT NULL )
                        OR (:new.COEFF_SOUTENANCE IS NOT NULL AND :old.COEFF_SOUTENANCE IS NULL)
                        OR NOT(:new.COEFF_SOUTENANCE = :old.COEFF_SOUTENANCE) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).COEFF_SOUTENANCE := :old.COEFF_SOUTENANCE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.ETAT_BAREME := :new.ETAT_BAREME;
    cg$ind.ETAT_BAREME :=    (:new.ETAT_BAREME IS NULL AND :old.ETAT_BAREME IS NOT NULL )
                        OR (:new.ETAT_BAREME IS NOT NULL AND :old.ETAT_BAREME IS NULL)
                        OR NOT(:new.ETAT_BAREME = :old.ETAT_BAREME) ;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).ETAT_BAREME := :old.ETAT_BAREME;


    cg$NOTATION_STAGE.idx := cg$NOTATION_STAGE.idx + 1;

    if not (cg$NOTATION_STAGE.called_from_package) then
        cg$NOTATION_STAGE.validate_arc(cg$rec);
        cg$NOTATION_STAGE.validate_domain(cg$rec, cg$ind);
        cg$NOTATION_STAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$NOTATION_STAGE.upd(cg$rec, cg$ind, FALSE);
        cg$NOTATION_STAGE.called_from_package := FALSE;
    end if;

    :new.COEFF_ENT := cg$rec.COEFF_ENT;
    :new.COEFF_RAPPORT := cg$rec.COEFF_RAPPORT;
    :new.COEFF_SOUTENANCE := cg$rec.COEFF_SOUTENANCE;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.ETAT_BAREME := cg$rec.ETAT_BAREME;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_NOTATION_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_NOTATION_STAGE
AFTER UPDATE ON NOTATION_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_NOTATION_STAGE
/






PROMPT Creating After Update Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$AUS_NOTATION_STAGE
AFTER UPDATE ON NOTATION_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$NOTATION_STAGE.cg$table.FIRST;
    cg$old_rec cg$NOTATION_STAGE.cg$row_type;
    cg$rec     cg$NOTATION_STAGE.cg$row_type;
    cg$ind     cg$NOTATION_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_BAREME := cg$NOTATION_STAGE.cg$table(idx).NO_BAREME;
        cg$old_rec.COEFF_ENT := cg$NOTATION_STAGE.cg$table(idx).COEFF_ENT;
        cg$old_rec.COEFF_RAPPORT := cg$NOTATION_STAGE.cg$table(idx).COEFF_RAPPORT;
        cg$old_rec.COEFF_SOUTENANCE := cg$NOTATION_STAGE.cg$table(idx).COEFF_SOUTENANCE;
        cg$old_rec.DATE_CREATION := cg$NOTATION_STAGE.cg$table(idx).DATE_CREATION;
        cg$old_rec.ETAT_BAREME := cg$NOTATION_STAGE.cg$table(idx).ETAT_BAREME;

    IF NOT (cg$NOTATION_STAGE.called_from_package) THEN
        idx := cg$NOTATION_STAGE.cg$table.NEXT(idx);
        cg$rec.NO_BAREME := cg$NOTATION_STAGE.cg$table(idx).NO_BAREME;
        cg$ind.NO_BAREME := updating('NO_BAREME');
        cg$rec.COEFF_ENT := cg$NOTATION_STAGE.cg$table(idx).COEFF_ENT;
        cg$ind.COEFF_ENT := updating('COEFF_ENT');
        cg$rec.COEFF_RAPPORT := cg$NOTATION_STAGE.cg$table(idx).COEFF_RAPPORT;
        cg$ind.COEFF_RAPPORT := updating('COEFF_RAPPORT');
        cg$rec.COEFF_SOUTENANCE := cg$NOTATION_STAGE.cg$table(idx).COEFF_SOUTENANCE;
        cg$ind.COEFF_SOUTENANCE := updating('COEFF_SOUTENANCE');
        cg$rec.DATE_CREATION := cg$NOTATION_STAGE.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.ETAT_BAREME := cg$NOTATION_STAGE.cg$table(idx).ETAT_BAREME;
        cg$ind.ETAT_BAREME := updating('ETAT_BAREME');

        cg$NOTATION_STAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$NOTATION_STAGE.upd_denorm2( cg$rec,
                                       cg$NOTATION_STAGE.cg$tableind(idx)
                                     );
        cg$NOTATION_STAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$NOTATION_STAGE.cg$tableind(idx)
								                  );
        cg$NOTATION_STAGE.cascade_update(cg$rec, cg$old_rec);
        cg$NOTATION_STAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$NOTATION_STAGE.called_from_package := FALSE;
	END IF;
        idx := cg$NOTATION_STAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$NOTATION_STAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$BDS_NOTATION_STAGE
BEFORE DELETE ON NOTATION_STAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$NOTATION_STAGE.cg$table.DELETE;
    cg$NOTATION_STAGE.cg$tableind.DELETE;
    cg$NOTATION_STAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$BDR_NOTATION_STAGE
BEFORE DELETE ON NOTATION_STAGE FOR EACH ROW
DECLARE
    cg$pk cg$NOTATION_STAGE.cg$pk_type;
    cg$rec cg$NOTATION_STAGE.cg$row_type;
    cg$ind cg$NOTATION_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_BAREME  := :old.NO_BAREME;
    cg$rec.NO_BAREME := :old.NO_BAREME;
    cg$NOTATION_STAGE.cg$table(cg$NOTATION_STAGE.idx).NO_BAREME := :old.NO_BAREME;


    cg$NOTATION_STAGE.idx := cg$NOTATION_STAGE.idx + 1;

    if not (cg$NOTATION_STAGE.called_from_package) then
        cg$NOTATION_STAGE.validate_domain_cascade_delete(cg$rec);   
        cg$NOTATION_STAGE.del(cg$pk, FALSE);
        cg$NOTATION_STAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_NOTATION_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_NOTATION_STAGE
AFTER DELETE ON NOTATION_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_NOTATION_STAGE
/

PROMPT Creating After Delete Statement Trigger on 'NOTATION_STAGE'
CREATE OR REPLACE TRIGGER cg$ADS_NOTATION_STAGE
AFTER DELETE ON NOTATION_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$NOTATION_STAGE.cg$table.FIRST;
    cg$rec   cg$NOTATION_STAGE.cg$row_type;
    cg$old_rec   cg$NOTATION_STAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$NOTATION_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_BAREME := cg$NOTATION_STAGE.cg$table(idx).NO_BAREME;
            cg$NOTATION_STAGE.cg$tableind(idx).NO_BAREME := TRUE;
            cg$rec.COEFF_ENT := cg$NOTATION_STAGE.cg$table(idx).COEFF_ENT;
            cg$NOTATION_STAGE.cg$tableind(idx).COEFF_ENT := TRUE;
            cg$rec.COEFF_RAPPORT := cg$NOTATION_STAGE.cg$table(idx).COEFF_RAPPORT;
            cg$NOTATION_STAGE.cg$tableind(idx).COEFF_RAPPORT := TRUE;
            cg$rec.COEFF_SOUTENANCE := cg$NOTATION_STAGE.cg$table(idx).COEFF_SOUTENANCE;
            cg$NOTATION_STAGE.cg$tableind(idx).COEFF_SOUTENANCE := TRUE;
            cg$rec.DATE_CREATION := cg$NOTATION_STAGE.cg$table(idx).DATE_CREATION;
            cg$NOTATION_STAGE.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.ETAT_BAREME := cg$NOTATION_STAGE.cg$table(idx).ETAT_BAREME;
            cg$NOTATION_STAGE.cg$tableind(idx).ETAT_BAREME := TRUE;

            cg$NOTATION_STAGE.validate_foreign_keys_del(cg$rec);
            cg$NOTATION_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$NOTATION_STAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$NOTATION_STAGE.cascade_delete(cg$rec);
            cg$NOTATION_STAGE.domain_cascade_delete(cg$rec);             

            idx := cg$NOTATION_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



