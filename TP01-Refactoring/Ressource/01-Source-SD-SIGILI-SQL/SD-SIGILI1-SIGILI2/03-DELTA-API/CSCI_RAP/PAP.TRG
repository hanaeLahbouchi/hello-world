
PROMPT Creating Trigger Logic for Table 'PROCESSUS_APPRENTISSAGE'
PROMPT Creating Before Insert Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BIS_PROCESSUS_APPRENTISSAGE
BEFORE INSERT ON PROCESSUS_APPRENTISSAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$PROCESSUS_APPRENTISSAGE.cg$table.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BIR_PROCESSUS_APPRENTISSAGE
BEFORE INSERT ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
DECLARE
    cg$rec cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$ind cg$PROCESSUS_APPRENTISSAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_PAILI := :new.CODE_PAILI;
    cg$ind.CODE_PAILI := TRUE;
    cg$rec.CODE_CRE := :new.CODE_CRE;
    cg$ind.CODE_CRE := TRUE;
    cg$rec.NO_VERSION := :new.NO_VERSION;
    cg$ind.NO_VERSION := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT := TRUE;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION := TRUE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION := TRUE;
    cg$rec.DATE_MODIFICATION := :new.DATE_MODIFICATION;
    cg$ind.DATE_MODIFICATION := TRUE;
    cg$rec.DATE_DISPONIBILITE := :new.DATE_DISPONIBILITE;
    cg$ind.DATE_DISPONIBILITE := TRUE;
    cg$rec.DATE_RETRAIT := :new.DATE_RETRAIT;
    cg$ind.DATE_RETRAIT := TRUE;

    if not (cg$PROCESSUS_APPRENTISSAGE.called_from_package) then
        cg$PROCESSUS_APPRENTISSAGE.validate_arc(cg$rec);
        cg$PROCESSUS_APPRENTISSAGE.validate_domain(cg$rec);

        cg$PROCESSUS_APPRENTISSAGE.ins(cg$rec, cg$ind, FALSE);
        cg$PROCESSUS_APPRENTISSAGE.called_from_package := FALSE;
    end if;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_PAILI := cg$rec.CODE_PAILI;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_PAILI := cg$ind.CODE_PAILI;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_CRE := cg$rec.CODE_CRE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_CRE := cg$ind.CODE_CRE;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).NO_VERSION := cg$rec.NO_VERSION;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).NO_VERSION := cg$ind.NO_VERSION;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).ETAT := cg$rec.ETAT;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).ETAT := cg$ind.ETAT;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_CREATION := cg$rec.DATE_CREATION;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_CREATION := cg$ind.DATE_CREATION;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_MODIFICATION := cg$ind.DATE_MODIFICATION;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_DISPONIBILITE := cg$rec.DATE_DISPONIBILITE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_DISPONIBILITE := cg$ind.DATE_DISPONIBILITE;

    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_RETRAIT := cg$rec.DATE_RETRAIT;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_RETRAIT := cg$ind.DATE_RETRAIT;

    cg$PROCESSUS_APPRENTISSAGE.idx := cg$PROCESSUS_APPRENTISSAGE.idx + 1;

    :new.CODE_PAILI := cg$rec.CODE_PAILI;
    :new.CODE_CRE := cg$rec.CODE_CRE;
    :new.NO_VERSION := cg$rec.NO_VERSION;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ETAT := cg$rec.ETAT;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    :new.DATE_DISPONIBILITE := cg$rec.DATE_DISPONIBILITE;
    :new.DATE_RETRAIT := cg$rec.DATE_RETRAIT;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_PROCESSUS_APPRENTISSAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_PROCESSUS_APPRENTISSAGE
AFTER INSERT ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_PROCESSUS_APPRENTISSAGE
/

PROMPT Creating After Insert Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$AIS_PROCESSUS_APPRENTISSAGE
AFTER INSERT ON PROCESSUS_APPRENTISSAGE
DECLARE
    idx      BINARY_INTEGER := cg$PROCESSUS_APPRENTISSAGE.cg$table.FIRST;
    cg$rec   cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$old_rec   cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$PROCESSUS_APPRENTISSAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_PAILI := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_PAILI;
            cg$rec.CODE_CRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_CRE;
            cg$rec.NO_VERSION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).NO_VERSION;
            cg$rec.DESIGNATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESIGNATION;
            cg$rec.ETAT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).ETAT;
            cg$rec.DESCRIPTION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESCRIPTION;
            cg$rec.COMMENTAIRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).COMMENTAIRE;
            cg$rec.DATE_CREATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_CREATION;
            cg$rec.DATE_MODIFICATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_MODIFICATION;
            cg$rec.DATE_DISPONIBILITE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_DISPONIBILITE;
            cg$rec.DATE_RETRAIT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_RETRAIT;

            cg$PROCESSUS_APPRENTISSAGE.validate_foreign_keys_ins(cg$rec);

            cg$PROCESSUS_APPRENTISSAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$PROCESSUS_APPRENTISSAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BUS_PROCESSUS_APPRENTISSAGE
BEFORE UPDATE ON PROCESSUS_APPRENTISSAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$PROCESSUS_APPRENTISSAGE.cg$table.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BUR_PROCESSUS_APPRENTISSAGE
BEFORE UPDATE ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
DECLARE
    cg$rec     cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$ind     cg$PROCESSUS_APPRENTISSAGE.cg$ind_type;
    cg$old_rec cg$PROCESSUS_APPRENTISSAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_PAILI := :new.CODE_PAILI;
    cg$ind.CODE_PAILI :=    (:new.CODE_PAILI IS NULL AND :old.CODE_PAILI IS NOT NULL )
                        OR (:new.CODE_PAILI IS NOT NULL AND :old.CODE_PAILI IS NULL)
                        OR NOT(:new.CODE_PAILI = :old.CODE_PAILI) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_PAILI := :old.CODE_PAILI;
    cg$rec.CODE_CRE := :new.CODE_CRE;
    cg$ind.CODE_CRE :=    (:new.CODE_CRE IS NULL AND :old.CODE_CRE IS NOT NULL )
                        OR (:new.CODE_CRE IS NOT NULL AND :old.CODE_CRE IS NULL)
                        OR NOT(:new.CODE_CRE = :old.CODE_CRE) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_CRE := :old.CODE_CRE;
    cg$rec.NO_VERSION := :new.NO_VERSION;
    cg$ind.NO_VERSION :=    (:new.NO_VERSION IS NULL AND :old.NO_VERSION IS NOT NULL )
                        OR (:new.NO_VERSION IS NOT NULL AND :old.NO_VERSION IS NULL)
                        OR NOT(:new.NO_VERSION = :old.NO_VERSION) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).NO_VERSION := :old.NO_VERSION;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT :=    (:new.ETAT IS NULL AND :old.ETAT IS NOT NULL )
                        OR (:new.ETAT IS NOT NULL AND :old.ETAT IS NULL)
                        OR NOT(:new.ETAT = :old.ETAT) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).ETAT := :old.ETAT;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION :=    (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL )
                        OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
                        OR NOT(:new.DESCRIPTION = :old.DESCRIPTION) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DESCRIPTION := :old.DESCRIPTION;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).COMMENTAIRE := :old.COMMENTAIRE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.DATE_MODIFICATION := :new.DATE_MODIFICATION;
    cg$ind.DATE_MODIFICATION :=    (:new.DATE_MODIFICATION IS NULL AND :old.DATE_MODIFICATION IS NOT NULL )
                        OR (:new.DATE_MODIFICATION IS NOT NULL AND :old.DATE_MODIFICATION IS NULL)
                        OR NOT(:new.DATE_MODIFICATION = :old.DATE_MODIFICATION) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_MODIFICATION := :old.DATE_MODIFICATION;
    cg$rec.DATE_DISPONIBILITE := :new.DATE_DISPONIBILITE;
    cg$ind.DATE_DISPONIBILITE :=    (:new.DATE_DISPONIBILITE IS NULL AND :old.DATE_DISPONIBILITE IS NOT NULL )
                        OR (:new.DATE_DISPONIBILITE IS NOT NULL AND :old.DATE_DISPONIBILITE IS NULL)
                        OR NOT(:new.DATE_DISPONIBILITE = :old.DATE_DISPONIBILITE) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_DISPONIBILITE := :old.DATE_DISPONIBILITE;
    cg$rec.DATE_RETRAIT := :new.DATE_RETRAIT;
    cg$ind.DATE_RETRAIT :=    (:new.DATE_RETRAIT IS NULL AND :old.DATE_RETRAIT IS NOT NULL )
                        OR (:new.DATE_RETRAIT IS NOT NULL AND :old.DATE_RETRAIT IS NULL)
                        OR NOT(:new.DATE_RETRAIT = :old.DATE_RETRAIT) ;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).DATE_RETRAIT := :old.DATE_RETRAIT;


    cg$PROCESSUS_APPRENTISSAGE.idx := cg$PROCESSUS_APPRENTISSAGE.idx + 1;

    if not (cg$PROCESSUS_APPRENTISSAGE.called_from_package) then
        cg$PROCESSUS_APPRENTISSAGE.validate_arc(cg$rec);
        cg$PROCESSUS_APPRENTISSAGE.validate_domain(cg$rec, cg$ind);
        cg$PROCESSUS_APPRENTISSAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$PROCESSUS_APPRENTISSAGE.upd(cg$rec, cg$ind, FALSE);
        cg$PROCESSUS_APPRENTISSAGE.called_from_package := FALSE;
    end if;

    :new.CODE_CRE := cg$rec.CODE_CRE;
    :new.NO_VERSION := cg$rec.NO_VERSION;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.ETAT := cg$rec.ETAT;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    :new.DATE_DISPONIBILITE := cg$rec.DATE_DISPONIBILITE;
    :new.DATE_RETRAIT := cg$rec.DATE_RETRAIT;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_PROCESSUS_APPRENTISSAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_PROCESSUS_APPRENTISSAGE
AFTER UPDATE ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_PROCESSUS_APPRENTISSAGE
/






PROMPT Creating After Update Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$AUS_PROCESSUS_APPRENTISSAGE
AFTER UPDATE ON PROCESSUS_APPRENTISSAGE
DECLARE
    idx        BINARY_INTEGER := cg$PROCESSUS_APPRENTISSAGE.cg$table.FIRST;
    cg$old_rec cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$rec     cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$ind     cg$PROCESSUS_APPRENTISSAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.CODE_PAILI := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_PAILI;
        cg$old_rec.CODE_CRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_CRE;
        cg$old_rec.NO_VERSION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).NO_VERSION;
        cg$old_rec.DESIGNATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESIGNATION;
        cg$old_rec.ETAT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).ETAT;
        cg$old_rec.DESCRIPTION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESCRIPTION;
        cg$old_rec.COMMENTAIRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).COMMENTAIRE;
        cg$old_rec.DATE_CREATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_CREATION;
        cg$old_rec.DATE_MODIFICATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_MODIFICATION;
        cg$old_rec.DATE_DISPONIBILITE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_DISPONIBILITE;
        cg$old_rec.DATE_RETRAIT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_RETRAIT;

    IF NOT (cg$PROCESSUS_APPRENTISSAGE.called_from_package) THEN
        idx := cg$PROCESSUS_APPRENTISSAGE.cg$table.NEXT(idx);
        cg$rec.CODE_PAILI := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_PAILI;
        cg$ind.CODE_PAILI := updating('CODE_PAILI');
        cg$rec.CODE_CRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_CRE;
        cg$ind.CODE_CRE := updating('CODE_CRE');
        cg$rec.NO_VERSION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).NO_VERSION;
        cg$ind.NO_VERSION := updating('NO_VERSION');
        cg$rec.DESIGNATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.ETAT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).ETAT;
        cg$ind.ETAT := updating('ETAT');
        cg$rec.DESCRIPTION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');
        cg$rec.COMMENTAIRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');
        cg$rec.DATE_CREATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.DATE_MODIFICATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_MODIFICATION;
        cg$ind.DATE_MODIFICATION := updating('DATE_MODIFICATION');
        cg$rec.DATE_DISPONIBILITE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_DISPONIBILITE;
        cg$ind.DATE_DISPONIBILITE := updating('DATE_DISPONIBILITE');
        cg$rec.DATE_RETRAIT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_RETRAIT;
        cg$ind.DATE_RETRAIT := updating('DATE_RETRAIT');

        cg$PROCESSUS_APPRENTISSAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$PROCESSUS_APPRENTISSAGE.upd_denorm2( cg$rec,
                                       cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx)
                                     );
        cg$PROCESSUS_APPRENTISSAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx)
								                  );
        cg$PROCESSUS_APPRENTISSAGE.cascade_update(cg$rec, cg$old_rec);
        cg$PROCESSUS_APPRENTISSAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$PROCESSUS_APPRENTISSAGE.called_from_package := FALSE;
	END IF;
        idx := cg$PROCESSUS_APPRENTISSAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$PROCESSUS_APPRENTISSAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BDS_PROCESSUS_APPRENTISSAGE
BEFORE DELETE ON PROCESSUS_APPRENTISSAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$PROCESSUS_APPRENTISSAGE.cg$table.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.cg$tableind.DELETE;
    cg$PROCESSUS_APPRENTISSAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$BDR_PROCESSUS_APPRENTISSAGE
BEFORE DELETE ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
DECLARE
    cg$pk cg$PROCESSUS_APPRENTISSAGE.cg$pk_type;
    cg$rec cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$ind cg$PROCESSUS_APPRENTISSAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CODE_PAILI  := :old.CODE_PAILI;
    cg$rec.CODE_PAILI := :old.CODE_PAILI;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_PAILI := :old.CODE_PAILI;
    cg$rec.CODE_CRE := :old.CODE_CRE;
    cg$PROCESSUS_APPRENTISSAGE.cg$table(cg$PROCESSUS_APPRENTISSAGE.idx).CODE_CRE := :old.CODE_CRE;


    cg$PROCESSUS_APPRENTISSAGE.idx := cg$PROCESSUS_APPRENTISSAGE.idx + 1;

    if not (cg$PROCESSUS_APPRENTISSAGE.called_from_package) then
        cg$PROCESSUS_APPRENTISSAGE.validate_domain_cascade_delete(cg$rec);   
        cg$PROCESSUS_APPRENTISSAGE.del(cg$pk, FALSE);
        cg$PROCESSUS_APPRENTISSAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_PROCESSUS_APPRENTISSAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_PROCESSUS_APPRENTISSAGE
AFTER DELETE ON PROCESSUS_APPRENTISSAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_PROCESSUS_APPRENTISSAGE
/

PROMPT Creating After Delete Statement Trigger on 'PROCESSUS_APPRENTISSAGE'
CREATE OR REPLACE TRIGGER cg$ADS_PROCESSUS_APPRENTISSAGE
AFTER DELETE ON PROCESSUS_APPRENTISSAGE
DECLARE
    idx        BINARY_INTEGER := cg$PROCESSUS_APPRENTISSAGE.cg$table.FIRST;
    cg$rec   cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
    cg$old_rec   cg$PROCESSUS_APPRENTISSAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$PROCESSUS_APPRENTISSAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_PAILI := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_PAILI;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).CODE_PAILI := TRUE;
            cg$rec.CODE_CRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).CODE_CRE;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).CODE_CRE := TRUE;
            cg$rec.NO_VERSION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).NO_VERSION;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).NO_VERSION := TRUE;
            cg$rec.DESIGNATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESIGNATION;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.ETAT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).ETAT;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).ETAT := TRUE;
            cg$rec.DESCRIPTION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DESCRIPTION;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DESCRIPTION := TRUE;
            cg$rec.COMMENTAIRE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).COMMENTAIRE;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).COMMENTAIRE := TRUE;
            cg$rec.DATE_CREATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_CREATION;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.DATE_MODIFICATION := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_MODIFICATION;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DATE_MODIFICATION := TRUE;
            cg$rec.DATE_DISPONIBILITE := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_DISPONIBILITE;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DATE_DISPONIBILITE := TRUE;
            cg$rec.DATE_RETRAIT := cg$PROCESSUS_APPRENTISSAGE.cg$table(idx).DATE_RETRAIT;
            cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx).DATE_RETRAIT := TRUE;

            cg$PROCESSUS_APPRENTISSAGE.validate_foreign_keys_del(cg$rec);
            cg$PROCESSUS_APPRENTISSAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$PROCESSUS_APPRENTISSAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$PROCESSUS_APPRENTISSAGE.cascade_delete(cg$rec);
            cg$PROCESSUS_APPRENTISSAGE.domain_cascade_delete(cg$rec);             

            idx := cg$PROCESSUS_APPRENTISSAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



