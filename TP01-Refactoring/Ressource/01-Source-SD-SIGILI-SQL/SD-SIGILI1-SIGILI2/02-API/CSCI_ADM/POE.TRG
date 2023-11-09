
PROMPT Creating Trigger Logic for Table 'POSTE_ENTREPRISE'
PROMPT Creating Before Insert Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIS_POSTE_ENTREPRISE
BEFORE INSERT ON POSTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$POSTE_ENTREPRISE.cg$table.DELETE;
    cg$POSTE_ENTREPRISE.cg$tableind.DELETE;
    cg$POSTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIR_POSTE_ENTREPRISE
BEFORE INSERT ON POSTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec cg$POSTE_ENTREPRISE.cg$row_type;
    cg$ind cg$POSTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE := TRUE;
    cg$rec.FONCTION := :new.FONCTION;
    cg$ind.FONCTION := TRUE;
    cg$rec.DATE_EMBAUCHE := :new.DATE_EMBAUCHE;
    cg$ind.DATE_EMBAUCHE := TRUE;
    cg$rec.MOYEN_OBTENTION := :new.MOYEN_OBTENTION;
    cg$ind.MOYEN_OBTENTION := TRUE;
    cg$rec.SERVICE := :new.SERVICE;
    cg$ind.SERVICE := TRUE;
    cg$rec.BRUT_ANNUEL := :new.BRUT_ANNUEL;
    cg$ind.BRUT_ANNUEL := TRUE;

    if not (cg$POSTE_ENTREPRISE.called_from_package) then
        cg$POSTE_ENTREPRISE.validate_arc(cg$rec);
        cg$POSTE_ENTREPRISE.validate_domain(cg$rec);

        cg$POSTE_ENTREPRISE.ins(cg$rec, cg$ind, FALSE);
        cg$POSTE_ENTREPRISE.called_from_package := FALSE;
    end if;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).FONCTION := cg$rec.FONCTION;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).FONCTION := cg$ind.FONCTION;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).DATE_EMBAUCHE := cg$rec.DATE_EMBAUCHE;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).DATE_EMBAUCHE := cg$ind.DATE_EMBAUCHE;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).MOYEN_OBTENTION := cg$rec.MOYEN_OBTENTION;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).MOYEN_OBTENTION := cg$ind.MOYEN_OBTENTION;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).SERVICE := cg$rec.SERVICE;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).SERVICE := cg$ind.SERVICE;

    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).BRUT_ANNUEL := cg$rec.BRUT_ANNUEL;
    cg$POSTE_ENTREPRISE.cg$tableind(cg$POSTE_ENTREPRISE.idx).BRUT_ANNUEL := cg$ind.BRUT_ANNUEL;

    cg$POSTE_ENTREPRISE.idx := cg$POSTE_ENTREPRISE.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.FONCTION := cg$rec.FONCTION;
    :new.DATE_EMBAUCHE := cg$rec.DATE_EMBAUCHE;
    :new.MOYEN_OBTENTION := cg$rec.MOYEN_OBTENTION;
    :new.SERVICE := cg$rec.SERVICE;
    :new.BRUT_ANNUEL := cg$rec.BRUT_ANNUEL;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_POSTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_POSTE_ENTREPRISE
AFTER INSERT ON POSTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_POSTE_ENTREPRISE
/

PROMPT Creating After Insert Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AIS_POSTE_ENTREPRISE
AFTER INSERT ON POSTE_ENTREPRISE
DECLARE
    idx      BINARY_INTEGER := cg$POSTE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$POSTE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$POSTE_ENTREPRISE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$POSTE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NO_ENTREPRISE := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
            cg$rec.FONCTION := cg$POSTE_ENTREPRISE.cg$table(idx).FONCTION;
            cg$rec.DATE_EMBAUCHE := cg$POSTE_ENTREPRISE.cg$table(idx).DATE_EMBAUCHE;
            cg$rec.MOYEN_OBTENTION := cg$POSTE_ENTREPRISE.cg$table(idx).MOYEN_OBTENTION;
            cg$rec.SERVICE := cg$POSTE_ENTREPRISE.cg$table(idx).SERVICE;
            cg$rec.BRUT_ANNUEL := cg$POSTE_ENTREPRISE.cg$table(idx).BRUT_ANNUEL;

            cg$POSTE_ENTREPRISE.validate_foreign_keys_ins(cg$rec);

            cg$POSTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$POSTE_ENTREPRISE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$POSTE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUS_POSTE_ENTREPRISE
BEFORE UPDATE ON POSTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$POSTE_ENTREPRISE.cg$table.DELETE;
    cg$POSTE_ENTREPRISE.cg$tableind.DELETE;
    cg$POSTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUR_POSTE_ENTREPRISE
BEFORE UPDATE ON POSTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec     cg$POSTE_ENTREPRISE.cg$row_type;
    cg$ind     cg$POSTE_ENTREPRISE.cg$ind_type;
    cg$old_rec cg$POSTE_ENTREPRISE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.FONCTION := :new.FONCTION;
    cg$ind.FONCTION :=    (:new.FONCTION IS NULL AND :old.FONCTION IS NOT NULL )
                        OR (:new.FONCTION IS NOT NULL AND :old.FONCTION IS NULL)
                        OR NOT(:new.FONCTION = :old.FONCTION) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).FONCTION := :old.FONCTION;
    cg$rec.DATE_EMBAUCHE := :new.DATE_EMBAUCHE;
    cg$ind.DATE_EMBAUCHE :=    (:new.DATE_EMBAUCHE IS NULL AND :old.DATE_EMBAUCHE IS NOT NULL )
                        OR (:new.DATE_EMBAUCHE IS NOT NULL AND :old.DATE_EMBAUCHE IS NULL)
                        OR NOT(:new.DATE_EMBAUCHE = :old.DATE_EMBAUCHE) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).DATE_EMBAUCHE := :old.DATE_EMBAUCHE;
    cg$rec.MOYEN_OBTENTION := :new.MOYEN_OBTENTION;
    cg$ind.MOYEN_OBTENTION :=    (:new.MOYEN_OBTENTION IS NULL AND :old.MOYEN_OBTENTION IS NOT NULL )
                        OR (:new.MOYEN_OBTENTION IS NOT NULL AND :old.MOYEN_OBTENTION IS NULL)
                        OR NOT(:new.MOYEN_OBTENTION = :old.MOYEN_OBTENTION) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).MOYEN_OBTENTION := :old.MOYEN_OBTENTION;
    cg$rec.SERVICE := :new.SERVICE;
    cg$ind.SERVICE :=    (:new.SERVICE IS NULL AND :old.SERVICE IS NOT NULL )
                        OR (:new.SERVICE IS NOT NULL AND :old.SERVICE IS NULL)
                        OR NOT(:new.SERVICE = :old.SERVICE) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).SERVICE := :old.SERVICE;
    cg$rec.BRUT_ANNUEL := :new.BRUT_ANNUEL;
    cg$ind.BRUT_ANNUEL :=    (:new.BRUT_ANNUEL IS NULL AND :old.BRUT_ANNUEL IS NOT NULL )
                        OR (:new.BRUT_ANNUEL IS NOT NULL AND :old.BRUT_ANNUEL IS NULL)
                        OR NOT(:new.BRUT_ANNUEL = :old.BRUT_ANNUEL) ;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).BRUT_ANNUEL := :old.BRUT_ANNUEL;


    cg$POSTE_ENTREPRISE.idx := cg$POSTE_ENTREPRISE.idx + 1;

    if not (cg$POSTE_ENTREPRISE.called_from_package) then
        cg$POSTE_ENTREPRISE.validate_arc(cg$rec);
        cg$POSTE_ENTREPRISE.validate_domain(cg$rec, cg$ind);
        cg$POSTE_ENTREPRISE.validate_domain_cascade_update(cg$old_rec);   

        cg$POSTE_ENTREPRISE.upd(cg$rec, cg$ind, FALSE);
        cg$POSTE_ENTREPRISE.called_from_package := FALSE;
    end if;

    :new.FONCTION := cg$rec.FONCTION;
    :new.DATE_EMBAUCHE := cg$rec.DATE_EMBAUCHE;
    :new.MOYEN_OBTENTION := cg$rec.MOYEN_OBTENTION;
    :new.SERVICE := cg$rec.SERVICE;
    :new.BRUT_ANNUEL := cg$rec.BRUT_ANNUEL;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_POSTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_POSTE_ENTREPRISE
AFTER UPDATE ON POSTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_POSTE_ENTREPRISE
/






PROMPT Creating After Update Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AUS_POSTE_ENTREPRISE
AFTER UPDATE ON POSTE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$POSTE_ENTREPRISE.cg$table.FIRST;
    cg$old_rec cg$POSTE_ENTREPRISE.cg$row_type;
    cg$rec     cg$POSTE_ENTREPRISE.cg$row_type;
    cg$ind     cg$POSTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NO_ENTREPRISE := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
        cg$old_rec.FONCTION := cg$POSTE_ENTREPRISE.cg$table(idx).FONCTION;
        cg$old_rec.DATE_EMBAUCHE := cg$POSTE_ENTREPRISE.cg$table(idx).DATE_EMBAUCHE;
        cg$old_rec.MOYEN_OBTENTION := cg$POSTE_ENTREPRISE.cg$table(idx).MOYEN_OBTENTION;
        cg$old_rec.SERVICE := cg$POSTE_ENTREPRISE.cg$table(idx).SERVICE;
        cg$old_rec.BRUT_ANNUEL := cg$POSTE_ENTREPRISE.cg$table(idx).BRUT_ANNUEL;

    IF NOT (cg$POSTE_ENTREPRISE.called_from_package) THEN
        idx := cg$POSTE_ENTREPRISE.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NO_ENTREPRISE := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');
        cg$rec.FONCTION := cg$POSTE_ENTREPRISE.cg$table(idx).FONCTION;
        cg$ind.FONCTION := updating('FONCTION');
        cg$rec.DATE_EMBAUCHE := cg$POSTE_ENTREPRISE.cg$table(idx).DATE_EMBAUCHE;
        cg$ind.DATE_EMBAUCHE := updating('DATE_EMBAUCHE');
        cg$rec.MOYEN_OBTENTION := cg$POSTE_ENTREPRISE.cg$table(idx).MOYEN_OBTENTION;
        cg$ind.MOYEN_OBTENTION := updating('MOYEN_OBTENTION');
        cg$rec.SERVICE := cg$POSTE_ENTREPRISE.cg$table(idx).SERVICE;
        cg$ind.SERVICE := updating('SERVICE');
        cg$rec.BRUT_ANNUEL := cg$POSTE_ENTREPRISE.cg$table(idx).BRUT_ANNUEL;
        cg$ind.BRUT_ANNUEL := updating('BRUT_ANNUEL');

        cg$POSTE_ENTREPRISE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$POSTE_ENTREPRISE.upd_denorm2( cg$rec,
                                       cg$POSTE_ENTREPRISE.cg$tableind(idx)
                                     );
        cg$POSTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$POSTE_ENTREPRISE.cg$tableind(idx)
								                  );
        cg$POSTE_ENTREPRISE.cascade_update(cg$rec, cg$old_rec);
        cg$POSTE_ENTREPRISE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$POSTE_ENTREPRISE.called_from_package := FALSE;
	END IF;
        idx := cg$POSTE_ENTREPRISE.cg$table.NEXT(idx);
    END LOOP;

    cg$POSTE_ENTREPRISE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDS_POSTE_ENTREPRISE
BEFORE DELETE ON POSTE_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$POSTE_ENTREPRISE.cg$table.DELETE;
    cg$POSTE_ENTREPRISE.cg$tableind.DELETE;
    cg$POSTE_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDR_POSTE_ENTREPRISE
BEFORE DELETE ON POSTE_ENTREPRISE FOR EACH ROW
DECLARE
    cg$pk cg$POSTE_ENTREPRISE.cg$pk_type;
    cg$rec cg$POSTE_ENTREPRISE.cg$row_type;
    cg$ind cg$POSTE_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.NO_ENTREPRISE  := :old.NO_ENTREPRISE;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$POSTE_ENTREPRISE.cg$table(cg$POSTE_ENTREPRISE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;


    cg$POSTE_ENTREPRISE.idx := cg$POSTE_ENTREPRISE.idx + 1;

    if not (cg$POSTE_ENTREPRISE.called_from_package) then
        cg$POSTE_ENTREPRISE.validate_domain_cascade_delete(cg$rec);   
        cg$POSTE_ENTREPRISE.del(cg$pk, FALSE);
        cg$POSTE_ENTREPRISE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_POSTE_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_POSTE_ENTREPRISE
AFTER DELETE ON POSTE_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_POSTE_ENTREPRISE
/

PROMPT Creating After Delete Statement Trigger on 'POSTE_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$ADS_POSTE_ENTREPRISE
AFTER DELETE ON POSTE_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$POSTE_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$POSTE_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$POSTE_ENTREPRISE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$POSTE_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NO_ENTREPRISE := cg$POSTE_ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).NO_ENTREPRISE := TRUE;
            cg$rec.FONCTION := cg$POSTE_ENTREPRISE.cg$table(idx).FONCTION;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).FONCTION := TRUE;
            cg$rec.DATE_EMBAUCHE := cg$POSTE_ENTREPRISE.cg$table(idx).DATE_EMBAUCHE;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).DATE_EMBAUCHE := TRUE;
            cg$rec.MOYEN_OBTENTION := cg$POSTE_ENTREPRISE.cg$table(idx).MOYEN_OBTENTION;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).MOYEN_OBTENTION := TRUE;
            cg$rec.SERVICE := cg$POSTE_ENTREPRISE.cg$table(idx).SERVICE;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).SERVICE := TRUE;
            cg$rec.BRUT_ANNUEL := cg$POSTE_ENTREPRISE.cg$table(idx).BRUT_ANNUEL;
            cg$POSTE_ENTREPRISE.cg$tableind(idx).BRUT_ANNUEL := TRUE;

            cg$POSTE_ENTREPRISE.validate_foreign_keys_del(cg$rec);
            cg$POSTE_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$POSTE_ENTREPRISE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$POSTE_ENTREPRISE.cascade_delete(cg$rec);
            cg$POSTE_ENTREPRISE.domain_cascade_delete(cg$rec);             

            idx := cg$POSTE_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



