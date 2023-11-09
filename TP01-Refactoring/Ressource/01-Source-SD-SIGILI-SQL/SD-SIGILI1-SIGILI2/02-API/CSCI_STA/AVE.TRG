
PROMPT Creating Trigger Logic for Table 'AVENANT'
PROMPT Creating Before Insert Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BIS_AVENANT
BEFORE INSERT ON AVENANT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AVENANT.cg$table.DELETE;
    cg$AVENANT.cg$tableind.DELETE;
    cg$AVENANT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BIR_AVENANT
BEFORE INSERT ON AVENANT FOR EACH ROW
DECLARE
    cg$rec cg$AVENANT.cg$row_type;
    cg$ind cg$AVENANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_AVENANT := :new.NO_AVENANT;
    cg$ind.NO_AVENANT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.ETAT_AVENANT := :new.ETAT_AVENANT;
    cg$ind.ETAT_AVENANT := TRUE;
    cg$rec.NUM_ARTICLE := :new.NUM_ARTICLE;
    cg$ind.NUM_ARTICLE := TRUE;
    cg$rec.DATE_SIGNATURE_AVE := :new.DATE_SIGNATURE_AVE;
    cg$ind.DATE_SIGNATURE_AVE := TRUE;
    -- Warning: Column MODIF_APPORTEE is of type LONG and not allowed in triggers
	cg$ind.MODIF_APPORTEE := FALSE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;

    if not (cg$AVENANT.called_from_package) then
        cg$AVENANT.validate_arc(cg$rec);
        cg$AVENANT.validate_domain(cg$rec);

        cg$AVENANT.ins(cg$rec, cg$ind, FALSE);
        cg$AVENANT.called_from_package := FALSE;
    end if;

    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_AVENANT := cg$rec.NO_AVENANT;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).NO_AVENANT := cg$ind.NO_AVENANT;

    cg$AVENANT.cg$table(cg$AVENANT.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$AVENANT.cg$table(cg$AVENANT.idx).ETAT_AVENANT := cg$rec.ETAT_AVENANT;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).ETAT_AVENANT := cg$ind.ETAT_AVENANT;

    cg$AVENANT.cg$table(cg$AVENANT.idx).NUM_ARTICLE := cg$rec.NUM_ARTICLE;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).NUM_ARTICLE := cg$ind.NUM_ARTICLE;

    cg$AVENANT.cg$table(cg$AVENANT.idx).DATE_SIGNATURE_AVE := cg$rec.DATE_SIGNATURE_AVE;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).DATE_SIGNATURE_AVE := cg$ind.DATE_SIGNATURE_AVE;

    cg$AVENANT.cg$table(cg$AVENANT.idx).MODIF_APPORTEE := cg$rec.MODIF_APPORTEE;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).MODIF_APPORTEE := cg$ind.MODIF_APPORTEE;

    cg$AVENANT.cg$table(cg$AVENANT.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$AVENANT.cg$tableind(cg$AVENANT.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$AVENANT.idx := cg$AVENANT.idx + 1;

    :new.NO_AVENANT := cg$rec.NO_AVENANT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ETAT_AVENANT := cg$rec.ETAT_AVENANT;
    :new.NUM_ARTICLE := cg$rec.NUM_ARTICLE;
    :new.DATE_SIGNATURE_AVE := cg$rec.DATE_SIGNATURE_AVE;
    -- Warning: Column MODIF_APPORTEE is of type LONG and not allowed in triggers
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_AVENANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AVENANT
AFTER INSERT ON AVENANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AVENANT
/

PROMPT Creating After Insert Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$AIS_AVENANT
AFTER INSERT ON AVENANT
DECLARE
    idx      BINARY_INTEGER := cg$AVENANT.cg$table.FIRST;
    cg$rec   cg$AVENANT.cg$row_type;
    cg$old_rec   cg$AVENANT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AVENANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_AVENANT := cg$AVENANT.cg$table(idx).NO_AVENANT;
            cg$rec.ANNEE_PRO := cg$AVENANT.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_ETUDIANT_NAT := cg$AVENANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.ETAT_AVENANT := cg$AVENANT.cg$table(idx).ETAT_AVENANT;
            cg$rec.NUM_ARTICLE := cg$AVENANT.cg$table(idx).NUM_ARTICLE;
            cg$rec.DATE_SIGNATURE_AVE := cg$AVENANT.cg$table(idx).DATE_SIGNATURE_AVE;
            cg$rec.MODIF_APPORTEE := cg$AVENANT.cg$table(idx).MODIF_APPORTEE;
            cg$rec.COMMENTAIRE := cg$AVENANT.cg$table(idx).COMMENTAIRE;

            cg$AVENANT.validate_foreign_keys_ins(cg$rec);

            cg$AVENANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AVENANT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AVENANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BUS_AVENANT
BEFORE UPDATE ON AVENANT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AVENANT.cg$table.DELETE;
    cg$AVENANT.cg$tableind.DELETE;
    cg$AVENANT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BUR_AVENANT
BEFORE UPDATE ON AVENANT FOR EACH ROW
DECLARE
    cg$rec     cg$AVENANT.cg$row_type;
    cg$ind     cg$AVENANT.cg$ind_type;
    cg$old_rec cg$AVENANT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_AVENANT := :new.NO_AVENANT;
    cg$ind.NO_AVENANT :=    (:new.NO_AVENANT IS NULL AND :old.NO_AVENANT IS NOT NULL )
                        OR (:new.NO_AVENANT IS NOT NULL AND :old.NO_AVENANT IS NULL)
                        OR NOT(:new.NO_AVENANT = :old.NO_AVENANT) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_AVENANT := :old.NO_AVENANT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ETAT_AVENANT := :new.ETAT_AVENANT;
    cg$ind.ETAT_AVENANT :=    (:new.ETAT_AVENANT IS NULL AND :old.ETAT_AVENANT IS NOT NULL )
                        OR (:new.ETAT_AVENANT IS NOT NULL AND :old.ETAT_AVENANT IS NULL)
                        OR NOT(:new.ETAT_AVENANT = :old.ETAT_AVENANT) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).ETAT_AVENANT := :old.ETAT_AVENANT;
    cg$rec.NUM_ARTICLE := :new.NUM_ARTICLE;
    cg$ind.NUM_ARTICLE :=    (:new.NUM_ARTICLE IS NULL AND :old.NUM_ARTICLE IS NOT NULL )
                        OR (:new.NUM_ARTICLE IS NOT NULL AND :old.NUM_ARTICLE IS NULL)
                        OR NOT(:new.NUM_ARTICLE = :old.NUM_ARTICLE) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).NUM_ARTICLE := :old.NUM_ARTICLE;
    cg$rec.DATE_SIGNATURE_AVE := :new.DATE_SIGNATURE_AVE;
    cg$ind.DATE_SIGNATURE_AVE :=    (:new.DATE_SIGNATURE_AVE IS NULL AND :old.DATE_SIGNATURE_AVE IS NOT NULL )
                        OR (:new.DATE_SIGNATURE_AVE IS NOT NULL AND :old.DATE_SIGNATURE_AVE IS NULL)
                        OR NOT(:new.DATE_SIGNATURE_AVE = :old.DATE_SIGNATURE_AVE) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).DATE_SIGNATURE_AVE := :old.DATE_SIGNATURE_AVE;
    -- Warning: Column MODIF_APPORTEE is of type LONG and not allowed in triggers
	cg$ind.MODIF_APPORTEE := FALSE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$AVENANT.cg$table(cg$AVENANT.idx).COMMENTAIRE := :old.COMMENTAIRE;


    cg$AVENANT.idx := cg$AVENANT.idx + 1;

    if not (cg$AVENANT.called_from_package) then
        cg$AVENANT.validate_arc(cg$rec);
        cg$AVENANT.validate_domain(cg$rec, cg$ind);
        cg$AVENANT.validate_domain_cascade_update(cg$old_rec);   

        cg$AVENANT.upd(cg$rec, cg$ind, FALSE);
        cg$AVENANT.called_from_package := FALSE;
    end if;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ETAT_AVENANT := cg$rec.ETAT_AVENANT;
    :new.NUM_ARTICLE := cg$rec.NUM_ARTICLE;
    :new.DATE_SIGNATURE_AVE := cg$rec.DATE_SIGNATURE_AVE;
    -- Warning: Column MODIF_APPORTEE is of type LONG and not allowed in triggers
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AVENANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AVENANT
AFTER UPDATE ON AVENANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AVENANT
/






PROMPT Creating After Update Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$AUS_AVENANT
AFTER UPDATE ON AVENANT
DECLARE
    idx        BINARY_INTEGER := cg$AVENANT.cg$table.FIRST;
    cg$old_rec cg$AVENANT.cg$row_type;
    cg$rec     cg$AVENANT.cg$row_type;
    cg$ind     cg$AVENANT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_AVENANT := cg$AVENANT.cg$table(idx).NO_AVENANT;
        cg$old_rec.ANNEE_PRO := cg$AVENANT.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_ETUDIANT_NAT := cg$AVENANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.ETAT_AVENANT := cg$AVENANT.cg$table(idx).ETAT_AVENANT;
        cg$old_rec.NUM_ARTICLE := cg$AVENANT.cg$table(idx).NUM_ARTICLE;
        cg$old_rec.DATE_SIGNATURE_AVE := cg$AVENANT.cg$table(idx).DATE_SIGNATURE_AVE;
        cg$old_rec.MODIF_APPORTEE := cg$AVENANT.cg$table(idx).MODIF_APPORTEE;
        cg$old_rec.COMMENTAIRE := cg$AVENANT.cg$table(idx).COMMENTAIRE;

    IF NOT (cg$AVENANT.called_from_package) THEN
        idx := cg$AVENANT.cg$table.NEXT(idx);
        cg$rec.NO_AVENANT := cg$AVENANT.cg$table(idx).NO_AVENANT;
        cg$ind.NO_AVENANT := updating('NO_AVENANT');
        cg$rec.ANNEE_PRO := cg$AVENANT.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_ETUDIANT_NAT := cg$AVENANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.ETAT_AVENANT := cg$AVENANT.cg$table(idx).ETAT_AVENANT;
        cg$ind.ETAT_AVENANT := updating('ETAT_AVENANT');
        cg$rec.NUM_ARTICLE := cg$AVENANT.cg$table(idx).NUM_ARTICLE;
        cg$ind.NUM_ARTICLE := updating('NUM_ARTICLE');
        cg$rec.DATE_SIGNATURE_AVE := cg$AVENANT.cg$table(idx).DATE_SIGNATURE_AVE;
        cg$ind.DATE_SIGNATURE_AVE := updating('DATE_SIGNATURE_AVE');
        cg$rec.MODIF_APPORTEE := cg$AVENANT.cg$table(idx).MODIF_APPORTEE;
        cg$ind.MODIF_APPORTEE := updating('MODIF_APPORTEE');
        cg$rec.COMMENTAIRE := cg$AVENANT.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');

        cg$AVENANT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AVENANT.upd_denorm2( cg$rec,
                                       cg$AVENANT.cg$tableind(idx)
                                     );
        cg$AVENANT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AVENANT.cg$tableind(idx)
								                  );
        cg$AVENANT.cascade_update(cg$rec, cg$old_rec);
        cg$AVENANT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AVENANT.called_from_package := FALSE;
	END IF;
        idx := cg$AVENANT.cg$table.NEXT(idx);
    END LOOP;

    cg$AVENANT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BDS_AVENANT
BEFORE DELETE ON AVENANT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AVENANT.cg$table.DELETE;
    cg$AVENANT.cg$tableind.DELETE;
    cg$AVENANT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$BDR_AVENANT
BEFORE DELETE ON AVENANT FOR EACH ROW
DECLARE
    cg$pk cg$AVENANT.cg$pk_type;
    cg$rec cg$AVENANT.cg$row_type;
    cg$ind cg$AVENANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_AVENANT  := :old.NO_AVENANT;
    cg$rec.NO_AVENANT := :old.NO_AVENANT;
    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_AVENANT := :old.NO_AVENANT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$AVENANT.cg$table(cg$AVENANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$AVENANT.cg$table(cg$AVENANT.idx).ANNEE_PRO := :old.ANNEE_PRO;


    cg$AVENANT.idx := cg$AVENANT.idx + 1;

    if not (cg$AVENANT.called_from_package) then
        cg$AVENANT.validate_domain_cascade_delete(cg$rec);   
        cg$AVENANT.del(cg$pk, FALSE);
        cg$AVENANT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AVENANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AVENANT
AFTER DELETE ON AVENANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AVENANT
/

PROMPT Creating After Delete Statement Trigger on 'AVENANT'
CREATE OR REPLACE TRIGGER cg$ADS_AVENANT
AFTER DELETE ON AVENANT
DECLARE
    idx        BINARY_INTEGER := cg$AVENANT.cg$table.FIRST;
    cg$rec   cg$AVENANT.cg$row_type;
    cg$old_rec   cg$AVENANT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AVENANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_AVENANT := cg$AVENANT.cg$table(idx).NO_AVENANT;
            cg$AVENANT.cg$tableind(idx).NO_AVENANT := TRUE;
            cg$rec.ANNEE_PRO := cg$AVENANT.cg$table(idx).ANNEE_PRO;
            cg$AVENANT.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$AVENANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$AVENANT.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.ETAT_AVENANT := cg$AVENANT.cg$table(idx).ETAT_AVENANT;
            cg$AVENANT.cg$tableind(idx).ETAT_AVENANT := TRUE;
            cg$rec.NUM_ARTICLE := cg$AVENANT.cg$table(idx).NUM_ARTICLE;
            cg$AVENANT.cg$tableind(idx).NUM_ARTICLE := TRUE;
            cg$rec.DATE_SIGNATURE_AVE := cg$AVENANT.cg$table(idx).DATE_SIGNATURE_AVE;
            cg$AVENANT.cg$tableind(idx).DATE_SIGNATURE_AVE := TRUE;
            cg$rec.MODIF_APPORTEE := cg$AVENANT.cg$table(idx).MODIF_APPORTEE;
            cg$AVENANT.cg$tableind(idx).MODIF_APPORTEE := TRUE;
            cg$rec.COMMENTAIRE := cg$AVENANT.cg$table(idx).COMMENTAIRE;
            cg$AVENANT.cg$tableind(idx).COMMENTAIRE := TRUE;

            cg$AVENANT.validate_foreign_keys_del(cg$rec);
            cg$AVENANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AVENANT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AVENANT.cascade_delete(cg$rec);
            cg$AVENANT.domain_cascade_delete(cg$rec);             

            idx := cg$AVENANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



