
PROMPT Creating Trigger Logic for Table 'RECUEIL_INDIVIDUEL_COMPETENCE'
PROMPT Creating Before Insert Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIS_RECUEIL_INDIVIDUEL_COMP
BEFORE INSERT ON RECUEIL_INDIVIDUEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BIR_RECUEIL_INDIVIDUEL_COMP
BEFORE INSERT ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$ind cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_RIC := :new.ID_RIC;
    cg$ind.ID_RIC := TRUE;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.NO_DEMANDE_RIC := :new.NO_DEMANDE_RIC;
    cg$ind.NO_DEMANDE_RIC := TRUE;
    cg$rec.NUMERO_RIC := :new.NUMERO_RIC;
    cg$ind.NUMERO_RIC := TRUE;
    cg$rec.DATE_PHOTOGRAPHIE := :new.DATE_PHOTOGRAPHIE;
    cg$ind.DATE_PHOTOGRAPHIE := TRUE;
    cg$rec.TYPE_RIC := :new.TYPE_RIC;
    cg$ind.TYPE_RIC := TRUE;
    cg$rec.LIBELLE_RIC := :new.LIBELLE_RIC;
    cg$ind.LIBELLE_RIC := TRUE;
    -- Warning: Column AUTRE_COMPETENCE is of type CLOB and not allowed in triggers
	cg$ind.AUTRE_COMPETENCE := FALSE;

    if not (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) then
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_arc(cg$rec);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_domain(cg$rec);

        cg$RECUEIL_INDIVIDUEL_COMPETEN.ins(cg$rec, cg$ind, FALSE);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package := FALSE;
    end if;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_RIC := cg$rec.ID_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_RIC := cg$ind.ID_RIC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_SPC := cg$rec.ID_SPC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_SPC := cg$ind.ID_SPC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NO_DEMANDE_RIC := cg$rec.NO_DEMANDE_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NO_DEMANDE_RIC := cg$ind.NO_DEMANDE_RIC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NUMERO_RIC := cg$rec.NUMERO_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NUMERO_RIC := cg$ind.NUMERO_RIC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).DATE_PHOTOGRAPHIE := cg$rec.DATE_PHOTOGRAPHIE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).DATE_PHOTOGRAPHIE := cg$ind.DATE_PHOTOGRAPHIE;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).TYPE_RIC := cg$rec.TYPE_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).TYPE_RIC := cg$ind.TYPE_RIC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).LIBELLE_RIC := cg$rec.LIBELLE_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).LIBELLE_RIC := cg$ind.LIBELLE_RIC;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).AUTRE_COMPETENCE := cg$rec.AUTRE_COMPETENCE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).AUTRE_COMPETENCE := cg$ind.AUTRE_COMPETENCE;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.idx + 1;

    :new.ID_RIC := cg$rec.ID_RIC;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.NO_DEMANDE_RIC := cg$rec.NO_DEMANDE_RIC;
    :new.NUMERO_RIC := cg$rec.NUMERO_RIC;
    :new.DATE_PHOTOGRAPHIE := cg$rec.DATE_PHOTOGRAPHIE;
    :new.TYPE_RIC := cg$rec.TYPE_RIC;
    :new.LIBELLE_RIC := cg$rec.LIBELLE_RIC;
    -- Warning: Column AUTRE_COMPETENCE is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_RECUEIL_INDIVIDUEL_COMP, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_RECUEIL_INDIVIDUEL_COMP
AFTER INSERT ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_RECUEIL_INDIVIDUEL_COMP
/

PROMPT Creating After Insert Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AIS_RECUEIL_INDIVIDUEL_COMP
AFTER INSERT ON RECUEIL_INDIVIDUEL_COMPETENCE
DECLARE
    idx      BINARY_INTEGER := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.FIRST;
    cg$rec   cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$old_rec   cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_RIC;
            cg$rec.ID_SPC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_SPC;
            cg$rec.NO_DEMANDE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NO_DEMANDE_RIC;
            cg$rec.NUMERO_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NUMERO_RIC;
            cg$rec.DATE_PHOTOGRAPHIE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).DATE_PHOTOGRAPHIE;
            cg$rec.TYPE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).TYPE_RIC;
            cg$rec.LIBELLE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).LIBELLE_RIC;
            cg$rec.AUTRE_COMPETENCE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).AUTRE_COMPETENCE;

            cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_foreign_keys_ins(cg$rec);

            cg$RECUEIL_INDIVIDUEL_COMPETEN.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUS_RECUEIL_INDIVIDUEL_COMP
BEFORE UPDATE ON RECUEIL_INDIVIDUEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BUR_RECUEIL_INDIVIDUEL_COMP
BEFORE UPDATE ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$rec     cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$ind     cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$ind_type;
    cg$old_rec cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_RIC := :new.ID_RIC;
    cg$ind.ID_RIC :=    (:new.ID_RIC IS NULL AND :old.ID_RIC IS NOT NULL )
                        OR (:new.ID_RIC IS NOT NULL AND :old.ID_RIC IS NULL)
                        OR NOT(:new.ID_RIC = :old.ID_RIC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_RIC := :old.ID_RIC;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_SPC := :old.ID_SPC;
    cg$rec.NO_DEMANDE_RIC := :new.NO_DEMANDE_RIC;
    cg$ind.NO_DEMANDE_RIC :=    (:new.NO_DEMANDE_RIC IS NULL AND :old.NO_DEMANDE_RIC IS NOT NULL )
                        OR (:new.NO_DEMANDE_RIC IS NOT NULL AND :old.NO_DEMANDE_RIC IS NULL)
                        OR NOT(:new.NO_DEMANDE_RIC = :old.NO_DEMANDE_RIC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NO_DEMANDE_RIC := :old.NO_DEMANDE_RIC;
    cg$rec.NUMERO_RIC := :new.NUMERO_RIC;
    cg$ind.NUMERO_RIC :=    (:new.NUMERO_RIC IS NULL AND :old.NUMERO_RIC IS NOT NULL )
                        OR (:new.NUMERO_RIC IS NOT NULL AND :old.NUMERO_RIC IS NULL)
                        OR NOT(:new.NUMERO_RIC = :old.NUMERO_RIC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NUMERO_RIC := :old.NUMERO_RIC;
    cg$rec.DATE_PHOTOGRAPHIE := :new.DATE_PHOTOGRAPHIE;
    cg$ind.DATE_PHOTOGRAPHIE :=    (:new.DATE_PHOTOGRAPHIE IS NULL AND :old.DATE_PHOTOGRAPHIE IS NOT NULL )
                        OR (:new.DATE_PHOTOGRAPHIE IS NOT NULL AND :old.DATE_PHOTOGRAPHIE IS NULL)
                        OR NOT(:new.DATE_PHOTOGRAPHIE = :old.DATE_PHOTOGRAPHIE) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).DATE_PHOTOGRAPHIE := :old.DATE_PHOTOGRAPHIE;
    cg$rec.TYPE_RIC := :new.TYPE_RIC;
    cg$ind.TYPE_RIC :=    (:new.TYPE_RIC IS NULL AND :old.TYPE_RIC IS NOT NULL )
                        OR (:new.TYPE_RIC IS NOT NULL AND :old.TYPE_RIC IS NULL)
                        OR NOT(:new.TYPE_RIC = :old.TYPE_RIC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).TYPE_RIC := :old.TYPE_RIC;
    cg$rec.LIBELLE_RIC := :new.LIBELLE_RIC;
    cg$ind.LIBELLE_RIC :=    (:new.LIBELLE_RIC IS NULL AND :old.LIBELLE_RIC IS NOT NULL )
                        OR (:new.LIBELLE_RIC IS NOT NULL AND :old.LIBELLE_RIC IS NULL)
                        OR NOT(:new.LIBELLE_RIC = :old.LIBELLE_RIC) ;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).LIBELLE_RIC := :old.LIBELLE_RIC;
    -- Warning: Column AUTRE_COMPETENCE is of type CLOB and not allowed in triggers
	cg$ind.AUTRE_COMPETENCE := FALSE;


    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.idx + 1;

    if not (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) then
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_arc(cg$rec);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_domain(cg$rec, cg$ind);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_domain_cascade_update(cg$old_rec);   

        cg$RECUEIL_INDIVIDUEL_COMPETEN.upd(cg$rec, cg$ind, FALSE);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package := FALSE;
    end if;

    :new.ID_SPC := cg$rec.ID_SPC;
    :new.NO_DEMANDE_RIC := cg$rec.NO_DEMANDE_RIC;
    :new.NUMERO_RIC := cg$rec.NUMERO_RIC;
    :new.DATE_PHOTOGRAPHIE := cg$rec.DATE_PHOTOGRAPHIE;
    :new.TYPE_RIC := cg$rec.TYPE_RIC;
    :new.LIBELLE_RIC := cg$rec.LIBELLE_RIC;
    -- Warning: Column AUTRE_COMPETENCE is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_RECUEIL_INDIVIDUEL_COMP, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_RECUEIL_INDIVIDUEL_COMP
AFTER UPDATE ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_RECUEIL_INDIVIDUEL_COMP
/






PROMPT Creating After Update Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$AUS_RECUEIL_INDIVIDUEL_COMP
AFTER UPDATE ON RECUEIL_INDIVIDUEL_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.FIRST;
    cg$old_rec cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$rec     cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$ind     cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_RIC;
        cg$old_rec.ID_SPC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_SPC;
        cg$old_rec.NO_DEMANDE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NO_DEMANDE_RIC;
        cg$old_rec.NUMERO_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NUMERO_RIC;
        cg$old_rec.DATE_PHOTOGRAPHIE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).DATE_PHOTOGRAPHIE;
        cg$old_rec.TYPE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).TYPE_RIC;
        cg$old_rec.LIBELLE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).LIBELLE_RIC;
        cg$old_rec.AUTRE_COMPETENCE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).AUTRE_COMPETENCE;

    IF NOT (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) THEN
        idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.NEXT(idx);
        cg$rec.ID_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_RIC;
        cg$ind.ID_RIC := updating('ID_RIC');
        cg$rec.ID_SPC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.NO_DEMANDE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NO_DEMANDE_RIC;
        cg$ind.NO_DEMANDE_RIC := updating('NO_DEMANDE_RIC');
        cg$rec.NUMERO_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NUMERO_RIC;
        cg$ind.NUMERO_RIC := updating('NUMERO_RIC');
        cg$rec.DATE_PHOTOGRAPHIE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).DATE_PHOTOGRAPHIE;
        cg$ind.DATE_PHOTOGRAPHIE := updating('DATE_PHOTOGRAPHIE');
        cg$rec.TYPE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).TYPE_RIC;
        cg$ind.TYPE_RIC := updating('TYPE_RIC');
        cg$rec.LIBELLE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).LIBELLE_RIC;
        cg$ind.LIBELLE_RIC := updating('LIBELLE_RIC');
        cg$rec.AUTRE_COMPETENCE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).AUTRE_COMPETENCE;
        cg$ind.AUTRE_COMPETENCE := updating('AUTRE_COMPETENCE');

        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$RECUEIL_INDIVIDUEL_COMPETEN.upd_denorm2( cg$rec,
                                       cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx)
                                     );
        cg$RECUEIL_INDIVIDUEL_COMPETEN.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx)
								                  );
        cg$RECUEIL_INDIVIDUEL_COMPETEN.cascade_update(cg$rec, cg$old_rec);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package := FALSE;
	END IF;
        idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.NEXT(idx);
    END LOOP;

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDS_RECUEIL_INDIVIDUEL_COMP
BEFORE DELETE ON RECUEIL_INDIVIDUEL_COMPETENCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind.DELETE;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$BDR_RECUEIL_INDIVIDUEL_COMP
BEFORE DELETE ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
DECLARE
    cg$pk cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$pk_type;
    cg$rec cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$ind cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_RIC  := :old.ID_RIC;
    cg$rec.ID_RIC := :old.ID_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_RIC := :old.ID_RIC;
    cg$rec.NO_DEMANDE_RIC := :old.NO_DEMANDE_RIC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).NO_DEMANDE_RIC := :old.NO_DEMANDE_RIC;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(cg$RECUEIL_INDIVIDUEL_COMPETEN.idx).ID_SPC := :old.ID_SPC;


    cg$RECUEIL_INDIVIDUEL_COMPETEN.idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.idx + 1;

    if not (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) then
        cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_domain_cascade_delete(cg$rec);   
        cg$RECUEIL_INDIVIDUEL_COMPETEN.del(cg$pk, FALSE);
        cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_RECUEIL_INDIVIDUEL_COMP, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_RECUEIL_INDIVIDUEL_COMP
AFTER DELETE ON RECUEIL_INDIVIDUEL_COMPETENCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_RECUEIL_INDIVIDUEL_COMP
/

PROMPT Creating After Delete Statement Trigger on 'RECUEIL_INDIVIDUEL_COMPETENCE'
CREATE OR REPLACE TRIGGER cg$ADS_RECUEIL_INDIVIDUEL_COMP
AFTER DELETE ON RECUEIL_INDIVIDUEL_COMPETENCE
DECLARE
    idx        BINARY_INTEGER := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.FIRST;
    cg$rec   cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
    cg$old_rec   cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$RECUEIL_INDIVIDUEL_COMPETEN.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_RIC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).ID_RIC := TRUE;
            cg$rec.ID_SPC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).ID_SPC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.NO_DEMANDE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NO_DEMANDE_RIC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).NO_DEMANDE_RIC := TRUE;
            cg$rec.NUMERO_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).NUMERO_RIC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).NUMERO_RIC := TRUE;
            cg$rec.DATE_PHOTOGRAPHIE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).DATE_PHOTOGRAPHIE;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).DATE_PHOTOGRAPHIE := TRUE;
            cg$rec.TYPE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).TYPE_RIC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).TYPE_RIC := TRUE;
            cg$rec.LIBELLE_RIC := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).LIBELLE_RIC;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).LIBELLE_RIC := TRUE;
            cg$rec.AUTRE_COMPETENCE := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table(idx).AUTRE_COMPETENCE;
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx).AUTRE_COMPETENCE := TRUE;

            cg$RECUEIL_INDIVIDUEL_COMPETEN.validate_foreign_keys_del(cg$rec);
            cg$RECUEIL_INDIVIDUEL_COMPETEN.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$RECUEIL_INDIVIDUEL_COMPETEN.cascade_delete(cg$rec);
            cg$RECUEIL_INDIVIDUEL_COMPETEN.domain_cascade_delete(cg$rec);             

            idx := cg$RECUEIL_INDIVIDUEL_COMPETEN.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



