
PROMPT Creating Trigger Logic for Table 'AFFECTATION_ETUDIANT'
PROMPT Creating Before Insert Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BIS_AFFECTATION_ETUDIANT
BEFORE INSERT ON AFFECTATION_ETUDIANT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AFFECTATION_ETUDIANT.cg$table.DELETE;
    cg$AFFECTATION_ETUDIANT.cg$tableind.DELETE;
    cg$AFFECTATION_ETUDIANT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BIR_AFFECTATION_ETUDIANT
BEFORE INSERT ON AFFECTATION_ETUDIANT FOR EACH ROW
DECLARE
    cg$rec cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$ind cg$AFFECTATION_ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.CHARGE := :new.CHARGE;
    cg$ind.CHARGE := TRUE;
    cg$rec.CONSOLIDATEUR := :new.CONSOLIDATEUR;
    cg$ind.CONSOLIDATEUR := TRUE;

    if not (cg$AFFECTATION_ETUDIANT.called_from_package) then
        cg$AFFECTATION_ETUDIANT.validate_arc(cg$rec);
        cg$AFFECTATION_ETUDIANT.validate_domain(cg$rec);

        cg$AFFECTATION_ETUDIANT.ins(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_ETUDIANT.called_from_package := FALSE;
    end if;

    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).ID_FA := cg$rec.ID_FA;
    cg$AFFECTATION_ETUDIANT.cg$tableind(cg$AFFECTATION_ETUDIANT.idx).ID_FA := cg$ind.ID_FA;

    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$AFFECTATION_ETUDIANT.cg$tableind(cg$AFFECTATION_ETUDIANT.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).CHARGE := cg$rec.CHARGE;
    cg$AFFECTATION_ETUDIANT.cg$tableind(cg$AFFECTATION_ETUDIANT.idx).CHARGE := cg$ind.CHARGE;

    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).CONSOLIDATEUR := cg$rec.CONSOLIDATEUR;
    cg$AFFECTATION_ETUDIANT.cg$tableind(cg$AFFECTATION_ETUDIANT.idx).CONSOLIDATEUR := cg$ind.CONSOLIDATEUR;

    cg$AFFECTATION_ETUDIANT.idx := cg$AFFECTATION_ETUDIANT.idx + 1;

    :new.ID_FA := cg$rec.ID_FA;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.CHARGE := cg$rec.CHARGE;
    :new.CONSOLIDATEUR := cg$rec.CONSOLIDATEUR;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_AFFECTATION_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AFFECTATION_ETUDIANT
AFTER INSERT ON AFFECTATION_ETUDIANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AFFECTATION_ETUDIANT
/

PROMPT Creating After Insert Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$AIS_AFFECTATION_ETUDIANT
AFTER INSERT ON AFFECTATION_ETUDIANT
DECLARE
    idx      BINARY_INTEGER := cg$AFFECTATION_ETUDIANT.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$old_rec   cg$AFFECTATION_ETUDIANT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AFFECTATION_ETUDIANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FA := cg$AFFECTATION_ETUDIANT.cg$table(idx).ID_FA;
            cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.CHARGE := cg$AFFECTATION_ETUDIANT.cg$table(idx).CHARGE;
            cg$rec.CONSOLIDATEUR := cg$AFFECTATION_ETUDIANT.cg$table(idx).CONSOLIDATEUR;

            cg$AFFECTATION_ETUDIANT.validate_foreign_keys_ins(cg$rec);

            cg$AFFECTATION_ETUDIANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_ETUDIANT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AFFECTATION_ETUDIANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BUS_AFFECTATION_ETUDIANT
BEFORE UPDATE ON AFFECTATION_ETUDIANT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AFFECTATION_ETUDIANT.cg$table.DELETE;
    cg$AFFECTATION_ETUDIANT.cg$tableind.DELETE;
    cg$AFFECTATION_ETUDIANT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BUR_AFFECTATION_ETUDIANT
BEFORE UPDATE ON AFFECTATION_ETUDIANT FOR EACH ROW
DECLARE
    cg$rec     cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$ind     cg$AFFECTATION_ETUDIANT.cg$ind_type;
    cg$old_rec cg$AFFECTATION_ETUDIANT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA :=    (:new.ID_FA IS NULL AND :old.ID_FA IS NOT NULL )
                        OR (:new.ID_FA IS NOT NULL AND :old.ID_FA IS NULL)
                        OR NOT(:new.ID_FA = :old.ID_FA) ;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).ID_FA := :old.ID_FA;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.CHARGE := :new.CHARGE;
    cg$ind.CHARGE :=    (:new.CHARGE IS NULL AND :old.CHARGE IS NOT NULL )
                        OR (:new.CHARGE IS NOT NULL AND :old.CHARGE IS NULL)
                        OR NOT(:new.CHARGE = :old.CHARGE) ;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).CHARGE := :old.CHARGE;
    cg$rec.CONSOLIDATEUR := :new.CONSOLIDATEUR;
    cg$ind.CONSOLIDATEUR :=    (:new.CONSOLIDATEUR IS NULL AND :old.CONSOLIDATEUR IS NOT NULL )
                        OR (:new.CONSOLIDATEUR IS NOT NULL AND :old.CONSOLIDATEUR IS NULL)
                        OR NOT(:new.CONSOLIDATEUR = :old.CONSOLIDATEUR) ;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).CONSOLIDATEUR := :old.CONSOLIDATEUR;


    cg$AFFECTATION_ETUDIANT.idx := cg$AFFECTATION_ETUDIANT.idx + 1;

    if not (cg$AFFECTATION_ETUDIANT.called_from_package) then
        cg$AFFECTATION_ETUDIANT.validate_arc(cg$rec);
        cg$AFFECTATION_ETUDIANT.validate_domain(cg$rec, cg$ind);
        cg$AFFECTATION_ETUDIANT.validate_domain_cascade_update(cg$old_rec);   

        cg$AFFECTATION_ETUDIANT.upd(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_ETUDIANT.called_from_package := FALSE;
    end if;

    :new.CHARGE := cg$rec.CHARGE;
    :new.CONSOLIDATEUR := cg$rec.CONSOLIDATEUR;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AFFECTATION_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AFFECTATION_ETUDIANT
AFTER UPDATE ON AFFECTATION_ETUDIANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AFFECTATION_ETUDIANT
/






PROMPT Creating After Update Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$AUS_AFFECTATION_ETUDIANT
AFTER UPDATE ON AFFECTATION_ETUDIANT
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_ETUDIANT.cg$table.FIRST;
    cg$old_rec cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$rec     cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$ind     cg$AFFECTATION_ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_FA := cg$AFFECTATION_ETUDIANT.cg$table(idx).ID_FA;
        cg$old_rec.NO_ETUDIANT_NAT := cg$AFFECTATION_ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.CHARGE := cg$AFFECTATION_ETUDIANT.cg$table(idx).CHARGE;
        cg$old_rec.CONSOLIDATEUR := cg$AFFECTATION_ETUDIANT.cg$table(idx).CONSOLIDATEUR;

    IF NOT (cg$AFFECTATION_ETUDIANT.called_from_package) THEN
        idx := cg$AFFECTATION_ETUDIANT.cg$table.NEXT(idx);
        cg$rec.ID_FA := cg$AFFECTATION_ETUDIANT.cg$table(idx).ID_FA;
        cg$ind.ID_FA := updating('ID_FA');
        cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.CHARGE := cg$AFFECTATION_ETUDIANT.cg$table(idx).CHARGE;
        cg$ind.CHARGE := updating('CHARGE');
        cg$rec.CONSOLIDATEUR := cg$AFFECTATION_ETUDIANT.cg$table(idx).CONSOLIDATEUR;
        cg$ind.CONSOLIDATEUR := updating('CONSOLIDATEUR');

        cg$AFFECTATION_ETUDIANT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AFFECTATION_ETUDIANT.upd_denorm2( cg$rec,
                                       cg$AFFECTATION_ETUDIANT.cg$tableind(idx)
                                     );
        cg$AFFECTATION_ETUDIANT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AFFECTATION_ETUDIANT.cg$tableind(idx)
								                  );
        cg$AFFECTATION_ETUDIANT.cascade_update(cg$rec, cg$old_rec);
        cg$AFFECTATION_ETUDIANT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AFFECTATION_ETUDIANT.called_from_package := FALSE;
	END IF;
        idx := cg$AFFECTATION_ETUDIANT.cg$table.NEXT(idx);
    END LOOP;

    cg$AFFECTATION_ETUDIANT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BDS_AFFECTATION_ETUDIANT
BEFORE DELETE ON AFFECTATION_ETUDIANT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AFFECTATION_ETUDIANT.cg$table.DELETE;
    cg$AFFECTATION_ETUDIANT.cg$tableind.DELETE;
    cg$AFFECTATION_ETUDIANT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BDR_AFFECTATION_ETUDIANT
BEFORE DELETE ON AFFECTATION_ETUDIANT FOR EACH ROW
DECLARE
    cg$pk cg$AFFECTATION_ETUDIANT.cg$pk_type;
    cg$rec cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$ind cg$AFFECTATION_ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_FA  := :old.ID_FA;
    cg$rec.ID_FA := :old.ID_FA;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).ID_FA := :old.ID_FA;
    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ID_FA := :old.ID_FA;
    cg$AFFECTATION_ETUDIANT.cg$table(cg$AFFECTATION_ETUDIANT.idx).ID_FA := :old.ID_FA;


    cg$AFFECTATION_ETUDIANT.idx := cg$AFFECTATION_ETUDIANT.idx + 1;

    if not (cg$AFFECTATION_ETUDIANT.called_from_package) then
        cg$AFFECTATION_ETUDIANT.validate_domain_cascade_delete(cg$rec);   
        cg$AFFECTATION_ETUDIANT.del(cg$pk, FALSE);
        cg$AFFECTATION_ETUDIANT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AFFECTATION_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AFFECTATION_ETUDIANT
AFTER DELETE ON AFFECTATION_ETUDIANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AFFECTATION_ETUDIANT
/

PROMPT Creating After Delete Statement Trigger on 'AFFECTATION_ETUDIANT'
CREATE OR REPLACE TRIGGER cg$ADS_AFFECTATION_ETUDIANT
AFTER DELETE ON AFFECTATION_ETUDIANT
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_ETUDIANT.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_ETUDIANT.cg$row_type;
    cg$old_rec   cg$AFFECTATION_ETUDIANT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AFFECTATION_ETUDIANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FA := cg$AFFECTATION_ETUDIANT.cg$table(idx).ID_FA;
            cg$AFFECTATION_ETUDIANT.cg$tableind(idx).ID_FA := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$AFFECTATION_ETUDIANT.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.CHARGE := cg$AFFECTATION_ETUDIANT.cg$table(idx).CHARGE;
            cg$AFFECTATION_ETUDIANT.cg$tableind(idx).CHARGE := TRUE;
            cg$rec.CONSOLIDATEUR := cg$AFFECTATION_ETUDIANT.cg$table(idx).CONSOLIDATEUR;
            cg$AFFECTATION_ETUDIANT.cg$tableind(idx).CONSOLIDATEUR := TRUE;

            cg$AFFECTATION_ETUDIANT.validate_foreign_keys_del(cg$rec);
            cg$AFFECTATION_ETUDIANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_ETUDIANT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AFFECTATION_ETUDIANT.cascade_delete(cg$rec);
            cg$AFFECTATION_ETUDIANT.domain_cascade_delete(cg$rec);             

            idx := cg$AFFECTATION_ETUDIANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



