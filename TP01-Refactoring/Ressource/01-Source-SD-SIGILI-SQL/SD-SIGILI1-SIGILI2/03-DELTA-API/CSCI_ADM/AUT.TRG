
PROMPT Creating Trigger Logic for Table 'AUTHENTIFICATION'
PROMPT Creating Before Insert Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$BIS_AUTHENTIFICATION
BEFORE INSERT ON AUTHENTIFICATION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AUTHENTIFICATION.cg$table.DELETE;
    cg$AUTHENTIFICATION.cg$tableind.DELETE;
    cg$AUTHENTIFICATION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AUTHENTIFICATION'
create or replace TRIGGER CG$BIR_AUTHENTIFICATION BEFORE INSERT ON AUTHENTIFICATION 
FOR EACH ROW 
DECLARE
    cg$rec cg$AUTHENTIFICATION.cg$row_type;
    cg$ind cg$AUTHENTIFICATION.cg$ind_type;
    v_ref char(1);
    ex_ent_n_ref EXCEPTION;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.LOGIN := :new.LOGIN;
    cg$ind.LOGIN := TRUE;
    cg$rec.PASSWORD := :new.PASSWORD;
    cg$ind.PASSWORD := TRUE;
    cg$rec.TYPE_AUTHENTIFICATION := :new.TYPE_AUTHENTIFICATION;
    cg$ind.TYPE_AUTHENTIFICATION := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE := TRUE;

    if not (cg$AUTHENTIFICATION.called_from_package) then
        cg$AUTHENTIFICATION.validate_arc(cg$rec);
        cg$AUTHENTIFICATION.validate_domain(cg$rec);

        cg$AUTHENTIFICATION.ins(cg$rec, cg$ind, FALSE);
        cg$AUTHENTIFICATION.called_from_package := FALSE;
    end if;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).LOGIN := cg$rec.LOGIN;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).LOGIN := cg$ind.LOGIN;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).PASSWORD := cg$rec.PASSWORD;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).PASSWORD := cg$ind.PASSWORD;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).TYPE_AUTHENTIFICATION := cg$rec.TYPE_AUTHENTIFICATION;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).TYPE_AUTHENTIFICATION := cg$ind.TYPE_AUTHENTIFICATION;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    cg$AUTHENTIFICATION.cg$tableind(cg$AUTHENTIFICATION.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;

    cg$AUTHENTIFICATION.idx := cg$AUTHENTIFICATION.idx + 1;
    
    IF :new.TYPE_AUTHENTIFICATION = 'ENT' THEN
      SELECT referencee into v_ref from ENTREPRISE WHERE no_entreprise = :new.NO_ENTREPRISE;
      IF v_ref = 'N' THEN
        raise ex_ent_n_ref;
      END IF;
    END IF;
    :new.LOGIN := cg$rec.LOGIN;
    :new.PASSWORD := cg$rec.PASSWORD;
    :new.TYPE_AUTHENTIFICATION := cg$rec.TYPE_AUTHENTIFICATION;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;

EXCEPTION
  WHEN ex_ent_n_ref THEN
      raise_application_error(-20003 , 'Entreprise n est pas référencée et ne peut donc pas avoir d authentification');
END;
/

-- No application logic defined for Trigger cg$AIR_AUTHENTIFICATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AUTHENTIFICATION
AFTER INSERT ON AUTHENTIFICATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AUTHENTIFICATION
/

PROMPT Creating After Insert Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$AIS_AUTHENTIFICATION
AFTER INSERT ON AUTHENTIFICATION
DECLARE
    idx      BINARY_INTEGER := cg$AUTHENTIFICATION.cg$table.FIRST;
    cg$rec   cg$AUTHENTIFICATION.cg$row_type;
    cg$old_rec   cg$AUTHENTIFICATION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AUTHENTIFICATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.LOGIN := cg$AUTHENTIFICATION.cg$table(idx).LOGIN;
            cg$rec.PASSWORD := cg$AUTHENTIFICATION.cg$table(idx).PASSWORD;
            cg$rec.TYPE_AUTHENTIFICATION := cg$AUTHENTIFICATION.cg$table(idx).TYPE_AUTHENTIFICATION;
            cg$rec.NO_ETUDIANT_NAT := cg$AUTHENTIFICATION.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NO_ENSEIGNANT := cg$AUTHENTIFICATION.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.NO_ENTREPRISE := cg$AUTHENTIFICATION.cg$table(idx).NO_ENTREPRISE;

            cg$AUTHENTIFICATION.validate_foreign_keys_ins(cg$rec);

            cg$AUTHENTIFICATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AUTHENTIFICATION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AUTHENTIFICATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$BUS_AUTHENTIFICATION
BEFORE UPDATE ON AUTHENTIFICATION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AUTHENTIFICATION.cg$table.DELETE;
    cg$AUTHENTIFICATION.cg$tableind.DELETE;
    cg$AUTHENTIFICATION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$BUR_AUTHENTIFICATION
BEFORE UPDATE ON AUTHENTIFICATION FOR EACH ROW
DECLARE
    cg$rec     cg$AUTHENTIFICATION.cg$row_type;
    cg$ind     cg$AUTHENTIFICATION.cg$ind_type;
    cg$old_rec cg$AUTHENTIFICATION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.LOGIN := :new.LOGIN;
    cg$ind.LOGIN :=    (:new.LOGIN IS NULL AND :old.LOGIN IS NOT NULL )
                        OR (:new.LOGIN IS NOT NULL AND :old.LOGIN IS NULL)
                        OR NOT(:new.LOGIN = :old.LOGIN) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).LOGIN := :old.LOGIN;
    cg$rec.PASSWORD := :new.PASSWORD;
    cg$ind.PASSWORD :=    (:new.PASSWORD IS NULL AND :old.PASSWORD IS NOT NULL )
                        OR (:new.PASSWORD IS NOT NULL AND :old.PASSWORD IS NULL)
                        OR NOT(:new.PASSWORD = :old.PASSWORD) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).PASSWORD := :old.PASSWORD;
    cg$rec.TYPE_AUTHENTIFICATION := :new.TYPE_AUTHENTIFICATION;
    cg$ind.TYPE_AUTHENTIFICATION :=    (:new.TYPE_AUTHENTIFICATION IS NULL AND :old.TYPE_AUTHENTIFICATION IS NOT NULL )
                        OR (:new.TYPE_AUTHENTIFICATION IS NOT NULL AND :old.TYPE_AUTHENTIFICATION IS NULL)
                        OR NOT(:new.TYPE_AUTHENTIFICATION = :old.TYPE_AUTHENTIFICATION) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).TYPE_AUTHENTIFICATION := :old.TYPE_AUTHENTIFICATION;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;


    cg$AUTHENTIFICATION.idx := cg$AUTHENTIFICATION.idx + 1;

    if not (cg$AUTHENTIFICATION.called_from_package) then
        cg$AUTHENTIFICATION.validate_arc(cg$rec);
        cg$AUTHENTIFICATION.validate_domain(cg$rec, cg$ind);
        cg$AUTHENTIFICATION.validate_domain_cascade_update(cg$old_rec);   

        cg$AUTHENTIFICATION.upd(cg$rec, cg$ind, FALSE);
        cg$AUTHENTIFICATION.called_from_package := FALSE;
    end if;

    :new.PASSWORD := cg$rec.PASSWORD;
    :new.TYPE_AUTHENTIFICATION := cg$rec.TYPE_AUTHENTIFICATION;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AUTHENTIFICATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AUTHENTIFICATION
AFTER UPDATE ON AUTHENTIFICATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AUTHENTIFICATION
/






PROMPT Creating After Update Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$AUS_AUTHENTIFICATION
AFTER UPDATE ON AUTHENTIFICATION
DECLARE
    idx        BINARY_INTEGER := cg$AUTHENTIFICATION.cg$table.FIRST;
    cg$old_rec cg$AUTHENTIFICATION.cg$row_type;
    cg$rec     cg$AUTHENTIFICATION.cg$row_type;
    cg$ind     cg$AUTHENTIFICATION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.LOGIN := cg$AUTHENTIFICATION.cg$table(idx).LOGIN;
        cg$old_rec.PASSWORD := cg$AUTHENTIFICATION.cg$table(idx).PASSWORD;
        cg$old_rec.TYPE_AUTHENTIFICATION := cg$AUTHENTIFICATION.cg$table(idx).TYPE_AUTHENTIFICATION;
        cg$old_rec.NO_ETUDIANT_NAT := cg$AUTHENTIFICATION.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NO_ENSEIGNANT := cg$AUTHENTIFICATION.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.NO_ENTREPRISE := cg$AUTHENTIFICATION.cg$table(idx).NO_ENTREPRISE;

    IF NOT (cg$AUTHENTIFICATION.called_from_package) THEN
        idx := cg$AUTHENTIFICATION.cg$table.NEXT(idx);
        cg$rec.LOGIN := cg$AUTHENTIFICATION.cg$table(idx).LOGIN;
        cg$ind.LOGIN := updating('LOGIN');
        cg$rec.PASSWORD := cg$AUTHENTIFICATION.cg$table(idx).PASSWORD;
        cg$ind.PASSWORD := updating('PASSWORD');
        cg$rec.TYPE_AUTHENTIFICATION := cg$AUTHENTIFICATION.cg$table(idx).TYPE_AUTHENTIFICATION;
        cg$ind.TYPE_AUTHENTIFICATION := updating('TYPE_AUTHENTIFICATION');
        cg$rec.NO_ETUDIANT_NAT := cg$AUTHENTIFICATION.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NO_ENSEIGNANT := cg$AUTHENTIFICATION.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.NO_ENTREPRISE := cg$AUTHENTIFICATION.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');

        cg$AUTHENTIFICATION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AUTHENTIFICATION.upd_denorm2( cg$rec,
                                       cg$AUTHENTIFICATION.cg$tableind(idx)
                                     );
        cg$AUTHENTIFICATION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AUTHENTIFICATION.cg$tableind(idx)
								                  );
        cg$AUTHENTIFICATION.cascade_update(cg$rec, cg$old_rec);
        cg$AUTHENTIFICATION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AUTHENTIFICATION.called_from_package := FALSE;
	END IF;
        idx := cg$AUTHENTIFICATION.cg$table.NEXT(idx);
    END LOOP;

    cg$AUTHENTIFICATION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$BDS_AUTHENTIFICATION
BEFORE DELETE ON AUTHENTIFICATION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AUTHENTIFICATION.cg$table.DELETE;
    cg$AUTHENTIFICATION.cg$tableind.DELETE;
    cg$AUTHENTIFICATION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$BDR_AUTHENTIFICATION
BEFORE DELETE ON AUTHENTIFICATION FOR EACH ROW
DECLARE
    cg$pk cg$AUTHENTIFICATION.cg$pk_type;
    cg$rec cg$AUTHENTIFICATION.cg$row_type;
    cg$ind cg$AUTHENTIFICATION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.LOGIN  := :old.LOGIN;
    cg$rec.LOGIN := :old.LOGIN;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).LOGIN := :old.LOGIN;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$AUTHENTIFICATION.cg$table(cg$AUTHENTIFICATION.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;


    cg$AUTHENTIFICATION.idx := cg$AUTHENTIFICATION.idx + 1;

    if not (cg$AUTHENTIFICATION.called_from_package) then
        cg$AUTHENTIFICATION.validate_domain_cascade_delete(cg$rec);   
        cg$AUTHENTIFICATION.del(cg$pk, FALSE);
        cg$AUTHENTIFICATION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AUTHENTIFICATION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AUTHENTIFICATION
AFTER DELETE ON AUTHENTIFICATION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AUTHENTIFICATION
/

PROMPT Creating After Delete Statement Trigger on 'AUTHENTIFICATION'
CREATE OR REPLACE TRIGGER cg$ADS_AUTHENTIFICATION
AFTER DELETE ON AUTHENTIFICATION
DECLARE
    idx        BINARY_INTEGER := cg$AUTHENTIFICATION.cg$table.FIRST;
    cg$rec   cg$AUTHENTIFICATION.cg$row_type;
    cg$old_rec   cg$AUTHENTIFICATION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AUTHENTIFICATION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.LOGIN := cg$AUTHENTIFICATION.cg$table(idx).LOGIN;
            cg$AUTHENTIFICATION.cg$tableind(idx).LOGIN := TRUE;
            cg$rec.PASSWORD := cg$AUTHENTIFICATION.cg$table(idx).PASSWORD;
            cg$AUTHENTIFICATION.cg$tableind(idx).PASSWORD := TRUE;
            cg$rec.TYPE_AUTHENTIFICATION := cg$AUTHENTIFICATION.cg$table(idx).TYPE_AUTHENTIFICATION;
            cg$AUTHENTIFICATION.cg$tableind(idx).TYPE_AUTHENTIFICATION := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$AUTHENTIFICATION.cg$table(idx).NO_ETUDIANT_NAT;
            cg$AUTHENTIFICATION.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NO_ENSEIGNANT := cg$AUTHENTIFICATION.cg$table(idx).NO_ENSEIGNANT;
            cg$AUTHENTIFICATION.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.NO_ENTREPRISE := cg$AUTHENTIFICATION.cg$table(idx).NO_ENTREPRISE;
            cg$AUTHENTIFICATION.cg$tableind(idx).NO_ENTREPRISE := TRUE;

            cg$AUTHENTIFICATION.validate_foreign_keys_del(cg$rec);
            cg$AUTHENTIFICATION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AUTHENTIFICATION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AUTHENTIFICATION.cascade_delete(cg$rec);
            cg$AUTHENTIFICATION.domain_cascade_delete(cg$rec);             

            idx := cg$AUTHENTIFICATION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



