
PROMPT Creating Trigger Logic for Table 'FA'
PROMPT Creating Before Insert Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BIS_FA
BEFORE INSERT ON FA
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$FA.cg$table.DELETE;
    cg$FA.cg$tableind.DELETE;
    cg$FA.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BIR_FA
BEFORE INSERT ON FA FOR EACH ROW
DECLARE
    cg$rec cg$FA.cg$row_type;
    cg$ind cg$FA.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_SEQUENCE := :new.NO_SEQUENCE;
    cg$ind.NO_SEQUENCE := TRUE;
    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA := TRUE;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM := TRUE;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC := TRUE;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS := TRUE;
    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS := TRUE;
    cg$rec.NO_FA := :new.NO_FA;
    cg$ind.NO_FA := TRUE;
    cg$rec.SIGLE_FA := :new.SIGLE_FA;
    cg$ind.SIGLE_FA := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION_TEXTUELLE := FALSE;
    cg$rec.DATE_ELABORATION := :new.DATE_ELABORATION;
    cg$ind.DATE_ELABORATION := TRUE;
    cg$rec.DATE_DEBUT_ESTIME := :new.DATE_DEBUT_ESTIME;
    cg$ind.DATE_DEBUT_ESTIME := TRUE;
    cg$rec.DATE_FIN_ESTIME := :new.DATE_FIN_ESTIME;
    cg$ind.DATE_FIN_ESTIME := TRUE;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
	cg$ind.AUTRES_RES_PEDA := FALSE;

    if not (cg$FA.called_from_package) then
        cg$FA.validate_arc(cg$rec);
        cg$FA.validate_domain(cg$rec);

        cg$FA.ins(cg$rec, cg$ind, FALSE);
        cg$FA.called_from_package := FALSE;
    end if;

    cg$FA.cg$table(cg$FA.idx).NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    cg$FA.cg$tableind(cg$FA.idx).NO_SEQUENCE := cg$ind.NO_SEQUENCE;

    cg$FA.cg$table(cg$FA.idx).ID_FA := cg$rec.ID_FA;
    cg$FA.cg$tableind(cg$FA.idx).ID_FA := cg$ind.ID_FA;

    cg$FA.cg$table(cg$FA.idx).CODE_COM := cg$rec.CODE_COM;
    cg$FA.cg$tableind(cg$FA.idx).CODE_COM := cg$ind.CODE_COM;

    cg$FA.cg$table(cg$FA.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$FA.cg$tableind(cg$FA.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$FA.cg$table(cg$FA.idx).ID_EC := cg$rec.ID_EC;
    cg$FA.cg$tableind(cg$FA.idx).ID_EC := cg$ind.ID_EC;

    cg$FA.cg$table(cg$FA.idx).ID_FAS := cg$rec.ID_FAS;
    cg$FA.cg$tableind(cg$FA.idx).ID_FAS := cg$ind.ID_FAS;

    cg$FA.cg$table(cg$FA.idx).NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    cg$FA.cg$tableind(cg$FA.idx).NO_VERSION_VFAS := cg$ind.NO_VERSION_VFAS;

    cg$FA.cg$table(cg$FA.idx).NO_FA := cg$rec.NO_FA;
    cg$FA.cg$tableind(cg$FA.idx).NO_FA := cg$ind.NO_FA;

    cg$FA.cg$table(cg$FA.idx).SIGLE_FA := cg$rec.SIGLE_FA;
    cg$FA.cg$tableind(cg$FA.idx).SIGLE_FA := cg$ind.SIGLE_FA;

    cg$FA.cg$table(cg$FA.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$FA.cg$tableind(cg$FA.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$FA.cg$table(cg$FA.idx).DESCRIPTION_TEXTUELLE := cg$rec.DESCRIPTION_TEXTUELLE;
    cg$FA.cg$tableind(cg$FA.idx).DESCRIPTION_TEXTUELLE := cg$ind.DESCRIPTION_TEXTUELLE;

    cg$FA.cg$table(cg$FA.idx).DATE_ELABORATION := cg$rec.DATE_ELABORATION;
    cg$FA.cg$tableind(cg$FA.idx).DATE_ELABORATION := cg$ind.DATE_ELABORATION;

    cg$FA.cg$table(cg$FA.idx).DATE_DEBUT_ESTIME := cg$rec.DATE_DEBUT_ESTIME;
    cg$FA.cg$tableind(cg$FA.idx).DATE_DEBUT_ESTIME := cg$ind.DATE_DEBUT_ESTIME;

    cg$FA.cg$table(cg$FA.idx).DATE_FIN_ESTIME := cg$rec.DATE_FIN_ESTIME;
    cg$FA.cg$tableind(cg$FA.idx).DATE_FIN_ESTIME := cg$ind.DATE_FIN_ESTIME;

    cg$FA.cg$table(cg$FA.idx).AUTRES_RES_PEDA := cg$rec.AUTRES_RES_PEDA;
    cg$FA.cg$tableind(cg$FA.idx).AUTRES_RES_PEDA := cg$ind.AUTRES_RES_PEDA;

    cg$FA.idx := cg$FA.idx + 1;

    :new.NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    :new.ID_FA := cg$rec.ID_FA;
    :new.CODE_COM := cg$rec.CODE_COM;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.ID_EC := cg$rec.ID_EC;
    :new.ID_FAS := cg$rec.ID_FAS;
    :new.NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    :new.NO_FA := cg$rec.NO_FA;
    :new.SIGLE_FA := cg$rec.SIGLE_FA;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
    :new.DATE_ELABORATION := cg$rec.DATE_ELABORATION;
    :new.DATE_DEBUT_ESTIME := cg$rec.DATE_DEBUT_ESTIME;
    :new.DATE_FIN_ESTIME := cg$rec.DATE_FIN_ESTIME;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_FA, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_FA
AFTER INSERT ON FA FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_FA
/

PROMPT Creating After Insert Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$AIS_FA
AFTER INSERT ON FA
DECLARE
    idx      BINARY_INTEGER := cg$FA.cg$table.FIRST;
    cg$rec   cg$FA.cg$row_type;
    cg$old_rec   cg$FA.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$FA.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_SEQUENCE := cg$FA.cg$table(idx).NO_SEQUENCE;
            cg$rec.ID_FA := cg$FA.cg$table(idx).ID_FA;
            cg$rec.CODE_COM := cg$FA.cg$table(idx).CODE_COM;
            cg$rec.NO_ENSEIGNANT := cg$FA.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.ID_EC := cg$FA.cg$table(idx).ID_EC;
            cg$rec.ID_FAS := cg$FA.cg$table(idx).ID_FAS;
            cg$rec.NO_VERSION_VFAS := cg$FA.cg$table(idx).NO_VERSION_VFAS;
            cg$rec.NO_FA := cg$FA.cg$table(idx).NO_FA;
            cg$rec.SIGLE_FA := cg$FA.cg$table(idx).SIGLE_FA;
            cg$rec.DESIGNATION := cg$FA.cg$table(idx).DESIGNATION;
            cg$rec.DESCRIPTION_TEXTUELLE := cg$FA.cg$table(idx).DESCRIPTION_TEXTUELLE;
            cg$rec.DATE_ELABORATION := cg$FA.cg$table(idx).DATE_ELABORATION;
            cg$rec.DATE_DEBUT_ESTIME := cg$FA.cg$table(idx).DATE_DEBUT_ESTIME;
            cg$rec.DATE_FIN_ESTIME := cg$FA.cg$table(idx).DATE_FIN_ESTIME;
            cg$rec.AUTRES_RES_PEDA := cg$FA.cg$table(idx).AUTRES_RES_PEDA;

            cg$FA.validate_foreign_keys_ins(cg$rec);

            cg$FA.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FA.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$FA.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BUS_FA
BEFORE UPDATE ON FA
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$FA.cg$table.DELETE;
    cg$FA.cg$tableind.DELETE;
    cg$FA.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BUR_FA
BEFORE UPDATE ON FA FOR EACH ROW
DECLARE
    cg$rec     cg$FA.cg$row_type;
    cg$ind     cg$FA.cg$ind_type;
    cg$old_rec cg$FA.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_SEQUENCE := :new.NO_SEQUENCE;
    cg$ind.NO_SEQUENCE :=    (:new.NO_SEQUENCE IS NULL AND :old.NO_SEQUENCE IS NOT NULL )
                        OR (:new.NO_SEQUENCE IS NOT NULL AND :old.NO_SEQUENCE IS NULL)
                        OR NOT(:new.NO_SEQUENCE = :old.NO_SEQUENCE) ;
    cg$FA.cg$table(cg$FA.idx).NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$rec.ID_FA := :new.ID_FA;
    cg$ind.ID_FA :=    (:new.ID_FA IS NULL AND :old.ID_FA IS NOT NULL )
                        OR (:new.ID_FA IS NOT NULL AND :old.ID_FA IS NULL)
                        OR NOT(:new.ID_FA = :old.ID_FA) ;
    cg$FA.cg$table(cg$FA.idx).ID_FA := :old.ID_FA;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM :=    (:new.CODE_COM IS NULL AND :old.CODE_COM IS NOT NULL )
                        OR (:new.CODE_COM IS NOT NULL AND :old.CODE_COM IS NULL)
                        OR NOT(:new.CODE_COM = :old.CODE_COM) ;
    cg$FA.cg$table(cg$FA.idx).CODE_COM := :old.CODE_COM;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$FA.cg$table(cg$FA.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.ID_EC := :new.ID_EC;
    cg$ind.ID_EC :=    (:new.ID_EC IS NULL AND :old.ID_EC IS NOT NULL )
                        OR (:new.ID_EC IS NOT NULL AND :old.ID_EC IS NULL)
                        OR NOT(:new.ID_EC = :old.ID_EC) ;
    cg$FA.cg$table(cg$FA.idx).ID_EC := :old.ID_EC;
    cg$rec.ID_FAS := :new.ID_FAS;
    cg$ind.ID_FAS :=    (:new.ID_FAS IS NULL AND :old.ID_FAS IS NOT NULL )
                        OR (:new.ID_FAS IS NOT NULL AND :old.ID_FAS IS NULL)
                        OR NOT(:new.ID_FAS = :old.ID_FAS) ;
    cg$FA.cg$table(cg$FA.idx).ID_FAS := :old.ID_FAS;
    cg$rec.NO_VERSION_VFAS := :new.NO_VERSION_VFAS;
    cg$ind.NO_VERSION_VFAS :=    (:new.NO_VERSION_VFAS IS NULL AND :old.NO_VERSION_VFAS IS NOT NULL )
                        OR (:new.NO_VERSION_VFAS IS NOT NULL AND :old.NO_VERSION_VFAS IS NULL)
                        OR NOT(:new.NO_VERSION_VFAS = :old.NO_VERSION_VFAS) ;
    cg$FA.cg$table(cg$FA.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$rec.NO_FA := :new.NO_FA;
    cg$ind.NO_FA :=    (:new.NO_FA IS NULL AND :old.NO_FA IS NOT NULL )
                        OR (:new.NO_FA IS NOT NULL AND :old.NO_FA IS NULL)
                        OR NOT(:new.NO_FA = :old.NO_FA) ;
    cg$FA.cg$table(cg$FA.idx).NO_FA := :old.NO_FA;
    cg$rec.SIGLE_FA := :new.SIGLE_FA;
    cg$ind.SIGLE_FA :=    (:new.SIGLE_FA IS NULL AND :old.SIGLE_FA IS NOT NULL )
                        OR (:new.SIGLE_FA IS NOT NULL AND :old.SIGLE_FA IS NULL)
                        OR NOT(:new.SIGLE_FA = :old.SIGLE_FA) ;
    cg$FA.cg$table(cg$FA.idx).SIGLE_FA := :old.SIGLE_FA;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$FA.cg$table(cg$FA.idx).DESIGNATION := :old.DESIGNATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
	cg$ind.DESCRIPTION_TEXTUELLE := FALSE;
    cg$rec.DATE_ELABORATION := :new.DATE_ELABORATION;
    cg$ind.DATE_ELABORATION :=    (:new.DATE_ELABORATION IS NULL AND :old.DATE_ELABORATION IS NOT NULL )
                        OR (:new.DATE_ELABORATION IS NOT NULL AND :old.DATE_ELABORATION IS NULL)
                        OR NOT(:new.DATE_ELABORATION = :old.DATE_ELABORATION) ;
    cg$FA.cg$table(cg$FA.idx).DATE_ELABORATION := :old.DATE_ELABORATION;
    cg$rec.DATE_DEBUT_ESTIME := :new.DATE_DEBUT_ESTIME;
    cg$ind.DATE_DEBUT_ESTIME :=    (:new.DATE_DEBUT_ESTIME IS NULL AND :old.DATE_DEBUT_ESTIME IS NOT NULL )
                        OR (:new.DATE_DEBUT_ESTIME IS NOT NULL AND :old.DATE_DEBUT_ESTIME IS NULL)
                        OR NOT(:new.DATE_DEBUT_ESTIME = :old.DATE_DEBUT_ESTIME) ;
    cg$FA.cg$table(cg$FA.idx).DATE_DEBUT_ESTIME := :old.DATE_DEBUT_ESTIME;
    cg$rec.DATE_FIN_ESTIME := :new.DATE_FIN_ESTIME;
    cg$ind.DATE_FIN_ESTIME :=    (:new.DATE_FIN_ESTIME IS NULL AND :old.DATE_FIN_ESTIME IS NOT NULL )
                        OR (:new.DATE_FIN_ESTIME IS NOT NULL AND :old.DATE_FIN_ESTIME IS NULL)
                        OR NOT(:new.DATE_FIN_ESTIME = :old.DATE_FIN_ESTIME) ;
    cg$FA.cg$table(cg$FA.idx).DATE_FIN_ESTIME := :old.DATE_FIN_ESTIME;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
	cg$ind.AUTRES_RES_PEDA := FALSE;


    cg$FA.idx := cg$FA.idx + 1;

    if not (cg$FA.called_from_package) then
        cg$FA.validate_arc(cg$rec);
        cg$FA.validate_domain(cg$rec, cg$ind);
        cg$FA.validate_domain_cascade_update(cg$old_rec);   

        cg$FA.upd(cg$rec, cg$ind, FALSE);
        cg$FA.called_from_package := FALSE;
    end if;

    :new.NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    :new.CODE_COM := cg$rec.CODE_COM;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.ID_EC := cg$rec.ID_EC;
    :new.ID_FAS := cg$rec.ID_FAS;
    :new.NO_VERSION_VFAS := cg$rec.NO_VERSION_VFAS;
    :new.NO_FA := cg$rec.NO_FA;
    :new.SIGLE_FA := cg$rec.SIGLE_FA;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    -- Warning: Column DESCRIPTION_TEXTUELLE is of type CLOB and not allowed in triggers
    :new.DATE_ELABORATION := cg$rec.DATE_ELABORATION;
    :new.DATE_DEBUT_ESTIME := cg$rec.DATE_DEBUT_ESTIME;
    :new.DATE_FIN_ESTIME := cg$rec.DATE_FIN_ESTIME;
    -- Warning: Column AUTRES_RES_PEDA is of type CLOB and not allowed in triggers
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_FA, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_FA
AFTER UPDATE ON FA FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_FA
/






PROMPT Creating After Update Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$AUS_FA
AFTER UPDATE ON FA
DECLARE
    idx        BINARY_INTEGER := cg$FA.cg$table.FIRST;
    cg$old_rec cg$FA.cg$row_type;
    cg$rec     cg$FA.cg$row_type;
    cg$ind     cg$FA.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_SEQUENCE := cg$FA.cg$table(idx).NO_SEQUENCE;
        cg$old_rec.ID_FA := cg$FA.cg$table(idx).ID_FA;
        cg$old_rec.CODE_COM := cg$FA.cg$table(idx).CODE_COM;
        cg$old_rec.NO_ENSEIGNANT := cg$FA.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.ID_EC := cg$FA.cg$table(idx).ID_EC;
        cg$old_rec.ID_FAS := cg$FA.cg$table(idx).ID_FAS;
        cg$old_rec.NO_VERSION_VFAS := cg$FA.cg$table(idx).NO_VERSION_VFAS;
        cg$old_rec.NO_FA := cg$FA.cg$table(idx).NO_FA;
        cg$old_rec.SIGLE_FA := cg$FA.cg$table(idx).SIGLE_FA;
        cg$old_rec.DESIGNATION := cg$FA.cg$table(idx).DESIGNATION;
        cg$old_rec.DESCRIPTION_TEXTUELLE := cg$FA.cg$table(idx).DESCRIPTION_TEXTUELLE;
        cg$old_rec.DATE_ELABORATION := cg$FA.cg$table(idx).DATE_ELABORATION;
        cg$old_rec.DATE_DEBUT_ESTIME := cg$FA.cg$table(idx).DATE_DEBUT_ESTIME;
        cg$old_rec.DATE_FIN_ESTIME := cg$FA.cg$table(idx).DATE_FIN_ESTIME;
        cg$old_rec.AUTRES_RES_PEDA := cg$FA.cg$table(idx).AUTRES_RES_PEDA;

    IF NOT (cg$FA.called_from_package) THEN
        idx := cg$FA.cg$table.NEXT(idx);
        cg$rec.NO_SEQUENCE := cg$FA.cg$table(idx).NO_SEQUENCE;
        cg$ind.NO_SEQUENCE := updating('NO_SEQUENCE');
        cg$rec.ID_FA := cg$FA.cg$table(idx).ID_FA;
        cg$ind.ID_FA := updating('ID_FA');
        cg$rec.CODE_COM := cg$FA.cg$table(idx).CODE_COM;
        cg$ind.CODE_COM := updating('CODE_COM');
        cg$rec.NO_ENSEIGNANT := cg$FA.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.ID_EC := cg$FA.cg$table(idx).ID_EC;
        cg$ind.ID_EC := updating('ID_EC');
        cg$rec.ID_FAS := cg$FA.cg$table(idx).ID_FAS;
        cg$ind.ID_FAS := updating('ID_FAS');
        cg$rec.NO_VERSION_VFAS := cg$FA.cg$table(idx).NO_VERSION_VFAS;
        cg$ind.NO_VERSION_VFAS := updating('NO_VERSION_VFAS');
        cg$rec.NO_FA := cg$FA.cg$table(idx).NO_FA;
        cg$ind.NO_FA := updating('NO_FA');
        cg$rec.SIGLE_FA := cg$FA.cg$table(idx).SIGLE_FA;
        cg$ind.SIGLE_FA := updating('SIGLE_FA');
        cg$rec.DESIGNATION := cg$FA.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.DESCRIPTION_TEXTUELLE := cg$FA.cg$table(idx).DESCRIPTION_TEXTUELLE;
        cg$ind.DESCRIPTION_TEXTUELLE := updating('DESCRIPTION_TEXTUELLE');
        cg$rec.DATE_ELABORATION := cg$FA.cg$table(idx).DATE_ELABORATION;
        cg$ind.DATE_ELABORATION := updating('DATE_ELABORATION');
        cg$rec.DATE_DEBUT_ESTIME := cg$FA.cg$table(idx).DATE_DEBUT_ESTIME;
        cg$ind.DATE_DEBUT_ESTIME := updating('DATE_DEBUT_ESTIME');
        cg$rec.DATE_FIN_ESTIME := cg$FA.cg$table(idx).DATE_FIN_ESTIME;
        cg$ind.DATE_FIN_ESTIME := updating('DATE_FIN_ESTIME');
        cg$rec.AUTRES_RES_PEDA := cg$FA.cg$table(idx).AUTRES_RES_PEDA;
        cg$ind.AUTRES_RES_PEDA := updating('AUTRES_RES_PEDA');

        cg$FA.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$FA.upd_denorm2( cg$rec,
                                       cg$FA.cg$tableind(idx)
                                     );
        cg$FA.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$FA.cg$tableind(idx)
								                  );
        cg$FA.cascade_update(cg$rec, cg$old_rec);
        cg$FA.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$FA.called_from_package := FALSE;
	END IF;
        idx := cg$FA.cg$table.NEXT(idx);
    END LOOP;

    cg$FA.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BDS_FA
BEFORE DELETE ON FA
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$FA.cg$table.DELETE;
    cg$FA.cg$tableind.DELETE;
    cg$FA.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$BDR_FA
BEFORE DELETE ON FA FOR EACH ROW
DECLARE
    cg$pk cg$FA.cg$pk_type;
    cg$rec cg$FA.cg$row_type;
    cg$ind cg$FA.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_FA  := :old.ID_FA;
    cg$rec.ID_FA := :old.ID_FA;
    cg$FA.cg$table(cg$FA.idx).ID_FA := :old.ID_FA;
    cg$rec.NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$FA.cg$table(cg$FA.idx).NO_SEQUENCE := :old.NO_SEQUENCE;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$FA.cg$table(cg$FA.idx).CODE_COM := :old.CODE_COM;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$FA.cg$table(cg$FA.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.ID_EC := :old.ID_EC;
    cg$FA.cg$table(cg$FA.idx).ID_EC := :old.ID_EC;
    cg$rec.NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$FA.cg$table(cg$FA.idx).NO_VERSION_VFAS := :old.NO_VERSION_VFAS;
    cg$rec.ID_FAS := :old.ID_FAS;
    cg$FA.cg$table(cg$FA.idx).ID_FAS := :old.ID_FAS;


    cg$FA.idx := cg$FA.idx + 1;

    if not (cg$FA.called_from_package) then
        cg$FA.validate_domain_cascade_delete(cg$rec);   
        cg$FA.del(cg$pk, FALSE);
        cg$FA.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_FA, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_FA
AFTER DELETE ON FA FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_FA
/

PROMPT Creating After Delete Statement Trigger on 'FA'
CREATE OR REPLACE TRIGGER cg$ADS_FA
AFTER DELETE ON FA
DECLARE
    idx        BINARY_INTEGER := cg$FA.cg$table.FIRST;
    cg$rec   cg$FA.cg$row_type;
    cg$old_rec   cg$FA.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$FA.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_SEQUENCE := cg$FA.cg$table(idx).NO_SEQUENCE;
            cg$FA.cg$tableind(idx).NO_SEQUENCE := TRUE;
            cg$rec.ID_FA := cg$FA.cg$table(idx).ID_FA;
            cg$FA.cg$tableind(idx).ID_FA := TRUE;
            cg$rec.CODE_COM := cg$FA.cg$table(idx).CODE_COM;
            cg$FA.cg$tableind(idx).CODE_COM := TRUE;
            cg$rec.NO_ENSEIGNANT := cg$FA.cg$table(idx).NO_ENSEIGNANT;
            cg$FA.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.ID_EC := cg$FA.cg$table(idx).ID_EC;
            cg$FA.cg$tableind(idx).ID_EC := TRUE;
            cg$rec.ID_FAS := cg$FA.cg$table(idx).ID_FAS;
            cg$FA.cg$tableind(idx).ID_FAS := TRUE;
            cg$rec.NO_VERSION_VFAS := cg$FA.cg$table(idx).NO_VERSION_VFAS;
            cg$FA.cg$tableind(idx).NO_VERSION_VFAS := TRUE;
            cg$rec.NO_FA := cg$FA.cg$table(idx).NO_FA;
            cg$FA.cg$tableind(idx).NO_FA := TRUE;
            cg$rec.SIGLE_FA := cg$FA.cg$table(idx).SIGLE_FA;
            cg$FA.cg$tableind(idx).SIGLE_FA := TRUE;
            cg$rec.DESIGNATION := cg$FA.cg$table(idx).DESIGNATION;
            cg$FA.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.DESCRIPTION_TEXTUELLE := cg$FA.cg$table(idx).DESCRIPTION_TEXTUELLE;
            cg$FA.cg$tableind(idx).DESCRIPTION_TEXTUELLE := TRUE;
            cg$rec.DATE_ELABORATION := cg$FA.cg$table(idx).DATE_ELABORATION;
            cg$FA.cg$tableind(idx).DATE_ELABORATION := TRUE;
            cg$rec.DATE_DEBUT_ESTIME := cg$FA.cg$table(idx).DATE_DEBUT_ESTIME;
            cg$FA.cg$tableind(idx).DATE_DEBUT_ESTIME := TRUE;
            cg$rec.DATE_FIN_ESTIME := cg$FA.cg$table(idx).DATE_FIN_ESTIME;
            cg$FA.cg$tableind(idx).DATE_FIN_ESTIME := TRUE;
            cg$rec.AUTRES_RES_PEDA := cg$FA.cg$table(idx).AUTRES_RES_PEDA;
            cg$FA.cg$tableind(idx).AUTRES_RES_PEDA := TRUE;

            cg$FA.validate_foreign_keys_del(cg$rec);
            cg$FA.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$FA.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$FA.cascade_delete(cg$rec);
            cg$FA.domain_cascade_delete(cg$rec);             

            idx := cg$FA.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



