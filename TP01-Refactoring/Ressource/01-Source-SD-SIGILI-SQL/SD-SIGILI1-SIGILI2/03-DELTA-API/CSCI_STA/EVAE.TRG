
PROMPT Creating Trigger Logic for Table 'EVALUATION_ENTREPRISE'
PROMPT Creating Before Insert Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BIS_EVALUATION_ENTREPRISE
BEFORE INSERT ON EVALUATION_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$EVALUATION_ENTREPRISE.cg$table.DELETE;
    cg$EVALUATION_ENTREPRISE.cg$tableind.DELETE;
    cg$EVALUATION_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'EVALUATION_ENTREPRISE'
create or replace TRIGGER CG$BIR_EVALUATION_ENTREPRISE BEFORE INSERT ON EVALUATION_ENTREPRISE 
FOR EACH ROW 
DECLARE
    cg$rec cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$ind cg$EVALUATION_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ := TRUE;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT := TRUE;

    if not (cg$EVALUATION_ENTREPRISE.called_from_package) then
        cg$EVALUATION_ENTREPRISE.validate_arc(cg$rec);
        cg$EVALUATION_ENTREPRISE.validate_domain(cg$rec);

        cg$EVALUATION_ENTREPRISE.ins(cg$rec, cg$ind, FALSE);
        cg$EVALUATION_ENTREPRISE.called_from_package := FALSE;
    end if;

    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$EVALUATION_ENTREPRISE.cg$tableind(cg$EVALUATION_ENTREPRISE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$EVALUATION_ENTREPRISE.cg$tableind(cg$EVALUATION_ENTREPRISE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).DATE_MAJ := cg$rec.DATE_MAJ;
    cg$EVALUATION_ENTREPRISE.cg$tableind(cg$EVALUATION_ENTREPRISE.idx).DATE_MAJ := cg$ind.DATE_MAJ;

    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ETAT := cg$rec.ETAT;
    cg$EVALUATION_ENTREPRISE.cg$tableind(cg$EVALUATION_ENTREPRISE.idx).ETAT := cg$ind.ETAT;

    cg$EVALUATION_ENTREPRISE.idx := cg$EVALUATION_ENTREPRISE.idx + 1;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.DATE_MAJ := SYSDATE;
    :new.ETAT := cg$rec.ETAT;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_EVALUATION_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_EVALUATION_ENTREPRISE
AFTER INSERT ON EVALUATION_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_EVALUATION_ENTREPRISE
/

PROMPT Creating After Insert Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AIS_EVALUATION_ENTREPRISE
AFTER INSERT ON EVALUATION_ENTREPRISE
DECLARE
    idx      BINARY_INTEGER := cg$EVALUATION_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$EVALUATION_ENTREPRISE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$EVALUATION_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$EVALUATION_ENTREPRISE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_ETUDIANT_NAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.DATE_MAJ := cg$EVALUATION_ENTREPRISE.cg$table(idx).DATE_MAJ;
            cg$rec.ETAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).ETAT;

            cg$EVALUATION_ENTREPRISE.validate_foreign_keys_ins(cg$rec);

            cg$EVALUATION_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EVALUATION_ENTREPRISE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$EVALUATION_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BUS_EVALUATION_ENTREPRISE
BEFORE UPDATE ON EVALUATION_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$EVALUATION_ENTREPRISE.cg$table.DELETE;
    cg$EVALUATION_ENTREPRISE.cg$tableind.DELETE;
    cg$EVALUATION_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'EVALUATION_ENTREPRISE'
create or replace TRIGGER cg$BUR_EVALUATION_ENTREPRISE
BEFORE UPDATE ON EVALUATION_ENTREPRISE FOR EACH ROW
DECLARE
    cg$rec     cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$ind     cg$EVALUATION_ENTREPRISE.cg$ind_type;
    cg$old_rec cg$EVALUATION_ENTREPRISE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ :=    (:new.DATE_MAJ IS NULL AND :old.DATE_MAJ IS NOT NULL )
                        OR (:new.DATE_MAJ IS NOT NULL AND :old.DATE_MAJ IS NULL)
                        OR NOT(:new.DATE_MAJ = :old.DATE_MAJ) ;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).DATE_MAJ := :old.DATE_MAJ;
    cg$rec.ETAT := :new.ETAT;
    cg$ind.ETAT :=    (:new.ETAT IS NULL AND :old.ETAT IS NOT NULL )
                        OR (:new.ETAT IS NOT NULL AND :old.ETAT IS NULL)
                        OR NOT(:new.ETAT = :old.ETAT) ;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ETAT := :old.ETAT;


    cg$EVALUATION_ENTREPRISE.idx := cg$EVALUATION_ENTREPRISE.idx + 1;

    if not (cg$EVALUATION_ENTREPRISE.called_from_package) then
        cg$EVALUATION_ENTREPRISE.validate_arc(cg$rec);
        cg$EVALUATION_ENTREPRISE.validate_domain(cg$rec, cg$ind);
        cg$EVALUATION_ENTREPRISE.validate_domain_cascade_update(cg$old_rec);   

        cg$EVALUATION_ENTREPRISE.upd(cg$rec, cg$ind, FALSE);
        cg$EVALUATION_ENTREPRISE.called_from_package := FALSE;
    end if;

    :new.DATE_MAJ := SYSDATE;
    :new.ETAT := cg$rec.ETAT;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_EVALUATION_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_EVALUATION_ENTREPRISE
AFTER UPDATE ON EVALUATION_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_EVALUATION_ENTREPRISE
/






PROMPT Creating After Update Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$AUS_EVALUATION_ENTREPRISE
AFTER UPDATE ON EVALUATION_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$EVALUATION_ENTREPRISE.cg$table.FIRST;
    cg$old_rec cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$rec     cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$ind     cg$EVALUATION_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ANNEE_PRO := cg$EVALUATION_ENTREPRISE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_ETUDIANT_NAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.DATE_MAJ := cg$EVALUATION_ENTREPRISE.cg$table(idx).DATE_MAJ;
        cg$old_rec.ETAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).ETAT;

    IF NOT (cg$EVALUATION_ENTREPRISE.called_from_package) THEN
        idx := cg$EVALUATION_ENTREPRISE.cg$table.NEXT(idx);
        cg$rec.ANNEE_PRO := cg$EVALUATION_ENTREPRISE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_ETUDIANT_NAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.DATE_MAJ := cg$EVALUATION_ENTREPRISE.cg$table(idx).DATE_MAJ;
        cg$ind.DATE_MAJ := updating('DATE_MAJ');
        cg$rec.ETAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).ETAT;
        cg$ind.ETAT := updating('ETAT');

        cg$EVALUATION_ENTREPRISE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$EVALUATION_ENTREPRISE.upd_denorm2( cg$rec,
                                       cg$EVALUATION_ENTREPRISE.cg$tableind(idx)
                                     );
        cg$EVALUATION_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$EVALUATION_ENTREPRISE.cg$tableind(idx)
								                  );
        cg$EVALUATION_ENTREPRISE.cascade_update(cg$rec, cg$old_rec);
        cg$EVALUATION_ENTREPRISE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$EVALUATION_ENTREPRISE.called_from_package := FALSE;
	END IF;
        idx := cg$EVALUATION_ENTREPRISE.cg$table.NEXT(idx);
    END LOOP;

    cg$EVALUATION_ENTREPRISE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDS_EVALUATION_ENTREPRISE
BEFORE DELETE ON EVALUATION_ENTREPRISE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$EVALUATION_ENTREPRISE.cg$table.DELETE;
    cg$EVALUATION_ENTREPRISE.cg$tableind.DELETE;
    cg$EVALUATION_ENTREPRISE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$BDR_EVALUATION_ENTREPRISE
BEFORE DELETE ON EVALUATION_ENTREPRISE FOR EACH ROW
DECLARE
    cg$pk cg$EVALUATION_ENTREPRISE.cg$pk_type;
    cg$rec cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$ind cg$EVALUATION_ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$EVALUATION_ENTREPRISE.cg$table(cg$EVALUATION_ENTREPRISE.idx).ANNEE_PRO := :old.ANNEE_PRO;


    cg$EVALUATION_ENTREPRISE.idx := cg$EVALUATION_ENTREPRISE.idx + 1;

    if not (cg$EVALUATION_ENTREPRISE.called_from_package) then
        cg$EVALUATION_ENTREPRISE.validate_domain_cascade_delete(cg$rec);   
        cg$EVALUATION_ENTREPRISE.del(cg$pk, FALSE);
        cg$EVALUATION_ENTREPRISE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_EVALUATION_ENTREPRISE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_EVALUATION_ENTREPRISE
AFTER DELETE ON EVALUATION_ENTREPRISE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_EVALUATION_ENTREPRISE
/

PROMPT Creating After Delete Statement Trigger on 'EVALUATION_ENTREPRISE'
CREATE OR REPLACE TRIGGER cg$ADS_EVALUATION_ENTREPRISE
AFTER DELETE ON EVALUATION_ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$EVALUATION_ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$EVALUATION_ENTREPRISE.cg$row_type;
    cg$old_rec   cg$EVALUATION_ENTREPRISE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$EVALUATION_ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$EVALUATION_ENTREPRISE.cg$table(idx).ANNEE_PRO;
            cg$EVALUATION_ENTREPRISE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$EVALUATION_ENTREPRISE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.DATE_MAJ := cg$EVALUATION_ENTREPRISE.cg$table(idx).DATE_MAJ;
            cg$EVALUATION_ENTREPRISE.cg$tableind(idx).DATE_MAJ := TRUE;
            cg$rec.ETAT := cg$EVALUATION_ENTREPRISE.cg$table(idx).ETAT;
            cg$EVALUATION_ENTREPRISE.cg$tableind(idx).ETAT := TRUE;

            cg$EVALUATION_ENTREPRISE.validate_foreign_keys_del(cg$rec);
            cg$EVALUATION_ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EVALUATION_ENTREPRISE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$EVALUATION_ENTREPRISE.cascade_delete(cg$rec);
            cg$EVALUATION_ENTREPRISE.domain_cascade_delete(cg$rec);             

            idx := cg$EVALUATION_ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



