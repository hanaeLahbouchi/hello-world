
PROMPT Creating Trigger Logic for Table 'VERSION'
PROMPT Creating Before Insert Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BIS_VERSION
BEFORE INSERT ON VERSION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$VERSION.cg$table.DELETE;
    cg$VERSION.cg$tableind.DELETE;
    cg$VERSION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BIR_VERSION
BEFORE INSERT ON VERSION FOR EACH ROW
DECLARE
    cg$rec cg$VERSION.cg$row_type;
    cg$ind cg$VERSION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_VPRO := :new.NO_VPRO;
    cg$ind.NO_VPRO := TRUE;
    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR := TRUE;
    cg$rec.NO_VERSION := :new.NO_VERSION;
    cg$ind.NO_VERSION := TRUE;
    cg$rec.DATE_LIVRAISON_SOUHAITEE := :new.DATE_LIVRAISON_SOUHAITEE;
    cg$ind.DATE_LIVRAISON_SOUHAITEE := TRUE;
    cg$rec.DATE_RECEPTION_PAPIER := :new.DATE_RECEPTION_PAPIER;
    cg$ind.DATE_RECEPTION_PAPIER := TRUE;
    cg$rec.DATE_RECEPTION_NUMERIQUE := :new.DATE_RECEPTION_NUMERIQUE;
    cg$ind.DATE_RECEPTION_NUMERIQUE := TRUE;
    cg$rec.REFERENCE := :new.REFERENCE;
    cg$ind.REFERENCE := TRUE;
    cg$rec.ETAT_EVALUATION := :new.ETAT_EVALUATION;
    cg$ind.ETAT_EVALUATION := TRUE;
    cg$rec.DATE_EVALUATION := :new.DATE_EVALUATION;
    cg$ind.DATE_EVALUATION := TRUE;
    cg$rec.COMMENTAIRE_EVALUATION := :new.COMMENTAIRE_EVALUATION;
    cg$ind.COMMENTAIRE_EVALUATION := TRUE;
    cg$rec.DATE_DEBRIEFING := :new.DATE_DEBRIEFING;
    cg$ind.DATE_DEBRIEFING := TRUE;
    cg$rec.NOTE_FORMATIVE := :new.NOTE_FORMATIVE;
    cg$ind.NOTE_FORMATIVE := TRUE;

    if not (cg$VERSION.called_from_package) then
        cg$VERSION.validate_arc(cg$rec);
        cg$VERSION.validate_domain(cg$rec);

        cg$VERSION.ins(cg$rec, cg$ind, FALSE);
        cg$VERSION.called_from_package := FALSE;
    end if;

    cg$VERSION.cg$table(cg$VERSION.idx).NO_VPRO := cg$rec.NO_VPRO;
    cg$VERSION.cg$tableind(cg$VERSION.idx).NO_VPRO := cg$ind.NO_VPRO;

    cg$VERSION.cg$table(cg$VERSION.idx).NO_CRR := cg$rec.NO_CRR;
    cg$VERSION.cg$tableind(cg$VERSION.idx).NO_CRR := cg$ind.NO_CRR;

    cg$VERSION.cg$table(cg$VERSION.idx).NO_VERSION := cg$rec.NO_VERSION;
    cg$VERSION.cg$tableind(cg$VERSION.idx).NO_VERSION := cg$ind.NO_VERSION;

    cg$VERSION.cg$table(cg$VERSION.idx).DATE_LIVRAISON_SOUHAITEE := cg$rec.DATE_LIVRAISON_SOUHAITEE;
    cg$VERSION.cg$tableind(cg$VERSION.idx).DATE_LIVRAISON_SOUHAITEE := cg$ind.DATE_LIVRAISON_SOUHAITEE;

    cg$VERSION.cg$table(cg$VERSION.idx).DATE_RECEPTION_PAPIER := cg$rec.DATE_RECEPTION_PAPIER;
    cg$VERSION.cg$tableind(cg$VERSION.idx).DATE_RECEPTION_PAPIER := cg$ind.DATE_RECEPTION_PAPIER;

    cg$VERSION.cg$table(cg$VERSION.idx).DATE_RECEPTION_NUMERIQUE := cg$rec.DATE_RECEPTION_NUMERIQUE;
    cg$VERSION.cg$tableind(cg$VERSION.idx).DATE_RECEPTION_NUMERIQUE := cg$ind.DATE_RECEPTION_NUMERIQUE;

    cg$VERSION.cg$table(cg$VERSION.idx).REFERENCE := cg$rec.REFERENCE;
    cg$VERSION.cg$tableind(cg$VERSION.idx).REFERENCE := cg$ind.REFERENCE;

    cg$VERSION.cg$table(cg$VERSION.idx).ETAT_EVALUATION := cg$rec.ETAT_EVALUATION;
    cg$VERSION.cg$tableind(cg$VERSION.idx).ETAT_EVALUATION := cg$ind.ETAT_EVALUATION;

    cg$VERSION.cg$table(cg$VERSION.idx).DATE_EVALUATION := cg$rec.DATE_EVALUATION;
    cg$VERSION.cg$tableind(cg$VERSION.idx).DATE_EVALUATION := cg$ind.DATE_EVALUATION;

    cg$VERSION.cg$table(cg$VERSION.idx).COMMENTAIRE_EVALUATION := cg$rec.COMMENTAIRE_EVALUATION;
    cg$VERSION.cg$tableind(cg$VERSION.idx).COMMENTAIRE_EVALUATION := cg$ind.COMMENTAIRE_EVALUATION;

    cg$VERSION.cg$table(cg$VERSION.idx).DATE_DEBRIEFING := cg$rec.DATE_DEBRIEFING;
    cg$VERSION.cg$tableind(cg$VERSION.idx).DATE_DEBRIEFING := cg$ind.DATE_DEBRIEFING;

    cg$VERSION.cg$table(cg$VERSION.idx).NOTE_FORMATIVE := cg$rec.NOTE_FORMATIVE;
    cg$VERSION.cg$tableind(cg$VERSION.idx).NOTE_FORMATIVE := cg$ind.NOTE_FORMATIVE;

    cg$VERSION.idx := cg$VERSION.idx + 1;

    :new.NO_VPRO := cg$rec.NO_VPRO;
    :new.NO_CRR := cg$rec.NO_CRR;
    :new.NO_VERSION := cg$rec.NO_VERSION;
    :new.DATE_LIVRAISON_SOUHAITEE := cg$rec.DATE_LIVRAISON_SOUHAITEE;
    :new.DATE_RECEPTION_PAPIER := cg$rec.DATE_RECEPTION_PAPIER;
    :new.DATE_RECEPTION_NUMERIQUE := cg$rec.DATE_RECEPTION_NUMERIQUE;
    :new.REFERENCE := cg$rec.REFERENCE;
    :new.ETAT_EVALUATION := cg$rec.ETAT_EVALUATION;
    :new.DATE_EVALUATION := cg$rec.DATE_EVALUATION;
    :new.COMMENTAIRE_EVALUATION := cg$rec.COMMENTAIRE_EVALUATION;
    :new.DATE_DEBRIEFING := cg$rec.DATE_DEBRIEFING;
    :new.NOTE_FORMATIVE := cg$rec.NOTE_FORMATIVE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_VERSION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_VERSION
AFTER INSERT ON VERSION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_VERSION
/

PROMPT Creating After Insert Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$AIS_VERSION
AFTER INSERT ON VERSION
DECLARE
    idx      BINARY_INTEGER := cg$VERSION.cg$table.FIRST;
    cg$rec   cg$VERSION.cg$row_type;
    cg$old_rec   cg$VERSION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$VERSION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_VPRO := cg$VERSION.cg$table(idx).NO_VPRO;
            cg$rec.NO_CRR := cg$VERSION.cg$table(idx).NO_CRR;
            cg$rec.NO_VERSION := cg$VERSION.cg$table(idx).NO_VERSION;
            cg$rec.DATE_LIVRAISON_SOUHAITEE := cg$VERSION.cg$table(idx).DATE_LIVRAISON_SOUHAITEE;
            cg$rec.DATE_RECEPTION_PAPIER := cg$VERSION.cg$table(idx).DATE_RECEPTION_PAPIER;
            cg$rec.DATE_RECEPTION_NUMERIQUE := cg$VERSION.cg$table(idx).DATE_RECEPTION_NUMERIQUE;
            cg$rec.REFERENCE := cg$VERSION.cg$table(idx).REFERENCE;
            cg$rec.ETAT_EVALUATION := cg$VERSION.cg$table(idx).ETAT_EVALUATION;
            cg$rec.DATE_EVALUATION := cg$VERSION.cg$table(idx).DATE_EVALUATION;
            cg$rec.COMMENTAIRE_EVALUATION := cg$VERSION.cg$table(idx).COMMENTAIRE_EVALUATION;
            cg$rec.DATE_DEBRIEFING := cg$VERSION.cg$table(idx).DATE_DEBRIEFING;
            cg$rec.NOTE_FORMATIVE := cg$VERSION.cg$table(idx).NOTE_FORMATIVE;

            cg$VERSION.validate_foreign_keys_ins(cg$rec);

            cg$VERSION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VERSION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$VERSION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BUS_VERSION
BEFORE UPDATE ON VERSION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$VERSION.cg$table.DELETE;
    cg$VERSION.cg$tableind.DELETE;
    cg$VERSION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BUR_VERSION
BEFORE UPDATE ON VERSION FOR EACH ROW
DECLARE
    cg$rec     cg$VERSION.cg$row_type;
    cg$ind     cg$VERSION.cg$ind_type;
    cg$old_rec cg$VERSION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_VPRO := :new.NO_VPRO;
    cg$ind.NO_VPRO :=    (:new.NO_VPRO IS NULL AND :old.NO_VPRO IS NOT NULL )
                        OR (:new.NO_VPRO IS NOT NULL AND :old.NO_VPRO IS NULL)
                        OR NOT(:new.NO_VPRO = :old.NO_VPRO) ;
    cg$VERSION.cg$table(cg$VERSION.idx).NO_VPRO := :old.NO_VPRO;
    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR :=    (:new.NO_CRR IS NULL AND :old.NO_CRR IS NOT NULL )
                        OR (:new.NO_CRR IS NOT NULL AND :old.NO_CRR IS NULL)
                        OR NOT(:new.NO_CRR = :old.NO_CRR) ;
    cg$VERSION.cg$table(cg$VERSION.idx).NO_CRR := :old.NO_CRR;
    cg$rec.NO_VERSION := :new.NO_VERSION;
    cg$ind.NO_VERSION :=    (:new.NO_VERSION IS NULL AND :old.NO_VERSION IS NOT NULL )
                        OR (:new.NO_VERSION IS NOT NULL AND :old.NO_VERSION IS NULL)
                        OR NOT(:new.NO_VERSION = :old.NO_VERSION) ;
    cg$VERSION.cg$table(cg$VERSION.idx).NO_VERSION := :old.NO_VERSION;
    cg$rec.DATE_LIVRAISON_SOUHAITEE := :new.DATE_LIVRAISON_SOUHAITEE;
    cg$ind.DATE_LIVRAISON_SOUHAITEE :=    (:new.DATE_LIVRAISON_SOUHAITEE IS NULL AND :old.DATE_LIVRAISON_SOUHAITEE IS NOT NULL )
                        OR (:new.DATE_LIVRAISON_SOUHAITEE IS NOT NULL AND :old.DATE_LIVRAISON_SOUHAITEE IS NULL)
                        OR NOT(:new.DATE_LIVRAISON_SOUHAITEE = :old.DATE_LIVRAISON_SOUHAITEE) ;
    cg$VERSION.cg$table(cg$VERSION.idx).DATE_LIVRAISON_SOUHAITEE := :old.DATE_LIVRAISON_SOUHAITEE;
    cg$rec.DATE_RECEPTION_PAPIER := :new.DATE_RECEPTION_PAPIER;
    cg$ind.DATE_RECEPTION_PAPIER :=    (:new.DATE_RECEPTION_PAPIER IS NULL AND :old.DATE_RECEPTION_PAPIER IS NOT NULL )
                        OR (:new.DATE_RECEPTION_PAPIER IS NOT NULL AND :old.DATE_RECEPTION_PAPIER IS NULL)
                        OR NOT(:new.DATE_RECEPTION_PAPIER = :old.DATE_RECEPTION_PAPIER) ;
    cg$VERSION.cg$table(cg$VERSION.idx).DATE_RECEPTION_PAPIER := :old.DATE_RECEPTION_PAPIER;
    cg$rec.DATE_RECEPTION_NUMERIQUE := :new.DATE_RECEPTION_NUMERIQUE;
    cg$ind.DATE_RECEPTION_NUMERIQUE :=    (:new.DATE_RECEPTION_NUMERIQUE IS NULL AND :old.DATE_RECEPTION_NUMERIQUE IS NOT NULL )
                        OR (:new.DATE_RECEPTION_NUMERIQUE IS NOT NULL AND :old.DATE_RECEPTION_NUMERIQUE IS NULL)
                        OR NOT(:new.DATE_RECEPTION_NUMERIQUE = :old.DATE_RECEPTION_NUMERIQUE) ;
    cg$VERSION.cg$table(cg$VERSION.idx).DATE_RECEPTION_NUMERIQUE := :old.DATE_RECEPTION_NUMERIQUE;
    cg$rec.REFERENCE := :new.REFERENCE;
    cg$ind.REFERENCE :=    (:new.REFERENCE IS NULL AND :old.REFERENCE IS NOT NULL )
                        OR (:new.REFERENCE IS NOT NULL AND :old.REFERENCE IS NULL)
                        OR NOT(:new.REFERENCE = :old.REFERENCE) ;
    cg$VERSION.cg$table(cg$VERSION.idx).REFERENCE := :old.REFERENCE;
    cg$rec.ETAT_EVALUATION := :new.ETAT_EVALUATION;
    cg$ind.ETAT_EVALUATION :=    (:new.ETAT_EVALUATION IS NULL AND :old.ETAT_EVALUATION IS NOT NULL )
                        OR (:new.ETAT_EVALUATION IS NOT NULL AND :old.ETAT_EVALUATION IS NULL)
                        OR NOT(:new.ETAT_EVALUATION = :old.ETAT_EVALUATION) ;
    cg$VERSION.cg$table(cg$VERSION.idx).ETAT_EVALUATION := :old.ETAT_EVALUATION;
    cg$rec.DATE_EVALUATION := :new.DATE_EVALUATION;
    cg$ind.DATE_EVALUATION :=    (:new.DATE_EVALUATION IS NULL AND :old.DATE_EVALUATION IS NOT NULL )
                        OR (:new.DATE_EVALUATION IS NOT NULL AND :old.DATE_EVALUATION IS NULL)
                        OR NOT(:new.DATE_EVALUATION = :old.DATE_EVALUATION) ;
    cg$VERSION.cg$table(cg$VERSION.idx).DATE_EVALUATION := :old.DATE_EVALUATION;
    cg$rec.COMMENTAIRE_EVALUATION := :new.COMMENTAIRE_EVALUATION;
    cg$ind.COMMENTAIRE_EVALUATION :=    (:new.COMMENTAIRE_EVALUATION IS NULL AND :old.COMMENTAIRE_EVALUATION IS NOT NULL )
                        OR (:new.COMMENTAIRE_EVALUATION IS NOT NULL AND :old.COMMENTAIRE_EVALUATION IS NULL)
                        OR NOT(:new.COMMENTAIRE_EVALUATION = :old.COMMENTAIRE_EVALUATION) ;
    cg$VERSION.cg$table(cg$VERSION.idx).COMMENTAIRE_EVALUATION := :old.COMMENTAIRE_EVALUATION;
    cg$rec.DATE_DEBRIEFING := :new.DATE_DEBRIEFING;
    cg$ind.DATE_DEBRIEFING :=    (:new.DATE_DEBRIEFING IS NULL AND :old.DATE_DEBRIEFING IS NOT NULL )
                        OR (:new.DATE_DEBRIEFING IS NOT NULL AND :old.DATE_DEBRIEFING IS NULL)
                        OR NOT(:new.DATE_DEBRIEFING = :old.DATE_DEBRIEFING) ;
    cg$VERSION.cg$table(cg$VERSION.idx).DATE_DEBRIEFING := :old.DATE_DEBRIEFING;
    cg$rec.NOTE_FORMATIVE := :new.NOTE_FORMATIVE;
    cg$ind.NOTE_FORMATIVE :=    (:new.NOTE_FORMATIVE IS NULL AND :old.NOTE_FORMATIVE IS NOT NULL )
                        OR (:new.NOTE_FORMATIVE IS NOT NULL AND :old.NOTE_FORMATIVE IS NULL)
                        OR NOT(:new.NOTE_FORMATIVE = :old.NOTE_FORMATIVE) ;
    cg$VERSION.cg$table(cg$VERSION.idx).NOTE_FORMATIVE := :old.NOTE_FORMATIVE;


    cg$VERSION.idx := cg$VERSION.idx + 1;

    if not (cg$VERSION.called_from_package) then
        cg$VERSION.validate_arc(cg$rec);
        cg$VERSION.validate_domain(cg$rec, cg$ind);
        cg$VERSION.validate_domain_cascade_update(cg$old_rec);   

        cg$VERSION.upd(cg$rec, cg$ind, FALSE);
        cg$VERSION.called_from_package := FALSE;
    end if;

    :new.NO_CRR := cg$rec.NO_CRR;
    :new.NO_VERSION := cg$rec.NO_VERSION;
    :new.DATE_LIVRAISON_SOUHAITEE := cg$rec.DATE_LIVRAISON_SOUHAITEE;
    :new.DATE_RECEPTION_PAPIER := cg$rec.DATE_RECEPTION_PAPIER;
    :new.DATE_RECEPTION_NUMERIQUE := cg$rec.DATE_RECEPTION_NUMERIQUE;
    :new.REFERENCE := cg$rec.REFERENCE;
    :new.ETAT_EVALUATION := cg$rec.ETAT_EVALUATION;
    :new.DATE_EVALUATION := cg$rec.DATE_EVALUATION;
    :new.COMMENTAIRE_EVALUATION := cg$rec.COMMENTAIRE_EVALUATION;
    :new.DATE_DEBRIEFING := cg$rec.DATE_DEBRIEFING;
    :new.NOTE_FORMATIVE := cg$rec.NOTE_FORMATIVE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_VERSION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_VERSION
AFTER UPDATE ON VERSION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_VERSION
/






PROMPT Creating After Update Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$AUS_VERSION
AFTER UPDATE ON VERSION
DECLARE
    idx        BINARY_INTEGER := cg$VERSION.cg$table.FIRST;
    cg$old_rec cg$VERSION.cg$row_type;
    cg$rec     cg$VERSION.cg$row_type;
    cg$ind     cg$VERSION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_VPRO := cg$VERSION.cg$table(idx).NO_VPRO;
        cg$old_rec.NO_CRR := cg$VERSION.cg$table(idx).NO_CRR;
        cg$old_rec.NO_VERSION := cg$VERSION.cg$table(idx).NO_VERSION;
        cg$old_rec.DATE_LIVRAISON_SOUHAITEE := cg$VERSION.cg$table(idx).DATE_LIVRAISON_SOUHAITEE;
        cg$old_rec.DATE_RECEPTION_PAPIER := cg$VERSION.cg$table(idx).DATE_RECEPTION_PAPIER;
        cg$old_rec.DATE_RECEPTION_NUMERIQUE := cg$VERSION.cg$table(idx).DATE_RECEPTION_NUMERIQUE;
        cg$old_rec.REFERENCE := cg$VERSION.cg$table(idx).REFERENCE;
        cg$old_rec.ETAT_EVALUATION := cg$VERSION.cg$table(idx).ETAT_EVALUATION;
        cg$old_rec.DATE_EVALUATION := cg$VERSION.cg$table(idx).DATE_EVALUATION;
        cg$old_rec.COMMENTAIRE_EVALUATION := cg$VERSION.cg$table(idx).COMMENTAIRE_EVALUATION;
        cg$old_rec.DATE_DEBRIEFING := cg$VERSION.cg$table(idx).DATE_DEBRIEFING;
        cg$old_rec.NOTE_FORMATIVE := cg$VERSION.cg$table(idx).NOTE_FORMATIVE;

    IF NOT (cg$VERSION.called_from_package) THEN
        idx := cg$VERSION.cg$table.NEXT(idx);
        cg$rec.NO_VPRO := cg$VERSION.cg$table(idx).NO_VPRO;
        cg$ind.NO_VPRO := updating('NO_VPRO');
        cg$rec.NO_CRR := cg$VERSION.cg$table(idx).NO_CRR;
        cg$ind.NO_CRR := updating('NO_CRR');
        cg$rec.NO_VERSION := cg$VERSION.cg$table(idx).NO_VERSION;
        cg$ind.NO_VERSION := updating('NO_VERSION');
        cg$rec.DATE_LIVRAISON_SOUHAITEE := cg$VERSION.cg$table(idx).DATE_LIVRAISON_SOUHAITEE;
        cg$ind.DATE_LIVRAISON_SOUHAITEE := updating('DATE_LIVRAISON_SOUHAITEE');
        cg$rec.DATE_RECEPTION_PAPIER := cg$VERSION.cg$table(idx).DATE_RECEPTION_PAPIER;
        cg$ind.DATE_RECEPTION_PAPIER := updating('DATE_RECEPTION_PAPIER');
        cg$rec.DATE_RECEPTION_NUMERIQUE := cg$VERSION.cg$table(idx).DATE_RECEPTION_NUMERIQUE;
        cg$ind.DATE_RECEPTION_NUMERIQUE := updating('DATE_RECEPTION_NUMERIQUE');
        cg$rec.REFERENCE := cg$VERSION.cg$table(idx).REFERENCE;
        cg$ind.REFERENCE := updating('REFERENCE');
        cg$rec.ETAT_EVALUATION := cg$VERSION.cg$table(idx).ETAT_EVALUATION;
        cg$ind.ETAT_EVALUATION := updating('ETAT_EVALUATION');
        cg$rec.DATE_EVALUATION := cg$VERSION.cg$table(idx).DATE_EVALUATION;
        cg$ind.DATE_EVALUATION := updating('DATE_EVALUATION');
        cg$rec.COMMENTAIRE_EVALUATION := cg$VERSION.cg$table(idx).COMMENTAIRE_EVALUATION;
        cg$ind.COMMENTAIRE_EVALUATION := updating('COMMENTAIRE_EVALUATION');
        cg$rec.DATE_DEBRIEFING := cg$VERSION.cg$table(idx).DATE_DEBRIEFING;
        cg$ind.DATE_DEBRIEFING := updating('DATE_DEBRIEFING');
        cg$rec.NOTE_FORMATIVE := cg$VERSION.cg$table(idx).NOTE_FORMATIVE;
        cg$ind.NOTE_FORMATIVE := updating('NOTE_FORMATIVE');

        cg$VERSION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$VERSION.upd_denorm2( cg$rec,
                                       cg$VERSION.cg$tableind(idx)
                                     );
        cg$VERSION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$VERSION.cg$tableind(idx)
								                  );
        cg$VERSION.cascade_update(cg$rec, cg$old_rec);
        cg$VERSION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$VERSION.called_from_package := FALSE;
	END IF;
        idx := cg$VERSION.cg$table.NEXT(idx);
    END LOOP;

    cg$VERSION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BDS_VERSION
BEFORE DELETE ON VERSION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$VERSION.cg$table.DELETE;
    cg$VERSION.cg$tableind.DELETE;
    cg$VERSION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$BDR_VERSION
BEFORE DELETE ON VERSION FOR EACH ROW
DECLARE
    cg$pk cg$VERSION.cg$pk_type;
    cg$rec cg$VERSION.cg$row_type;
    cg$ind cg$VERSION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_VPRO  := :old.NO_VPRO;
    cg$rec.NO_VPRO := :old.NO_VPRO;
    cg$VERSION.cg$table(cg$VERSION.idx).NO_VPRO := :old.NO_VPRO;
    cg$rec.NO_CRR := :old.NO_CRR;
    cg$VERSION.cg$table(cg$VERSION.idx).NO_CRR := :old.NO_CRR;
    cg$rec.NOTE_FORMATIVE := :old.NOTE_FORMATIVE;
    cg$VERSION.cg$table(cg$VERSION.idx).NOTE_FORMATIVE := :old.NOTE_FORMATIVE;


    cg$VERSION.idx := cg$VERSION.idx + 1;

    if not (cg$VERSION.called_from_package) then
        cg$VERSION.validate_domain_cascade_delete(cg$rec);   
        cg$VERSION.del(cg$pk, FALSE);
        cg$VERSION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_VERSION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_VERSION
AFTER DELETE ON VERSION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_VERSION
/

PROMPT Creating After Delete Statement Trigger on 'VERSION'
CREATE OR REPLACE TRIGGER cg$ADS_VERSION
AFTER DELETE ON VERSION
DECLARE
    idx        BINARY_INTEGER := cg$VERSION.cg$table.FIRST;
    cg$rec   cg$VERSION.cg$row_type;
    cg$old_rec   cg$VERSION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$VERSION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_VPRO := cg$VERSION.cg$table(idx).NO_VPRO;
            cg$VERSION.cg$tableind(idx).NO_VPRO := TRUE;
            cg$rec.NO_CRR := cg$VERSION.cg$table(idx).NO_CRR;
            cg$VERSION.cg$tableind(idx).NO_CRR := TRUE;
            cg$rec.NO_VERSION := cg$VERSION.cg$table(idx).NO_VERSION;
            cg$VERSION.cg$tableind(idx).NO_VERSION := TRUE;
            cg$rec.DATE_LIVRAISON_SOUHAITEE := cg$VERSION.cg$table(idx).DATE_LIVRAISON_SOUHAITEE;
            cg$VERSION.cg$tableind(idx).DATE_LIVRAISON_SOUHAITEE := TRUE;
            cg$rec.DATE_RECEPTION_PAPIER := cg$VERSION.cg$table(idx).DATE_RECEPTION_PAPIER;
            cg$VERSION.cg$tableind(idx).DATE_RECEPTION_PAPIER := TRUE;
            cg$rec.DATE_RECEPTION_NUMERIQUE := cg$VERSION.cg$table(idx).DATE_RECEPTION_NUMERIQUE;
            cg$VERSION.cg$tableind(idx).DATE_RECEPTION_NUMERIQUE := TRUE;
            cg$rec.REFERENCE := cg$VERSION.cg$table(idx).REFERENCE;
            cg$VERSION.cg$tableind(idx).REFERENCE := TRUE;
            cg$rec.ETAT_EVALUATION := cg$VERSION.cg$table(idx).ETAT_EVALUATION;
            cg$VERSION.cg$tableind(idx).ETAT_EVALUATION := TRUE;
            cg$rec.DATE_EVALUATION := cg$VERSION.cg$table(idx).DATE_EVALUATION;
            cg$VERSION.cg$tableind(idx).DATE_EVALUATION := TRUE;
            cg$rec.COMMENTAIRE_EVALUATION := cg$VERSION.cg$table(idx).COMMENTAIRE_EVALUATION;
            cg$VERSION.cg$tableind(idx).COMMENTAIRE_EVALUATION := TRUE;
            cg$rec.DATE_DEBRIEFING := cg$VERSION.cg$table(idx).DATE_DEBRIEFING;
            cg$VERSION.cg$tableind(idx).DATE_DEBRIEFING := TRUE;
            cg$rec.NOTE_FORMATIVE := cg$VERSION.cg$table(idx).NOTE_FORMATIVE;
            cg$VERSION.cg$tableind(idx).NOTE_FORMATIVE := TRUE;

            cg$VERSION.validate_foreign_keys_del(cg$rec);
            cg$VERSION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$VERSION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$VERSION.cascade_delete(cg$rec);
            cg$VERSION.domain_cascade_delete(cg$rec);             

            idx := cg$VERSION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



