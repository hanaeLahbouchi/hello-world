
PROMPT Creating Trigger Logic for Table 'AFFECTATION_PRODUIT'
PROMPT Creating Before Insert Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BIS_AFFECTATION_PRODUIT
BEFORE INSERT ON AFFECTATION_PRODUIT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$AFFECTATION_PRODUIT.cg$table.DELETE;
    cg$AFFECTATION_PRODUIT.cg$tableind.DELETE;
    cg$AFFECTATION_PRODUIT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BIR_AFFECTATION_PRODUIT
BEFORE INSERT ON AFFECTATION_PRODUIT FOR EACH ROW
DECLARE
    cg$rec cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$ind cg$AFFECTATION_PRODUIT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA := TRUE;
    cg$rec.ID_PDT := :new.ID_PDT;
    cg$ind.ID_PDT := TRUE;
    cg$rec.VERSION := :new.VERSION;
    cg$ind.VERSION := TRUE;
    cg$rec.DATE_CLE := :new.DATE_CLE;
    cg$ind.DATE_CLE := TRUE;

    if not (cg$AFFECTATION_PRODUIT.called_from_package) then
        cg$AFFECTATION_PRODUIT.validate_arc(cg$rec);
        cg$AFFECTATION_PRODUIT.validate_domain(cg$rec);

        cg$AFFECTATION_PRODUIT.ins(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_PRODUIT.called_from_package := FALSE;
    end if;

    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_FA := cg$rec.ID_FA;
    cg$AFFECTATION_PRODUIT.cg$tableind(cg$AFFECTATION_PRODUIT.idx).ID_FA := cg$ind.ID_FA;

    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_PDT := cg$rec.ID_PDT;
    cg$AFFECTATION_PRODUIT.cg$tableind(cg$AFFECTATION_PRODUIT.idx).ID_PDT := cg$ind.ID_PDT;

    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).VERSION := cg$rec.VERSION;
    cg$AFFECTATION_PRODUIT.cg$tableind(cg$AFFECTATION_PRODUIT.idx).VERSION := cg$ind.VERSION;

    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).DATE_CLE := cg$rec.DATE_CLE;
    cg$AFFECTATION_PRODUIT.cg$tableind(cg$AFFECTATION_PRODUIT.idx).DATE_CLE := cg$ind.DATE_CLE;

    cg$AFFECTATION_PRODUIT.idx := cg$AFFECTATION_PRODUIT.idx + 1;

    :new.ID_FA := cg$rec.ID_FA;
    :new.ID_PDT := cg$rec.ID_PDT;
    :new.VERSION := cg$rec.VERSION;
    :new.DATE_CLE := cg$rec.DATE_CLE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_AFFECTATION_PRODUIT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_AFFECTATION_PRODUIT
AFTER INSERT ON AFFECTATION_PRODUIT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_AFFECTATION_PRODUIT
/

PROMPT Creating After Insert Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$AIS_AFFECTATION_PRODUIT
AFTER INSERT ON AFFECTATION_PRODUIT
DECLARE
    idx      BINARY_INTEGER := cg$AFFECTATION_PRODUIT.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$old_rec   cg$AFFECTATION_PRODUIT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$AFFECTATION_PRODUIT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FA := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_FA;
            cg$rec.ID_PDT := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_PDT;
            cg$rec.VERSION := cg$AFFECTATION_PRODUIT.cg$table(idx).VERSION;
            cg$rec.DATE_CLE := cg$AFFECTATION_PRODUIT.cg$table(idx).DATE_CLE;

            cg$AFFECTATION_PRODUIT.validate_foreign_keys_ins(cg$rec);

            cg$AFFECTATION_PRODUIT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_PRODUIT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$AFFECTATION_PRODUIT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BUS_AFFECTATION_PRODUIT
BEFORE UPDATE ON AFFECTATION_PRODUIT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$AFFECTATION_PRODUIT.cg$table.DELETE;
    cg$AFFECTATION_PRODUIT.cg$tableind.DELETE;
    cg$AFFECTATION_PRODUIT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BUR_AFFECTATION_PRODUIT
BEFORE UPDATE ON AFFECTATION_PRODUIT FOR EACH ROW
DECLARE
    cg$rec     cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$ind     cg$AFFECTATION_PRODUIT.cg$ind_type;
    cg$old_rec cg$AFFECTATION_PRODUIT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA :=    (:new.ID_FA IS NULL AND :old.ID_FA IS NOT NULL )
                        OR (:new.ID_FA IS NOT NULL AND :old.ID_FA IS NULL)
                        OR NOT(:new.ID_FA = :old.ID_FA) ;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_FA := :old.ID_FA;
    cg$rec.ID_PDT := :new.ID_PDT;
    cg$ind.ID_PDT :=    (:new.ID_PDT IS NULL AND :old.ID_PDT IS NOT NULL )
                        OR (:new.ID_PDT IS NOT NULL AND :old.ID_PDT IS NULL)
                        OR NOT(:new.ID_PDT = :old.ID_PDT) ;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_PDT := :old.ID_PDT;
    cg$rec.VERSION := :new.VERSION;
    cg$ind.VERSION :=    (:new.VERSION IS NULL AND :old.VERSION IS NOT NULL )
                        OR (:new.VERSION IS NOT NULL AND :old.VERSION IS NULL)
                        OR NOT(:new.VERSION = :old.VERSION) ;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).VERSION := :old.VERSION;
    cg$rec.DATE_CLE := :new.DATE_CLE;
    cg$ind.DATE_CLE :=    (:new.DATE_CLE IS NULL AND :old.DATE_CLE IS NOT NULL )
                        OR (:new.DATE_CLE IS NOT NULL AND :old.DATE_CLE IS NULL)
                        OR NOT(:new.DATE_CLE = :old.DATE_CLE) ;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).DATE_CLE := :old.DATE_CLE;


    cg$AFFECTATION_PRODUIT.idx := cg$AFFECTATION_PRODUIT.idx + 1;

    if not (cg$AFFECTATION_PRODUIT.called_from_package) then
        cg$AFFECTATION_PRODUIT.validate_arc(cg$rec);
        cg$AFFECTATION_PRODUIT.validate_domain(cg$rec, cg$ind);
        cg$AFFECTATION_PRODUIT.validate_domain_cascade_update(cg$old_rec);   

        cg$AFFECTATION_PRODUIT.upd(cg$rec, cg$ind, FALSE);
        cg$AFFECTATION_PRODUIT.called_from_package := FALSE;
    end if;

    :new.DATE_CLE := cg$rec.DATE_CLE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_AFFECTATION_PRODUIT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_AFFECTATION_PRODUIT
AFTER UPDATE ON AFFECTATION_PRODUIT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_AFFECTATION_PRODUIT
/






PROMPT Creating After Update Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$AUS_AFFECTATION_PRODUIT
AFTER UPDATE ON AFFECTATION_PRODUIT
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_PRODUIT.cg$table.FIRST;
    cg$old_rec cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$rec     cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$ind     cg$AFFECTATION_PRODUIT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_FA := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_FA;
        cg$old_rec.ID_PDT := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_PDT;
        cg$old_rec.VERSION := cg$AFFECTATION_PRODUIT.cg$table(idx).VERSION;
        cg$old_rec.DATE_CLE := cg$AFFECTATION_PRODUIT.cg$table(idx).DATE_CLE;

    IF NOT (cg$AFFECTATION_PRODUIT.called_from_package) THEN
        idx := cg$AFFECTATION_PRODUIT.cg$table.NEXT(idx);
        cg$rec.ID_FA := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_FA;
        cg$ind.ID_FA := updating('ID_FA');
        cg$rec.ID_PDT := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_PDT;
        cg$ind.ID_PDT := updating('ID_PDT');
        cg$rec.VERSION := cg$AFFECTATION_PRODUIT.cg$table(idx).VERSION;
        cg$ind.VERSION := updating('VERSION');
        cg$rec.DATE_CLE := cg$AFFECTATION_PRODUIT.cg$table(idx).DATE_CLE;
        cg$ind.DATE_CLE := updating('DATE_CLE');

        cg$AFFECTATION_PRODUIT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$AFFECTATION_PRODUIT.upd_denorm2( cg$rec,
                                       cg$AFFECTATION_PRODUIT.cg$tableind(idx)
                                     );
        cg$AFFECTATION_PRODUIT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$AFFECTATION_PRODUIT.cg$tableind(idx)
								                  );
        cg$AFFECTATION_PRODUIT.cascade_update(cg$rec, cg$old_rec);
        cg$AFFECTATION_PRODUIT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$AFFECTATION_PRODUIT.called_from_package := FALSE;
	END IF;
        idx := cg$AFFECTATION_PRODUIT.cg$table.NEXT(idx);
    END LOOP;

    cg$AFFECTATION_PRODUIT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BDS_AFFECTATION_PRODUIT
BEFORE DELETE ON AFFECTATION_PRODUIT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$AFFECTATION_PRODUIT.cg$table.DELETE;
    cg$AFFECTATION_PRODUIT.cg$tableind.DELETE;
    cg$AFFECTATION_PRODUIT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$BDR_AFFECTATION_PRODUIT
BEFORE DELETE ON AFFECTATION_PRODUIT FOR EACH ROW
DECLARE
    cg$pk cg$AFFECTATION_PRODUIT.cg$pk_type;
    cg$rec cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$ind cg$AFFECTATION_PRODUIT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_PDT  := :old.ID_PDT;
    cg$rec.ID_PDT := :old.ID_PDT;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_PDT := :old.ID_PDT;
    cg$pk.VERSION  := :old.VERSION;
    cg$rec.VERSION := :old.VERSION;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).VERSION := :old.VERSION;
    cg$pk.ID_FA  := :old.ID_FA;
    cg$rec.ID_FA := :old.ID_FA;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_FA := :old.ID_FA;
    cg$rec.ID_FA := :old.ID_FA;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_FA := :old.ID_FA;
    cg$rec.ID_PDT := :old.ID_PDT;
    cg$AFFECTATION_PRODUIT.cg$table(cg$AFFECTATION_PRODUIT.idx).ID_PDT := :old.ID_PDT;


    cg$AFFECTATION_PRODUIT.idx := cg$AFFECTATION_PRODUIT.idx + 1;

    if not (cg$AFFECTATION_PRODUIT.called_from_package) then
        cg$AFFECTATION_PRODUIT.validate_domain_cascade_delete(cg$rec);   
        cg$AFFECTATION_PRODUIT.del(cg$pk, FALSE);
        cg$AFFECTATION_PRODUIT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_AFFECTATION_PRODUIT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_AFFECTATION_PRODUIT
AFTER DELETE ON AFFECTATION_PRODUIT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_AFFECTATION_PRODUIT
/

PROMPT Creating After Delete Statement Trigger on 'AFFECTATION_PRODUIT'
CREATE OR REPLACE TRIGGER cg$ADS_AFFECTATION_PRODUIT
AFTER DELETE ON AFFECTATION_PRODUIT
DECLARE
    idx        BINARY_INTEGER := cg$AFFECTATION_PRODUIT.cg$table.FIRST;
    cg$rec   cg$AFFECTATION_PRODUIT.cg$row_type;
    cg$old_rec   cg$AFFECTATION_PRODUIT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$AFFECTATION_PRODUIT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_FA := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_FA;
            cg$AFFECTATION_PRODUIT.cg$tableind(idx).ID_FA := TRUE;
            cg$rec.ID_PDT := cg$AFFECTATION_PRODUIT.cg$table(idx).ID_PDT;
            cg$AFFECTATION_PRODUIT.cg$tableind(idx).ID_PDT := TRUE;
            cg$rec.VERSION := cg$AFFECTATION_PRODUIT.cg$table(idx).VERSION;
            cg$AFFECTATION_PRODUIT.cg$tableind(idx).VERSION := TRUE;
            cg$rec.DATE_CLE := cg$AFFECTATION_PRODUIT.cg$table(idx).DATE_CLE;
            cg$AFFECTATION_PRODUIT.cg$tableind(idx).DATE_CLE := TRUE;

            cg$AFFECTATION_PRODUIT.validate_foreign_keys_del(cg$rec);
            cg$AFFECTATION_PRODUIT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$AFFECTATION_PRODUIT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$AFFECTATION_PRODUIT.cascade_delete(cg$rec);
            cg$AFFECTATION_PRODUIT.domain_cascade_delete(cg$rec);             

            idx := cg$AFFECTATION_PRODUIT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



