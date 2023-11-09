
PROMPT Creating Trigger Logic for Table 'INTERVENTION'
PROMPT Creating Before Insert Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BIS_INTERVENTION
BEFORE INSERT ON INTERVENTION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$INTERVENTION.cg$table.DELETE;
    cg$INTERVENTION.cg$tableind.DELETE;
    cg$INTERVENTION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BIR_INTERVENTION
BEFORE INSERT ON INTERVENTION FOR EACH ROW
DECLARE
    cg$rec cg$INTERVENTION.cg$row_type;
    cg$ind cg$INTERVENTION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_INTERVENTION := :new.ID_INTERVENTION;
    cg$ind.ID_INTERVENTION := TRUE;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.DEBUT := :new.DEBUT;
    cg$ind.DEBUT := TRUE;
    cg$rec.FIN := :new.FIN;
    cg$ind.FIN := TRUE;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE := TRUE;
    cg$rec.SALLE := :new.SALLE;
    cg$ind.SALLE := TRUE;
    cg$rec.DOM_APP := :new.DOM_APP;
    cg$ind.DOM_APP := TRUE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;

    if not (cg$INTERVENTION.called_from_package) then
        cg$INTERVENTION.validate_arc(cg$rec);
        cg$INTERVENTION.validate_domain(cg$rec);

        cg$INTERVENTION.ins(cg$rec, cg$ind, FALSE);
        cg$INTERVENTION.called_from_package := FALSE;
    end if;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).ID_INTERVENTION := cg$rec.ID_INTERVENTION;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).ID_INTERVENTION := cg$ind.ID_INTERVENTION;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DEBUT := cg$rec.DEBUT;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).DEBUT := cg$ind.DEBUT;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).FIN := cg$rec.FIN;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).FIN := cg$ind.FIN;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DUREE := cg$rec.DUREE;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).DUREE := cg$ind.DUREE;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).SALLE := cg$rec.SALLE;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).SALLE := cg$ind.SALLE;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DOM_APP := cg$rec.DOM_APP;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).DOM_APP := cg$ind.DOM_APP;

    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$INTERVENTION.cg$tableind(cg$INTERVENTION.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$INTERVENTION.idx := cg$INTERVENTION.idx + 1;

    :new.ID_INTERVENTION := cg$rec.ID_INTERVENTION;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.DEBUT := cg$rec.DEBUT;
    :new.FIN := cg$rec.FIN;
    :new.DUREE := cg$rec.DUREE;
    :new.SALLE := cg$rec.SALLE;
    :new.DOM_APP := cg$rec.DOM_APP;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_INTERVENTION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_INTERVENTION
AFTER INSERT ON INTERVENTION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_INTERVENTION
/

PROMPT Creating After Insert Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$AIS_INTERVENTION
AFTER INSERT ON INTERVENTION
DECLARE
    idx      BINARY_INTEGER := cg$INTERVENTION.cg$table.FIRST;
    cg$rec   cg$INTERVENTION.cg$row_type;
    cg$old_rec   cg$INTERVENTION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$INTERVENTION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_INTERVENTION := cg$INTERVENTION.cg$table(idx).ID_INTERVENTION;
            cg$rec.NO_ENSEIGNANT := cg$INTERVENTION.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.DEBUT := cg$INTERVENTION.cg$table(idx).DEBUT;
            cg$rec.FIN := cg$INTERVENTION.cg$table(idx).FIN;
            cg$rec.DUREE := cg$INTERVENTION.cg$table(idx).DUREE;
            cg$rec.SALLE := cg$INTERVENTION.cg$table(idx).SALLE;
            cg$rec.DOM_APP := cg$INTERVENTION.cg$table(idx).DOM_APP;
            cg$rec.COMMENTAIRE := cg$INTERVENTION.cg$table(idx).COMMENTAIRE;

            cg$INTERVENTION.validate_foreign_keys_ins(cg$rec);

            cg$INTERVENTION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$INTERVENTION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$INTERVENTION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BUS_INTERVENTION
BEFORE UPDATE ON INTERVENTION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$INTERVENTION.cg$table.DELETE;
    cg$INTERVENTION.cg$tableind.DELETE;
    cg$INTERVENTION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BUR_INTERVENTION
BEFORE UPDATE ON INTERVENTION FOR EACH ROW
DECLARE
    cg$rec     cg$INTERVENTION.cg$row_type;
    cg$ind     cg$INTERVENTION.cg$ind_type;
    cg$old_rec cg$INTERVENTION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_INTERVENTION := :new.ID_INTERVENTION;
    cg$ind.ID_INTERVENTION :=    (:new.ID_INTERVENTION IS NULL AND :old.ID_INTERVENTION IS NOT NULL )
                        OR (:new.ID_INTERVENTION IS NOT NULL AND :old.ID_INTERVENTION IS NULL)
                        OR NOT(:new.ID_INTERVENTION = :old.ID_INTERVENTION) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).ID_INTERVENTION := :old.ID_INTERVENTION;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.DEBUT := :new.DEBUT;
    cg$ind.DEBUT :=    (:new.DEBUT IS NULL AND :old.DEBUT IS NOT NULL )
                        OR (:new.DEBUT IS NOT NULL AND :old.DEBUT IS NULL)
                        OR NOT(:new.DEBUT = :old.DEBUT) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DEBUT := :old.DEBUT;
    cg$rec.FIN := :new.FIN;
    cg$ind.FIN :=    (:new.FIN IS NULL AND :old.FIN IS NOT NULL )
                        OR (:new.FIN IS NOT NULL AND :old.FIN IS NULL)
                        OR NOT(:new.FIN = :old.FIN) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).FIN := :old.FIN;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE :=    (:new.DUREE IS NULL AND :old.DUREE IS NOT NULL )
                        OR (:new.DUREE IS NOT NULL AND :old.DUREE IS NULL)
                        OR NOT(:new.DUREE = :old.DUREE) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DUREE := :old.DUREE;
    cg$rec.SALLE := :new.SALLE;
    cg$ind.SALLE :=    (:new.SALLE IS NULL AND :old.SALLE IS NOT NULL )
                        OR (:new.SALLE IS NOT NULL AND :old.SALLE IS NULL)
                        OR NOT(:new.SALLE = :old.SALLE) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).SALLE := :old.SALLE;
    cg$rec.DOM_APP := :new.DOM_APP;
    cg$ind.DOM_APP :=    (:new.DOM_APP IS NULL AND :old.DOM_APP IS NOT NULL )
                        OR (:new.DOM_APP IS NOT NULL AND :old.DOM_APP IS NULL)
                        OR NOT(:new.DOM_APP = :old.DOM_APP) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).DOM_APP := :old.DOM_APP;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).COMMENTAIRE := :old.COMMENTAIRE;


    cg$INTERVENTION.idx := cg$INTERVENTION.idx + 1;

    if not (cg$INTERVENTION.called_from_package) then
        cg$INTERVENTION.validate_arc(cg$rec);
        cg$INTERVENTION.validate_domain(cg$rec, cg$ind);
        cg$INTERVENTION.validate_domain_cascade_update(cg$old_rec);   

        cg$INTERVENTION.upd(cg$rec, cg$ind, FALSE);
        cg$INTERVENTION.called_from_package := FALSE;
    end if;

    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.DEBUT := cg$rec.DEBUT;
    :new.FIN := cg$rec.FIN;
    :new.DUREE := cg$rec.DUREE;
    :new.SALLE := cg$rec.SALLE;
    :new.DOM_APP := cg$rec.DOM_APP;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_INTERVENTION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_INTERVENTION
AFTER UPDATE ON INTERVENTION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_INTERVENTION
/






PROMPT Creating After Update Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$AUS_INTERVENTION
AFTER UPDATE ON INTERVENTION
DECLARE
    idx        BINARY_INTEGER := cg$INTERVENTION.cg$table.FIRST;
    cg$old_rec cg$INTERVENTION.cg$row_type;
    cg$rec     cg$INTERVENTION.cg$row_type;
    cg$ind     cg$INTERVENTION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_INTERVENTION := cg$INTERVENTION.cg$table(idx).ID_INTERVENTION;
        cg$old_rec.NO_ENSEIGNANT := cg$INTERVENTION.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.DEBUT := cg$INTERVENTION.cg$table(idx).DEBUT;
        cg$old_rec.FIN := cg$INTERVENTION.cg$table(idx).FIN;
        cg$old_rec.DUREE := cg$INTERVENTION.cg$table(idx).DUREE;
        cg$old_rec.SALLE := cg$INTERVENTION.cg$table(idx).SALLE;
        cg$old_rec.DOM_APP := cg$INTERVENTION.cg$table(idx).DOM_APP;
        cg$old_rec.COMMENTAIRE := cg$INTERVENTION.cg$table(idx).COMMENTAIRE;

    IF NOT (cg$INTERVENTION.called_from_package) THEN
        idx := cg$INTERVENTION.cg$table.NEXT(idx);
        cg$rec.ID_INTERVENTION := cg$INTERVENTION.cg$table(idx).ID_INTERVENTION;
        cg$ind.ID_INTERVENTION := updating('ID_INTERVENTION');
        cg$rec.NO_ENSEIGNANT := cg$INTERVENTION.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.DEBUT := cg$INTERVENTION.cg$table(idx).DEBUT;
        cg$ind.DEBUT := updating('DEBUT');
        cg$rec.FIN := cg$INTERVENTION.cg$table(idx).FIN;
        cg$ind.FIN := updating('FIN');
        cg$rec.DUREE := cg$INTERVENTION.cg$table(idx).DUREE;
        cg$ind.DUREE := updating('DUREE');
        cg$rec.SALLE := cg$INTERVENTION.cg$table(idx).SALLE;
        cg$ind.SALLE := updating('SALLE');
        cg$rec.DOM_APP := cg$INTERVENTION.cg$table(idx).DOM_APP;
        cg$ind.DOM_APP := updating('DOM_APP');
        cg$rec.COMMENTAIRE := cg$INTERVENTION.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');

        cg$INTERVENTION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$INTERVENTION.upd_denorm2( cg$rec,
                                       cg$INTERVENTION.cg$tableind(idx)
                                     );
        cg$INTERVENTION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$INTERVENTION.cg$tableind(idx)
								                  );
        cg$INTERVENTION.cascade_update(cg$rec, cg$old_rec);
        cg$INTERVENTION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$INTERVENTION.called_from_package := FALSE;
	END IF;
        idx := cg$INTERVENTION.cg$table.NEXT(idx);
    END LOOP;

    cg$INTERVENTION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BDS_INTERVENTION
BEFORE DELETE ON INTERVENTION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$INTERVENTION.cg$table.DELETE;
    cg$INTERVENTION.cg$tableind.DELETE;
    cg$INTERVENTION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$BDR_INTERVENTION
BEFORE DELETE ON INTERVENTION FOR EACH ROW
DECLARE
    cg$pk cg$INTERVENTION.cg$pk_type;
    cg$rec cg$INTERVENTION.cg$row_type;
    cg$ind cg$INTERVENTION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_INTERVENTION  := :old.ID_INTERVENTION;
    cg$rec.ID_INTERVENTION := :old.ID_INTERVENTION;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).ID_INTERVENTION := :old.ID_INTERVENTION;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$INTERVENTION.cg$table(cg$INTERVENTION.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;


    cg$INTERVENTION.idx := cg$INTERVENTION.idx + 1;

    if not (cg$INTERVENTION.called_from_package) then
        cg$INTERVENTION.validate_domain_cascade_delete(cg$rec);   
        cg$INTERVENTION.del(cg$pk, FALSE);
        cg$INTERVENTION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_INTERVENTION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_INTERVENTION
AFTER DELETE ON INTERVENTION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_INTERVENTION
/

PROMPT Creating After Delete Statement Trigger on 'INTERVENTION'
CREATE OR REPLACE TRIGGER cg$ADS_INTERVENTION
AFTER DELETE ON INTERVENTION
DECLARE
    idx        BINARY_INTEGER := cg$INTERVENTION.cg$table.FIRST;
    cg$rec   cg$INTERVENTION.cg$row_type;
    cg$old_rec   cg$INTERVENTION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$INTERVENTION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_INTERVENTION := cg$INTERVENTION.cg$table(idx).ID_INTERVENTION;
            cg$INTERVENTION.cg$tableind(idx).ID_INTERVENTION := TRUE;
            cg$rec.NO_ENSEIGNANT := cg$INTERVENTION.cg$table(idx).NO_ENSEIGNANT;
            cg$INTERVENTION.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.DEBUT := cg$INTERVENTION.cg$table(idx).DEBUT;
            cg$INTERVENTION.cg$tableind(idx).DEBUT := TRUE;
            cg$rec.FIN := cg$INTERVENTION.cg$table(idx).FIN;
            cg$INTERVENTION.cg$tableind(idx).FIN := TRUE;
            cg$rec.DUREE := cg$INTERVENTION.cg$table(idx).DUREE;
            cg$INTERVENTION.cg$tableind(idx).DUREE := TRUE;
            cg$rec.SALLE := cg$INTERVENTION.cg$table(idx).SALLE;
            cg$INTERVENTION.cg$tableind(idx).SALLE := TRUE;
            cg$rec.DOM_APP := cg$INTERVENTION.cg$table(idx).DOM_APP;
            cg$INTERVENTION.cg$tableind(idx).DOM_APP := TRUE;
            cg$rec.COMMENTAIRE := cg$INTERVENTION.cg$table(idx).COMMENTAIRE;
            cg$INTERVENTION.cg$tableind(idx).COMMENTAIRE := TRUE;

            cg$INTERVENTION.validate_foreign_keys_del(cg$rec);
            cg$INTERVENTION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$INTERVENTION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$INTERVENTION.cascade_delete(cg$rec);
            cg$INTERVENTION.domain_cascade_delete(cg$rec);             

            idx := cg$INTERVENTION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



