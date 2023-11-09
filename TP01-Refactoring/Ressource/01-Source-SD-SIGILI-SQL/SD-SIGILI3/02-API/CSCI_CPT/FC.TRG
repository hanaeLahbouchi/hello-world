
PROMPT Creating Trigger Logic for Table 'FAMILLE_COMPETENCE'
PROMPT Creating Before Insert Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIS_FAMILLE_COMPETENCE
BEFORE INSERT ON FAMILLE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$FAMILLE_COMPETENCE.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIR_FAMILLE_COMPETENCE
BEFORE INSERT ON FAMILLE_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$ind cg$FAMILLE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC := TRUE;
    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC := TRUE;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.STD_PERSO := :new.STD_PERSO;
    cg$ind.STD_PERSO := TRUE;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$FAMILLE_COMPETENCE.called_from_package) then
        cg$FAMILLE_COMPETENCE.validate_arc(cg$rec);
        cg$FAMILLE_COMPETENCE.validate_domain(cg$rec);

        cg$FAMILLE_COMPETENCE.ins(cg$rec, cg$ind, FALSE);
        cg$FAMILLE_COMPETENCE.called_from_package := FALSE;
    end if;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_FC := cg$rec.ID_FC;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).ID_FC := cg$ind.ID_FC;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_DC := cg$rec.ID_DC;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).ID_DC := cg$ind.ID_DC;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_EC := cg$rec.ID_EC;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).ID_EC := cg$ind.ID_EC;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_SPC := cg$rec.ID_SPC;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).ID_SPC := cg$ind.ID_SPC;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).STD_PERSO := cg$rec.STD_PERSO;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).STD_PERSO := cg$ind.STD_PERSO;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).TYPE_COMPETENCE := cg$ind.TYPE_COMPETENCE;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ORDRE := cg$rec.ORDRE;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).ORDRE := cg$ind.ORDRE;

    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$FAMILLE_COMPETENCE.cg$tableind(cg$FAMILLE_COMPETENCE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$FAMILLE_COMPETENCE.idx := cg$FAMILLE_COMPETENCE.idx + 1;

    :new.ID_FC := cg$rec.ID_FC;
    :new.ID_DC := cg$rec.ID_DC;
    :new.ID_EC := cg$rec.ID_EC;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.STD_PERSO := cg$rec.STD_PERSO;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_FAMILLE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_FAMILLE_COMPETENCE
AFTER INSERT ON FAMILLE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_FAMILLE_COMPETENCE
/

PROMPT Creating After Insert Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AIS_FAMILLE_COMPETENCE
AFTER INSERT ON FAMILLE_COMPETENCE
DECLARE
    idx      BINARY_INTEGER := cg$FAMILLE_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$old_rec   cg$FAMILLE_COMPETENCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$FAMILLE_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_FC;
            cg$rec.ID_DC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_DC;
            cg$rec.ID_EC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_EC;
            cg$rec.ID_SPC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_SPC;
            cg$rec.STD_PERSO := cg$FAMILLE_COMPETENCE.cg$table(idx).STD_PERSO;
            cg$rec.TYPE_COMPETENCE := cg$FAMILLE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESIGNATION;
            cg$rec.ORDRE := cg$FAMILLE_COMPETENCE.cg$table(idx).ORDRE;
            cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESCRIPTION;

            cg$FAMILLE_COMPETENCE.validate_foreign_keys_ins(cg$rec);

            cg$FAMILLE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FAMILLE_COMPETENCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$FAMILLE_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUS_FAMILLE_COMPETENCE
BEFORE UPDATE ON FAMILLE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$FAMILLE_COMPETENCE.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUR_FAMILLE_COMPETENCE
BEFORE UPDATE ON FAMILLE_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec     cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$ind     cg$FAMILLE_COMPETENCE.cg$ind_type;
    cg$old_rec cg$FAMILLE_COMPETENCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC :=    (:new.ID_DC IS NULL AND :old.ID_DC IS NOT NULL )
                        OR (:new.ID_DC IS NOT NULL AND :old.ID_DC IS NULL)
                        OR NOT(:new.ID_DC = :old.ID_DC) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_DC := :old.ID_DC;
    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC :=    (:new.ID_EC IS NULL AND :old.ID_EC IS NOT NULL )
                        OR (:new.ID_EC IS NOT NULL AND :old.ID_EC IS NULL)
                        OR NOT(:new.ID_EC = :old.ID_EC) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_EC := :old.ID_EC;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_SPC := :old.ID_SPC;
    cg$rec.STD_PERSO := :new.STD_PERSO;
    cg$ind.STD_PERSO :=    (:new.STD_PERSO IS NULL AND :old.STD_PERSO IS NOT NULL )
                        OR (:new.STD_PERSO IS NOT NULL AND :old.STD_PERSO IS NULL)
                        OR NOT(:new.STD_PERSO = :old.STD_PERSO) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).STD_PERSO := :old.STD_PERSO;
    cg$rec.TYPE_COMPETENCE := :new.TYPE_COMPETENCE;
    cg$ind.TYPE_COMPETENCE :=    (:new.TYPE_COMPETENCE IS NULL AND :old.TYPE_COMPETENCE IS NOT NULL )
                        OR (:new.TYPE_COMPETENCE IS NOT NULL AND :old.TYPE_COMPETENCE IS NULL)
                        OR NOT(:new.TYPE_COMPETENCE = :old.TYPE_COMPETENCE) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).TYPE_COMPETENCE := :old.TYPE_COMPETENCE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.ORDRE := :new.ORDRE;
    cg$ind.ORDRE :=    (:new.ORDRE IS NULL AND :old.ORDRE IS NOT NULL )
                        OR (:new.ORDRE IS NOT NULL AND :old.ORDRE IS NULL)
                        OR NOT(:new.ORDRE = :old.ORDRE) ;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ORDRE := :old.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$FAMILLE_COMPETENCE.idx := cg$FAMILLE_COMPETENCE.idx + 1;

    if not (cg$FAMILLE_COMPETENCE.called_from_package) then
        cg$FAMILLE_COMPETENCE.validate_arc(cg$rec);
        cg$FAMILLE_COMPETENCE.validate_domain(cg$rec, cg$ind);
        cg$FAMILLE_COMPETENCE.validate_domain_cascade_update(cg$old_rec);   

        cg$FAMILLE_COMPETENCE.upd(cg$rec, cg$ind, FALSE);
        cg$FAMILLE_COMPETENCE.called_from_package := FALSE;
    end if;

    :new.ID_DC := cg$rec.ID_DC;
    :new.ID_EC := cg$rec.ID_EC;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.STD_PERSO := cg$rec.STD_PERSO;
    :new.TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ORDRE := cg$rec.ORDRE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_FAMILLE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_FAMILLE_COMPETENCE
AFTER UPDATE ON FAMILLE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_FAMILLE_COMPETENCE
/






PROMPT Creating After Update Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AUS_FAMILLE_COMPETENCE
AFTER UPDATE ON FAMILLE_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$FAMILLE_COMPETENCE.cg$table.FIRST;
    cg$old_rec cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$rec     cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$ind     cg$FAMILLE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_FC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_FC;
        cg$old_rec.ID_DC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_DC;
        cg$old_rec.ID_EC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_EC;
        cg$old_rec.ID_SPC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_SPC;
        cg$old_rec.STD_PERSO := cg$FAMILLE_COMPETENCE.cg$table(idx).STD_PERSO;
        cg$old_rec.TYPE_COMPETENCE := cg$FAMILLE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$old_rec.DESIGNATION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESIGNATION;
        cg$old_rec.ORDRE := cg$FAMILLE_COMPETENCE.cg$table(idx).ORDRE;
        cg$old_rec.DESCRIPTION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESCRIPTION;

    IF NOT (cg$FAMILLE_COMPETENCE.called_from_package) THEN
        idx := cg$FAMILLE_COMPETENCE.cg$table.NEXT(idx);
        cg$rec.ID_FC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.ID_DC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_DC;
        cg$ind.ID_DC := updating('ID_DC');
        cg$rec.ID_EC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_EC;
        cg$ind.ID_EC := updating('ID_EC');
        cg$rec.ID_SPC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.STD_PERSO := cg$FAMILLE_COMPETENCE.cg$table(idx).STD_PERSO;
        cg$ind.STD_PERSO := updating('STD_PERSO');
        cg$rec.TYPE_COMPETENCE := cg$FAMILLE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
        cg$ind.TYPE_COMPETENCE := updating('TYPE_COMPETENCE');
        cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ORDRE := cg$FAMILLE_COMPETENCE.cg$table(idx).ORDRE;
        cg$ind.ORDRE := updating('ORDRE');
        cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$FAMILLE_COMPETENCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$FAMILLE_COMPETENCE.upd_denorm2( cg$rec,
                                       cg$FAMILLE_COMPETENCE.cg$tableind(idx)
                                     );
        cg$FAMILLE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$FAMILLE_COMPETENCE.cg$tableind(idx)
								                  );
        cg$FAMILLE_COMPETENCE.cascade_update(cg$rec, cg$old_rec);
        cg$FAMILLE_COMPETENCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$FAMILLE_COMPETENCE.called_from_package := FALSE;
	END IF;
        idx := cg$FAMILLE_COMPETENCE.cg$table.NEXT(idx);
    END LOOP;

    cg$FAMILLE_COMPETENCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDS_FAMILLE_COMPETENCE
BEFORE DELETE ON FAMILLE_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$FAMILLE_COMPETENCE.cg$table.DELETE;
    cg$FAMILLE_COMPETENCE.cg$tableind.DELETE;
    cg$FAMILLE_COMPETENCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDR_FAMILLE_COMPETENCE
BEFORE DELETE ON FAMILLE_COMPETENCE FOR EACH ROW
DECLARE
    cg$pk cg$FAMILLE_COMPETENCE.cg$pk_type;
    cg$rec cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$ind cg$FAMILLE_COMPETENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_FC  := :old.ID_FC;
    cg$rec.ID_FC := :old.ID_FC;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_EC := :old.ID_EC;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_EC := :old.ID_EC;
    cg$rec.ID_DC := :old.ID_DC;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_DC := :old.ID_DC;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$FAMILLE_COMPETENCE.cg$table(cg$FAMILLE_COMPETENCE.idx).ID_SPC := :old.ID_SPC;


    cg$FAMILLE_COMPETENCE.idx := cg$FAMILLE_COMPETENCE.idx + 1;

    if not (cg$FAMILLE_COMPETENCE.called_from_package) then
        cg$FAMILLE_COMPETENCE.validate_domain_cascade_delete(cg$rec);   
        cg$FAMILLE_COMPETENCE.del(cg$pk, FALSE);
        cg$FAMILLE_COMPETENCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_FAMILLE_COMPETENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_FAMILLE_COMPETENCE
AFTER DELETE ON FAMILLE_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_FAMILLE_COMPETENCE
/

PROMPT Creating After Delete Statement Trigger on 'FAMILLE_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$ADS_FAMILLE_COMPETENCE
AFTER DELETE ON FAMILLE_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$FAMILLE_COMPETENCE.cg$table.FIRST;
    cg$rec   cg$FAMILLE_COMPETENCE.cg$row_type;
    cg$old_rec   cg$FAMILLE_COMPETENCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$FAMILLE_COMPETENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_FC;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.ID_DC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_DC;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).ID_DC := TRUE;
            cg$rec.ID_EC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_EC;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).ID_EC := TRUE;
            cg$rec.ID_SPC := cg$FAMILLE_COMPETENCE.cg$table(idx).ID_SPC;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.STD_PERSO := cg$FAMILLE_COMPETENCE.cg$table(idx).STD_PERSO;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).STD_PERSO := TRUE;
            cg$rec.TYPE_COMPETENCE := cg$FAMILLE_COMPETENCE.cg$table(idx).TYPE_COMPETENCE;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).TYPE_COMPETENCE := TRUE;
            cg$rec.DESIGNATION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESIGNATION;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ORDRE := cg$FAMILLE_COMPETENCE.cg$table(idx).ORDRE;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).ORDRE := TRUE;
            cg$rec.DESCRIPTION := cg$FAMILLE_COMPETENCE.cg$table(idx).DESCRIPTION;
            cg$FAMILLE_COMPETENCE.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$FAMILLE_COMPETENCE.validate_foreign_keys_del(cg$rec);
            cg$FAMILLE_COMPETENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FAMILLE_COMPETENCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$FAMILLE_COMPETENCE.cascade_delete(cg$rec);
            cg$FAMILLE_COMPETENCE.domain_cascade_delete(cg$rec);             

            idx := cg$FAMILLE_COMPETENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



