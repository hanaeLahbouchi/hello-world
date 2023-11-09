
PROMPT Creating Trigger Logic for Table 'SOUTENANCE'
PROMPT Creating Before Insert Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BIS_SOUTENANCE
BEFORE INSERT ON SOUTENANCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$SOUTENANCE.cg$table.DELETE;
    cg$SOUTENANCE.cg$tableind.DELETE;
    cg$SOUTENANCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BIR_SOUTENANCE
BEFORE INSERT ON SOUTENANCE FOR EACH ROW
DECLARE
    cg$rec cg$SOUTENANCE.cg$row_type;
    cg$ind cg$SOUTENANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_SESSION := :new.NO_SESSION;
    cg$ind.NO_SESSION := TRUE;
    cg$rec.NO_ENSEIGNANT_RESPONSABLE := :new.NO_ENSEIGNANT_RESPONSABLE;
    cg$ind.NO_ENSEIGNANT_RESPONSABLE := TRUE;
    cg$rec.NO_ENSEIGNANT_ASSESSEUR := :new.NO_ENSEIGNANT_ASSESSEUR;
    cg$ind.NO_ENSEIGNANT_ASSESSEUR := TRUE;
    cg$rec.DATE_SOUTENANCE := :new.DATE_SOUTENANCE;
    cg$ind.DATE_SOUTENANCE := TRUE;
    cg$rec.PLAGE_HORAIRE := :new.PLAGE_HORAIRE;
    cg$ind.PLAGE_HORAIRE := TRUE;
    cg$rec.SALLE := :new.SALLE;
    cg$ind.SALLE := TRUE;

    if not (cg$SOUTENANCE.called_from_package) then
        cg$SOUTENANCE.validate_arc(cg$rec);
        cg$SOUTENANCE.validate_domain(cg$rec);

        cg$SOUTENANCE.ins(cg$rec, cg$ind, FALSE);
        cg$SOUTENANCE.called_from_package := FALSE;
    end if;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_SESSION := cg$rec.NO_SESSION;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).NO_SESSION := cg$ind.NO_SESSION;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_RESPONSABLE := cg$rec.NO_ENSEIGNANT_RESPONSABLE;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).NO_ENSEIGNANT_RESPONSABLE := cg$ind.NO_ENSEIGNANT_RESPONSABLE;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_ASSESSEUR := cg$rec.NO_ENSEIGNANT_ASSESSEUR;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).NO_ENSEIGNANT_ASSESSEUR := cg$ind.NO_ENSEIGNANT_ASSESSEUR;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).DATE_SOUTENANCE := cg$rec.DATE_SOUTENANCE;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).DATE_SOUTENANCE := cg$ind.DATE_SOUTENANCE;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).PLAGE_HORAIRE := cg$rec.PLAGE_HORAIRE;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).PLAGE_HORAIRE := cg$ind.PLAGE_HORAIRE;

    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).SALLE := cg$rec.SALLE;
    cg$SOUTENANCE.cg$tableind(cg$SOUTENANCE.idx).SALLE := cg$ind.SALLE;

    cg$SOUTENANCE.idx := cg$SOUTENANCE.idx + 1;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_SESSION := cg$rec.NO_SESSION;
    :new.NO_ENSEIGNANT_RESPONSABLE := cg$rec.NO_ENSEIGNANT_RESPONSABLE;
    :new.NO_ENSEIGNANT_ASSESSEUR := cg$rec.NO_ENSEIGNANT_ASSESSEUR;
    :new.DATE_SOUTENANCE := cg$rec.DATE_SOUTENANCE;
    :new.PLAGE_HORAIRE := cg$rec.PLAGE_HORAIRE;
    :new.SALLE := cg$rec.SALLE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_SOUTENANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_SOUTENANCE
AFTER INSERT ON SOUTENANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_SOUTENANCE
/

PROMPT Creating After Insert Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$AIS_SOUTENANCE
AFTER INSERT ON SOUTENANCE
DECLARE
    idx      BINARY_INTEGER := cg$SOUTENANCE.cg$table.FIRST;
    cg$rec   cg$SOUTENANCE.cg$row_type;
    cg$old_rec   cg$SOUTENANCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$SOUTENANCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$SOUTENANCE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_SESSION := cg$SOUTENANCE.cg$table(idx).NO_SESSION;
            cg$rec.NO_ENSEIGNANT_RESPONSABLE := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_RESPONSABLE;
            cg$rec.NO_ENSEIGNANT_ASSESSEUR := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_ASSESSEUR;
            cg$rec.DATE_SOUTENANCE := cg$SOUTENANCE.cg$table(idx).DATE_SOUTENANCE;
            cg$rec.PLAGE_HORAIRE := cg$SOUTENANCE.cg$table(idx).PLAGE_HORAIRE;
            cg$rec.SALLE := cg$SOUTENANCE.cg$table(idx).SALLE;

            cg$SOUTENANCE.validate_foreign_keys_ins(cg$rec);

            cg$SOUTENANCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SOUTENANCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$SOUTENANCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BUS_SOUTENANCE
BEFORE UPDATE ON SOUTENANCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$SOUTENANCE.cg$table.DELETE;
    cg$SOUTENANCE.cg$tableind.DELETE;
    cg$SOUTENANCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BUR_SOUTENANCE
BEFORE UPDATE ON SOUTENANCE FOR EACH ROW
DECLARE
    cg$rec     cg$SOUTENANCE.cg$row_type;
    cg$ind     cg$SOUTENANCE.cg$ind_type;
    cg$old_rec cg$SOUTENANCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_SESSION := :new.NO_SESSION;
    cg$ind.NO_SESSION :=    (:new.NO_SESSION IS NULL AND :old.NO_SESSION IS NOT NULL )
                        OR (:new.NO_SESSION IS NOT NULL AND :old.NO_SESSION IS NULL)
                        OR NOT(:new.NO_SESSION = :old.NO_SESSION) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_SESSION := :old.NO_SESSION;
    cg$rec.NO_ENSEIGNANT_RESPONSABLE := :new.NO_ENSEIGNANT_RESPONSABLE;
    cg$ind.NO_ENSEIGNANT_RESPONSABLE :=    (:new.NO_ENSEIGNANT_RESPONSABLE IS NULL AND :old.NO_ENSEIGNANT_RESPONSABLE IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT_RESPONSABLE IS NOT NULL AND :old.NO_ENSEIGNANT_RESPONSABLE IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT_RESPONSABLE = :old.NO_ENSEIGNANT_RESPONSABLE) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_RESPONSABLE := :old.NO_ENSEIGNANT_RESPONSABLE;
    cg$rec.NO_ENSEIGNANT_ASSESSEUR := :new.NO_ENSEIGNANT_ASSESSEUR;
    cg$ind.NO_ENSEIGNANT_ASSESSEUR :=    (:new.NO_ENSEIGNANT_ASSESSEUR IS NULL AND :old.NO_ENSEIGNANT_ASSESSEUR IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT_ASSESSEUR IS NOT NULL AND :old.NO_ENSEIGNANT_ASSESSEUR IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT_ASSESSEUR = :old.NO_ENSEIGNANT_ASSESSEUR) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_ASSESSEUR := :old.NO_ENSEIGNANT_ASSESSEUR;
    cg$rec.DATE_SOUTENANCE := :new.DATE_SOUTENANCE;
    cg$ind.DATE_SOUTENANCE :=    (:new.DATE_SOUTENANCE IS NULL AND :old.DATE_SOUTENANCE IS NOT NULL )
                        OR (:new.DATE_SOUTENANCE IS NOT NULL AND :old.DATE_SOUTENANCE IS NULL)
                        OR NOT(:new.DATE_SOUTENANCE = :old.DATE_SOUTENANCE) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).DATE_SOUTENANCE := :old.DATE_SOUTENANCE;
    cg$rec.PLAGE_HORAIRE := :new.PLAGE_HORAIRE;
    cg$ind.PLAGE_HORAIRE :=    (:new.PLAGE_HORAIRE IS NULL AND :old.PLAGE_HORAIRE IS NOT NULL )
                        OR (:new.PLAGE_HORAIRE IS NOT NULL AND :old.PLAGE_HORAIRE IS NULL)
                        OR NOT(:new.PLAGE_HORAIRE = :old.PLAGE_HORAIRE) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).PLAGE_HORAIRE := :old.PLAGE_HORAIRE;
    cg$rec.SALLE := :new.SALLE;
    cg$ind.SALLE :=    (:new.SALLE IS NULL AND :old.SALLE IS NOT NULL )
                        OR (:new.SALLE IS NOT NULL AND :old.SALLE IS NULL)
                        OR NOT(:new.SALLE = :old.SALLE) ;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).SALLE := :old.SALLE;


    cg$SOUTENANCE.idx := cg$SOUTENANCE.idx + 1;

    if not (cg$SOUTENANCE.called_from_package) then
        cg$SOUTENANCE.validate_arc(cg$rec);
        cg$SOUTENANCE.validate_domain(cg$rec, cg$ind);
        cg$SOUTENANCE.validate_domain_cascade_update(cg$old_rec);   

        cg$SOUTENANCE.upd(cg$rec, cg$ind, FALSE);
        cg$SOUTENANCE.called_from_package := FALSE;
    end if;

    :new.NO_ENSEIGNANT_RESPONSABLE := cg$rec.NO_ENSEIGNANT_RESPONSABLE;
    :new.NO_ENSEIGNANT_ASSESSEUR := cg$rec.NO_ENSEIGNANT_ASSESSEUR;
    :new.DATE_SOUTENANCE := cg$rec.DATE_SOUTENANCE;
    :new.PLAGE_HORAIRE := cg$rec.PLAGE_HORAIRE;
    :new.SALLE := cg$rec.SALLE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_SOUTENANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_SOUTENANCE
AFTER UPDATE ON SOUTENANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_SOUTENANCE
/






PROMPT Creating After Update Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$AUS_SOUTENANCE
AFTER UPDATE ON SOUTENANCE
DECLARE
    idx        BINARY_INTEGER := cg$SOUTENANCE.cg$table.FIRST;
    cg$old_rec cg$SOUTENANCE.cg$row_type;
    cg$rec     cg$SOUTENANCE.cg$row_type;
    cg$ind     cg$SOUTENANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ANNEE_PRO := cg$SOUTENANCE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_SESSION := cg$SOUTENANCE.cg$table(idx).NO_SESSION;
        cg$old_rec.NO_ENSEIGNANT_RESPONSABLE := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_RESPONSABLE;
        cg$old_rec.NO_ENSEIGNANT_ASSESSEUR := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_ASSESSEUR;
        cg$old_rec.DATE_SOUTENANCE := cg$SOUTENANCE.cg$table(idx).DATE_SOUTENANCE;
        cg$old_rec.PLAGE_HORAIRE := cg$SOUTENANCE.cg$table(idx).PLAGE_HORAIRE;
        cg$old_rec.SALLE := cg$SOUTENANCE.cg$table(idx).SALLE;

    IF NOT (cg$SOUTENANCE.called_from_package) THEN
        idx := cg$SOUTENANCE.cg$table.NEXT(idx);
        cg$rec.ANNEE_PRO := cg$SOUTENANCE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_SESSION := cg$SOUTENANCE.cg$table(idx).NO_SESSION;
        cg$ind.NO_SESSION := updating('NO_SESSION');
        cg$rec.NO_ENSEIGNANT_RESPONSABLE := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_RESPONSABLE;
        cg$ind.NO_ENSEIGNANT_RESPONSABLE := updating('NO_ENSEIGNANT_RESPONSABLE');
        cg$rec.NO_ENSEIGNANT_ASSESSEUR := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_ASSESSEUR;
        cg$ind.NO_ENSEIGNANT_ASSESSEUR := updating('NO_ENSEIGNANT_ASSESSEUR');
        cg$rec.DATE_SOUTENANCE := cg$SOUTENANCE.cg$table(idx).DATE_SOUTENANCE;
        cg$ind.DATE_SOUTENANCE := updating('DATE_SOUTENANCE');
        cg$rec.PLAGE_HORAIRE := cg$SOUTENANCE.cg$table(idx).PLAGE_HORAIRE;
        cg$ind.PLAGE_HORAIRE := updating('PLAGE_HORAIRE');
        cg$rec.SALLE := cg$SOUTENANCE.cg$table(idx).SALLE;
        cg$ind.SALLE := updating('SALLE');

        cg$SOUTENANCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$SOUTENANCE.upd_denorm2( cg$rec,
                                       cg$SOUTENANCE.cg$tableind(idx)
                                     );
        cg$SOUTENANCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$SOUTENANCE.cg$tableind(idx)
								                  );
        cg$SOUTENANCE.cascade_update(cg$rec, cg$old_rec);
        cg$SOUTENANCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$SOUTENANCE.called_from_package := FALSE;
	END IF;
        idx := cg$SOUTENANCE.cg$table.NEXT(idx);
    END LOOP;

    cg$SOUTENANCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BDS_SOUTENANCE
BEFORE DELETE ON SOUTENANCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$SOUTENANCE.cg$table.DELETE;
    cg$SOUTENANCE.cg$tableind.DELETE;
    cg$SOUTENANCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$BDR_SOUTENANCE
BEFORE DELETE ON SOUTENANCE FOR EACH ROW
DECLARE
    cg$pk cg$SOUTENANCE.cg$pk_type;
    cg$rec cg$SOUTENANCE.cg$row_type;
    cg$ind cg$SOUTENANCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_SESSION  := :old.NO_SESSION;
    cg$rec.NO_SESSION := :old.NO_SESSION;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_SESSION := :old.NO_SESSION;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ENSEIGNANT_RESPONSABLE := :old.NO_ENSEIGNANT_RESPONSABLE;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_RESPONSABLE := :old.NO_ENSEIGNANT_RESPONSABLE;
    cg$rec.NO_ENSEIGNANT_ASSESSEUR := :old.NO_ENSEIGNANT_ASSESSEUR;
    cg$SOUTENANCE.cg$table(cg$SOUTENANCE.idx).NO_ENSEIGNANT_ASSESSEUR := :old.NO_ENSEIGNANT_ASSESSEUR;


    cg$SOUTENANCE.idx := cg$SOUTENANCE.idx + 1;

    if not (cg$SOUTENANCE.called_from_package) then
        cg$SOUTENANCE.validate_domain_cascade_delete(cg$rec);   
        cg$SOUTENANCE.del(cg$pk, FALSE);
        cg$SOUTENANCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_SOUTENANCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_SOUTENANCE
AFTER DELETE ON SOUTENANCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_SOUTENANCE
/

PROMPT Creating After Delete Statement Trigger on 'SOUTENANCE'
CREATE OR REPLACE TRIGGER cg$ADS_SOUTENANCE
AFTER DELETE ON SOUTENANCE
DECLARE
    idx        BINARY_INTEGER := cg$SOUTENANCE.cg$table.FIRST;
    cg$rec   cg$SOUTENANCE.cg$row_type;
    cg$old_rec   cg$SOUTENANCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$SOUTENANCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$SOUTENANCE.cg$table(idx).ANNEE_PRO;
            cg$SOUTENANCE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_SESSION := cg$SOUTENANCE.cg$table(idx).NO_SESSION;
            cg$SOUTENANCE.cg$tableind(idx).NO_SESSION := TRUE;
            cg$rec.NO_ENSEIGNANT_RESPONSABLE := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_RESPONSABLE;
            cg$SOUTENANCE.cg$tableind(idx).NO_ENSEIGNANT_RESPONSABLE := TRUE;
            cg$rec.NO_ENSEIGNANT_ASSESSEUR := cg$SOUTENANCE.cg$table(idx).NO_ENSEIGNANT_ASSESSEUR;
            cg$SOUTENANCE.cg$tableind(idx).NO_ENSEIGNANT_ASSESSEUR := TRUE;
            cg$rec.DATE_SOUTENANCE := cg$SOUTENANCE.cg$table(idx).DATE_SOUTENANCE;
            cg$SOUTENANCE.cg$tableind(idx).DATE_SOUTENANCE := TRUE;
            cg$rec.PLAGE_HORAIRE := cg$SOUTENANCE.cg$table(idx).PLAGE_HORAIRE;
            cg$SOUTENANCE.cg$tableind(idx).PLAGE_HORAIRE := TRUE;
            cg$rec.SALLE := cg$SOUTENANCE.cg$table(idx).SALLE;
            cg$SOUTENANCE.cg$tableind(idx).SALLE := TRUE;

            cg$SOUTENANCE.validate_foreign_keys_del(cg$rec);
            cg$SOUTENANCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SOUTENANCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$SOUTENANCE.cascade_delete(cg$rec);
            cg$SOUTENANCE.domain_cascade_delete(cg$rec);             

            idx := cg$SOUTENANCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



