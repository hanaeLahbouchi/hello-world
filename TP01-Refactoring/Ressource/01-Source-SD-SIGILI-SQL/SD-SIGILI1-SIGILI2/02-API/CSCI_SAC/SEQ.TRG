
PROMPT Creating Trigger Logic for Table 'SEQUENCE'
PROMPT Creating Before Insert Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BIS_SEQUENCE
BEFORE INSERT ON SEQUENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$SEQUENCE.cg$table.DELETE;
    cg$SEQUENCE.cg$tableind.DELETE;
    cg$SEQUENCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BIR_SEQUENCE
BEFORE INSERT ON SEQUENCE FOR EACH ROW
DECLARE
    cg$rec cg$SEQUENCE.cg$row_type;
    cg$ind cg$SEQUENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM := TRUE;
    cg$rec.NO_SEQUENCE := :new.NO_SEQUENCE;
    cg$ind.NO_SEQUENCE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.DEBUT := :new.DEBUT;
    cg$ind.DEBUT := TRUE;
    cg$rec.FIN := :new.FIN;
    cg$ind.FIN := TRUE;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE := TRUE;
    cg$rec.DESCRIPTIF := :new.DESCRIPTIF;
    cg$ind.DESCRIPTIF := TRUE;
    cg$rec.MAD := :new.MAD;
    cg$ind.MAD := TRUE;

    if not (cg$SEQUENCE.called_from_package) then
        cg$SEQUENCE.validate_arc(cg$rec);
        cg$SEQUENCE.validate_domain(cg$rec);

        cg$SEQUENCE.ins(cg$rec, cg$ind, FALSE);
        cg$SEQUENCE.called_from_package := FALSE;
    end if;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).CODE_COM := cg$rec.CODE_COM;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).CODE_COM := cg$ind.CODE_COM;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).NO_SEQUENCE := cg$ind.NO_SEQUENCE;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DEBUT := cg$rec.DEBUT;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).DEBUT := cg$ind.DEBUT;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).FIN := cg$rec.FIN;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).FIN := cg$ind.FIN;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DUREE := cg$rec.DUREE;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).DUREE := cg$ind.DUREE;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DESCRIPTIF := cg$rec.DESCRIPTIF;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).DESCRIPTIF := cg$ind.DESCRIPTIF;

    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).MAD := cg$rec.MAD;
    cg$SEQUENCE.cg$tableind(cg$SEQUENCE.idx).MAD := cg$ind.MAD;

    cg$SEQUENCE.idx := cg$SEQUENCE.idx + 1;

    :new.CODE_COM := cg$rec.CODE_COM;
    :new.NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.DEBUT := cg$rec.DEBUT;
    :new.FIN := cg$rec.FIN;
    :new.DUREE := cg$rec.DUREE;
    :new.DESCRIPTIF := cg$rec.DESCRIPTIF;
    :new.MAD := cg$rec.MAD;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_SEQUENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_SEQUENCE
AFTER INSERT ON SEQUENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_SEQUENCE
/

PROMPT Creating After Insert Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$AIS_SEQUENCE
AFTER INSERT ON SEQUENCE
DECLARE
    idx      BINARY_INTEGER := cg$SEQUENCE.cg$table.FIRST;
    cg$rec   cg$SEQUENCE.cg$row_type;
    cg$old_rec   cg$SEQUENCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$SEQUENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_COM := cg$SEQUENCE.cg$table(idx).CODE_COM;
            cg$rec.NO_SEQUENCE := cg$SEQUENCE.cg$table(idx).NO_SEQUENCE;
            cg$rec.DESIGNATION := cg$SEQUENCE.cg$table(idx).DESIGNATION;
            cg$rec.DEBUT := cg$SEQUENCE.cg$table(idx).DEBUT;
            cg$rec.FIN := cg$SEQUENCE.cg$table(idx).FIN;
            cg$rec.DUREE := cg$SEQUENCE.cg$table(idx).DUREE;
            cg$rec.DESCRIPTIF := cg$SEQUENCE.cg$table(idx).DESCRIPTIF;
            cg$rec.MAD := cg$SEQUENCE.cg$table(idx).MAD;

            cg$SEQUENCE.validate_foreign_keys_ins(cg$rec);

            cg$SEQUENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SEQUENCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$SEQUENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BUS_SEQUENCE
BEFORE UPDATE ON SEQUENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$SEQUENCE.cg$table.DELETE;
    cg$SEQUENCE.cg$tableind.DELETE;
    cg$SEQUENCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BUR_SEQUENCE
BEFORE UPDATE ON SEQUENCE FOR EACH ROW
DECLARE
    cg$rec     cg$SEQUENCE.cg$row_type;
    cg$ind     cg$SEQUENCE.cg$ind_type;
    cg$old_rec cg$SEQUENCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM :=    (:new.CODE_COM IS NULL AND :old.CODE_COM IS NOT NULL )
                        OR (:new.CODE_COM IS NOT NULL AND :old.CODE_COM IS NULL)
                        OR NOT(:new.CODE_COM = :old.CODE_COM) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).CODE_COM := :old.CODE_COM;
    cg$rec.NO_SEQUENCE := :new.NO_SEQUENCE;
    cg$ind.NO_SEQUENCE :=    (:new.NO_SEQUENCE IS NULL AND :old.NO_SEQUENCE IS NOT NULL )
                        OR (:new.NO_SEQUENCE IS NOT NULL AND :old.NO_SEQUENCE IS NULL)
                        OR NOT(:new.NO_SEQUENCE = :old.NO_SEQUENCE) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.DEBUT := :new.DEBUT;
    cg$ind.DEBUT :=    (:new.DEBUT IS NULL AND :old.DEBUT IS NOT NULL )
                        OR (:new.DEBUT IS NOT NULL AND :old.DEBUT IS NULL)
                        OR NOT(:new.DEBUT = :old.DEBUT) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DEBUT := :old.DEBUT;
    cg$rec.FIN := :new.FIN;
    cg$ind.FIN :=    (:new.FIN IS NULL AND :old.FIN IS NOT NULL )
                        OR (:new.FIN IS NOT NULL AND :old.FIN IS NULL)
                        OR NOT(:new.FIN = :old.FIN) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).FIN := :old.FIN;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE :=    (:new.DUREE IS NULL AND :old.DUREE IS NOT NULL )
                        OR (:new.DUREE IS NOT NULL AND :old.DUREE IS NULL)
                        OR NOT(:new.DUREE = :old.DUREE) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DUREE := :old.DUREE;
    cg$rec.DESCRIPTIF := :new.DESCRIPTIF;
    cg$ind.DESCRIPTIF :=    (:new.DESCRIPTIF IS NULL AND :old.DESCRIPTIF IS NOT NULL )
                        OR (:new.DESCRIPTIF IS NOT NULL AND :old.DESCRIPTIF IS NULL)
                        OR NOT(:new.DESCRIPTIF = :old.DESCRIPTIF) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).DESCRIPTIF := :old.DESCRIPTIF;
    cg$rec.MAD := :new.MAD;
    cg$ind.MAD :=    (:new.MAD IS NULL AND :old.MAD IS NOT NULL )
                        OR (:new.MAD IS NOT NULL AND :old.MAD IS NULL)
                        OR NOT(:new.MAD = :old.MAD) ;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).MAD := :old.MAD;


    cg$SEQUENCE.idx := cg$SEQUENCE.idx + 1;

    if not (cg$SEQUENCE.called_from_package) then
        cg$SEQUENCE.validate_arc(cg$rec);
        cg$SEQUENCE.validate_domain(cg$rec, cg$ind);
        cg$SEQUENCE.validate_domain_cascade_update(cg$old_rec);   

        cg$SEQUENCE.upd(cg$rec, cg$ind, FALSE);
        cg$SEQUENCE.called_from_package := FALSE;
    end if;

    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.DEBUT := cg$rec.DEBUT;
    :new.FIN := cg$rec.FIN;
    :new.DUREE := cg$rec.DUREE;
    :new.DESCRIPTIF := cg$rec.DESCRIPTIF;
    :new.MAD := cg$rec.MAD;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_SEQUENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_SEQUENCE
AFTER UPDATE ON SEQUENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_SEQUENCE
/






PROMPT Creating After Update Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$AUS_SEQUENCE
AFTER UPDATE ON SEQUENCE
DECLARE
    idx        BINARY_INTEGER := cg$SEQUENCE.cg$table.FIRST;
    cg$old_rec cg$SEQUENCE.cg$row_type;
    cg$rec     cg$SEQUENCE.cg$row_type;
    cg$ind     cg$SEQUENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.CODE_COM := cg$SEQUENCE.cg$table(idx).CODE_COM;
        cg$old_rec.NO_SEQUENCE := cg$SEQUENCE.cg$table(idx).NO_SEQUENCE;
        cg$old_rec.DESIGNATION := cg$SEQUENCE.cg$table(idx).DESIGNATION;
        cg$old_rec.DEBUT := cg$SEQUENCE.cg$table(idx).DEBUT;
        cg$old_rec.FIN := cg$SEQUENCE.cg$table(idx).FIN;
        cg$old_rec.DUREE := cg$SEQUENCE.cg$table(idx).DUREE;
        cg$old_rec.DESCRIPTIF := cg$SEQUENCE.cg$table(idx).DESCRIPTIF;
        cg$old_rec.MAD := cg$SEQUENCE.cg$table(idx).MAD;

    IF NOT (cg$SEQUENCE.called_from_package) THEN
        idx := cg$SEQUENCE.cg$table.NEXT(idx);
        cg$rec.CODE_COM := cg$SEQUENCE.cg$table(idx).CODE_COM;
        cg$ind.CODE_COM := updating('CODE_COM');
        cg$rec.NO_SEQUENCE := cg$SEQUENCE.cg$table(idx).NO_SEQUENCE;
        cg$ind.NO_SEQUENCE := updating('NO_SEQUENCE');
        cg$rec.DESIGNATION := cg$SEQUENCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.DEBUT := cg$SEQUENCE.cg$table(idx).DEBUT;
        cg$ind.DEBUT := updating('DEBUT');
        cg$rec.FIN := cg$SEQUENCE.cg$table(idx).FIN;
        cg$ind.FIN := updating('FIN');
        cg$rec.DUREE := cg$SEQUENCE.cg$table(idx).DUREE;
        cg$ind.DUREE := updating('DUREE');
        cg$rec.DESCRIPTIF := cg$SEQUENCE.cg$table(idx).DESCRIPTIF;
        cg$ind.DESCRIPTIF := updating('DESCRIPTIF');
        cg$rec.MAD := cg$SEQUENCE.cg$table(idx).MAD;
        cg$ind.MAD := updating('MAD');

        cg$SEQUENCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$SEQUENCE.upd_denorm2( cg$rec,
                                       cg$SEQUENCE.cg$tableind(idx)
                                     );
        cg$SEQUENCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$SEQUENCE.cg$tableind(idx)
								                  );
        cg$SEQUENCE.cascade_update(cg$rec, cg$old_rec);
        cg$SEQUENCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$SEQUENCE.called_from_package := FALSE;
	END IF;
        idx := cg$SEQUENCE.cg$table.NEXT(idx);
    END LOOP;

    cg$SEQUENCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BDS_SEQUENCE
BEFORE DELETE ON SEQUENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$SEQUENCE.cg$table.DELETE;
    cg$SEQUENCE.cg$tableind.DELETE;
    cg$SEQUENCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$BDR_SEQUENCE
BEFORE DELETE ON SEQUENCE FOR EACH ROW
DECLARE
    cg$pk cg$SEQUENCE.cg$pk_type;
    cg$rec cg$SEQUENCE.cg$row_type;
    cg$ind cg$SEQUENCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_SEQUENCE  := :old.NO_SEQUENCE;
    cg$rec.NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$pk.CODE_COM  := :old.CODE_COM;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).CODE_COM := :old.CODE_COM;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$SEQUENCE.cg$table(cg$SEQUENCE.idx).CODE_COM := :old.CODE_COM;


    cg$SEQUENCE.idx := cg$SEQUENCE.idx + 1;

    if not (cg$SEQUENCE.called_from_package) then
        cg$SEQUENCE.validate_domain_cascade_delete(cg$rec);   
        cg$SEQUENCE.del(cg$pk, FALSE);
        cg$SEQUENCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_SEQUENCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_SEQUENCE
AFTER DELETE ON SEQUENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_SEQUENCE
/

PROMPT Creating After Delete Statement Trigger on 'SEQUENCE'
CREATE OR REPLACE TRIGGER cg$ADS_SEQUENCE
AFTER DELETE ON SEQUENCE
DECLARE
    idx        BINARY_INTEGER := cg$SEQUENCE.cg$table.FIRST;
    cg$rec   cg$SEQUENCE.cg$row_type;
    cg$old_rec   cg$SEQUENCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$SEQUENCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_COM := cg$SEQUENCE.cg$table(idx).CODE_COM;
            cg$SEQUENCE.cg$tableind(idx).CODE_COM := TRUE;
            cg$rec.NO_SEQUENCE := cg$SEQUENCE.cg$table(idx).NO_SEQUENCE;
            cg$SEQUENCE.cg$tableind(idx).NO_SEQUENCE := TRUE;
            cg$rec.DESIGNATION := cg$SEQUENCE.cg$table(idx).DESIGNATION;
            cg$SEQUENCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.DEBUT := cg$SEQUENCE.cg$table(idx).DEBUT;
            cg$SEQUENCE.cg$tableind(idx).DEBUT := TRUE;
            cg$rec.FIN := cg$SEQUENCE.cg$table(idx).FIN;
            cg$SEQUENCE.cg$tableind(idx).FIN := TRUE;
            cg$rec.DUREE := cg$SEQUENCE.cg$table(idx).DUREE;
            cg$SEQUENCE.cg$tableind(idx).DUREE := TRUE;
            cg$rec.DESCRIPTIF := cg$SEQUENCE.cg$table(idx).DESCRIPTIF;
            cg$SEQUENCE.cg$tableind(idx).DESCRIPTIF := TRUE;
            cg$rec.MAD := cg$SEQUENCE.cg$table(idx).MAD;
            cg$SEQUENCE.cg$tableind(idx).MAD := TRUE;

            cg$SEQUENCE.validate_foreign_keys_del(cg$rec);
            cg$SEQUENCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$SEQUENCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$SEQUENCE.cascade_delete(cg$rec);
            cg$SEQUENCE.domain_cascade_delete(cg$rec);             

            idx := cg$SEQUENCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



