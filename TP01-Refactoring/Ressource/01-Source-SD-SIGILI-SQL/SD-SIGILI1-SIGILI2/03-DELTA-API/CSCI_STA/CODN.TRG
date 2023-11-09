
PROMPT Creating Trigger Logic for Table 'CODE_NOTATION'
PROMPT Creating Before Insert Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BIS_CODE_NOTATION
BEFORE INSERT ON CODE_NOTATION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CODE_NOTATION.cg$table.DELETE;
    cg$CODE_NOTATION.cg$tableind.DELETE;
    cg$CODE_NOTATION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BIR_CODE_NOTATION
BEFORE INSERT ON CODE_NOTATION FOR EACH ROW
DECLARE
    cg$rec cg$CODE_NOTATION.cg$row_type;
    cg$ind cg$CODE_NOTATION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODN_ID := :new.CODN_ID;
    cg$ind.CODN_ID := TRUE;
    cg$rec.NO_BAREME := :new.NO_BAREME;
    cg$ind.NO_BAREME := TRUE;
    cg$rec.CODE_NOTE := :new.CODE_NOTE;
    cg$ind.CODE_NOTE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.VALEUR_NOTE := :new.VALEUR_NOTE;
    cg$ind.VALEUR_NOTE := TRUE;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTIF := FALSE;

    if not (cg$CODE_NOTATION.called_from_package) then
        cg$CODE_NOTATION.validate_arc(cg$rec);
        cg$CODE_NOTATION.validate_domain(cg$rec);

        cg$CODE_NOTATION.ins(cg$rec, cg$ind, FALSE);
        cg$CODE_NOTATION.called_from_package := FALSE;
    end if;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).CODN_ID := cg$rec.CODN_ID;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).CODN_ID := cg$ind.CODN_ID;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).NO_BAREME := cg$rec.NO_BAREME;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).NO_BAREME := cg$ind.NO_BAREME;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).CODE_NOTE := cg$rec.CODE_NOTE;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).CODE_NOTE := cg$ind.CODE_NOTE;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).VALEUR_NOTE := cg$rec.VALEUR_NOTE;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).VALEUR_NOTE := cg$ind.VALEUR_NOTE;

    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).DESCRIPTIF := cg$rec.DESCRIPTIF;
    cg$CODE_NOTATION.cg$tableind(cg$CODE_NOTATION.idx).DESCRIPTIF := cg$ind.DESCRIPTIF;

    cg$CODE_NOTATION.idx := cg$CODE_NOTATION.idx + 1;

    :new.CODN_ID := cg$rec.CODN_ID;
    :new.NO_BAREME := cg$rec.NO_BAREME;
    :new.CODE_NOTE := cg$rec.CODE_NOTE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.VALEUR_NOTE := cg$rec.VALEUR_NOTE;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_CODE_NOTATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CODE_NOTATION
AFTER INSERT ON CODE_NOTATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CODE_NOTATION
/

PROMPT Creating After Insert Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$AIS_CODE_NOTATION
AFTER INSERT ON CODE_NOTATION
DECLARE
    idx      BINARY_INTEGER := cg$CODE_NOTATION.cg$table.FIRST;
    cg$rec   cg$CODE_NOTATION.cg$row_type;
    cg$old_rec   cg$CODE_NOTATION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CODE_NOTATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODN_ID := cg$CODE_NOTATION.cg$table(idx).CODN_ID;
            cg$rec.NO_BAREME := cg$CODE_NOTATION.cg$table(idx).NO_BAREME;
            cg$rec.CODE_NOTE := cg$CODE_NOTATION.cg$table(idx).CODE_NOTE;
            cg$rec.DESIGNATION := cg$CODE_NOTATION.cg$table(idx).DESIGNATION;
            cg$rec.VALEUR_NOTE := cg$CODE_NOTATION.cg$table(idx).VALEUR_NOTE;
            cg$rec.DESCRIPTIF := cg$CODE_NOTATION.cg$table(idx).DESCRIPTIF;

            cg$CODE_NOTATION.validate_foreign_keys_ins(cg$rec);

            cg$CODE_NOTATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CODE_NOTATION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$CODE_NOTATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BUS_CODE_NOTATION
BEFORE UPDATE ON CODE_NOTATION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CODE_NOTATION.cg$table.DELETE;
    cg$CODE_NOTATION.cg$tableind.DELETE;
    cg$CODE_NOTATION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BUR_CODE_NOTATION
BEFORE UPDATE ON CODE_NOTATION FOR EACH ROW
DECLARE
    cg$rec     cg$CODE_NOTATION.cg$row_type;
    cg$ind     cg$CODE_NOTATION.cg$ind_type;
    cg$old_rec cg$CODE_NOTATION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODN_ID := :new.CODN_ID;
    cg$ind.CODN_ID :=    (:new.CODN_ID IS NULL AND :old.CODN_ID IS NOT NULL )
                        OR (:new.CODN_ID IS NOT NULL AND :old.CODN_ID IS NULL)
                        OR NOT(:new.CODN_ID = :old.CODN_ID) ;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).CODN_ID := :old.CODN_ID;
    cg$rec.NO_BAREME := :new.NO_BAREME;
    cg$ind.NO_BAREME :=    (:new.NO_BAREME IS NULL AND :old.NO_BAREME IS NOT NULL )
                        OR (:new.NO_BAREME IS NOT NULL AND :old.NO_BAREME IS NULL)
                        OR NOT(:new.NO_BAREME = :old.NO_BAREME) ;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).NO_BAREME := :old.NO_BAREME;
    cg$rec.CODE_NOTE := :new.CODE_NOTE;
    cg$ind.CODE_NOTE :=    (:new.CODE_NOTE IS NULL AND :old.CODE_NOTE IS NOT NULL )
                        OR (:new.CODE_NOTE IS NOT NULL AND :old.CODE_NOTE IS NULL)
                        OR NOT(:new.CODE_NOTE = :old.CODE_NOTE) ;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).CODE_NOTE := :old.CODE_NOTE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.VALEUR_NOTE := :new.VALEUR_NOTE;
    cg$ind.VALEUR_NOTE :=    (:new.VALEUR_NOTE IS NULL AND :old.VALEUR_NOTE IS NOT NULL )
                        OR (:new.VALEUR_NOTE IS NOT NULL AND :old.VALEUR_NOTE IS NULL)
                        OR NOT(:new.VALEUR_NOTE = :old.VALEUR_NOTE) ;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).VALEUR_NOTE := :old.VALEUR_NOTE;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTIF := FALSE;


    cg$CODE_NOTATION.idx := cg$CODE_NOTATION.idx + 1;

    if not (cg$CODE_NOTATION.called_from_package) then
        cg$CODE_NOTATION.validate_arc(cg$rec);
        cg$CODE_NOTATION.validate_domain(cg$rec, cg$ind);
        cg$CODE_NOTATION.validate_domain_cascade_update(cg$old_rec);   

        cg$CODE_NOTATION.upd(cg$rec, cg$ind, FALSE);
        cg$CODE_NOTATION.called_from_package := FALSE;
    end if;

    :new.NO_BAREME := cg$rec.NO_BAREME;
    :new.CODE_NOTE := cg$rec.CODE_NOTE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.VALEUR_NOTE := cg$rec.VALEUR_NOTE;
    -- Warning: Column DESCRIPTIF is of type LONG and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_CODE_NOTATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CODE_NOTATION
AFTER UPDATE ON CODE_NOTATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CODE_NOTATION
/






PROMPT Creating After Update Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$AUS_CODE_NOTATION
AFTER UPDATE ON CODE_NOTATION
DECLARE
    idx        BINARY_INTEGER := cg$CODE_NOTATION.cg$table.FIRST;
    cg$old_rec cg$CODE_NOTATION.cg$row_type;
    cg$rec     cg$CODE_NOTATION.cg$row_type;
    cg$ind     cg$CODE_NOTATION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.CODN_ID := cg$CODE_NOTATION.cg$table(idx).CODN_ID;
        cg$old_rec.NO_BAREME := cg$CODE_NOTATION.cg$table(idx).NO_BAREME;
        cg$old_rec.CODE_NOTE := cg$CODE_NOTATION.cg$table(idx).CODE_NOTE;
        cg$old_rec.DESIGNATION := cg$CODE_NOTATION.cg$table(idx).DESIGNATION;
        cg$old_rec.VALEUR_NOTE := cg$CODE_NOTATION.cg$table(idx).VALEUR_NOTE;
        cg$old_rec.DESCRIPTIF := cg$CODE_NOTATION.cg$table(idx).DESCRIPTIF;

    IF NOT (cg$CODE_NOTATION.called_from_package) THEN
        idx := cg$CODE_NOTATION.cg$table.NEXT(idx);
        cg$rec.CODN_ID := cg$CODE_NOTATION.cg$table(idx).CODN_ID;
        cg$ind.CODN_ID := updating('CODN_ID');
        cg$rec.NO_BAREME := cg$CODE_NOTATION.cg$table(idx).NO_BAREME;
        cg$ind.NO_BAREME := updating('NO_BAREME');
        cg$rec.CODE_NOTE := cg$CODE_NOTATION.cg$table(idx).CODE_NOTE;
        cg$ind.CODE_NOTE := updating('CODE_NOTE');
        cg$rec.DESIGNATION := cg$CODE_NOTATION.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.VALEUR_NOTE := cg$CODE_NOTATION.cg$table(idx).VALEUR_NOTE;
        cg$ind.VALEUR_NOTE := updating('VALEUR_NOTE');
        cg$rec.DESCRIPTIF := cg$CODE_NOTATION.cg$table(idx).DESCRIPTIF;
        cg$ind.DESCRIPTIF := updating('DESCRIPTIF');

        cg$CODE_NOTATION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$CODE_NOTATION.upd_denorm2( cg$rec,
                                       cg$CODE_NOTATION.cg$tableind(idx)
                                     );
        cg$CODE_NOTATION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$CODE_NOTATION.cg$tableind(idx)
								                  );
        cg$CODE_NOTATION.cascade_update(cg$rec, cg$old_rec);
        cg$CODE_NOTATION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$CODE_NOTATION.called_from_package := FALSE;
	END IF;
        idx := cg$CODE_NOTATION.cg$table.NEXT(idx);
    END LOOP;

    cg$CODE_NOTATION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BDS_CODE_NOTATION
BEFORE DELETE ON CODE_NOTATION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CODE_NOTATION.cg$table.DELETE;
    cg$CODE_NOTATION.cg$tableind.DELETE;
    cg$CODE_NOTATION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$BDR_CODE_NOTATION
BEFORE DELETE ON CODE_NOTATION FOR EACH ROW
DECLARE
    cg$pk cg$CODE_NOTATION.cg$pk_type;
    cg$rec cg$CODE_NOTATION.cg$row_type;
    cg$ind cg$CODE_NOTATION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CODN_ID  := :old.CODN_ID;
    cg$rec.CODN_ID := :old.CODN_ID;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).CODN_ID := :old.CODN_ID;
    cg$rec.NO_BAREME := :old.NO_BAREME;
    cg$CODE_NOTATION.cg$table(cg$CODE_NOTATION.idx).NO_BAREME := :old.NO_BAREME;


    cg$CODE_NOTATION.idx := cg$CODE_NOTATION.idx + 1;

    if not (cg$CODE_NOTATION.called_from_package) then
        cg$CODE_NOTATION.validate_domain_cascade_delete(cg$rec);   
        cg$CODE_NOTATION.del(cg$pk, FALSE);
        cg$CODE_NOTATION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CODE_NOTATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CODE_NOTATION
AFTER DELETE ON CODE_NOTATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CODE_NOTATION
/

PROMPT Creating After Delete Statement Trigger on 'CODE_NOTATION'
CREATE OR REPLACE TRIGGER cg$ADS_CODE_NOTATION
AFTER DELETE ON CODE_NOTATION
DECLARE
    idx        BINARY_INTEGER := cg$CODE_NOTATION.cg$table.FIRST;
    cg$rec   cg$CODE_NOTATION.cg$row_type;
    cg$old_rec   cg$CODE_NOTATION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CODE_NOTATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODN_ID := cg$CODE_NOTATION.cg$table(idx).CODN_ID;
            cg$CODE_NOTATION.cg$tableind(idx).CODN_ID := TRUE;
            cg$rec.NO_BAREME := cg$CODE_NOTATION.cg$table(idx).NO_BAREME;
            cg$CODE_NOTATION.cg$tableind(idx).NO_BAREME := TRUE;
            cg$rec.CODE_NOTE := cg$CODE_NOTATION.cg$table(idx).CODE_NOTE;
            cg$CODE_NOTATION.cg$tableind(idx).CODE_NOTE := TRUE;
            cg$rec.DESIGNATION := cg$CODE_NOTATION.cg$table(idx).DESIGNATION;
            cg$CODE_NOTATION.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.VALEUR_NOTE := cg$CODE_NOTATION.cg$table(idx).VALEUR_NOTE;
            cg$CODE_NOTATION.cg$tableind(idx).VALEUR_NOTE := TRUE;
            cg$rec.DESCRIPTIF := cg$CODE_NOTATION.cg$table(idx).DESCRIPTIF;
            cg$CODE_NOTATION.cg$tableind(idx).DESCRIPTIF := TRUE;

            cg$CODE_NOTATION.validate_foreign_keys_del(cg$rec);
            cg$CODE_NOTATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CODE_NOTATION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$CODE_NOTATION.cascade_delete(cg$rec);
            cg$CODE_NOTATION.domain_cascade_delete(cg$rec);             

            idx := cg$CODE_NOTATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



