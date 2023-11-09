
PROMPT Creating Trigger Logic for Table 'VISITE_STAGE'
PROMPT Creating Before Insert Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BIS_VISITE_STAGE
BEFORE INSERT ON VISITE_STAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$VISITE_STAGE.cg$table.DELETE;
    cg$VISITE_STAGE.cg$tableind.DELETE;
    cg$VISITE_STAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BIR_VISITE_STAGE
BEFORE INSERT ON VISITE_STAGE FOR EACH ROW
DECLARE
    cg$rec cg$VISITE_STAGE.cg$row_type;
    cg$ind cg$VISITE_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI := TRUE;
    cg$rec.TYPE_CONTACT := :new.TYPE_CONTACT;
    cg$ind.TYPE_CONTACT := TRUE;
    cg$rec.DATE_PREVISIONNELLE := :new.DATE_PREVISIONNELLE;
    cg$ind.DATE_PREVISIONNELLE := TRUE;
    cg$rec.HEURE_PREVISIONNELLE := :new.HEURE_PREVISIONNELLE;
    cg$ind.HEURE_PREVISIONNELLE := TRUE;
    cg$rec.DATE_EFFECTIVE := :new.DATE_EFFECTIVE;
    cg$ind.DATE_EFFECTIVE := TRUE;
    cg$rec.HEURE_EFFECTIVE := :new.HEURE_EFFECTIVE;
    cg$ind.HEURE_EFFECTIVE := TRUE;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE := TRUE;
    -- Warning: Column COMMENTAIRE_TUTEUR_UBO is of type LONG and not allowed in triggers
	cg$ind.COMMENTAIRE_TUTEUR_UBO := FALSE;

    if not (cg$VISITE_STAGE.called_from_package) then
        cg$VISITE_STAGE.validate_arc(cg$rec);
        cg$VISITE_STAGE.validate_domain(cg$rec);

        cg$VISITE_STAGE.ins(cg$rec, cg$ind, FALSE);
        cg$VISITE_STAGE.called_from_package := FALSE;
    end if;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).TYPE_CONTACT := cg$ind.TYPE_CONTACT;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DATE_PREVISIONNELLE := cg$rec.DATE_PREVISIONNELLE;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).DATE_PREVISIONNELLE := cg$ind.DATE_PREVISIONNELLE;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).HEURE_PREVISIONNELLE := cg$rec.HEURE_PREVISIONNELLE;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).HEURE_PREVISIONNELLE := cg$ind.HEURE_PREVISIONNELLE;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DATE_EFFECTIVE := cg$rec.DATE_EFFECTIVE;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).DATE_EFFECTIVE := cg$ind.DATE_EFFECTIVE;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).HEURE_EFFECTIVE := cg$rec.HEURE_EFFECTIVE;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).HEURE_EFFECTIVE := cg$ind.HEURE_EFFECTIVE;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DUREE := cg$rec.DUREE;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).DUREE := cg$ind.DUREE;

    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).COMMENTAIRE_TUTEUR_UBO := cg$rec.COMMENTAIRE_TUTEUR_UBO;
    cg$VISITE_STAGE.cg$tableind(cg$VISITE_STAGE.idx).COMMENTAIRE_TUTEUR_UBO := cg$ind.COMMENTAIRE_TUTEUR_UBO;

    cg$VISITE_STAGE.idx := cg$VISITE_STAGE.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    :new.DATE_PREVISIONNELLE := cg$rec.DATE_PREVISIONNELLE;
    :new.HEURE_PREVISIONNELLE := cg$rec.HEURE_PREVISIONNELLE;
    :new.DATE_EFFECTIVE := cg$rec.DATE_EFFECTIVE;
    :new.HEURE_EFFECTIVE := cg$rec.HEURE_EFFECTIVE;
    :new.DUREE := cg$rec.DUREE;
    -- Warning: Column COMMENTAIRE_TUTEUR_UBO is of type LONG and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_VISITE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_VISITE_STAGE
AFTER INSERT ON VISITE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_VISITE_STAGE
/

PROMPT Creating After Insert Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$AIS_VISITE_STAGE
AFTER INSERT ON VISITE_STAGE
DECLARE
    idx      BINARY_INTEGER := cg$VISITE_STAGE.cg$table.FIRST;
    cg$rec   cg$VISITE_STAGE.cg$row_type;
    cg$old_rec   cg$VISITE_STAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$VISITE_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$VISITE_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.ANNEE_PRO := cg$VISITE_STAGE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_CONTACT_ILI := cg$VISITE_STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$rec.TYPE_CONTACT := cg$VISITE_STAGE.cg$table(idx).TYPE_CONTACT;
            cg$rec.DATE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).DATE_PREVISIONNELLE;
            cg$rec.HEURE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).HEURE_PREVISIONNELLE;
            cg$rec.DATE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).DATE_EFFECTIVE;
            cg$rec.HEURE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).HEURE_EFFECTIVE;
            cg$rec.DUREE := cg$VISITE_STAGE.cg$table(idx).DUREE;
            cg$rec.COMMENTAIRE_TUTEUR_UBO := cg$VISITE_STAGE.cg$table(idx).COMMENTAIRE_TUTEUR_UBO;

            cg$VISITE_STAGE.validate_foreign_keys_ins(cg$rec);

            cg$VISITE_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VISITE_STAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$VISITE_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BUS_VISITE_STAGE
BEFORE UPDATE ON VISITE_STAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$VISITE_STAGE.cg$table.DELETE;
    cg$VISITE_STAGE.cg$tableind.DELETE;
    cg$VISITE_STAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BUR_VISITE_STAGE
BEFORE UPDATE ON VISITE_STAGE FOR EACH ROW
DECLARE
    cg$rec     cg$VISITE_STAGE.cg$row_type;
    cg$ind     cg$VISITE_STAGE.cg$ind_type;
    cg$old_rec cg$VISITE_STAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI :=    (:new.NO_CONTACT_ILI IS NULL AND :old.NO_CONTACT_ILI IS NOT NULL )
                        OR (:new.NO_CONTACT_ILI IS NOT NULL AND :old.NO_CONTACT_ILI IS NULL)
                        OR NOT(:new.NO_CONTACT_ILI = :old.NO_CONTACT_ILI) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.TYPE_CONTACT := :new.TYPE_CONTACT;
    cg$ind.TYPE_CONTACT :=    (:new.TYPE_CONTACT IS NULL AND :old.TYPE_CONTACT IS NOT NULL )
                        OR (:new.TYPE_CONTACT IS NOT NULL AND :old.TYPE_CONTACT IS NULL)
                        OR NOT(:new.TYPE_CONTACT = :old.TYPE_CONTACT) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).TYPE_CONTACT := :old.TYPE_CONTACT;
    cg$rec.DATE_PREVISIONNELLE := :new.DATE_PREVISIONNELLE;
    cg$ind.DATE_PREVISIONNELLE :=    (:new.DATE_PREVISIONNELLE IS NULL AND :old.DATE_PREVISIONNELLE IS NOT NULL )
                        OR (:new.DATE_PREVISIONNELLE IS NOT NULL AND :old.DATE_PREVISIONNELLE IS NULL)
                        OR NOT(:new.DATE_PREVISIONNELLE = :old.DATE_PREVISIONNELLE) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DATE_PREVISIONNELLE := :old.DATE_PREVISIONNELLE;
    cg$rec.HEURE_PREVISIONNELLE := :new.HEURE_PREVISIONNELLE;
    cg$ind.HEURE_PREVISIONNELLE :=    (:new.HEURE_PREVISIONNELLE IS NULL AND :old.HEURE_PREVISIONNELLE IS NOT NULL )
                        OR (:new.HEURE_PREVISIONNELLE IS NOT NULL AND :old.HEURE_PREVISIONNELLE IS NULL)
                        OR NOT(:new.HEURE_PREVISIONNELLE = :old.HEURE_PREVISIONNELLE) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).HEURE_PREVISIONNELLE := :old.HEURE_PREVISIONNELLE;
    cg$rec.DATE_EFFECTIVE := :new.DATE_EFFECTIVE;
    cg$ind.DATE_EFFECTIVE :=    (:new.DATE_EFFECTIVE IS NULL AND :old.DATE_EFFECTIVE IS NOT NULL )
                        OR (:new.DATE_EFFECTIVE IS NOT NULL AND :old.DATE_EFFECTIVE IS NULL)
                        OR NOT(:new.DATE_EFFECTIVE = :old.DATE_EFFECTIVE) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DATE_EFFECTIVE := :old.DATE_EFFECTIVE;
    cg$rec.HEURE_EFFECTIVE := :new.HEURE_EFFECTIVE;
    cg$ind.HEURE_EFFECTIVE :=    (:new.HEURE_EFFECTIVE IS NULL AND :old.HEURE_EFFECTIVE IS NOT NULL )
                        OR (:new.HEURE_EFFECTIVE IS NOT NULL AND :old.HEURE_EFFECTIVE IS NULL)
                        OR NOT(:new.HEURE_EFFECTIVE = :old.HEURE_EFFECTIVE) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).HEURE_EFFECTIVE := :old.HEURE_EFFECTIVE;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE :=    (:new.DUREE IS NULL AND :old.DUREE IS NOT NULL )
                        OR (:new.DUREE IS NOT NULL AND :old.DUREE IS NULL)
                        OR NOT(:new.DUREE = :old.DUREE) ;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).DUREE := :old.DUREE;
    -- Warning: Column COMMENTAIRE_TUTEUR_UBO is of type LONG and not allowed in triggers
	cg$ind.COMMENTAIRE_TUTEUR_UBO := FALSE;


    cg$VISITE_STAGE.idx := cg$VISITE_STAGE.idx + 1;

    if not (cg$VISITE_STAGE.called_from_package) then
        cg$VISITE_STAGE.validate_arc(cg$rec);
        cg$VISITE_STAGE.validate_domain(cg$rec, cg$ind);
        cg$VISITE_STAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$VISITE_STAGE.upd(cg$rec, cg$ind, FALSE);
        cg$VISITE_STAGE.called_from_package := FALSE;
    end if;

    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    :new.DATE_PREVISIONNELLE := cg$rec.DATE_PREVISIONNELLE;
    :new.HEURE_PREVISIONNELLE := cg$rec.HEURE_PREVISIONNELLE;
    :new.DATE_EFFECTIVE := cg$rec.DATE_EFFECTIVE;
    :new.HEURE_EFFECTIVE := cg$rec.HEURE_EFFECTIVE;
    :new.DUREE := cg$rec.DUREE;
    -- Warning: Column COMMENTAIRE_TUTEUR_UBO is of type LONG and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_VISITE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_VISITE_STAGE
AFTER UPDATE ON VISITE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_VISITE_STAGE
/






PROMPT Creating After Update Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$AUS_VISITE_STAGE
AFTER UPDATE ON VISITE_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$VISITE_STAGE.cg$table.FIRST;
    cg$old_rec cg$VISITE_STAGE.cg$row_type;
    cg$rec     cg$VISITE_STAGE.cg$row_type;
    cg$ind     cg$VISITE_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$VISITE_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.ANNEE_PRO := cg$VISITE_STAGE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_CONTACT_ILI := cg$VISITE_STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$old_rec.TYPE_CONTACT := cg$VISITE_STAGE.cg$table(idx).TYPE_CONTACT;
        cg$old_rec.DATE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).DATE_PREVISIONNELLE;
        cg$old_rec.HEURE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).HEURE_PREVISIONNELLE;
        cg$old_rec.DATE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).DATE_EFFECTIVE;
        cg$old_rec.HEURE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).HEURE_EFFECTIVE;
        cg$old_rec.DUREE := cg$VISITE_STAGE.cg$table(idx).DUREE;
        cg$old_rec.COMMENTAIRE_TUTEUR_UBO := cg$VISITE_STAGE.cg$table(idx).COMMENTAIRE_TUTEUR_UBO;

    IF NOT (cg$VISITE_STAGE.called_from_package) THEN
        idx := cg$VISITE_STAGE.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$VISITE_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.ANNEE_PRO := cg$VISITE_STAGE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_CONTACT_ILI := cg$VISITE_STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$ind.NO_CONTACT_ILI := updating('NO_CONTACT_ILI');
        cg$rec.TYPE_CONTACT := cg$VISITE_STAGE.cg$table(idx).TYPE_CONTACT;
        cg$ind.TYPE_CONTACT := updating('TYPE_CONTACT');
        cg$rec.DATE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).DATE_PREVISIONNELLE;
        cg$ind.DATE_PREVISIONNELLE := updating('DATE_PREVISIONNELLE');
        cg$rec.HEURE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).HEURE_PREVISIONNELLE;
        cg$ind.HEURE_PREVISIONNELLE := updating('HEURE_PREVISIONNELLE');
        cg$rec.DATE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).DATE_EFFECTIVE;
        cg$ind.DATE_EFFECTIVE := updating('DATE_EFFECTIVE');
        cg$rec.HEURE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).HEURE_EFFECTIVE;
        cg$ind.HEURE_EFFECTIVE := updating('HEURE_EFFECTIVE');
        cg$rec.DUREE := cg$VISITE_STAGE.cg$table(idx).DUREE;
        cg$ind.DUREE := updating('DUREE');
        cg$rec.COMMENTAIRE_TUTEUR_UBO := cg$VISITE_STAGE.cg$table(idx).COMMENTAIRE_TUTEUR_UBO;
        cg$ind.COMMENTAIRE_TUTEUR_UBO := updating('COMMENTAIRE_TUTEUR_UBO');

        cg$VISITE_STAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$VISITE_STAGE.upd_denorm2( cg$rec,
                                       cg$VISITE_STAGE.cg$tableind(idx)
                                     );
        cg$VISITE_STAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$VISITE_STAGE.cg$tableind(idx)
								                  );
        cg$VISITE_STAGE.cascade_update(cg$rec, cg$old_rec);
        cg$VISITE_STAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$VISITE_STAGE.called_from_package := FALSE;
	END IF;
        idx := cg$VISITE_STAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$VISITE_STAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BDS_VISITE_STAGE
BEFORE DELETE ON VISITE_STAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$VISITE_STAGE.cg$table.DELETE;
    cg$VISITE_STAGE.cg$tableind.DELETE;
    cg$VISITE_STAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$BDR_VISITE_STAGE
BEFORE DELETE ON VISITE_STAGE FOR EACH ROW
DECLARE
    cg$pk cg$VISITE_STAGE.cg$pk_type;
    cg$rec cg$VISITE_STAGE.cg$row_type;
    cg$ind cg$VISITE_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$VISITE_STAGE.cg$table(cg$VISITE_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;


    cg$VISITE_STAGE.idx := cg$VISITE_STAGE.idx + 1;

    if not (cg$VISITE_STAGE.called_from_package) then
        cg$VISITE_STAGE.validate_domain_cascade_delete(cg$rec);   
        cg$VISITE_STAGE.del(cg$pk, FALSE);
        cg$VISITE_STAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_VISITE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_VISITE_STAGE
AFTER DELETE ON VISITE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_VISITE_STAGE
/

PROMPT Creating After Delete Statement Trigger on 'VISITE_STAGE'
CREATE OR REPLACE TRIGGER cg$ADS_VISITE_STAGE
AFTER DELETE ON VISITE_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$VISITE_STAGE.cg$table.FIRST;
    cg$rec   cg$VISITE_STAGE.cg$row_type;
    cg$old_rec   cg$VISITE_STAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$VISITE_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$VISITE_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$VISITE_STAGE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.ANNEE_PRO := cg$VISITE_STAGE.cg$table(idx).ANNEE_PRO;
            cg$VISITE_STAGE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_CONTACT_ILI := cg$VISITE_STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$VISITE_STAGE.cg$tableind(idx).NO_CONTACT_ILI := TRUE;
            cg$rec.TYPE_CONTACT := cg$VISITE_STAGE.cg$table(idx).TYPE_CONTACT;
            cg$VISITE_STAGE.cg$tableind(idx).TYPE_CONTACT := TRUE;
            cg$rec.DATE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).DATE_PREVISIONNELLE;
            cg$VISITE_STAGE.cg$tableind(idx).DATE_PREVISIONNELLE := TRUE;
            cg$rec.HEURE_PREVISIONNELLE := cg$VISITE_STAGE.cg$table(idx).HEURE_PREVISIONNELLE;
            cg$VISITE_STAGE.cg$tableind(idx).HEURE_PREVISIONNELLE := TRUE;
            cg$rec.DATE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).DATE_EFFECTIVE;
            cg$VISITE_STAGE.cg$tableind(idx).DATE_EFFECTIVE := TRUE;
            cg$rec.HEURE_EFFECTIVE := cg$VISITE_STAGE.cg$table(idx).HEURE_EFFECTIVE;
            cg$VISITE_STAGE.cg$tableind(idx).HEURE_EFFECTIVE := TRUE;
            cg$rec.DUREE := cg$VISITE_STAGE.cg$table(idx).DUREE;
            cg$VISITE_STAGE.cg$tableind(idx).DUREE := TRUE;
            cg$rec.COMMENTAIRE_TUTEUR_UBO := cg$VISITE_STAGE.cg$table(idx).COMMENTAIRE_TUTEUR_UBO;
            cg$VISITE_STAGE.cg$tableind(idx).COMMENTAIRE_TUTEUR_UBO := TRUE;

            cg$VISITE_STAGE.validate_foreign_keys_del(cg$rec);
            cg$VISITE_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VISITE_STAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$VISITE_STAGE.cascade_delete(cg$rec);
            cg$VISITE_STAGE.domain_cascade_delete(cg$rec);             

            idx := cg$VISITE_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



