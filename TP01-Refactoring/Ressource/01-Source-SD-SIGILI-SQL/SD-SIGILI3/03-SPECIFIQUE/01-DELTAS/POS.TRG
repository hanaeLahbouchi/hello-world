
PROMPT Creating Trigger Logic for Table 'POSITIONNEMENT'
PROMPT Creating Before Insert Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BIS_POSITIONNEMENT
BEFORE INSERT ON POSITIONNEMENT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$POSITIONNEMENT.cg$table.DELETE;
    cg$POSITIONNEMENT.cg$tableind.DELETE;
    cg$POSITIONNEMENT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BIR_POSITIONNEMENT
BEFORE INSERT ON POSITIONNEMENT FOR EACH ROW
DECLARE
    cg$rec cg$POSITIONNEMENT.cg$row_type;
    cg$ind cg$POSITIONNEMENT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_POS := :new.ID_POS;
    cg$ind.ID_POS := TRUE;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.ID_CAP := :new.ID_CAP;
    cg$ind.ID_CAP := TRUE;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT := TRUE;
    cg$rec.ID_FC_CAP := :new.ID_FC_CAP;
    cg$ind.ID_FC_CAP := TRUE;
    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT := TRUE;
    cg$rec.TYPE_POSITIONNEMENT := :new.TYPE_POSITIONNEMENT;
    cg$ind.TYPE_POSITIONNEMENT := TRUE;
    cg$rec.NIVEAU_COMPETENCE := :new.NIVEAU_COMPETENCE;
    cg$ind.NIVEAU_COMPETENCE := TRUE;
    cg$rec.NIVEAU_MATURITE := :new.NIVEAU_MATURITE;
    cg$ind.NIVEAU_MATURITE := TRUE;

    if not (cg$POSITIONNEMENT.called_from_package) then
        cg$POSITIONNEMENT.validate_arc(cg$rec);
        cg$POSITIONNEMENT.validate_domain(cg$rec);

        cg$POSITIONNEMENT.ins(cg$rec, cg$ind, FALSE);
        cg$POSITIONNEMENT.called_from_package := FALSE;
    end if;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_POS := cg$rec.ID_POS;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_POS := cg$ind.ID_POS;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_SPC := cg$rec.ID_SPC;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_SPC := cg$ind.ID_SPC;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CAP := cg$rec.ID_CAP;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_CAP := cg$ind.ID_CAP;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_FC := cg$rec.ID_FC;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_FC := cg$ind.ID_FC;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPT := cg$rec.ID_CPT;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_CPT := cg$ind.ID_CPT;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_FC_CAP := cg$rec.ID_FC_CAP;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_FC_CAP := cg$ind.ID_FC_CAP;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPTT := cg$rec.ID_CPTT;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).ID_CPTT := cg$ind.ID_CPTT;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).TYPE_POSITIONNEMENT := cg$rec.TYPE_POSITIONNEMENT;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).TYPE_POSITIONNEMENT := cg$ind.TYPE_POSITIONNEMENT;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).NIVEAU_COMPETENCE := cg$rec.NIVEAU_COMPETENCE;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).NIVEAU_COMPETENCE := cg$ind.NIVEAU_COMPETENCE;

    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).NIVEAU_MATURITE := cg$rec.NIVEAU_MATURITE;
    cg$POSITIONNEMENT.cg$tableind(cg$POSITIONNEMENT.idx).NIVEAU_MATURITE := cg$ind.NIVEAU_MATURITE;

    cg$POSITIONNEMENT.idx := cg$POSITIONNEMENT.idx + 1;

    :new.ID_POS := cg$rec.ID_POS;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.ID_CAP := cg$rec.ID_CAP;
    :new.ID_FC := cg$rec.ID_FC;
    :new.ID_CPT := cg$rec.ID_CPT;
    :new.ID_FC_CAP := cg$rec.ID_FC_CAP;
    :new.ID_CPTT := cg$rec.ID_CPTT;
    :new.TYPE_POSITIONNEMENT := cg$rec.TYPE_POSITIONNEMENT;
    :new.NIVEAU_COMPETENCE := cg$rec.NIVEAU_COMPETENCE;
    :new.NIVEAU_MATURITE := cg$rec.NIVEAU_MATURITE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_POSITIONNEMENT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_POSITIONNEMENT
AFTER INSERT ON POSITIONNEMENT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_POSITIONNEMENT
/

PROMPT Creating After Insert Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$AIS_POSITIONNEMENT
AFTER INSERT ON POSITIONNEMENT
DECLARE
    idx      BINARY_INTEGER := cg$POSITIONNEMENT.cg$table.FIRST;
    cg$rec   cg$POSITIONNEMENT.cg$row_type;
    cg$old_rec   cg$POSITIONNEMENT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$POSITIONNEMENT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_POS := cg$POSITIONNEMENT.cg$table(idx).ID_POS;
            cg$rec.ID_SPC := cg$POSITIONNEMENT.cg$table(idx).ID_SPC;
            cg$rec.ID_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_CAP;
            cg$rec.ID_FC := cg$POSITIONNEMENT.cg$table(idx).ID_FC;
            cg$rec.ID_CPT := cg$POSITIONNEMENT.cg$table(idx).ID_CPT;
            cg$rec.ID_FC_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_FC_CAP;
            cg$rec.ID_CPTT := cg$POSITIONNEMENT.cg$table(idx).ID_CPTT;
            cg$rec.TYPE_POSITIONNEMENT := cg$POSITIONNEMENT.cg$table(idx).TYPE_POSITIONNEMENT;
            cg$rec.NIVEAU_COMPETENCE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_COMPETENCE;
            cg$rec.NIVEAU_MATURITE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_MATURITE;

            cg$POSITIONNEMENT.validate_foreign_keys_ins(cg$rec);

            cg$POSITIONNEMENT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$POSITIONNEMENT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$POSITIONNEMENT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BUS_POSITIONNEMENT
BEFORE UPDATE ON POSITIONNEMENT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$POSITIONNEMENT.cg$table.DELETE;
    cg$POSITIONNEMENT.cg$tableind.DELETE;
    cg$POSITIONNEMENT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BUR_POSITIONNEMENT
BEFORE UPDATE ON POSITIONNEMENT FOR EACH ROW
DECLARE
    cg$rec     cg$POSITIONNEMENT.cg$row_type;
    cg$ind     cg$POSITIONNEMENT.cg$ind_type;
    cg$old_rec cg$POSITIONNEMENT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_POS := :new.ID_POS;
    cg$ind.ID_POS :=    (:new.ID_POS IS NULL AND :old.ID_POS IS NOT NULL )
                        OR (:new.ID_POS IS NOT NULL AND :old.ID_POS IS NULL)
                        OR NOT(:new.ID_POS = :old.ID_POS) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_POS := :old.ID_POS;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_SPC := :old.ID_SPC;
    cg$rec.ID_CAP := :new.ID_CAP;
    cg$ind.ID_CAP :=    (:new.ID_CAP IS NULL AND :old.ID_CAP IS NOT NULL )
                        OR (:new.ID_CAP IS NOT NULL AND :old.ID_CAP IS NULL)
                        OR NOT(:new.ID_CAP = :old.ID_CAP) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CAP := :old.ID_CAP;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT :=    (:new.ID_CPT IS NULL AND :old.ID_CPT IS NOT NULL )
                        OR (:new.ID_CPT IS NOT NULL AND :old.ID_CPT IS NULL)
                        OR NOT(:new.ID_CPT = :old.ID_CPT) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_FC_CAP := :new.ID_FC_CAP;
    cg$ind.ID_FC_CAP :=    (:new.ID_FC_CAP IS NULL AND :old.ID_FC_CAP IS NOT NULL )
                        OR (:new.ID_FC_CAP IS NOT NULL AND :old.ID_FC_CAP IS NULL)
                        OR NOT(:new.ID_FC_CAP = :old.ID_FC_CAP) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_FC_CAP := :old.ID_FC_CAP;
    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT :=    (:new.ID_CPTT IS NULL AND :old.ID_CPTT IS NOT NULL )
                        OR (:new.ID_CPTT IS NOT NULL AND :old.ID_CPTT IS NULL)
                        OR NOT(:new.ID_CPTT = :old.ID_CPTT) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPTT := :old.ID_CPTT;
    cg$rec.TYPE_POSITIONNEMENT := :new.TYPE_POSITIONNEMENT;
    cg$ind.TYPE_POSITIONNEMENT :=    (:new.TYPE_POSITIONNEMENT IS NULL AND :old.TYPE_POSITIONNEMENT IS NOT NULL )
                        OR (:new.TYPE_POSITIONNEMENT IS NOT NULL AND :old.TYPE_POSITIONNEMENT IS NULL)
                        OR NOT(:new.TYPE_POSITIONNEMENT = :old.TYPE_POSITIONNEMENT) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).TYPE_POSITIONNEMENT := :old.TYPE_POSITIONNEMENT;
    cg$rec.NIVEAU_COMPETENCE := :new.NIVEAU_COMPETENCE;
    cg$ind.NIVEAU_COMPETENCE :=    (:new.NIVEAU_COMPETENCE IS NULL AND :old.NIVEAU_COMPETENCE IS NOT NULL )
                        OR (:new.NIVEAU_COMPETENCE IS NOT NULL AND :old.NIVEAU_COMPETENCE IS NULL)
                        OR NOT(:new.NIVEAU_COMPETENCE = :old.NIVEAU_COMPETENCE) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).NIVEAU_COMPETENCE := :old.NIVEAU_COMPETENCE;
    cg$rec.NIVEAU_MATURITE := :new.NIVEAU_MATURITE;
    cg$ind.NIVEAU_MATURITE :=    (:new.NIVEAU_MATURITE IS NULL AND :old.NIVEAU_MATURITE IS NOT NULL )
                        OR (:new.NIVEAU_MATURITE IS NOT NULL AND :old.NIVEAU_MATURITE IS NULL)
                        OR NOT(:new.NIVEAU_MATURITE = :old.NIVEAU_MATURITE) ;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).NIVEAU_MATURITE := :old.NIVEAU_MATURITE;


    cg$POSITIONNEMENT.idx := cg$POSITIONNEMENT.idx + 1;

    if not (cg$POSITIONNEMENT.called_from_package) then
        cg$POSITIONNEMENT.validate_arc(cg$rec);
        cg$POSITIONNEMENT.validate_domain(cg$rec, cg$ind);
        cg$POSITIONNEMENT.validate_domain_cascade_update(cg$old_rec);   

        cg$POSITIONNEMENT.upd(cg$rec, cg$ind, FALSE);
        cg$POSITIONNEMENT.called_from_package := FALSE;
    end if;

    :new.ID_SPC := cg$rec.ID_SPC;
    :new.ID_CAP := cg$rec.ID_CAP;
    :new.ID_FC := cg$rec.ID_FC;
    :new.ID_CPT := cg$rec.ID_CPT;
    :new.ID_FC_CAP := cg$rec.ID_FC_CAP;
    :new.ID_CPTT := cg$rec.ID_CPTT;
    :new.TYPE_POSITIONNEMENT := cg$rec.TYPE_POSITIONNEMENT;
    :new.NIVEAU_COMPETENCE := cg$rec.NIVEAU_COMPETENCE;
    :new.NIVEAU_MATURITE := cg$rec.NIVEAU_MATURITE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_POSITIONNEMENT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_POSITIONNEMENT
AFTER UPDATE ON POSITIONNEMENT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_POSITIONNEMENT
/






PROMPT Creating After Update Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$AUS_POSITIONNEMENT
AFTER UPDATE ON POSITIONNEMENT
DECLARE
    idx        BINARY_INTEGER := cg$POSITIONNEMENT.cg$table.FIRST;
    cg$old_rec cg$POSITIONNEMENT.cg$row_type;
    cg$rec     cg$POSITIONNEMENT.cg$row_type;
    cg$ind     cg$POSITIONNEMENT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_POS := cg$POSITIONNEMENT.cg$table(idx).ID_POS;
        cg$old_rec.ID_SPC := cg$POSITIONNEMENT.cg$table(idx).ID_SPC;
        cg$old_rec.ID_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_CAP;
        cg$old_rec.ID_FC := cg$POSITIONNEMENT.cg$table(idx).ID_FC;
        cg$old_rec.ID_CPT := cg$POSITIONNEMENT.cg$table(idx).ID_CPT;
        cg$old_rec.ID_FC_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_FC_CAP;
        cg$old_rec.ID_CPTT := cg$POSITIONNEMENT.cg$table(idx).ID_CPTT;
        cg$old_rec.TYPE_POSITIONNEMENT := cg$POSITIONNEMENT.cg$table(idx).TYPE_POSITIONNEMENT;
        cg$old_rec.NIVEAU_COMPETENCE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_COMPETENCE;
        cg$old_rec.NIVEAU_MATURITE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_MATURITE;

    IF NOT (cg$POSITIONNEMENT.called_from_package) THEN
        idx := cg$POSITIONNEMENT.cg$table.NEXT(idx);
        cg$rec.ID_POS := cg$POSITIONNEMENT.cg$table(idx).ID_POS;
        cg$ind.ID_POS := updating('ID_POS');
        cg$rec.ID_SPC := cg$POSITIONNEMENT.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.ID_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_CAP;
        cg$ind.ID_CAP := updating('ID_CAP');
        cg$rec.ID_FC := cg$POSITIONNEMENT.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.ID_CPT := cg$POSITIONNEMENT.cg$table(idx).ID_CPT;
        cg$ind.ID_CPT := updating('ID_CPT');
        cg$rec.ID_FC_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_FC_CAP;
        cg$ind.ID_FC_CAP := updating('ID_FC_CAP');
        cg$rec.ID_CPTT := cg$POSITIONNEMENT.cg$table(idx).ID_CPTT;
        cg$ind.ID_CPTT := updating('ID_CPTT');
        cg$rec.TYPE_POSITIONNEMENT := cg$POSITIONNEMENT.cg$table(idx).TYPE_POSITIONNEMENT;
        cg$ind.TYPE_POSITIONNEMENT := updating('TYPE_POSITIONNEMENT');
        cg$rec.NIVEAU_COMPETENCE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_COMPETENCE;
        cg$ind.NIVEAU_COMPETENCE := updating('NIVEAU_COMPETENCE');
        cg$rec.NIVEAU_MATURITE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_MATURITE;
        cg$ind.NIVEAU_MATURITE := updating('NIVEAU_MATURITE');

        cg$POSITIONNEMENT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$POSITIONNEMENT.upd_denorm2( cg$rec,
                                       cg$POSITIONNEMENT.cg$tableind(idx)
                                     );
        cg$POSITIONNEMENT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$POSITIONNEMENT.cg$tableind(idx)
								                  );
        cg$POSITIONNEMENT.cascade_update(cg$rec, cg$old_rec);
        cg$POSITIONNEMENT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$POSITIONNEMENT.called_from_package := FALSE;
	END IF;
        idx := cg$POSITIONNEMENT.cg$table.NEXT(idx);
    END LOOP;

    cg$POSITIONNEMENT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BDS_POSITIONNEMENT
BEFORE DELETE ON POSITIONNEMENT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$POSITIONNEMENT.cg$table.DELETE;
    cg$POSITIONNEMENT.cg$tableind.DELETE;
    cg$POSITIONNEMENT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$BDR_POSITIONNEMENT
BEFORE DELETE ON POSITIONNEMENT FOR EACH ROW
DECLARE
    cg$pk cg$POSITIONNEMENT.cg$pk_type;
    cg$rec cg$POSITIONNEMENT.cg$row_type;
    cg$ind cg$POSITIONNEMENT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_POS  := :old.ID_POS;
    cg$rec.ID_POS := :old.ID_POS;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_POS := :old.ID_POS;
    cg$rec.ID_CPT := :old.ID_CPT;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_FC := :old.ID_FC;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_CPTT := :old.ID_CPTT;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CPTT := :old.ID_CPTT;
    cg$rec.ID_CAP := :old.ID_CAP;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_CAP := :old.ID_CAP;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$POSITIONNEMENT.cg$table(cg$POSITIONNEMENT.idx).ID_SPC := :old.ID_SPC;


    cg$POSITIONNEMENT.idx := cg$POSITIONNEMENT.idx + 1;

    if not (cg$POSITIONNEMENT.called_from_package) then
        cg$POSITIONNEMENT.validate_domain_cascade_delete(cg$rec);   
        cg$POSITIONNEMENT.del(cg$pk, FALSE);
        cg$POSITIONNEMENT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_POSITIONNEMENT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_POSITIONNEMENT
AFTER DELETE ON POSITIONNEMENT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_POSITIONNEMENT
/

PROMPT Creating After Delete Statement Trigger on 'POSITIONNEMENT'
CREATE OR REPLACE TRIGGER cg$ADS_POSITIONNEMENT
AFTER DELETE ON POSITIONNEMENT
DECLARE
    idx        BINARY_INTEGER := cg$POSITIONNEMENT.cg$table.FIRST;
    cg$rec   cg$POSITIONNEMENT.cg$row_type;
    cg$old_rec   cg$POSITIONNEMENT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$POSITIONNEMENT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_POS := cg$POSITIONNEMENT.cg$table(idx).ID_POS;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_POS := TRUE;
            cg$rec.ID_SPC := cg$POSITIONNEMENT.cg$table(idx).ID_SPC;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.ID_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_CAP;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_CAP := TRUE;
            cg$rec.ID_FC := cg$POSITIONNEMENT.cg$table(idx).ID_FC;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.ID_CPT := cg$POSITIONNEMENT.cg$table(idx).ID_CPT;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_CPT := TRUE;
            cg$rec.ID_FC_CAP := cg$POSITIONNEMENT.cg$table(idx).ID_FC_CAP;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_FC_CAP := TRUE;
            cg$rec.ID_CPTT := cg$POSITIONNEMENT.cg$table(idx).ID_CPTT;
            cg$POSITIONNEMENT.cg$tableind(idx).ID_CPTT := TRUE;
            cg$rec.TYPE_POSITIONNEMENT := cg$POSITIONNEMENT.cg$table(idx).TYPE_POSITIONNEMENT;
            cg$POSITIONNEMENT.cg$tableind(idx).TYPE_POSITIONNEMENT := TRUE;
            cg$rec.NIVEAU_COMPETENCE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_COMPETENCE;
            cg$POSITIONNEMENT.cg$tableind(idx).NIVEAU_COMPETENCE := TRUE;
            cg$rec.NIVEAU_MATURITE := cg$POSITIONNEMENT.cg$table(idx).NIVEAU_MATURITE;
            cg$POSITIONNEMENT.cg$tableind(idx).NIVEAU_MATURITE := TRUE;

            cg$POSITIONNEMENT.validate_foreign_keys_del(cg$rec);
            cg$POSITIONNEMENT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$POSITIONNEMENT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$POSITIONNEMENT.cascade_delete(cg$rec);
            cg$POSITIONNEMENT.domain_cascade_delete(cg$rec);             

            idx := cg$POSITIONNEMENT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



