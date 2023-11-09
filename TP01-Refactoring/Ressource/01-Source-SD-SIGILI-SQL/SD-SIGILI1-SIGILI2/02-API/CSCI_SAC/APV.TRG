
PROMPT Creating Trigger Logic for Table 'AFFECTATION_PDT_VFAS'
PROMPT Creating Before Insert Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BIS_AFFECTATION_PDT_VFAS
BEFORE INSERT ON AFFECTATION_PDT_VFAS
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AFFECTATION_PDT_VFAS.cg$table.DELETE;
    cg$AFFECTATION_PDT_VFAS.cg$tableind.DELETE;
    cg$AFFECTATION_PDT_VFAS.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BIR_AFFECTATION_PDT_VFAS
BEFORE INSERT ON AFFECTATION_PDT_VFAS FOR EACH ROW
DECLARE
    cg$rec cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$ind cg$AFFECTATION_PDT_VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_PDT := :new.ID_PDT;
    cg$ind.ID_PDT := TRUE;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS := TRUE;
    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS := TRUE;
    cg$rec.VERSION := :new.VERSION;
    cg$ind.VERSION := TRUE;

    if not (cg$AFFECTATION_PDT_VFAS.called_from_package) then
        cg$AFFECTATION_PDT_VFAS.validate_arc(cg$rec);
        cg$AFFECTATION_PDT_VFAS.validate_domain(cg$rec);

        cg$AFFECTATION_PDT_VFAS.ins(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_PDT_VFAS.called_from_package := FALSE;
    end if;

    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_PDT := cg$rec.ID_PDT;
    cg$AFFECTATION_PDT_VFAS.cg$tableind(cg$AFFECTATION_PDT_VFAS.idx).ID_PDT := cg$ind.ID_PDT;

    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_FAS := cg$rec.ID_FAS;
    cg$AFFECTATION_PDT_VFAS.cg$tableind(cg$AFFECTATION_PDT_VFAS.idx).ID_FAS := cg$ind.ID_FAS;

    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    cg$AFFECTATION_PDT_VFAS.cg$tableind(cg$AFFECTATION_PDT_VFAS.idx).NO_VERSION_VFAS := cg$ind.NO_VERSION_VFAS;

    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).VERSION := cg$rec.VERSION;
    cg$AFFECTATION_PDT_VFAS.cg$tableind(cg$AFFECTATION_PDT_VFAS.idx).VERSION := cg$ind.VERSION;

    cg$AFFECTATION_PDT_VFAS.idx := cg$AFFECTATION_PDT_VFAS.idx + 1;

    :new.ID_PDT := cg$rec.ID_PDT;
    :new.ID_FAS := cg$rec.ID_FAS;
    :new.NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    :new.VERSION := cg$rec.VERSION;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_AFFECTATION_PDT_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AFFECTATION_PDT_VFAS
AFTER INSERT ON AFFECTATION_PDT_VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AFFECTATION_PDT_VFAS
/

PROMPT Creating After Insert Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$AIS_AFFECTATION_PDT_VFAS
AFTER INSERT ON AFFECTATION_PDT_VFAS
DECLARE
    idx      BINARY_INTEGER := cg$AFFECTATION_PDT_VFAS.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$old_rec   cg$AFFECTATION_PDT_VFAS.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AFFECTATION_PDT_VFAS.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_PDT := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_PDT;
            cg$rec.ID_FAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_FAS;
            cg$rec.NO_VERSION_VFAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).NO_VERSION_VFAS;
            cg$rec.VERSION := cg$AFFECTATION_PDT_VFAS.cg$table(idx).VERSION;

            cg$AFFECTATION_PDT_VFAS.validate_foreign_keys_ins(cg$rec);

            cg$AFFECTATION_PDT_VFAS.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_PDT_VFAS.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AFFECTATION_PDT_VFAS.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BUS_AFFECTATION_PDT_VFAS
BEFORE UPDATE ON AFFECTATION_PDT_VFAS
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AFFECTATION_PDT_VFAS.cg$table.DELETE;
    cg$AFFECTATION_PDT_VFAS.cg$tableind.DELETE;
    cg$AFFECTATION_PDT_VFAS.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BUR_AFFECTATION_PDT_VFAS
BEFORE UPDATE ON AFFECTATION_PDT_VFAS FOR EACH ROW
DECLARE
    cg$rec     cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$ind     cg$AFFECTATION_PDT_VFAS.cg$ind_type;
    cg$old_rec cg$AFFECTATION_PDT_VFAS.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_PDT := :new.ID_PDT;
    cg$ind.ID_PDT :=    (:new.ID_PDT IS NULL AND :old.ID_PDT IS NOT NULL )
                        OR (:new.ID_PDT IS NOT NULL AND :old.ID_PDT IS NULL)
                        OR NOT(:new.ID_PDT = :old.ID_PDT) ;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_PDT := :old.ID_PDT;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS :=    (:new.ID_FAS IS NULL AND :old.ID_FAS IS NOT NULL )
                        OR (:new.ID_FAS IS NOT NULL AND :old.ID_FAS IS NULL)
                        OR NOT(:new.ID_FAS = :old.ID_FAS) ;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_FAS := :old.ID_FAS;
    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS :=    (:new.NO_VERSION_VFAS IS NULL AND :old.NO_VERSION_VFAS IS NOT NULL )
                        OR (:new.NO_VERSION_VFAS IS NOT NULL AND :old.NO_VERSION_VFAS IS NULL)
                        OR NOT(:new.NO_VERSION_VFAS = :old.NO_VERSION_VFAS) ;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$rec.VERSION := :new.VERSION;
    cg$ind.VERSION :=    (:new.VERSION IS NULL AND :old.VERSION IS NOT NULL )
                        OR (:new.VERSION IS NOT NULL AND :old.VERSION IS NULL)
                        OR NOT(:new.VERSION = :old.VERSION) ;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).VERSION := :old.VERSION;


    cg$AFFECTATION_PDT_VFAS.idx := cg$AFFECTATION_PDT_VFAS.idx + 1;

    if not (cg$AFFECTATION_PDT_VFAS.called_from_package) then
        cg$AFFECTATION_PDT_VFAS.validate_arc(cg$rec);
        cg$AFFECTATION_PDT_VFAS.validate_domain(cg$rec, cg$ind);
        cg$AFFECTATION_PDT_VFAS.validate_domain_cascade_update(cg$old_rec);   

        cg$AFFECTATION_PDT_VFAS.upd(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_PDT_VFAS.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AFFECTATION_PDT_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AFFECTATION_PDT_VFAS
AFTER UPDATE ON AFFECTATION_PDT_VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AFFECTATION_PDT_VFAS
/






PROMPT Creating After Update Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$AUS_AFFECTATION_PDT_VFAS
AFTER UPDATE ON AFFECTATION_PDT_VFAS
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_PDT_VFAS.cg$table.FIRST;
    cg$old_rec cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$rec     cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$ind     cg$AFFECTATION_PDT_VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_PDT := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_PDT;
        cg$old_rec.ID_FAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_FAS;
        cg$old_rec.NO_VERSION_VFAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).NO_VERSION_VFAS;
        cg$old_rec.VERSION := cg$AFFECTATION_PDT_VFAS.cg$table(idx).VERSION;

    IF NOT (cg$AFFECTATION_PDT_VFAS.called_from_package) THEN
        idx := cg$AFFECTATION_PDT_VFAS.cg$table.NEXT(idx);
        cg$rec.ID_PDT := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_PDT;
        cg$ind.ID_PDT := updating('ID_PDT');
        cg$rec.ID_FAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_FAS;
        cg$ind.ID_FAS := updating('ID_FAS');
        cg$rec.NO_VERSION_VFAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).NO_VERSION_VFAS;
        cg$ind.NO_VERSION_VFAS := updating('NO_VERSION_VFAS');
        cg$rec.VERSION := cg$AFFECTATION_PDT_VFAS.cg$table(idx).VERSION;
        cg$ind.VERSION := updating('VERSION');

        cg$AFFECTATION_PDT_VFAS.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AFFECTATION_PDT_VFAS.upd_denorm2( cg$rec,
                                       cg$AFFECTATION_PDT_VFAS.cg$tableind(idx)
                                     );
        cg$AFFECTATION_PDT_VFAS.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AFFECTATION_PDT_VFAS.cg$tableind(idx)
								                  );
        cg$AFFECTATION_PDT_VFAS.cascade_update(cg$rec, cg$old_rec);
        cg$AFFECTATION_PDT_VFAS.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AFFECTATION_PDT_VFAS.called_from_package := FALSE;
	END IF;
        idx := cg$AFFECTATION_PDT_VFAS.cg$table.NEXT(idx);
    END LOOP;

    cg$AFFECTATION_PDT_VFAS.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BDS_AFFECTATION_PDT_VFAS
BEFORE DELETE ON AFFECTATION_PDT_VFAS
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AFFECTATION_PDT_VFAS.cg$table.DELETE;
    cg$AFFECTATION_PDT_VFAS.cg$tableind.DELETE;
    cg$AFFECTATION_PDT_VFAS.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$BDR_AFFECTATION_PDT_VFAS
BEFORE DELETE ON AFFECTATION_PDT_VFAS FOR EACH ROW
DECLARE
    cg$pk cg$AFFECTATION_PDT_VFAS.cg$pk_type;
    cg$rec cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$ind cg$AFFECTATION_PDT_VFAS.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_PDT  := :old.ID_PDT;
    cg$rec.ID_PDT := :old.ID_PDT;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_PDT := :old.ID_PDT;
    cg$pk.VERSION  := :old.VERSION;
    cg$rec.VERSION := :old.VERSION;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).VERSION := :old.VERSION;
    cg$pk.NO_VERSION_VFAS  := :old.NO_VERSION_VFAS;
    cg$rec.NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$pk.ID_FAS  := :old.ID_FAS;
    cg$rec.ID_FAS := :old.ID_FAS;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_FAS := :old.ID_FAS;
    cg$rec.NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$rec.ID_FAS := :old.ID_FAS;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_FAS := :old.ID_FAS;
    cg$rec.ID_PDT := :old.ID_PDT;
    cg$AFFECTATION_PDT_VFAS.cg$table(cg$AFFECTATION_PDT_VFAS.idx).ID_PDT := :old.ID_PDT;


    cg$AFFECTATION_PDT_VFAS.idx := cg$AFFECTATION_PDT_VFAS.idx + 1;

    if not (cg$AFFECTATION_PDT_VFAS.called_from_package) then
        cg$AFFECTATION_PDT_VFAS.validate_domain_cascade_delete(cg$rec);   
        cg$AFFECTATION_PDT_VFAS.del(cg$pk, FALSE);
        cg$AFFECTATION_PDT_VFAS.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AFFECTATION_PDT_VFAS, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AFFECTATION_PDT_VFAS
AFTER DELETE ON AFFECTATION_PDT_VFAS FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AFFECTATION_PDT_VFAS
/

PROMPT Creating After Delete Statement Trigger on 'AFFECTATION_PDT_VFAS'
CREATE OR REPLACE TRIGGER cg$ADS_AFFECTATION_PDT_VFAS
AFTER DELETE ON AFFECTATION_PDT_VFAS
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_PDT_VFAS.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_PDT_VFAS.cg$row_type;
    cg$old_rec   cg$AFFECTATION_PDT_VFAS.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AFFECTATION_PDT_VFAS.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_PDT := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_PDT;
            cg$AFFECTATION_PDT_VFAS.cg$tableind(idx).ID_PDT := TRUE;
            cg$rec.ID_FAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).ID_FAS;
            cg$AFFECTATION_PDT_VFAS.cg$tableind(idx).ID_FAS := TRUE;
            cg$rec.NO_VERSION_VFAS := cg$AFFECTATION_PDT_VFAS.cg$table(idx).NO_VERSION_VFAS;
            cg$AFFECTATION_PDT_VFAS.cg$tableind(idx).NO_VERSION_VFAS := TRUE;
            cg$rec.VERSION := cg$AFFECTATION_PDT_VFAS.cg$table(idx).VERSION;
            cg$AFFECTATION_PDT_VFAS.cg$tableind(idx).VERSION := TRUE;

            cg$AFFECTATION_PDT_VFAS.validate_foreign_keys_del(cg$rec);
            cg$AFFECTATION_PDT_VFAS.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_PDT_VFAS.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AFFECTATION_PDT_VFAS.cascade_delete(cg$rec);
            cg$AFFECTATION_PDT_VFAS.domain_cascade_delete(cg$rec);             

            idx := cg$AFFECTATION_PDT_VFAS.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



