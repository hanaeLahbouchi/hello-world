
PROMPT Creating Trigger Logic for Table 'STRUCTURE_EVALUATION'
PROMPT Creating Before Insert Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$BIS_STRUCTURE_EVALUATION
BEFORE INSERT ON STRUCTURE_EVALUATION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$STRUCTURE_EVALUATION.cg$table.DELETE;
    cg$STRUCTURE_EVALUATION.cg$tableind.DELETE;
    cg$STRUCTURE_EVALUATION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'STRUCTURE_EVALUATION'
create or replace TRIGGER CG$BIR_STRUCTURE_EVALUATION BEFORE INSERT ON STRUCTURE_EVALUATION 
FOR EACH ROW 
DECLARE
    cg$rec cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$ind cg$STRUCTURE_EVALUATION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new
    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION := TRUE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION := TRUE;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT := TRUE;

    if not (cg$STRUCTURE_EVALUATION.called_from_package) then
        cg$STRUCTURE_EVALUATION.validate_arc(cg$rec);
        cg$STRUCTURE_EVALUATION.validate_domain(cg$rec);

        cg$STRUCTURE_EVALUATION.ins(cg$rec, cg$ind, FALSE);
        cg$STRUCTURE_EVALUATION.called_from_package := FALSE;
    end if;

    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).NO_EVALUATION := cg$rec.NO_EVALUATION;
    cg$STRUCTURE_EVALUATION.cg$tableind(cg$STRUCTURE_EVALUATION.idx).NO_EVALUATION := cg$ind.NO_EVALUATION;

    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).DATE_CREATION := cg$rec.DATE_CREATION;
    cg$STRUCTURE_EVALUATION.cg$tableind(cg$STRUCTURE_EVALUATION.idx).DATE_CREATION := cg$ind.DATE_CREATION;

    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).ETAT := cg$rec.ETAT;
    cg$STRUCTURE_EVALUATION.cg$tableind(cg$STRUCTURE_EVALUATION.idx).ETAT := cg$ind.ETAT;

    cg$STRUCTURE_EVALUATION.idx := cg$STRUCTURE_EVALUATION.idx + 1;
    
    --SELECT STRE_SEQ.nextval INTO :NEW.NO_EVALUATION FROM DUAL;
    :new.NO_EVALUATION := cg$rec.NO_EVALUATION;
    :new.DATE_CREATION := SYSDATE;
    :new.ETAT := cg$rec.ETAT;
    -- A l'insertion l'état est a APP
    IF :NEW.ETAT = 'APP' THEN
      UPDATE STRUCTURE_EVALUATION SET ETAT = 'ARC' WHERE ETAT = 'APP';
    END IF; -- Fin de l'état (de ELA à APP)
--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/

-- No application logic defined for Trigger cg$AIR_STRUCTURE_EVALUATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_STRUCTURE_EVALUATION
AFTER INSERT ON STRUCTURE_EVALUATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_STRUCTURE_EVALUATION
/

PROMPT Creating After Insert Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$AIS_STRUCTURE_EVALUATION
AFTER INSERT ON STRUCTURE_EVALUATION
DECLARE
    idx      BINARY_INTEGER := cg$STRUCTURE_EVALUATION.cg$table.FIRST;
    cg$rec   cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$old_rec   cg$STRUCTURE_EVALUATION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$STRUCTURE_EVALUATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_EVALUATION := cg$STRUCTURE_EVALUATION.cg$table(idx).NO_EVALUATION;
            cg$rec.DATE_CREATION := cg$STRUCTURE_EVALUATION.cg$table(idx).DATE_CREATION;
            cg$rec.ETAT := cg$STRUCTURE_EVALUATION.cg$table(idx).ETAT;

            cg$STRUCTURE_EVALUATION.validate_foreign_keys_ins(cg$rec);

            cg$STRUCTURE_EVALUATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$STRUCTURE_EVALUATION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$STRUCTURE_EVALUATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$BUS_STRUCTURE_EVALUATION
BEFORE UPDATE ON STRUCTURE_EVALUATION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$STRUCTURE_EVALUATION.cg$table.DELETE;
    cg$STRUCTURE_EVALUATION.cg$tableind.DELETE;
    cg$STRUCTURE_EVALUATION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$BUR_STRUCTURE_EVALUATION
BEFORE UPDATE ON STRUCTURE_EVALUATION FOR EACH ROW
DECLARE
    cg$rec     cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$ind     cg$STRUCTURE_EVALUATION.cg$ind_type;
    cg$old_rec cg$STRUCTURE_EVALUATION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION :=    (:new.NO_EVALUATION IS NULL AND :old.NO_EVALUATION IS NOT NULL )
                        OR (:new.NO_EVALUATION IS NOT NULL AND :old.NO_EVALUATION IS NULL)
                        OR NOT(:new.NO_EVALUATION = :old.NO_EVALUATION) ;
    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).NO_EVALUATION := :old.NO_EVALUATION;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT :=    (:new.ETAT IS NULL AND :old.ETAT IS NOT NULL )
                        OR (:new.ETAT IS NOT NULL AND :old.ETAT IS NULL)
                        OR NOT(:new.ETAT = :old.ETAT) ;
    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).ETAT := :old.ETAT;


    cg$STRUCTURE_EVALUATION.idx := cg$STRUCTURE_EVALUATION.idx + 1;

    if not (cg$STRUCTURE_EVALUATION.called_from_package) then
        cg$STRUCTURE_EVALUATION.validate_arc(cg$rec);
        cg$STRUCTURE_EVALUATION.validate_domain(cg$rec, cg$ind);
        cg$STRUCTURE_EVALUATION.validate_domain_cascade_update(cg$old_rec);   

        cg$STRUCTURE_EVALUATION.upd(cg$rec, cg$ind, FALSE);
        cg$STRUCTURE_EVALUATION.called_from_package := FALSE;
    end if;

    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.ETAT := cg$rec.ETAT;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_STRUCTURE_EVALUATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_STRUCTURE_EVALUATION
AFTER UPDATE ON STRUCTURE_EVALUATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_STRUCTURE_EVALUATION
/






PROMPT Creating After Update Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$AUS_STRUCTURE_EVALUATION
AFTER UPDATE ON STRUCTURE_EVALUATION
DECLARE
    idx        BINARY_INTEGER := cg$STRUCTURE_EVALUATION.cg$table.FIRST;
    cg$old_rec cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$rec     cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$ind     cg$STRUCTURE_EVALUATION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_EVALUATION := cg$STRUCTURE_EVALUATION.cg$table(idx).NO_EVALUATION;
        cg$old_rec.DATE_CREATION := cg$STRUCTURE_EVALUATION.cg$table(idx).DATE_CREATION;
        cg$old_rec.ETAT := cg$STRUCTURE_EVALUATION.cg$table(idx).ETAT;

    IF NOT (cg$STRUCTURE_EVALUATION.called_from_package) THEN
        idx := cg$STRUCTURE_EVALUATION.cg$table.NEXT(idx);
        cg$rec.NO_EVALUATION := cg$STRUCTURE_EVALUATION.cg$table(idx).NO_EVALUATION;
        cg$ind.NO_EVALUATION := updating('NO_EVALUATION');
        cg$rec.DATE_CREATION := cg$STRUCTURE_EVALUATION.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.ETAT := cg$STRUCTURE_EVALUATION.cg$table(idx).ETAT;
        cg$ind.ETAT := updating('ETAT');

        cg$STRUCTURE_EVALUATION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$STRUCTURE_EVALUATION.upd_denorm2( cg$rec,
                                       cg$STRUCTURE_EVALUATION.cg$tableind(idx)
                                     );
        cg$STRUCTURE_EVALUATION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$STRUCTURE_EVALUATION.cg$tableind(idx)
								                  );
        cg$STRUCTURE_EVALUATION.cascade_update(cg$rec, cg$old_rec);
        cg$STRUCTURE_EVALUATION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$STRUCTURE_EVALUATION.called_from_package := FALSE;
	END IF;
        idx := cg$STRUCTURE_EVALUATION.cg$table.NEXT(idx);
    END LOOP;

    cg$STRUCTURE_EVALUATION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$BDS_STRUCTURE_EVALUATION
BEFORE DELETE ON STRUCTURE_EVALUATION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$STRUCTURE_EVALUATION.cg$table.DELETE;
    cg$STRUCTURE_EVALUATION.cg$tableind.DELETE;
    cg$STRUCTURE_EVALUATION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$BDR_STRUCTURE_EVALUATION
BEFORE DELETE ON STRUCTURE_EVALUATION FOR EACH ROW
DECLARE
    cg$pk cg$STRUCTURE_EVALUATION.cg$pk_type;
    cg$rec cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$ind cg$STRUCTURE_EVALUATION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_EVALUATION  := :old.NO_EVALUATION;
    cg$rec.NO_EVALUATION := :old.NO_EVALUATION;
    cg$STRUCTURE_EVALUATION.cg$table(cg$STRUCTURE_EVALUATION.idx).NO_EVALUATION := :old.NO_EVALUATION;


    cg$STRUCTURE_EVALUATION.idx := cg$STRUCTURE_EVALUATION.idx + 1;

    if not (cg$STRUCTURE_EVALUATION.called_from_package) then
        cg$STRUCTURE_EVALUATION.validate_domain_cascade_delete(cg$rec);   
        cg$STRUCTURE_EVALUATION.del(cg$pk, FALSE);
        cg$STRUCTURE_EVALUATION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_STRUCTURE_EVALUATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_STRUCTURE_EVALUATION
AFTER DELETE ON STRUCTURE_EVALUATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_STRUCTURE_EVALUATION
/

PROMPT Creating After Delete Statement Trigger on 'STRUCTURE_EVALUATION'
CREATE OR REPLACE TRIGGER cg$ADS_STRUCTURE_EVALUATION
AFTER DELETE ON STRUCTURE_EVALUATION
DECLARE
    idx        BINARY_INTEGER := cg$STRUCTURE_EVALUATION.cg$table.FIRST;
    cg$rec   cg$STRUCTURE_EVALUATION.cg$row_type;
    cg$old_rec   cg$STRUCTURE_EVALUATION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$STRUCTURE_EVALUATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_EVALUATION := cg$STRUCTURE_EVALUATION.cg$table(idx).NO_EVALUATION;
            cg$STRUCTURE_EVALUATION.cg$tableind(idx).NO_EVALUATION := TRUE;
            cg$rec.DATE_CREATION := cg$STRUCTURE_EVALUATION.cg$table(idx).DATE_CREATION;
            cg$STRUCTURE_EVALUATION.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.ETAT := cg$STRUCTURE_EVALUATION.cg$table(idx).ETAT;
            cg$STRUCTURE_EVALUATION.cg$tableind(idx).ETAT := TRUE;

            cg$STRUCTURE_EVALUATION.validate_foreign_keys_del(cg$rec);
            cg$STRUCTURE_EVALUATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$STRUCTURE_EVALUATION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$STRUCTURE_EVALUATION.cascade_delete(cg$rec);
            cg$STRUCTURE_EVALUATION.domain_cascade_delete(cg$rec);             

            idx := cg$STRUCTURE_EVALUATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



