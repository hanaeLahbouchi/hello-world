
PROMPT Creating Trigger Logic for Table 'PROMOTION'
PROMPT Creating Before Insert Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BIS_PROMOTION
BEFORE INSERT ON PROMOTION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$PROMOTION.cg$table.DELETE;
    cg$PROMOTION.cg$tableind.DELETE;
    cg$PROMOTION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BIR_PROMOTION
BEFORE INSERT ON PROMOTION FOR EACH ROW
DECLARE
    cg$rec cg$PROMOTION.cg$row_type;
    cg$ind cg$PROMOTION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.SIGLE_PRO := :new.SIGLE_PRO;
    cg$ind.SIGLE_PRO := TRUE;
    cg$rec.NB_ETU_SOUHAITE := :new.NB_ETU_SOUHAITE;
    cg$ind.NB_ETU_SOUHAITE := TRUE;
    cg$rec.ETAT_PRESELECTION := :new.ETAT_PRESELECTION;
    cg$ind.ETAT_PRESELECTION := TRUE;
    cg$rec.DATE_RENTREE := :new.DATE_RENTREE;
    cg$ind.DATE_RENTREE := TRUE;
    cg$rec.LIEU_RENTREE := :new.LIEU_RENTREE;
    cg$ind.LIEU_RENTREE := TRUE;
    cg$rec.DATE_REPONSE_LP := :new.DATE_REPONSE_LP;
    cg$ind.DATE_REPONSE_LP := TRUE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;
    cg$rec.DATE_REPONSE_LALP := :new.DATE_REPONSE_LALP;
    cg$ind.DATE_REPONSE_LALP := TRUE;
    cg$rec.PROCESSUS_STAGE := :new.PROCESSUS_STAGE;
    cg$ind.PROCESSUS_STAGE := TRUE;
    cg$rec.NO_BAREME := :new.NO_BAREME;
    cg$ind.NO_BAREME := TRUE;
    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION := TRUE;

    if not (cg$PROMOTION.called_from_package) then
        cg$PROMOTION.validate_arc(cg$rec);
        cg$PROMOTION.validate_domain(cg$rec);

        cg$PROMOTION.ins(cg$rec, cg$ind, FALSE);
        cg$PROMOTION.called_from_package := FALSE;
    end if;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).SIGLE_PRO := cg$rec.SIGLE_PRO;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).SIGLE_PRO := cg$ind.SIGLE_PRO;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NB_ETU_SOUHAITE := cg$rec.NB_ETU_SOUHAITE;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).NB_ETU_SOUHAITE := cg$ind.NB_ETU_SOUHAITE;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).ETAT_PRESELECTION := cg$rec.ETAT_PRESELECTION;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).ETAT_PRESELECTION := cg$ind.ETAT_PRESELECTION;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_RENTREE := cg$rec.DATE_RENTREE;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).DATE_RENTREE := cg$ind.DATE_RENTREE;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).LIEU_RENTREE := cg$rec.LIEU_RENTREE;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).LIEU_RENTREE := cg$ind.LIEU_RENTREE;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_REPONSE_LP := cg$rec.DATE_REPONSE_LP;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).DATE_REPONSE_LP := cg$ind.DATE_REPONSE_LP;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_REPONSE_LALP := cg$rec.DATE_REPONSE_LALP;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).DATE_REPONSE_LALP := cg$ind.DATE_REPONSE_LALP;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).PROCESSUS_STAGE := cg$rec.PROCESSUS_STAGE;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).PROCESSUS_STAGE := cg$ind.PROCESSUS_STAGE;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_BAREME := cg$rec.NO_BAREME;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).NO_BAREME := cg$ind.NO_BAREME;

    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_EVALUATION := cg$rec.NO_EVALUATION;
    cg$PROMOTION.cg$tableind(cg$PROMOTION.idx).NO_EVALUATION := cg$ind.NO_EVALUATION;

    cg$PROMOTION.idx := cg$PROMOTION.idx + 1;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.SIGLE_PRO := cg$rec.SIGLE_PRO;
    :new.NB_ETU_SOUHAITE := cg$rec.NB_ETU_SOUHAITE;
    :new.ETAT_PRESELECTION := cg$rec.ETAT_PRESELECTION;
    :new.DATE_RENTREE := cg$rec.DATE_RENTREE;
    :new.LIEU_RENTREE := cg$rec.LIEU_RENTREE;
    :new.DATE_REPONSE_LP := cg$rec.DATE_REPONSE_LP;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.DATE_REPONSE_LALP := cg$rec.DATE_REPONSE_LALP;
    :new.PROCESSUS_STAGE := cg$rec.PROCESSUS_STAGE;
    :new.NO_BAREME := cg$rec.NO_BAREME;
    :new.NO_EVALUATION := cg$rec.NO_EVALUATION;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_PROMOTION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_PROMOTION
AFTER INSERT ON PROMOTION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_PROMOTION
/

PROMPT Creating After Insert Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$AIS_PROMOTION
AFTER INSERT ON PROMOTION
DECLARE
    idx      BINARY_INTEGER := cg$PROMOTION.cg$table.FIRST;
    cg$rec   cg$PROMOTION.cg$row_type;
    cg$old_rec   cg$PROMOTION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$PROMOTION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$PROMOTION.cg$table(idx).ANNEE_PRO;
            cg$rec.SIGLE_PRO := cg$PROMOTION.cg$table(idx).SIGLE_PRO;
            cg$rec.NB_ETU_SOUHAITE := cg$PROMOTION.cg$table(idx).NB_ETU_SOUHAITE;
            cg$rec.ETAT_PRESELECTION := cg$PROMOTION.cg$table(idx).ETAT_PRESELECTION;
            cg$rec.DATE_RENTREE := cg$PROMOTION.cg$table(idx).DATE_RENTREE;
            cg$rec.LIEU_RENTREE := cg$PROMOTION.cg$table(idx).LIEU_RENTREE;
            cg$rec.DATE_REPONSE_LP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LP;
            cg$rec.COMMENTAIRE := cg$PROMOTION.cg$table(idx).COMMENTAIRE;
            cg$rec.DATE_REPONSE_LALP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LALP;
            cg$rec.PROCESSUS_STAGE := cg$PROMOTION.cg$table(idx).PROCESSUS_STAGE;
            cg$rec.NO_BAREME := cg$PROMOTION.cg$table(idx).NO_BAREME;
            cg$rec.NO_EVALUATION := cg$PROMOTION.cg$table(idx).NO_EVALUATION;

            cg$PROMOTION.validate_foreign_keys_ins(cg$rec);

            cg$PROMOTION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$PROMOTION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$PROMOTION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BUS_PROMOTION
BEFORE UPDATE ON PROMOTION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$PROMOTION.cg$table.DELETE;
    cg$PROMOTION.cg$tableind.DELETE;
    cg$PROMOTION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BUR_PROMOTION
BEFORE UPDATE ON PROMOTION FOR EACH ROW
DECLARE
    cg$rec     cg$PROMOTION.cg$row_type;
    cg$ind     cg$PROMOTION.cg$ind_type;
    cg$old_rec cg$PROMOTION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.SIGLE_PRO := :new.SIGLE_PRO;
    cg$ind.SIGLE_PRO :=    (:new.SIGLE_PRO IS NULL AND :old.SIGLE_PRO IS NOT NULL )
                        OR (:new.SIGLE_PRO IS NOT NULL AND :old.SIGLE_PRO IS NULL)
                        OR NOT(:new.SIGLE_PRO = :old.SIGLE_PRO) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).SIGLE_PRO := :old.SIGLE_PRO;
    cg$rec.NB_ETU_SOUHAITE := :new.NB_ETU_SOUHAITE;
    cg$ind.NB_ETU_SOUHAITE :=    (:new.NB_ETU_SOUHAITE IS NULL AND :old.NB_ETU_SOUHAITE IS NOT NULL )
                        OR (:new.NB_ETU_SOUHAITE IS NOT NULL AND :old.NB_ETU_SOUHAITE IS NULL)
                        OR NOT(:new.NB_ETU_SOUHAITE = :old.NB_ETU_SOUHAITE) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NB_ETU_SOUHAITE := :old.NB_ETU_SOUHAITE;
    cg$rec.ETAT_PRESELECTION := :new.ETAT_PRESELECTION;
    cg$ind.ETAT_PRESELECTION :=    (:new.ETAT_PRESELECTION IS NULL AND :old.ETAT_PRESELECTION IS NOT NULL )
                        OR (:new.ETAT_PRESELECTION IS NOT NULL AND :old.ETAT_PRESELECTION IS NULL)
                        OR NOT(:new.ETAT_PRESELECTION = :old.ETAT_PRESELECTION) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).ETAT_PRESELECTION := :old.ETAT_PRESELECTION;
    cg$rec.DATE_RENTREE := :new.DATE_RENTREE;
    cg$ind.DATE_RENTREE :=    (:new.DATE_RENTREE IS NULL AND :old.DATE_RENTREE IS NOT NULL )
                        OR (:new.DATE_RENTREE IS NOT NULL AND :old.DATE_RENTREE IS NULL)
                        OR NOT(:new.DATE_RENTREE = :old.DATE_RENTREE) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_RENTREE := :old.DATE_RENTREE;
    cg$rec.LIEU_RENTREE := :new.LIEU_RENTREE;
    cg$ind.LIEU_RENTREE :=    (:new.LIEU_RENTREE IS NULL AND :old.LIEU_RENTREE IS NOT NULL )
                        OR (:new.LIEU_RENTREE IS NOT NULL AND :old.LIEU_RENTREE IS NULL)
                        OR NOT(:new.LIEU_RENTREE = :old.LIEU_RENTREE) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).LIEU_RENTREE := :old.LIEU_RENTREE;
    cg$rec.DATE_REPONSE_LP := :new.DATE_REPONSE_LP;
    cg$ind.DATE_REPONSE_LP :=    (:new.DATE_REPONSE_LP IS NULL AND :old.DATE_REPONSE_LP IS NOT NULL )
                        OR (:new.DATE_REPONSE_LP IS NOT NULL AND :old.DATE_REPONSE_LP IS NULL)
                        OR NOT(:new.DATE_REPONSE_LP = :old.DATE_REPONSE_LP) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_REPONSE_LP := :old.DATE_REPONSE_LP;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).COMMENTAIRE := :old.COMMENTAIRE;
    cg$rec.DATE_REPONSE_LALP := :new.DATE_REPONSE_LALP;
    cg$ind.DATE_REPONSE_LALP :=    (:new.DATE_REPONSE_LALP IS NULL AND :old.DATE_REPONSE_LALP IS NOT NULL )
                        OR (:new.DATE_REPONSE_LALP IS NOT NULL AND :old.DATE_REPONSE_LALP IS NULL)
                        OR NOT(:new.DATE_REPONSE_LALP = :old.DATE_REPONSE_LALP) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).DATE_REPONSE_LALP := :old.DATE_REPONSE_LALP;
    cg$rec.PROCESSUS_STAGE := :new.PROCESSUS_STAGE;
    cg$ind.PROCESSUS_STAGE :=    (:new.PROCESSUS_STAGE IS NULL AND :old.PROCESSUS_STAGE IS NOT NULL )
                        OR (:new.PROCESSUS_STAGE IS NOT NULL AND :old.PROCESSUS_STAGE IS NULL)
                        OR NOT(:new.PROCESSUS_STAGE = :old.PROCESSUS_STAGE) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).PROCESSUS_STAGE := :old.PROCESSUS_STAGE;
    cg$rec.NO_BAREME := :new.NO_BAREME;
    cg$ind.NO_BAREME :=    (:new.NO_BAREME IS NULL AND :old.NO_BAREME IS NOT NULL )
                        OR (:new.NO_BAREME IS NOT NULL AND :old.NO_BAREME IS NULL)
                        OR NOT(:new.NO_BAREME = :old.NO_BAREME) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_BAREME := :old.NO_BAREME;
    cg$rec.NO_EVALUATION := :new.NO_EVALUATION;
    cg$ind.NO_EVALUATION :=    (:new.NO_EVALUATION IS NULL AND :old.NO_EVALUATION IS NOT NULL )
                        OR (:new.NO_EVALUATION IS NOT NULL AND :old.NO_EVALUATION IS NULL)
                        OR NOT(:new.NO_EVALUATION = :old.NO_EVALUATION) ;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_EVALUATION := :old.NO_EVALUATION;


    cg$PROMOTION.idx := cg$PROMOTION.idx + 1;

    if not (cg$PROMOTION.called_from_package) then
        cg$PROMOTION.validate_arc(cg$rec);
        cg$PROMOTION.validate_domain(cg$rec, cg$ind);
        cg$PROMOTION.validate_domain_cascade_update(cg$old_rec);   

        cg$PROMOTION.upd(cg$rec, cg$ind, FALSE);
        cg$PROMOTION.called_from_package := FALSE;
    end if;

    :new.SIGLE_PRO := cg$rec.SIGLE_PRO;
    :new.NB_ETU_SOUHAITE := cg$rec.NB_ETU_SOUHAITE;
    :new.ETAT_PRESELECTION := cg$rec.ETAT_PRESELECTION;
    :new.DATE_RENTREE := cg$rec.DATE_RENTREE;
    :new.LIEU_RENTREE := cg$rec.LIEU_RENTREE;
    :new.DATE_REPONSE_LP := cg$rec.DATE_REPONSE_LP;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.DATE_REPONSE_LALP := cg$rec.DATE_REPONSE_LALP;
    :new.PROCESSUS_STAGE := cg$rec.PROCESSUS_STAGE;
    :new.NO_BAREME := cg$rec.NO_BAREME;
    :new.NO_EVALUATION := cg$rec.NO_EVALUATION;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

PROMPT Creating After Update Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$AUS_PROMOTION
AFTER UPDATE ON PROMOTION
DECLARE
    idx        BINARY_INTEGER := cg$PROMOTION.cg$table.FIRST;
    cg$old_rec cg$PROMOTION.cg$row_type;
    cg$rec     cg$PROMOTION.cg$row_type;
    cg$ind     cg$PROMOTION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ANNEE_PRO := cg$PROMOTION.cg$table(idx).ANNEE_PRO;
        cg$old_rec.SIGLE_PRO := cg$PROMOTION.cg$table(idx).SIGLE_PRO;
        cg$old_rec.NB_ETU_SOUHAITE := cg$PROMOTION.cg$table(idx).NB_ETU_SOUHAITE;
        cg$old_rec.ETAT_PRESELECTION := cg$PROMOTION.cg$table(idx).ETAT_PRESELECTION;
        cg$old_rec.DATE_RENTREE := cg$PROMOTION.cg$table(idx).DATE_RENTREE;
        cg$old_rec.LIEU_RENTREE := cg$PROMOTION.cg$table(idx).LIEU_RENTREE;
        cg$old_rec.DATE_REPONSE_LP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LP;
        cg$old_rec.COMMENTAIRE := cg$PROMOTION.cg$table(idx).COMMENTAIRE;
        cg$old_rec.DATE_REPONSE_LALP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LALP;
        cg$old_rec.PROCESSUS_STAGE := cg$PROMOTION.cg$table(idx).PROCESSUS_STAGE;
        cg$old_rec.NO_BAREME := cg$PROMOTION.cg$table(idx).NO_BAREME;
        cg$old_rec.NO_EVALUATION := cg$PROMOTION.cg$table(idx).NO_EVALUATION;

    IF NOT (cg$PROMOTION.called_from_package) THEN
        idx := cg$PROMOTION.cg$table.NEXT(idx);
        cg$rec.ANNEE_PRO := cg$PROMOTION.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.SIGLE_PRO := cg$PROMOTION.cg$table(idx).SIGLE_PRO;
        cg$ind.SIGLE_PRO := updating('SIGLE_PRO');
        cg$rec.NB_ETU_SOUHAITE := cg$PROMOTION.cg$table(idx).NB_ETU_SOUHAITE;
        cg$ind.NB_ETU_SOUHAITE := updating('NB_ETU_SOUHAITE');
        cg$rec.ETAT_PRESELECTION := cg$PROMOTION.cg$table(idx).ETAT_PRESELECTION;
        cg$ind.ETAT_PRESELECTION := updating('ETAT_PRESELECTION');
        cg$rec.DATE_RENTREE := cg$PROMOTION.cg$table(idx).DATE_RENTREE;
        cg$ind.DATE_RENTREE := updating('DATE_RENTREE');
        cg$rec.LIEU_RENTREE := cg$PROMOTION.cg$table(idx).LIEU_RENTREE;
        cg$ind.LIEU_RENTREE := updating('LIEU_RENTREE');
        cg$rec.DATE_REPONSE_LP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LP;
        cg$ind.DATE_REPONSE_LP := updating('DATE_REPONSE_LP');
        cg$rec.COMMENTAIRE := cg$PROMOTION.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');
        cg$rec.DATE_REPONSE_LALP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LALP;
        cg$ind.DATE_REPONSE_LALP := updating('DATE_REPONSE_LALP');
        cg$rec.PROCESSUS_STAGE := cg$PROMOTION.cg$table(idx).PROCESSUS_STAGE;
        cg$ind.PROCESSUS_STAGE := updating('PROCESSUS_STAGE');
        cg$rec.NO_BAREME := cg$PROMOTION.cg$table(idx).NO_BAREME;
        cg$ind.NO_BAREME := updating('NO_BAREME');
        cg$rec.NO_EVALUATION := cg$PROMOTION.cg$table(idx).NO_EVALUATION;
        cg$ind.NO_EVALUATION := updating('NO_EVALUATION');

        cg$PROMOTION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$PROMOTION.upd_denorm2( cg$rec,
                                       cg$PROMOTION.cg$tableind(idx)
                                     );
        cg$PROMOTION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$PROMOTION.cg$tableind(idx)
								                  );
        cg$PROMOTION.cascade_update(cg$rec, cg$old_rec);
        cg$PROMOTION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$PROMOTION.called_from_package := FALSE;
	END IF;
        idx := cg$PROMOTION.cg$table.NEXT(idx);
    END LOOP;

    cg$PROMOTION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BDS_PROMOTION
BEFORE DELETE ON PROMOTION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$PROMOTION.cg$table.DELETE;
    cg$PROMOTION.cg$tableind.DELETE;
    cg$PROMOTION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$BDR_PROMOTION
BEFORE DELETE ON PROMOTION FOR EACH ROW
DECLARE
    cg$pk cg$PROMOTION.cg$pk_type;
    cg$rec cg$PROMOTION.cg$row_type;
    cg$ind cg$PROMOTION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_EVALUATION := :old.NO_EVALUATION;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_EVALUATION := :old.NO_EVALUATION;
    cg$rec.NO_BAREME := :old.NO_BAREME;
    cg$PROMOTION.cg$table(cg$PROMOTION.idx).NO_BAREME := :old.NO_BAREME;


    cg$PROMOTION.idx := cg$PROMOTION.idx + 1;

    if not (cg$PROMOTION.called_from_package) then
        cg$PROMOTION.validate_domain_cascade_delete(cg$rec);   
        cg$PROMOTION.del(cg$pk, FALSE);
        cg$PROMOTION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_PROMOTION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_PROMOTION
AFTER DELETE ON PROMOTION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_PROMOTION
/

PROMPT Creating After Delete Statement Trigger on 'PROMOTION'
CREATE OR REPLACE TRIGGER cg$ADS_PROMOTION
AFTER DELETE ON PROMOTION
DECLARE
    idx        BINARY_INTEGER := cg$PROMOTION.cg$table.FIRST;
    cg$rec   cg$PROMOTION.cg$row_type;
    cg$old_rec   cg$PROMOTION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$PROMOTION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$PROMOTION.cg$table(idx).ANNEE_PRO;
            cg$PROMOTION.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.SIGLE_PRO := cg$PROMOTION.cg$table(idx).SIGLE_PRO;
            cg$PROMOTION.cg$tableind(idx).SIGLE_PRO := TRUE;
            cg$rec.NB_ETU_SOUHAITE := cg$PROMOTION.cg$table(idx).NB_ETU_SOUHAITE;
            cg$PROMOTION.cg$tableind(idx).NB_ETU_SOUHAITE := TRUE;
            cg$rec.ETAT_PRESELECTION := cg$PROMOTION.cg$table(idx).ETAT_PRESELECTION;
            cg$PROMOTION.cg$tableind(idx).ETAT_PRESELECTION := TRUE;
            cg$rec.DATE_RENTREE := cg$PROMOTION.cg$table(idx).DATE_RENTREE;
            cg$PROMOTION.cg$tableind(idx).DATE_RENTREE := TRUE;
            cg$rec.LIEU_RENTREE := cg$PROMOTION.cg$table(idx).LIEU_RENTREE;
            cg$PROMOTION.cg$tableind(idx).LIEU_RENTREE := TRUE;
            cg$rec.DATE_REPONSE_LP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LP;
            cg$PROMOTION.cg$tableind(idx).DATE_REPONSE_LP := TRUE;
            cg$rec.COMMENTAIRE := cg$PROMOTION.cg$table(idx).COMMENTAIRE;
            cg$PROMOTION.cg$tableind(idx).COMMENTAIRE := TRUE;
            cg$rec.DATE_REPONSE_LALP := cg$PROMOTION.cg$table(idx).DATE_REPONSE_LALP;
            cg$PROMOTION.cg$tableind(idx).DATE_REPONSE_LALP := TRUE;
            cg$rec.PROCESSUS_STAGE := cg$PROMOTION.cg$table(idx).PROCESSUS_STAGE;
            cg$PROMOTION.cg$tableind(idx).PROCESSUS_STAGE := TRUE;
            cg$rec.NO_BAREME := cg$PROMOTION.cg$table(idx).NO_BAREME;
            cg$PROMOTION.cg$tableind(idx).NO_BAREME := TRUE;
            cg$rec.NO_EVALUATION := cg$PROMOTION.cg$table(idx).NO_EVALUATION;
            cg$PROMOTION.cg$tableind(idx).NO_EVALUATION := TRUE;

            cg$PROMOTION.validate_foreign_keys_del(cg$rec);
            cg$PROMOTION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$PROMOTION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$PROMOTION.cascade_delete(cg$rec);
            cg$PROMOTION.domain_cascade_delete(cg$rec);             

            idx := cg$PROMOTION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



