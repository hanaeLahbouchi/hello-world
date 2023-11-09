
PROMPT Creating Trigger Logic for Table 'VFAS'
PROMPT Creating Before Insert Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BIS_VFAS
BEFORE INSERT ON VFAS
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$VFAS.cg$table.DELETE;
    cg$VFAS.cg$tableind.DELETE;
    cg$VFAS.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BIR_VFAS
BEFORE INSERT ON VFAS FOR EACH ROW
DECLARE
    cg$rec cg$VFAS.cg$row_type;
    cg$ind cg$VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS := TRUE;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS := TRUE;
    cg$rec.NO_REVISION := :new.NO_REVISION;
    cg$ind.NO_REVISION := TRUE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION := TRUE;
    cg$rec.DATE_MODIFICATION := :new.DATE_MODIFICATION;
    cg$ind.DATE_MODIFICATION := TRUE;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION_TEXTUELLE := FALSE;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
	cg$ind.AUTRES_RES_PEDA := FALSE;
    cg$rec.CHARGE_PREV := :new.CHARGE_PREV;
    cg$ind.CHARGE_PREV := TRUE;
    cg$rec.NB_ETU_PREV := :new.NB_ETU_PREV;
    cg$ind.NB_ETU_PREV := TRUE;

    if not (cg$VFAS.called_from_package) then
        cg$VFAS.validate_arc(cg$rec);
        cg$VFAS.validate_domain(cg$rec);

        cg$VFAS.ins(cg$rec, cg$ind, FALSE);
        cg$VFAS.called_from_package := FALSE;
    end if;

    cg$VFAS.cg$table(cg$VFAS.idx).NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    cg$VFAS.cg$tableind(cg$VFAS.idx).NO_VERSION_VFAS := cg$ind.NO_VERSION_VFAS;

    cg$VFAS.cg$table(cg$VFAS.idx).ID_FAS := cg$rec.ID_FAS;
    cg$VFAS.cg$tableind(cg$VFAS.idx).ID_FAS := cg$ind.ID_FAS;

    cg$VFAS.cg$table(cg$VFAS.idx).NO_REVISION := cg$rec.NO_REVISION;
    cg$VFAS.cg$tableind(cg$VFAS.idx).NO_REVISION := cg$ind.NO_REVISION;

    cg$VFAS.cg$table(cg$VFAS.idx).DATE_CREATION := cg$rec.DATE_CREATION;
    cg$VFAS.cg$tableind(cg$VFAS.idx).DATE_CREATION := cg$ind.DATE_CREATION;

    cg$VFAS.cg$table(cg$VFAS.idx).DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    cg$VFAS.cg$tableind(cg$VFAS.idx).DATE_MODIFICATION := cg$ind.DATE_MODIFICATION;

    cg$VFAS.cg$table(cg$VFAS.idx).DESCRIPTION_TEXTUELLE := cg$rec.DESCRIPTION_TEXTUELLE;
    cg$VFAS.cg$tableind(cg$VFAS.idx).DESCRIPTION_TEXTUELLE := cg$ind.DESCRIPTION_TEXTUELLE;

    cg$VFAS.cg$table(cg$VFAS.idx).AUTRES_RES_PEDA := cg$rec.AUTRES_RES_PEDA;
    cg$VFAS.cg$tableind(cg$VFAS.idx).AUTRES_RES_PEDA := cg$ind.AUTRES_RES_PEDA;

    cg$VFAS.cg$table(cg$VFAS.idx).CHARGE_PREV := cg$rec.CHARGE_PREV;
    cg$VFAS.cg$tableind(cg$VFAS.idx).CHARGE_PREV := cg$ind.CHARGE_PREV;

    cg$VFAS.cg$table(cg$VFAS.idx).NB_ETU_PREV := cg$rec.NB_ETU_PREV;
    cg$VFAS.cg$tableind(cg$VFAS.idx).NB_ETU_PREV := cg$ind.NB_ETU_PREV;

    cg$VFAS.idx := cg$VFAS.idx + 1;

    :new.NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    :new.ID_FAS := cg$rec.ID_FAS;
    :new.NO_REVISION := cg$rec.NO_REVISION;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
    :new.CHARGE_PREV := cg$rec.CHARGE_PREV;
    :new.NB_ETU_PREV := cg$rec.NB_ETU_PREV;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_VFAS
AFTER INSERT ON VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_VFAS
/

PROMPT Creating After Insert Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$AIS_VFAS
AFTER INSERT ON VFAS
DECLARE
    idx      BINARY_INTEGER := cg$VFAS.cg$table.FIRST;
    cg$rec   cg$VFAS.cg$row_type;
    cg$old_rec   cg$VFAS.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$VFAS.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_VERSION_VFAS := cg$VFAS.cg$table(idx).NO_VERSION_VFAS;
            cg$rec.ID_FAS := cg$VFAS.cg$table(idx).ID_FAS;
            cg$rec.NO_REVISION := cg$VFAS.cg$table(idx).NO_REVISION;
            cg$rec.DATE_CREATION := cg$VFAS.cg$table(idx).DATE_CREATION;
            cg$rec.DATE_MODIFICATION := cg$VFAS.cg$table(idx).DATE_MODIFICATION;
            cg$rec.DESCRIPTION_TEXTUELLE := cg$VFAS.cg$table(idx).DESCRIPTION_TEXTUELLE;
            cg$rec.AUTRES_RES_PEDA := cg$VFAS.cg$table(idx).AUTRES_RES_PEDA;
            cg$rec.CHARGE_PREV := cg$VFAS.cg$table(idx).CHARGE_PREV;
            cg$rec.NB_ETU_PREV := cg$VFAS.cg$table(idx).NB_ETU_PREV;

            cg$VFAS.validate_foreign_keys_ins(cg$rec);

            cg$VFAS.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VFAS.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$VFAS.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BUS_VFAS
BEFORE UPDATE ON VFAS
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$VFAS.cg$table.DELETE;
    cg$VFAS.cg$tableind.DELETE;
    cg$VFAS.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BUR_VFAS
BEFORE UPDATE ON VFAS FOR EACH ROW
DECLARE
    cg$rec     cg$VFAS.cg$row_type;
    cg$ind     cg$VFAS.cg$ind_type;
    cg$old_rec cg$VFAS.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS :=    (:new.NO_VERSION_VFAS IS NULL AND :old.NO_VERSION_VFAS IS NOT NULL )
                        OR (:new.NO_VERSION_VFAS IS NOT NULL AND :old.NO_VERSION_VFAS IS NULL)
                        OR NOT(:new.NO_VERSION_VFAS = :old.NO_VERSION_VFAS) ;
    cg$VFAS.cg$table(cg$VFAS.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS :=    (:new.ID_FAS IS NULL AND :old.ID_FAS IS NOT NULL )
                        OR (:new.ID_FAS IS NOT NULL AND :old.ID_FAS IS NULL)
                        OR NOT(:new.ID_FAS = :old.ID_FAS) ;
    cg$VFAS.cg$table(cg$VFAS.idx).ID_FAS := :old.ID_FAS;
    cg$rec.NO_REVISION := :new.NO_REVISION;
    cg$ind.NO_REVISION :=    (:new.NO_REVISION IS NULL AND :old.NO_REVISION IS NOT NULL )
                        OR (:new.NO_REVISION IS NOT NULL AND :old.NO_REVISION IS NULL)
                        OR NOT(:new.NO_REVISION = :old.NO_REVISION) ;
    cg$VFAS.cg$table(cg$VFAS.idx).NO_REVISION := :old.NO_REVISION;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$VFAS.cg$table(cg$VFAS.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.DATE_MODIFICATION := :new.DATE_MODIFICATION;
    cg$ind.DATE_MODIFICATION :=    (:new.DATE_MODIFICATION IS NULL AND :old.DATE_MODIFICATION IS NOT NULL )
                        OR (:new.DATE_MODIFICATION IS NOT NULL AND :old.DATE_MODIFICATION IS NULL)
                        OR NOT(:new.DATE_MODIFICATION = :old.DATE_MODIFICATION) ;
    cg$VFAS.cg$table(cg$VFAS.idx).DATE_MODIFICATION := :old.DATE_MODIFICATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION_TEXTUELLE := FALSE;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
	cg$ind.AUTRES_RES_PEDA := FALSE;
    cg$rec.CHARGE_PREV := :new.CHARGE_PREV;
    cg$ind.CHARGE_PREV :=    (:new.CHARGE_PREV IS NULL AND :old.CHARGE_PREV IS NOT NULL )
                        OR (:new.CHARGE_PREV IS NOT NULL AND :old.CHARGE_PREV IS NULL)
                        OR NOT(:new.CHARGE_PREV = :old.CHARGE_PREV) ;
    cg$VFAS.cg$table(cg$VFAS.idx).CHARGE_PREV := :old.CHARGE_PREV;
    cg$rec.NB_ETU_PREV := :new.NB_ETU_PREV;
    cg$ind.NB_ETU_PREV :=    (:new.NB_ETU_PREV IS NULL AND :old.NB_ETU_PREV IS NOT NULL )
                        OR (:new.NB_ETU_PREV IS NOT NULL AND :old.NB_ETU_PREV IS NULL)
                        OR NOT(:new.NB_ETU_PREV = :old.NB_ETU_PREV) ;
    cg$VFAS.cg$table(cg$VFAS.idx).NB_ETU_PREV := :old.NB_ETU_PREV;


    cg$VFAS.idx := cg$VFAS.idx + 1;

    if not (cg$VFAS.called_from_package) then
        cg$VFAS.validate_arc(cg$rec);
        cg$VFAS.validate_domain(cg$rec, cg$ind);
        cg$VFAS.validate_domain_cascade_update(cg$old_rec);   

        cg$VFAS.upd(cg$rec, cg$ind, FALSE);
        cg$VFAS.called_from_package := FALSE;
    end if;

    :new.NO_REVISION := cg$rec.NO_REVISION;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
    :new.CHARGE_PREV := cg$rec.CHARGE_PREV;
    :new.NB_ETU_PREV := cg$rec.NB_ETU_PREV;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_VFAS
AFTER UPDATE ON VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_VFAS
/






PROMPT Creating After Update Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$AUS_VFAS
AFTER UPDATE ON VFAS
DECLARE
    idx        BINARY_INTEGER := cg$VFAS.cg$table.FIRST;
    cg$old_rec cg$VFAS.cg$row_type;
    cg$rec     cg$VFAS.cg$row_type;
    cg$ind     cg$VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_VERSION_VFAS := cg$VFAS.cg$table(idx).NO_VERSION_VFAS;
        cg$old_rec.ID_FAS := cg$VFAS.cg$table(idx).ID_FAS;
        cg$old_rec.NO_REVISION := cg$VFAS.cg$table(idx).NO_REVISION;
        cg$old_rec.DATE_CREATION := cg$VFAS.cg$table(idx).DATE_CREATION;
        cg$old_rec.DATE_MODIFICATION := cg$VFAS.cg$table(idx).DATE_MODIFICATION;
        cg$old_rec.DESCRIPTION_TEXTUELLE := cg$VFAS.cg$table(idx).DESCRIPTION_TEXTUELLE;
        cg$old_rec.AUTRES_RES_PEDA := cg$VFAS.cg$table(idx).AUTRES_RES_PEDA;
        cg$old_rec.CHARGE_PREV := cg$VFAS.cg$table(idx).CHARGE_PREV;
        cg$old_rec.NB_ETU_PREV := cg$VFAS.cg$table(idx).NB_ETU_PREV;

    IF NOT (cg$VFAS.called_from_package) THEN
        idx := cg$VFAS.cg$table.NEXT(idx);
        cg$rec.NO_VERSION_VFAS := cg$VFAS.cg$table(idx).NO_VERSION_VFAS;
        cg$ind.NO_VERSION_VFAS := updating('NO_VERSION_VFAS');
        cg$rec.ID_FAS := cg$VFAS.cg$table(idx).ID_FAS;
        cg$ind.ID_FAS := updating('ID_FAS');
        cg$rec.NO_REVISION := cg$VFAS.cg$table(idx).NO_REVISION;
        cg$ind.NO_REVISION := updating('NO_REVISION');
        cg$rec.DATE_CREATION := cg$VFAS.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.DATE_MODIFICATION := cg$VFAS.cg$table(idx).DATE_MODIFICATION;
        cg$ind.DATE_MODIFICATION := updating('DATE_MODIFICATION');
        cg$rec.DESCRIPTION_TEXTUELLE := cg$VFAS.cg$table(idx).DESCRIPTION_TEXTUELLE;
        cg$ind.DESCRIPTION_TEXTUELLE := updating('DESCRIPTION_TEXTUELLE');
        cg$rec.AUTRES_RES_PEDA := cg$VFAS.cg$table(idx).AUTRES_RES_PEDA;
        cg$ind.AUTRES_RES_PEDA := updating('AUTRES_RES_PEDA');
        cg$rec.CHARGE_PREV := cg$VFAS.cg$table(idx).CHARGE_PREV;
        cg$ind.CHARGE_PREV := updating('CHARGE_PREV');
        cg$rec.NB_ETU_PREV := cg$VFAS.cg$table(idx).NB_ETU_PREV;
        cg$ind.NB_ETU_PREV := updating('NB_ETU_PREV');

        cg$VFAS.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$VFAS.upd_denorm2( cg$rec,
                                       cg$VFAS.cg$tableind(idx)
                                     );
        cg$VFAS.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$VFAS.cg$tableind(idx)
								                  );
        cg$VFAS.cascade_update(cg$rec, cg$old_rec);
        cg$VFAS.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$VFAS.called_from_package := FALSE;
	END IF;
        idx := cg$VFAS.cg$table.NEXT(idx);
    END LOOP;

    cg$VFAS.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BDS_VFAS
BEFORE DELETE ON VFAS
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$VFAS.cg$table.DELETE;
    cg$VFAS.cg$tableind.DELETE;
    cg$VFAS.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$BDR_VFAS
BEFORE DELETE ON VFAS FOR EACH ROW
DECLARE
    cg$pk cg$VFAS.cg$pk_type;
    cg$rec cg$VFAS.cg$row_type;
    cg$ind cg$VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_VERSION_VFAS  := :old.NO_VERSION_VFAS;
    cg$rec.NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$VFAS.cg$table(cg$VFAS.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$pk.ID_FAS  := :old.ID_FAS;
    cg$rec.ID_FAS := :old.ID_FAS;
    cg$VFAS.cg$table(cg$VFAS.idx).ID_FAS := :old.ID_FAS;
    cg$rec.ID_FAS := :old.ID_FAS;
    cg$VFAS.cg$table(cg$VFAS.idx).ID_FAS := :old.ID_FAS;


    cg$VFAS.idx := cg$VFAS.idx + 1;

    if not (cg$VFAS.called_from_package) then
        cg$VFAS.validate_domain_cascade_delete(cg$rec);   
        cg$VFAS.del(cg$pk, FALSE);
        cg$VFAS.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_VFAS
AFTER DELETE ON VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_VFAS
/

PROMPT Creating After Delete Statement Trigger on 'VFAS'
CREATE OR REPLACE TRIGGER cg$ADS_VFAS
AFTER DELETE ON VFAS
DECLARE
    idx        BINARY_INTEGER := cg$VFAS.cg$table.FIRST;
    cg$rec   cg$VFAS.cg$row_type;
    cg$old_rec   cg$VFAS.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$VFAS.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_VERSION_VFAS := cg$VFAS.cg$table(idx).NO_VERSION_VFAS;
            cg$VFAS.cg$tableind(idx).NO_VERSION_VFAS := TRUE;
            cg$rec.ID_FAS := cg$VFAS.cg$table(idx).ID_FAS;
            cg$VFAS.cg$tableind(idx).ID_FAS := TRUE;
            cg$rec.NO_REVISION := cg$VFAS.cg$table(idx).NO_REVISION;
            cg$VFAS.cg$tableind(idx).NO_REVISION := TRUE;
            cg$rec.DATE_CREATION := cg$VFAS.cg$table(idx).DATE_CREATION;
            cg$VFAS.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.DATE_MODIFICATION := cg$VFAS.cg$table(idx).DATE_MODIFICATION;
            cg$VFAS.cg$tableind(idx).DATE_MODIFICATION := TRUE;
            cg$rec.DESCRIPTION_TEXTUELLE := cg$VFAS.cg$table(idx).DESCRIPTION_TEXTUELLE;
            cg$VFAS.cg$tableind(idx).DESCRIPTION_TEXTUELLE := TRUE;
            cg$rec.AUTRES_RES_PEDA := cg$VFAS.cg$table(idx).AUTRES_RES_PEDA;
            cg$VFAS.cg$tableind(idx).AUTRES_RES_PEDA := TRUE;
            cg$rec.CHARGE_PREV := cg$VFAS.cg$table(idx).CHARGE_PREV;
            cg$VFAS.cg$tableind(idx).CHARGE_PREV := TRUE;
            cg$rec.NB_ETU_PREV := cg$VFAS.cg$table(idx).NB_ETU_PREV;
            cg$VFAS.cg$tableind(idx).NB_ETU_PREV := TRUE;

            cg$VFAS.validate_foreign_keys_del(cg$rec);
            cg$VFAS.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VFAS.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$VFAS.cascade_delete(cg$rec);
            cg$VFAS.domain_cascade_delete(cg$rec);             

            idx := cg$VFAS.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



