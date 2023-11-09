
PROMPT Creating Trigger Logic for Table 'JOURNAL_SUIVI_PERSONNEL'
PROMPT Creating Before Insert Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BIS_JOURNAL_SUIVI_PERSONNEL
BEFORE INSERT ON JOURNAL_SUIVI_PERSONNEL
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BIR_JOURNAL_SUIVI_PERSONNEL
BEFORE INSERT ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
DECLARE
    cg$rec cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$ind cg$JOURNAL_SUIVI_PERSONNEL.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_JSP := :new.ID_JSP;
    cg$ind.ID_JSP := TRUE;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC := TRUE;
    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC := TRUE;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC := TRUE;
    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT := TRUE;
    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT := TRUE;
    cg$rec.TYPE_ENTREE := :new.TYPE_ENTREE;
    cg$ind.TYPE_ENTREE := TRUE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION := TRUE;
    cg$rec.LIBELLE := :new.LIBELLE;
    cg$ind.LIBELLE := TRUE;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ := TRUE;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;

    if not (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) then
        cg$JOURNAL_SUIVI_PERSONNEL.validate_arc(cg$rec);
        cg$JOURNAL_SUIVI_PERSONNEL.validate_domain(cg$rec);

        cg$JOURNAL_SUIVI_PERSONNEL.ins(cg$rec, cg$ind, FALSE);
        cg$JOURNAL_SUIVI_PERSONNEL.called_from_package := FALSE;
    end if;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_JSP := cg$rec.ID_JSP;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_JSP := cg$ind.ID_JSP;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_SPC := cg$rec.ID_SPC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_SPC := cg$ind.ID_SPC;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_DC := cg$rec.ID_DC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_DC := cg$ind.ID_DC;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_FC := cg$rec.ID_FC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_FC := cg$ind.ID_FC;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPT := cg$rec.ID_CPT;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPT := cg$ind.ID_CPT;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPTT := cg$rec.ID_CPTT;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPTT := cg$ind.ID_CPTT;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).TYPE_ENTREE := cg$rec.TYPE_ENTREE;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).TYPE_ENTREE := cg$ind.TYPE_ENTREE;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_CREATION := cg$rec.DATE_CREATION;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_CREATION := cg$ind.DATE_CREATION;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).LIBELLE := cg$rec.LIBELLE;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).LIBELLE := cg$ind.LIBELLE;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_MAJ := cg$rec.DATE_MAJ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_MAJ := cg$ind.DATE_MAJ;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(cg$JOURNAL_SUIVI_PERSONNEL.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$JOURNAL_SUIVI_PERSONNEL.idx := cg$JOURNAL_SUIVI_PERSONNEL.idx + 1;

    :new.ID_JSP := cg$rec.ID_JSP;
    :new.ID_SPC := cg$rec.ID_SPC;
    :new.ID_DC := cg$rec.ID_DC;
    :new.ID_FC := cg$rec.ID_FC;
    :new.ID_CPT := cg$rec.ID_CPT;
    :new.ID_CPTT := cg$rec.ID_CPTT;
    :new.TYPE_ENTREE := cg$rec.TYPE_ENTREE;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.LIBELLE := cg$rec.LIBELLE;
    :new.DATE_MAJ := cg$rec.DATE_MAJ;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_JOURNAL_SUIVI_PERSONNEL, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_JOURNAL_SUIVI_PERSONNEL
AFTER INSERT ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_JOURNAL_SUIVI_PERSONNEL
/

PROMPT Creating After Insert Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$AIS_JOURNAL_SUIVI_PERSONNEL
AFTER INSERT ON JOURNAL_SUIVI_PERSONNEL
DECLARE
    idx      BINARY_INTEGER := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.FIRST;
    cg$rec   cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$old_rec   cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_JSP := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_JSP;
            cg$rec.ID_SPC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_SPC;
            cg$rec.ID_DC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_DC;
            cg$rec.ID_FC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_FC;
            cg$rec.ID_CPT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPT;
            cg$rec.ID_CPTT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPTT;
            cg$rec.TYPE_ENTREE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).TYPE_ENTREE;
            cg$rec.DATE_CREATION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_CREATION;
            cg$rec.LIBELLE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).LIBELLE;
            cg$rec.DATE_MAJ := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_MAJ;
            cg$rec.DESCRIPTION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DESCRIPTION;

            cg$JOURNAL_SUIVI_PERSONNEL.validate_foreign_keys_ins(cg$rec);

            cg$JOURNAL_SUIVI_PERSONNEL.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BUS_JOURNAL_SUIVI_PERSONNEL
BEFORE UPDATE ON JOURNAL_SUIVI_PERSONNEL
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BUR_JOURNAL_SUIVI_PERSONNEL
BEFORE UPDATE ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
DECLARE
    cg$rec     cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$ind     cg$JOURNAL_SUIVI_PERSONNEL.cg$ind_type;
    cg$old_rec cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_JSP := :new.ID_JSP;
    cg$ind.ID_JSP :=    (:new.ID_JSP IS NULL AND :old.ID_JSP IS NOT NULL )
                        OR (:new.ID_JSP IS NOT NULL AND :old.ID_JSP IS NULL)
                        OR NOT(:new.ID_JSP = :old.ID_JSP) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_JSP := :old.ID_JSP;
    cg$rec.ID_SPC := :new.ID_SPC;
    cg$ind.ID_SPC :=    (:new.ID_SPC IS NULL AND :old.ID_SPC IS NOT NULL )
                        OR (:new.ID_SPC IS NOT NULL AND :old.ID_SPC IS NULL)
                        OR NOT(:new.ID_SPC = :old.ID_SPC) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_SPC := :old.ID_SPC;
    cg$rec.ID_DC := :new.ID_DC;
    cg$ind.ID_DC :=    (:new.ID_DC IS NULL AND :old.ID_DC IS NOT NULL )
                        OR (:new.ID_DC IS NOT NULL AND :old.ID_DC IS NULL)
                        OR NOT(:new.ID_DC = :old.ID_DC) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_DC := :old.ID_DC;
    cg$rec.ID_FC := :new.ID_FC;
    cg$ind.ID_FC :=    (:new.ID_FC IS NULL AND :old.ID_FC IS NOT NULL )
                        OR (:new.ID_FC IS NOT NULL AND :old.ID_FC IS NULL)
                        OR NOT(:new.ID_FC = :old.ID_FC) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_CPT := :new.ID_CPT;
    cg$ind.ID_CPT :=    (:new.ID_CPT IS NULL AND :old.ID_CPT IS NOT NULL )
                        OR (:new.ID_CPT IS NOT NULL AND :old.ID_CPT IS NULL)
                        OR NOT(:new.ID_CPT = :old.ID_CPT) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_CPTT := :new.ID_CPTT;
    cg$ind.ID_CPTT :=    (:new.ID_CPTT IS NULL AND :old.ID_CPTT IS NOT NULL )
                        OR (:new.ID_CPTT IS NOT NULL AND :old.ID_CPTT IS NULL)
                        OR NOT(:new.ID_CPTT = :old.ID_CPTT) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPTT := :old.ID_CPTT;
    cg$rec.TYPE_ENTREE := :new.TYPE_ENTREE;
    cg$ind.TYPE_ENTREE :=    (:new.TYPE_ENTREE IS NULL AND :old.TYPE_ENTREE IS NOT NULL )
                        OR (:new.TYPE_ENTREE IS NOT NULL AND :old.TYPE_ENTREE IS NULL)
                        OR NOT(:new.TYPE_ENTREE = :old.TYPE_ENTREE) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).TYPE_ENTREE := :old.TYPE_ENTREE;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.LIBELLE := :new.LIBELLE;
    cg$ind.LIBELLE :=    (:new.LIBELLE IS NULL AND :old.LIBELLE IS NOT NULL )
                        OR (:new.LIBELLE IS NOT NULL AND :old.LIBELLE IS NULL)
                        OR NOT(:new.LIBELLE = :old.LIBELLE) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).LIBELLE := :old.LIBELLE;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ :=    (:new.DATE_MAJ IS NULL AND :old.DATE_MAJ IS NOT NULL )
                        OR (:new.DATE_MAJ IS NOT NULL AND :old.DATE_MAJ IS NULL)
                        OR NOT(:new.DATE_MAJ = :old.DATE_MAJ) ;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).DATE_MAJ := :old.DATE_MAJ;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;


    cg$JOURNAL_SUIVI_PERSONNEL.idx := cg$JOURNAL_SUIVI_PERSONNEL.idx + 1;

    if not (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) then
        cg$JOURNAL_SUIVI_PERSONNEL.validate_arc(cg$rec);
        cg$JOURNAL_SUIVI_PERSONNEL.validate_domain(cg$rec, cg$ind);
        cg$JOURNAL_SUIVI_PERSONNEL.validate_domain_cascade_update(cg$old_rec);   

        cg$JOURNAL_SUIVI_PERSONNEL.upd(cg$rec, cg$ind, FALSE);
        cg$JOURNAL_SUIVI_PERSONNEL.called_from_package := FALSE;
    end if;

    :new.ID_SPC := cg$rec.ID_SPC;
    :new.ID_DC := cg$rec.ID_DC;
    :new.ID_FC := cg$rec.ID_FC;
    :new.ID_CPT := cg$rec.ID_CPT;
    :new.ID_CPTT := cg$rec.ID_CPTT;
    :new.TYPE_ENTREE := cg$rec.TYPE_ENTREE;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.LIBELLE := cg$rec.LIBELLE;
    :new.DATE_MAJ := cg$rec.DATE_MAJ;
    -- Warning: Column DESCRIPTION is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_JOURNAL_SUIVI_PERSONNEL, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_JOURNAL_SUIVI_PERSONNEL
AFTER UPDATE ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_JOURNAL_SUIVI_PERSONNEL
/






PROMPT Creating After Update Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$AUS_JOURNAL_SUIVI_PERSONNEL
AFTER UPDATE ON JOURNAL_SUIVI_PERSONNEL
DECLARE
    idx        BINARY_INTEGER := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.FIRST;
    cg$old_rec cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$rec     cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$ind     cg$JOURNAL_SUIVI_PERSONNEL.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_JSP := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_JSP;
        cg$old_rec.ID_SPC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_SPC;
        cg$old_rec.ID_DC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_DC;
        cg$old_rec.ID_FC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_FC;
        cg$old_rec.ID_CPT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPT;
        cg$old_rec.ID_CPTT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPTT;
        cg$old_rec.TYPE_ENTREE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).TYPE_ENTREE;
        cg$old_rec.DATE_CREATION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_CREATION;
        cg$old_rec.LIBELLE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).LIBELLE;
        cg$old_rec.DATE_MAJ := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_MAJ;
        cg$old_rec.DESCRIPTION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DESCRIPTION;

    IF NOT (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) THEN
        idx := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.NEXT(idx);
        cg$rec.ID_JSP := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_JSP;
        cg$ind.ID_JSP := updating('ID_JSP');
        cg$rec.ID_SPC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_SPC;
        cg$ind.ID_SPC := updating('ID_SPC');
        cg$rec.ID_DC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_DC;
        cg$ind.ID_DC := updating('ID_DC');
        cg$rec.ID_FC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_FC;
        cg$ind.ID_FC := updating('ID_FC');
        cg$rec.ID_CPT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPT;
        cg$ind.ID_CPT := updating('ID_CPT');
        cg$rec.ID_CPTT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPTT;
        cg$ind.ID_CPTT := updating('ID_CPTT');
        cg$rec.TYPE_ENTREE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).TYPE_ENTREE;
        cg$ind.TYPE_ENTREE := updating('TYPE_ENTREE');
        cg$rec.DATE_CREATION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.LIBELLE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).LIBELLE;
        cg$ind.LIBELLE := updating('LIBELLE');
        cg$rec.DATE_MAJ := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_MAJ;
        cg$ind.DATE_MAJ := updating('DATE_MAJ');
        cg$rec.DESCRIPTION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');

        cg$JOURNAL_SUIVI_PERSONNEL.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$JOURNAL_SUIVI_PERSONNEL.upd_denorm2( cg$rec,
                                       cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx)
                                     );
        cg$JOURNAL_SUIVI_PERSONNEL.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx)
								                  );
        cg$JOURNAL_SUIVI_PERSONNEL.cascade_update(cg$rec, cg$old_rec);
        cg$JOURNAL_SUIVI_PERSONNEL.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$JOURNAL_SUIVI_PERSONNEL.called_from_package := FALSE;
	END IF;
        idx := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.NEXT(idx);
    END LOOP;

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BDS_JOURNAL_SUIVI_PERSONNEL
BEFORE DELETE ON JOURNAL_SUIVI_PERSONNEL
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$JOURNAL_SUIVI_PERSONNEL.cg$table.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind.DELETE;
    cg$JOURNAL_SUIVI_PERSONNEL.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$BDR_JOURNAL_SUIVI_PERSONNEL
BEFORE DELETE ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
DECLARE
    cg$pk cg$JOURNAL_SUIVI_PERSONNEL.cg$pk_type;
    cg$rec cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$ind cg$JOURNAL_SUIVI_PERSONNEL.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_JSP  := :old.ID_JSP;
    cg$rec.ID_JSP := :old.ID_JSP;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_JSP := :old.ID_JSP;
    cg$rec.ID_SPC := :old.ID_SPC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_SPC := :old.ID_SPC;
    cg$rec.ID_FC := :old.ID_FC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_FC := :old.ID_FC;
    cg$rec.ID_CPT := :old.ID_CPT;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPT := :old.ID_CPT;
    cg$rec.ID_DC := :old.ID_DC;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_DC := :old.ID_DC;
    cg$rec.ID_CPTT := :old.ID_CPTT;
    cg$JOURNAL_SUIVI_PERSONNEL.cg$table(cg$JOURNAL_SUIVI_PERSONNEL.idx).ID_CPTT := :old.ID_CPTT;


    cg$JOURNAL_SUIVI_PERSONNEL.idx := cg$JOURNAL_SUIVI_PERSONNEL.idx + 1;

    if not (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) then
        cg$JOURNAL_SUIVI_PERSONNEL.validate_domain_cascade_delete(cg$rec);   
        cg$JOURNAL_SUIVI_PERSONNEL.del(cg$pk, FALSE);
        cg$JOURNAL_SUIVI_PERSONNEL.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_JOURNAL_SUIVI_PERSONNEL, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_JOURNAL_SUIVI_PERSONNEL
AFTER DELETE ON JOURNAL_SUIVI_PERSONNEL FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_JOURNAL_SUIVI_PERSONNEL
/

PROMPT Creating After Delete Statement Trigger on 'JOURNAL_SUIVI_PERSONNEL'
CREATE OR REPLACE TRIGGER cg$ADS_JOURNAL_SUIVI_PERSONNEL
AFTER DELETE ON JOURNAL_SUIVI_PERSONNEL
DECLARE
    idx        BINARY_INTEGER := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.FIRST;
    cg$rec   cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
    cg$old_rec   cg$JOURNAL_SUIVI_PERSONNEL.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$JOURNAL_SUIVI_PERSONNEL.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_JSP := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_JSP;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_JSP := TRUE;
            cg$rec.ID_SPC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_SPC;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_SPC := TRUE;
            cg$rec.ID_DC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_DC;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_DC := TRUE;
            cg$rec.ID_FC := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_FC;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_FC := TRUE;
            cg$rec.ID_CPT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPT;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_CPT := TRUE;
            cg$rec.ID_CPTT := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).ID_CPTT;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).ID_CPTT := TRUE;
            cg$rec.TYPE_ENTREE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).TYPE_ENTREE;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).TYPE_ENTREE := TRUE;
            cg$rec.DATE_CREATION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_CREATION;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.LIBELLE := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).LIBELLE;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).LIBELLE := TRUE;
            cg$rec.DATE_MAJ := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DATE_MAJ;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).DATE_MAJ := TRUE;
            cg$rec.DESCRIPTION := cg$JOURNAL_SUIVI_PERSONNEL.cg$table(idx).DESCRIPTION;
            cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx).DESCRIPTION := TRUE;

            cg$JOURNAL_SUIVI_PERSONNEL.validate_foreign_keys_del(cg$rec);
            cg$JOURNAL_SUIVI_PERSONNEL.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$JOURNAL_SUIVI_PERSONNEL.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$JOURNAL_SUIVI_PERSONNEL.cascade_delete(cg$rec);
            cg$JOURNAL_SUIVI_PERSONNEL.domain_cascade_delete(cg$rec);             

            idx := cg$JOURNAL_SUIVI_PERSONNEL.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



