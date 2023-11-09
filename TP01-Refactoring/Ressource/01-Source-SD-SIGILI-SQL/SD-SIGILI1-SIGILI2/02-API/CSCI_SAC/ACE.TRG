
PROMPT Creating Trigger Logic for Table 'AFFECTATION_CRR_ETU'
PROMPT Creating Before Insert Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BIS_AFFECTATION_CRR_ETU
BEFORE INSERT ON AFFECTATION_CRR_ETU
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AFFECTATION_CRR_ETU.cg$table.DELETE;
    cg$AFFECTATION_CRR_ETU.cg$tableind.DELETE;
    cg$AFFECTATION_CRR_ETU.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BIR_AFFECTATION_CRR_ETU
BEFORE INSERT ON AFFECTATION_CRR_ETU FOR EACH ROW
DECLARE
    cg$rec cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$ind cg$AFFECTATION_CRR_ETU.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_ACE := :new.ID_ACE;
    cg$ind.ID_ACE := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR := TRUE;

    if not (cg$AFFECTATION_CRR_ETU.called_from_package) then
        cg$AFFECTATION_CRR_ETU.validate_arc(cg$rec);
        cg$AFFECTATION_CRR_ETU.validate_domain(cg$rec);

        cg$AFFECTATION_CRR_ETU.ins(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_CRR_ETU.called_from_package := FALSE;
    end if;

    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).ID_ACE := cg$rec.ID_ACE;
    cg$AFFECTATION_CRR_ETU.cg$tableind(cg$AFFECTATION_CRR_ETU.idx).ID_ACE := cg$ind.ID_ACE;

    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$AFFECTATION_CRR_ETU.cg$tableind(cg$AFFECTATION_CRR_ETU.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_CRR := cg$rec.NO_CRR;
    cg$AFFECTATION_CRR_ETU.cg$tableind(cg$AFFECTATION_CRR_ETU.idx).NO_CRR := cg$ind.NO_CRR;

    cg$AFFECTATION_CRR_ETU.idx := cg$AFFECTATION_CRR_ETU.idx + 1;

    :new.ID_ACE := cg$rec.ID_ACE;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_CRR := cg$rec.NO_CRR;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_AFFECTATION_CRR_ETU, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AFFECTATION_CRR_ETU
AFTER INSERT ON AFFECTATION_CRR_ETU FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AFFECTATION_CRR_ETU
/

PROMPT Creating After Insert Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$AIS_AFFECTATION_CRR_ETU
AFTER INSERT ON AFFECTATION_CRR_ETU
DECLARE
    idx      BINARY_INTEGER := cg$AFFECTATION_CRR_ETU.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$old_rec   cg$AFFECTATION_CRR_ETU.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AFFECTATION_CRR_ETU.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_ACE := cg$AFFECTATION_CRR_ETU.cg$table(idx).ID_ACE;
            cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NO_CRR := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_CRR;

            cg$AFFECTATION_CRR_ETU.validate_foreign_keys_ins(cg$rec);

            cg$AFFECTATION_CRR_ETU.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_CRR_ETU.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AFFECTATION_CRR_ETU.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BUS_AFFECTATION_CRR_ETU
BEFORE UPDATE ON AFFECTATION_CRR_ETU
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AFFECTATION_CRR_ETU.cg$table.DELETE;
    cg$AFFECTATION_CRR_ETU.cg$tableind.DELETE;
    cg$AFFECTATION_CRR_ETU.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BUR_AFFECTATION_CRR_ETU
BEFORE UPDATE ON AFFECTATION_CRR_ETU FOR EACH ROW
DECLARE
    cg$rec     cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$ind     cg$AFFECTATION_CRR_ETU.cg$ind_type;
    cg$old_rec cg$AFFECTATION_CRR_ETU.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_ACE := :new.ID_ACE;
    cg$ind.ID_ACE :=    (:new.ID_ACE IS NULL AND :old.ID_ACE IS NOT NULL )
                        OR (:new.ID_ACE IS NOT NULL AND :old.ID_ACE IS NULL)
                        OR NOT(:new.ID_ACE = :old.ID_ACE) ;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).ID_ACE := :old.ID_ACE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR :=    (:new.NO_CRR IS NULL AND :old.NO_CRR IS NOT NULL )
                        OR (:new.NO_CRR IS NOT NULL AND :old.NO_CRR IS NULL)
                        OR NOT(:new.NO_CRR = :old.NO_CRR) ;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_CRR := :old.NO_CRR;


    cg$AFFECTATION_CRR_ETU.idx := cg$AFFECTATION_CRR_ETU.idx + 1;

    if not (cg$AFFECTATION_CRR_ETU.called_from_package) then
        cg$AFFECTATION_CRR_ETU.validate_arc(cg$rec);
        cg$AFFECTATION_CRR_ETU.validate_domain(cg$rec, cg$ind);
        cg$AFFECTATION_CRR_ETU.validate_domain_cascade_update(cg$old_rec);   

        cg$AFFECTATION_CRR_ETU.upd(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_CRR_ETU.called_from_package := FALSE;
    end if;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_CRR := cg$rec.NO_CRR;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AFFECTATION_CRR_ETU, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AFFECTATION_CRR_ETU
AFTER UPDATE ON AFFECTATION_CRR_ETU FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AFFECTATION_CRR_ETU
/






PROMPT Creating After Update Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$AUS_AFFECTATION_CRR_ETU
AFTER UPDATE ON AFFECTATION_CRR_ETU
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_CRR_ETU.cg$table.FIRST;
    cg$old_rec cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$rec     cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$ind     cg$AFFECTATION_CRR_ETU.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_ACE := cg$AFFECTATION_CRR_ETU.cg$table(idx).ID_ACE;
        cg$old_rec.NO_ETUDIANT_NAT := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NO_CRR := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_CRR;

    IF NOT (cg$AFFECTATION_CRR_ETU.called_from_package) THEN
        idx := cg$AFFECTATION_CRR_ETU.cg$table.NEXT(idx);
        cg$rec.ID_ACE := cg$AFFECTATION_CRR_ETU.cg$table(idx).ID_ACE;
        cg$ind.ID_ACE := updating('ID_ACE');
        cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NO_CRR := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_CRR;
        cg$ind.NO_CRR := updating('NO_CRR');

        cg$AFFECTATION_CRR_ETU.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AFFECTATION_CRR_ETU.upd_denorm2( cg$rec,
                                       cg$AFFECTATION_CRR_ETU.cg$tableind(idx)
                                     );
        cg$AFFECTATION_CRR_ETU.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AFFECTATION_CRR_ETU.cg$tableind(idx)
								                  );
        cg$AFFECTATION_CRR_ETU.cascade_update(cg$rec, cg$old_rec);
        cg$AFFECTATION_CRR_ETU.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AFFECTATION_CRR_ETU.called_from_package := FALSE;
	END IF;
        idx := cg$AFFECTATION_CRR_ETU.cg$table.NEXT(idx);
    END LOOP;

    cg$AFFECTATION_CRR_ETU.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BDS_AFFECTATION_CRR_ETU
BEFORE DELETE ON AFFECTATION_CRR_ETU
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AFFECTATION_CRR_ETU.cg$table.DELETE;
    cg$AFFECTATION_CRR_ETU.cg$tableind.DELETE;
    cg$AFFECTATION_CRR_ETU.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$BDR_AFFECTATION_CRR_ETU
BEFORE DELETE ON AFFECTATION_CRR_ETU FOR EACH ROW
DECLARE
    cg$pk cg$AFFECTATION_CRR_ETU.cg$pk_type;
    cg$rec cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$ind cg$AFFECTATION_CRR_ETU.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_ACE  := :old.ID_ACE;
    cg$rec.ID_ACE := :old.ID_ACE;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).ID_ACE := :old.ID_ACE;
    cg$rec.NO_CRR := :old.NO_CRR;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_CRR := :old.NO_CRR;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$AFFECTATION_CRR_ETU.cg$table(cg$AFFECTATION_CRR_ETU.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;


    cg$AFFECTATION_CRR_ETU.idx := cg$AFFECTATION_CRR_ETU.idx + 1;

    if not (cg$AFFECTATION_CRR_ETU.called_from_package) then
        cg$AFFECTATION_CRR_ETU.validate_domain_cascade_delete(cg$rec);   
        cg$AFFECTATION_CRR_ETU.del(cg$pk, FALSE);
        cg$AFFECTATION_CRR_ETU.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AFFECTATION_CRR_ETU, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AFFECTATION_CRR_ETU
AFTER DELETE ON AFFECTATION_CRR_ETU FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AFFECTATION_CRR_ETU
/

PROMPT Creating After Delete Statement Trigger on 'AFFECTATION_CRR_ETU'
CREATE OR REPLACE TRIGGER cg$ADS_AFFECTATION_CRR_ETU
AFTER DELETE ON AFFECTATION_CRR_ETU
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_CRR_ETU.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_CRR_ETU.cg$row_type;
    cg$old_rec   cg$AFFECTATION_CRR_ETU.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AFFECTATION_CRR_ETU.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_ACE := cg$AFFECTATION_CRR_ETU.cg$table(idx).ID_ACE;
            cg$AFFECTATION_CRR_ETU.cg$tableind(idx).ID_ACE := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_ETUDIANT_NAT;
            cg$AFFECTATION_CRR_ETU.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NO_CRR := cg$AFFECTATION_CRR_ETU.cg$table(idx).NO_CRR;
            cg$AFFECTATION_CRR_ETU.cg$tableind(idx).NO_CRR := TRUE;

            cg$AFFECTATION_CRR_ETU.validate_foreign_keys_del(cg$rec);
            cg$AFFECTATION_CRR_ETU.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_CRR_ETU.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AFFECTATION_CRR_ETU.cascade_delete(cg$rec);
            cg$AFFECTATION_CRR_ETU.domain_cascade_delete(cg$rec);             

            idx := cg$AFFECTATION_CRR_ETU.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



