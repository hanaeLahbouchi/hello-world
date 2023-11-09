
PROMPT Creating Trigger Logic for Table 'CONTACT_STAGE'
PROMPT Creating Before Insert Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BIS_CONTACT_STAGE
BEFORE INSERT ON CONTACT_STAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CONTACT_STAGE.cg$table.DELETE;
    cg$CONTACT_STAGE.cg$tableind.DELETE;
    cg$CONTACT_STAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BIR_CONTACT_STAGE
BEFORE INSERT ON CONTACT_STAGE FOR EACH ROW
DECLARE
    cg$rec cg$CONTACT_STAGE.cg$row_type;
    cg$ind cg$CONTACT_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.DATE_CONTACT := :new.DATE_CONTACT;
    cg$ind.DATE_CONTACT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.TYPE_CONTACT := :new.TYPE_CONTACT;
    cg$ind.TYPE_CONTACT := TRUE;
    cg$rec.INTERLOCUTEUR := :new.INTERLOCUTEUR;
    cg$ind.INTERLOCUTEUR := TRUE;
    cg$rec.OBJET := :new.OBJET;
    cg$ind.OBJET := TRUE;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE := TRUE;
    -- Warning: Column RESUME is of type LONG and not allowed in triggers
	cg$ind.RESUME := FALSE;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI := TRUE;
    cg$rec.HEURE_CONTACT := :new.HEURE_CONTACT;
    cg$ind.HEURE_CONTACT := TRUE;

    if not (cg$CONTACT_STAGE.called_from_package) then
        cg$CONTACT_STAGE.validate_arc(cg$rec);
        cg$CONTACT_STAGE.validate_domain(cg$rec);

        cg$CONTACT_STAGE.ins(cg$rec, cg$ind, FALSE);
        cg$CONTACT_STAGE.called_from_package := FALSE;
    end if;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).DATE_CONTACT := cg$rec.DATE_CONTACT;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).DATE_CONTACT := cg$ind.DATE_CONTACT;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).TYPE_CONTACT := cg$ind.TYPE_CONTACT;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).INTERLOCUTEUR := cg$rec.INTERLOCUTEUR;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).INTERLOCUTEUR := cg$ind.INTERLOCUTEUR;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).OBJET := cg$rec.OBJET;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).OBJET := cg$ind.OBJET;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).DUREE := cg$rec.DUREE;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).DUREE := cg$ind.DUREE;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).RESUME := cg$rec.RESUME;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).RESUME := cg$ind.RESUME;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;

    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).HEURE_CONTACT := cg$rec.HEURE_CONTACT;
    cg$CONTACT_STAGE.cg$tableind(cg$CONTACT_STAGE.idx).HEURE_CONTACT := cg$ind.HEURE_CONTACT;

    cg$CONTACT_STAGE.idx := cg$CONTACT_STAGE.idx + 1;

    if(cg$rec.INTERLOCUTEUR = 'ENT')THEN
          :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI; 
    else
      :new.NO_CONTACT_ILI := NULL;
    end if;
    :new.DATE_CONTACT := cg$rec.DATE_CONTACT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    :new.INTERLOCUTEUR := cg$rec.INTERLOCUTEUR;
    :new.OBJET := cg$rec.OBJET;
    :new.DUREE := cg$rec.DUREE;
    -- Warning: Column RESUME is of type LONG and not allowed in triggers
    :new.HEURE_CONTACT := cg$rec.HEURE_CONTACT;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/

-- No application logic defined for Trigger cg$AIR_CONTACT_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CONTACT_STAGE
AFTER INSERT ON CONTACT_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CONTACT_STAGE
/

PROMPT Creating After Insert Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$AIS_CONTACT_STAGE
AFTER INSERT ON CONTACT_STAGE
DECLARE
    idx      BINARY_INTEGER := cg$CONTACT_STAGE.cg$table.FIRST;
    cg$rec   cg$CONTACT_STAGE.cg$row_type;
    cg$old_rec   cg$CONTACT_STAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CONTACT_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.DATE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).DATE_CONTACT;
            cg$rec.ANNEE_PRO := cg$CONTACT_STAGE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_ETUDIANT_NAT := cg$CONTACT_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.TYPE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).TYPE_CONTACT;
            cg$rec.INTERLOCUTEUR := cg$CONTACT_STAGE.cg$table(idx).INTERLOCUTEUR;
            cg$rec.OBJET := cg$CONTACT_STAGE.cg$table(idx).OBJET;
            cg$rec.DUREE := cg$CONTACT_STAGE.cg$table(idx).DUREE;
            cg$rec.RESUME := cg$CONTACT_STAGE.cg$table(idx).RESUME;
            cg$rec.NO_CONTACT_ILI := cg$CONTACT_STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$rec.HEURE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).HEURE_CONTACT;

            cg$CONTACT_STAGE.validate_foreign_keys_ins(cg$rec);

            cg$CONTACT_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CONTACT_STAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$CONTACT_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BUS_CONTACT_STAGE
BEFORE UPDATE ON CONTACT_STAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CONTACT_STAGE.cg$table.DELETE;
    cg$CONTACT_STAGE.cg$tableind.DELETE;
    cg$CONTACT_STAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BUR_CONTACT_STAGE
BEFORE UPDATE ON CONTACT_STAGE FOR EACH ROW
DECLARE
    cg$rec     cg$CONTACT_STAGE.cg$row_type;
    cg$ind     cg$CONTACT_STAGE.cg$ind_type;
    cg$old_rec cg$CONTACT_STAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.DATE_CONTACT := :new.DATE_CONTACT;
    cg$ind.DATE_CONTACT :=    (:new.DATE_CONTACT IS NULL AND :old.DATE_CONTACT IS NOT NULL )
                        OR (:new.DATE_CONTACT IS NOT NULL AND :old.DATE_CONTACT IS NULL)
                        OR NOT(:new.DATE_CONTACT = :old.DATE_CONTACT) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).DATE_CONTACT := :old.DATE_CONTACT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.TYPE_CONTACT := :new.TYPE_CONTACT;
    cg$ind.TYPE_CONTACT :=    (:new.TYPE_CONTACT IS NULL AND :old.TYPE_CONTACT IS NOT NULL )
                        OR (:new.TYPE_CONTACT IS NOT NULL AND :old.TYPE_CONTACT IS NULL)
                        OR NOT(:new.TYPE_CONTACT = :old.TYPE_CONTACT) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).TYPE_CONTACT := :old.TYPE_CONTACT;
    cg$rec.INTERLOCUTEUR := :new.INTERLOCUTEUR;
    cg$ind.INTERLOCUTEUR :=    (:new.INTERLOCUTEUR IS NULL AND :old.INTERLOCUTEUR IS NOT NULL )
                        OR (:new.INTERLOCUTEUR IS NOT NULL AND :old.INTERLOCUTEUR IS NULL)
                        OR NOT(:new.INTERLOCUTEUR = :old.INTERLOCUTEUR) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).INTERLOCUTEUR := :old.INTERLOCUTEUR;
    cg$rec.OBJET := :new.OBJET;
    cg$ind.OBJET :=    (:new.OBJET IS NULL AND :old.OBJET IS NOT NULL )
                        OR (:new.OBJET IS NOT NULL AND :old.OBJET IS NULL)
                        OR NOT(:new.OBJET = :old.OBJET) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).OBJET := :old.OBJET;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE :=    (:new.DUREE IS NULL AND :old.DUREE IS NOT NULL )
                        OR (:new.DUREE IS NOT NULL AND :old.DUREE IS NULL)
                        OR NOT(:new.DUREE = :old.DUREE) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).DUREE := :old.DUREE;
    -- Warning: Column RESUME is of type LONG and not allowed in triggers
	cg$ind.RESUME := FALSE;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI :=    (:new.NO_CONTACT_ILI IS NULL AND :old.NO_CONTACT_ILI IS NOT NULL )
                        OR (:new.NO_CONTACT_ILI IS NOT NULL AND :old.NO_CONTACT_ILI IS NULL)
                        OR NOT(:new.NO_CONTACT_ILI = :old.NO_CONTACT_ILI) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.HEURE_CONTACT := :new.HEURE_CONTACT;
    cg$ind.HEURE_CONTACT :=    (:new.HEURE_CONTACT IS NULL AND :old.HEURE_CONTACT IS NOT NULL )
                        OR (:new.HEURE_CONTACT IS NOT NULL AND :old.HEURE_CONTACT IS NULL)
                        OR NOT(:new.HEURE_CONTACT = :old.HEURE_CONTACT) ;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).HEURE_CONTACT := :old.HEURE_CONTACT;


    cg$CONTACT_STAGE.idx := cg$CONTACT_STAGE.idx + 1;

    if not (cg$CONTACT_STAGE.called_from_package) then
        cg$CONTACT_STAGE.validate_arc(cg$rec);
        cg$CONTACT_STAGE.validate_domain(cg$rec, cg$ind);
        cg$CONTACT_STAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$CONTACT_STAGE.upd(cg$rec, cg$ind, FALSE);
        cg$CONTACT_STAGE.called_from_package := FALSE;
    end if;
    
    if(cg$rec.INTERLOCUTEUR = 'ENT')THEN
          :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI; 
    else
      :new.NO_CONTACT_ILI := NULL;
    end if;
    :new.TYPE_CONTACT := cg$rec.TYPE_CONTACT;
    :new.INTERLOCUTEUR := cg$rec.INTERLOCUTEUR;
    :new.OBJET := cg$rec.OBJET;
    :new.DUREE := cg$rec.DUREE;
    -- Warning: Column RESUME is of type LONG and not allowed in triggers
    :new.HEURE_CONTACT := cg$rec.HEURE_CONTACT;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/



-- No application logic defined for Trigger cg$AUR_CONTACT_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CONTACT_STAGE
AFTER UPDATE ON CONTACT_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CONTACT_STAGE
/






PROMPT Creating After Update Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$AUS_CONTACT_STAGE
AFTER UPDATE ON CONTACT_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$CONTACT_STAGE.cg$table.FIRST;
    cg$old_rec cg$CONTACT_STAGE.cg$row_type;
    cg$rec     cg$CONTACT_STAGE.cg$row_type;
    cg$ind     cg$CONTACT_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.DATE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).DATE_CONTACT;
        cg$old_rec.ANNEE_PRO := cg$CONTACT_STAGE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_ETUDIANT_NAT := cg$CONTACT_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.TYPE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).TYPE_CONTACT;
        cg$old_rec.INTERLOCUTEUR := cg$CONTACT_STAGE.cg$table(idx).INTERLOCUTEUR;
        cg$old_rec.OBJET := cg$CONTACT_STAGE.cg$table(idx).OBJET;
        cg$old_rec.DUREE := cg$CONTACT_STAGE.cg$table(idx).DUREE;
        cg$old_rec.RESUME := cg$CONTACT_STAGE.cg$table(idx).RESUME;
        cg$old_rec.NO_CONTACT_ILI := cg$CONTACT_STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$old_rec.HEURE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).HEURE_CONTACT;

    IF NOT (cg$CONTACT_STAGE.called_from_package) THEN
        idx := cg$CONTACT_STAGE.cg$table.NEXT(idx);
        cg$rec.DATE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).DATE_CONTACT;
        cg$ind.DATE_CONTACT := updating('DATE_CONTACT');
        cg$rec.ANNEE_PRO := cg$CONTACT_STAGE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_ETUDIANT_NAT := cg$CONTACT_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.TYPE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).TYPE_CONTACT;
        cg$ind.TYPE_CONTACT := updating('TYPE_CONTACT');
        cg$rec.INTERLOCUTEUR := cg$CONTACT_STAGE.cg$table(idx).INTERLOCUTEUR;
        cg$ind.INTERLOCUTEUR := updating('INTERLOCUTEUR');
        cg$rec.OBJET := cg$CONTACT_STAGE.cg$table(idx).OBJET;
        cg$ind.OBJET := updating('OBJET');
        cg$rec.DUREE := cg$CONTACT_STAGE.cg$table(idx).DUREE;
        cg$ind.DUREE := updating('DUREE');
        cg$rec.RESUME := cg$CONTACT_STAGE.cg$table(idx).RESUME;
        cg$ind.RESUME := updating('RESUME');
        cg$rec.NO_CONTACT_ILI := cg$CONTACT_STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$ind.NO_CONTACT_ILI := updating('NO_CONTACT_ILI');
        cg$rec.HEURE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).HEURE_CONTACT;
        cg$ind.HEURE_CONTACT := updating('HEURE_CONTACT');

        cg$CONTACT_STAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$CONTACT_STAGE.upd_denorm2( cg$rec,
                                       cg$CONTACT_STAGE.cg$tableind(idx)
                                     );
        cg$CONTACT_STAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$CONTACT_STAGE.cg$tableind(idx)
								                  );
        cg$CONTACT_STAGE.cascade_update(cg$rec, cg$old_rec);
        cg$CONTACT_STAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$CONTACT_STAGE.called_from_package := FALSE;
	END IF;
        idx := cg$CONTACT_STAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$CONTACT_STAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BDS_CONTACT_STAGE
BEFORE DELETE ON CONTACT_STAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CONTACT_STAGE.cg$table.DELETE;
    cg$CONTACT_STAGE.cg$tableind.DELETE;
    cg$CONTACT_STAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$BDR_CONTACT_STAGE
BEFORE DELETE ON CONTACT_STAGE FOR EACH ROW
DECLARE
    cg$pk cg$CONTACT_STAGE.cg$pk_type;
    cg$rec cg$CONTACT_STAGE.cg$row_type;
    cg$ind cg$CONTACT_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$pk.DATE_CONTACT  := :old.DATE_CONTACT;
    cg$rec.DATE_CONTACT := :old.DATE_CONTACT;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).DATE_CONTACT := :old.DATE_CONTACT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$CONTACT_STAGE.cg$table(cg$CONTACT_STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;


    cg$CONTACT_STAGE.idx := cg$CONTACT_STAGE.idx + 1;

    if not (cg$CONTACT_STAGE.called_from_package) then
        cg$CONTACT_STAGE.validate_domain_cascade_delete(cg$rec);   
        cg$CONTACT_STAGE.del(cg$pk, FALSE);
        cg$CONTACT_STAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CONTACT_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CONTACT_STAGE
AFTER DELETE ON CONTACT_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CONTACT_STAGE
/

PROMPT Creating After Delete Statement Trigger on 'CONTACT_STAGE'
CREATE OR REPLACE TRIGGER cg$ADS_CONTACT_STAGE
AFTER DELETE ON CONTACT_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$CONTACT_STAGE.cg$table.FIRST;
    cg$rec   cg$CONTACT_STAGE.cg$row_type;
    cg$old_rec   cg$CONTACT_STAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CONTACT_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.DATE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).DATE_CONTACT;
            cg$CONTACT_STAGE.cg$tableind(idx).DATE_CONTACT := TRUE;
            cg$rec.ANNEE_PRO := cg$CONTACT_STAGE.cg$table(idx).ANNEE_PRO;
            cg$CONTACT_STAGE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$CONTACT_STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$CONTACT_STAGE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.TYPE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).TYPE_CONTACT;
            cg$CONTACT_STAGE.cg$tableind(idx).TYPE_CONTACT := TRUE;
            cg$rec.INTERLOCUTEUR := cg$CONTACT_STAGE.cg$table(idx).INTERLOCUTEUR;
            cg$CONTACT_STAGE.cg$tableind(idx).INTERLOCUTEUR := TRUE;
            cg$rec.OBJET := cg$CONTACT_STAGE.cg$table(idx).OBJET;
            cg$CONTACT_STAGE.cg$tableind(idx).OBJET := TRUE;
            cg$rec.DUREE := cg$CONTACT_STAGE.cg$table(idx).DUREE;
            cg$CONTACT_STAGE.cg$tableind(idx).DUREE := TRUE;
            cg$rec.RESUME := cg$CONTACT_STAGE.cg$table(idx).RESUME;
            cg$CONTACT_STAGE.cg$tableind(idx).RESUME := TRUE;
            cg$rec.NO_CONTACT_ILI := cg$CONTACT_STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$CONTACT_STAGE.cg$tableind(idx).NO_CONTACT_ILI := TRUE;
            cg$rec.HEURE_CONTACT := cg$CONTACT_STAGE.cg$table(idx).HEURE_CONTACT;
            cg$CONTACT_STAGE.cg$tableind(idx).HEURE_CONTACT := TRUE;

            cg$CONTACT_STAGE.validate_foreign_keys_del(cg$rec);
            cg$CONTACT_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CONTACT_STAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$CONTACT_STAGE.cascade_delete(cg$rec);
            cg$CONTACT_STAGE.domain_cascade_delete(cg$rec);             

            idx := cg$CONTACT_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



