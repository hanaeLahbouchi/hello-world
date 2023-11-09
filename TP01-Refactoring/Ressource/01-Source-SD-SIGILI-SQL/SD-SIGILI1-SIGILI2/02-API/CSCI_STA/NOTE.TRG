
PROMPT Creating Trigger Logic for Table 'NOTE_ENTREPRISE'
PROMPT Creating Before Insert Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIS_NOTE_ENTREPRISE
BEFORE INSERT ON NOTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$NOTE_ENTREPRISE.cg$table.DELETE;
    cg$NOTE_ENTREPRISE.cg$tableind.DELETE;
    cg$NOTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIR_NOTE_ENTREPRISE
BEFORE INSERT ON NOTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec cg$NOTE_ENTREPRISE.cg$row_type;
    cg$ind cg$NOTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.CRITE_ID := :new.CRITE_ID;
    cg$ind.CRITE_ID := TRUE;
    cg$rec.CODN_ID := :new.CODN_ID;
    cg$ind.CODN_ID := TRUE;
    -- Warning: Column COMMENTAIRE is of type LONG and not allowed in triggers
	cg$ind.COMMENTAIRE := FALSE;

    if not (cg$NOTE_ENTREPRISE.called_from_package) then
        cg$NOTE_ENTREPRISE.validate_arc(cg$rec);
        cg$NOTE_ENTREPRISE.validate_domain(cg$rec);

        cg$NOTE_ENTREPRISE.ins(cg$rec, cg$ind, FALSE);
        cg$NOTE_ENTREPRISE.called_from_package := FALSE;
    end if;

    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$NOTE_ENTREPRISE.cg$tableind(cg$NOTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$NOTE_ENTREPRISE.cg$tableind(cg$NOTE_ENTREPRISE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CRITE_ID := cg$rec.CRITE_ID;
    cg$NOTE_ENTREPRISE.cg$tableind(cg$NOTE_ENTREPRISE.idx).CRITE_ID := cg$ind.CRITE_ID;

    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CODN_ID := cg$rec.CODN_ID;
    cg$NOTE_ENTREPRISE.cg$tableind(cg$NOTE_ENTREPRISE.idx).CODN_ID := cg$ind.CODN_ID;

    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$NOTE_ENTREPRISE.cg$tableind(cg$NOTE_ENTREPRISE.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$NOTE_ENTREPRISE.idx := cg$NOTE_ENTREPRISE.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.CRITE_ID := cg$rec.CRITE_ID;
    :new.CODN_ID := cg$rec.CODN_ID;
    -- Warning: Column COMMENTAIRE is of type LONG and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_NOTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_NOTE_ENTREPRISE
AFTER INSERT ON NOTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_NOTE_ENTREPRISE
/

PROMPT Creating After Insert Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AIS_NOTE_ENTREPRISE
AFTER INSERT ON NOTE_ENTREPRISE
DECLARE
    idx      BINARY_INTEGER := cg$NOTE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$NOTE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$NOTE_ENTREPRISE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$NOTE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$NOTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.ANNEE_PRO := cg$NOTE_ENTREPRISE.cg$table(idx).ANNEE_PRO;
            cg$rec.CRITE_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CRITE_ID;
            cg$rec.CODN_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CODN_ID;
            cg$rec.COMMENTAIRE := cg$NOTE_ENTREPRISE.cg$table(idx).COMMENTAIRE;

            cg$NOTE_ENTREPRISE.validate_foreign_keys_ins(cg$rec);

            cg$NOTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$NOTE_ENTREPRISE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$NOTE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUS_NOTE_ENTREPRISE
BEFORE UPDATE ON NOTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$NOTE_ENTREPRISE.cg$table.DELETE;
    cg$NOTE_ENTREPRISE.cg$tableind.DELETE;
    cg$NOTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUR_NOTE_ENTREPRISE
BEFORE UPDATE ON NOTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec     cg$NOTE_ENTREPRISE.cg$row_type;
    cg$ind     cg$NOTE_ENTREPRISE.cg$ind_type;
    cg$old_rec cg$NOTE_ENTREPRISE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.CRITE_ID := :new.CRITE_ID;
    cg$ind.CRITE_ID :=    (:new.CRITE_ID IS NULL AND :old.CRITE_ID IS NOT NULL )
                        OR (:new.CRITE_ID IS NOT NULL AND :old.CRITE_ID IS NULL)
                        OR NOT(:new.CRITE_ID = :old.CRITE_ID) ;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CRITE_ID := :old.CRITE_ID;
    cg$rec.CODN_ID := :new.CODN_ID;
    cg$ind.CODN_ID :=    (:new.CODN_ID IS NULL AND :old.CODN_ID IS NOT NULL )
                        OR (:new.CODN_ID IS NOT NULL AND :old.CODN_ID IS NULL)
                        OR NOT(:new.CODN_ID = :old.CODN_ID) ;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CODN_ID := :old.CODN_ID;
    -- Warning: Column COMMENTAIRE is of type LONG and not allowed in triggers
	cg$ind.COMMENTAIRE := FALSE;


    cg$NOTE_ENTREPRISE.idx := cg$NOTE_ENTREPRISE.idx + 1;

    if not (cg$NOTE_ENTREPRISE.called_from_package) then
        cg$NOTE_ENTREPRISE.validate_arc(cg$rec);
        cg$NOTE_ENTREPRISE.validate_domain(cg$rec, cg$ind);
        cg$NOTE_ENTREPRISE.validate_domain_cascade_update(cg$old_rec);   

        cg$NOTE_ENTREPRISE.upd(cg$rec, cg$ind, FALSE);
        cg$NOTE_ENTREPRISE.called_from_package := FALSE;
    end if;

    :new.CODN_ID := cg$rec.CODN_ID;
    -- Warning: Column COMMENTAIRE is of type LONG and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_NOTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_NOTE_ENTREPRISE
AFTER UPDATE ON NOTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_NOTE_ENTREPRISE
/






PROMPT Creating After Update Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AUS_NOTE_ENTREPRISE
AFTER UPDATE ON NOTE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$NOTE_ENTREPRISE.cg$table.FIRST;
    cg$old_rec cg$NOTE_ENTREPRISE.cg$row_type;
    cg$rec     cg$NOTE_ENTREPRISE.cg$row_type;
    cg$ind     cg$NOTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$NOTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.ANNEE_PRO := cg$NOTE_ENTREPRISE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.CRITE_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CRITE_ID;
        cg$old_rec.CODN_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CODN_ID;
        cg$old_rec.COMMENTAIRE := cg$NOTE_ENTREPRISE.cg$table(idx).COMMENTAIRE;

    IF NOT (cg$NOTE_ENTREPRISE.called_from_package) THEN
        idx := cg$NOTE_ENTREPRISE.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$NOTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.ANNEE_PRO := cg$NOTE_ENTREPRISE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.CRITE_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CRITE_ID;
        cg$ind.CRITE_ID := updating('CRITE_ID');
        cg$rec.CODN_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CODN_ID;
        cg$ind.CODN_ID := updating('CODN_ID');
        cg$rec.COMMENTAIRE := cg$NOTE_ENTREPRISE.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');

        cg$NOTE_ENTREPRISE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$NOTE_ENTREPRISE.upd_denorm2( cg$rec,
                                       cg$NOTE_ENTREPRISE.cg$tableind(idx)
                                     );
        cg$NOTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$NOTE_ENTREPRISE.cg$tableind(idx)
								                  );
        cg$NOTE_ENTREPRISE.cascade_update(cg$rec, cg$old_rec);
        cg$NOTE_ENTREPRISE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$NOTE_ENTREPRISE.called_from_package := FALSE;
	END IF;
        idx := cg$NOTE_ENTREPRISE.cg$table.NEXT(idx);
    END LOOP;

    cg$NOTE_ENTREPRISE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDS_NOTE_ENTREPRISE
BEFORE DELETE ON NOTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$NOTE_ENTREPRISE.cg$table.DELETE;
    cg$NOTE_ENTREPRISE.cg$tableind.DELETE;
    cg$NOTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDR_NOTE_ENTREPRISE
BEFORE DELETE ON NOTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$pk cg$NOTE_ENTREPRISE.cg$pk_type;
    cg$rec cg$NOTE_ENTREPRISE.cg$row_type;
    cg$ind cg$NOTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CRITE_ID  := :old.CRITE_ID;
    cg$rec.CRITE_ID := :old.CRITE_ID;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CRITE_ID := :old.CRITE_ID;
    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.CRITE_ID := :old.CRITE_ID;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CRITE_ID := :old.CRITE_ID;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.CODN_ID := :old.CODN_ID;
    cg$NOTE_ENTREPRISE.cg$table(cg$NOTE_ENTREPRISE.idx).CODN_ID := :old.CODN_ID;


    cg$NOTE_ENTREPRISE.idx := cg$NOTE_ENTREPRISE.idx + 1;

    if not (cg$NOTE_ENTREPRISE.called_from_package) then
        cg$NOTE_ENTREPRISE.validate_domain_cascade_delete(cg$rec);   
        cg$NOTE_ENTREPRISE.del(cg$pk, FALSE);
        cg$NOTE_ENTREPRISE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_NOTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_NOTE_ENTREPRISE
AFTER DELETE ON NOTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_NOTE_ENTREPRISE
/

PROMPT Creating After Delete Statement Trigger on 'NOTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$ADS_NOTE_ENTREPRISE
AFTER DELETE ON NOTE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$NOTE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$NOTE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$NOTE_ENTREPRISE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$NOTE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$NOTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$NOTE_ENTREPRISE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.ANNEE_PRO := cg$NOTE_ENTREPRISE.cg$table(idx).ANNEE_PRO;
            cg$NOTE_ENTREPRISE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.CRITE_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CRITE_ID;
            cg$NOTE_ENTREPRISE.cg$tableind(idx).CRITE_ID := TRUE;
            cg$rec.CODN_ID := cg$NOTE_ENTREPRISE.cg$table(idx).CODN_ID;
            cg$NOTE_ENTREPRISE.cg$tableind(idx).CODN_ID := TRUE;
            cg$rec.COMMENTAIRE := cg$NOTE_ENTREPRISE.cg$table(idx).COMMENTAIRE;
            cg$NOTE_ENTREPRISE.cg$tableind(idx).COMMENTAIRE := TRUE;

            cg$NOTE_ENTREPRISE.validate_foreign_keys_del(cg$rec);
            cg$NOTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$NOTE_ENTREPRISE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$NOTE_ENTREPRISE.cascade_delete(cg$rec);
            cg$NOTE_ENTREPRISE.domain_cascade_delete(cg$rec);             

            idx := cg$NOTE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



