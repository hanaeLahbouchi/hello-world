
PROMPT Creating Trigger Logic for Table 'STAGE'
PROMPT Creating Before Insert Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BIS_STAGE
BEFORE INSERT ON STAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$STAGE.cg$table.DELETE;
    cg$STAGE.cg$tableind.DELETE;
    cg$STAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BIR_STAGE
BEFORE INSERT ON STAGE FOR EACH ROW
DECLARE
    cg$rec cg$STAGE.cg$row_type;
    cg$ind cg$STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE := TRUE;
    cg$rec.NO_OFFRE := :new.NO_OFFRE;
    cg$ind.NO_OFFRE := TRUE;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI := TRUE;
    cg$rec.INTITULE := :new.INTITULE;
    cg$ind.INTITULE := TRUE;
    cg$rec.SUJET := :new.SUJET;
    cg$ind.SUJET := TRUE;
    cg$rec.DATE_DEB := :new.DATE_DEB;
    cg$ind.DATE_DEB := TRUE;
    cg$rec.DATE_FIN := :new.DATE_FIN;
    cg$ind.DATE_FIN := TRUE;
    cg$rec.LIEU := :new.LIEU;
    cg$ind.LIEU := TRUE;
    cg$rec.ETAT_STAGE := :new.ETAT_STAGE;
    cg$ind.ETAT_STAGE := TRUE;
    cg$rec.CLE_EVALUATION := :new.CLE_EVALUATION;
    cg$ind.CLE_EVALUATION := TRUE;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION := TRUE;
    cg$rec.ETAT_CONVENTION := :new.ETAT_CONVENTION;
    cg$ind.ETAT_CONVENTION := TRUE;
    cg$rec.DATE_SIGNATURE_CONV := :new.DATE_SIGNATURE_CONV;
    cg$ind.DATE_SIGNATURE_CONV := TRUE;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.COMMENTAIRE_TUTEUR := :new.COMMENTAIRE_TUTEUR;
    cg$ind.COMMENTAIRE_TUTEUR := TRUE;
    cg$rec.DATE_RECEPTION_RAPPORT := :new.DATE_RECEPTION_RAPPORT;
    cg$ind.DATE_RECEPTION_RAPPORT := TRUE;
    cg$rec.NOTE_ENTREPRISE := :new.NOTE_ENTREPRISE;
    cg$ind.NOTE_ENTREPRISE := TRUE;
    cg$rec.NOTE_RAPPORT := :new.NOTE_RAPPORT;
    cg$ind.NOTE_RAPPORT := TRUE;
    cg$rec.NO_SESSION := :new.NO_SESSION;
    cg$ind.NO_SESSION := TRUE;
    cg$rec.NOTE_SOUTENANCE := :new.NOTE_SOUTENANCE;
    cg$ind.NOTE_SOUTENANCE := TRUE;

    if not (cg$STAGE.called_from_package) then
        cg$STAGE.validate_arc(cg$rec);
        cg$STAGE.validate_domain(cg$rec);

        cg$STAGE.ins(cg$rec, cg$ind, FALSE);
        cg$STAGE.called_from_package := FALSE;
    end if;

    cg$STAGE.cg$table(cg$STAGE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$STAGE.cg$tableind(cg$STAGE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_OFFRE := cg$rec.NO_OFFRE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_OFFRE := cg$ind.NO_OFFRE;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;

    cg$STAGE.cg$table(cg$STAGE.idx).INTITULE := cg$rec.INTITULE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).INTITULE := cg$ind.INTITULE;

    cg$STAGE.cg$table(cg$STAGE.idx).SUJET := cg$rec.SUJET;
    cg$STAGE.cg$tableind(cg$STAGE.idx).SUJET := cg$ind.SUJET;

    cg$STAGE.cg$table(cg$STAGE.idx).DATE_DEB := cg$rec.DATE_DEB;
    cg$STAGE.cg$tableind(cg$STAGE.idx).DATE_DEB := cg$ind.DATE_DEB;

    cg$STAGE.cg$table(cg$STAGE.idx).DATE_FIN := cg$rec.DATE_FIN;
    cg$STAGE.cg$tableind(cg$STAGE.idx).DATE_FIN := cg$ind.DATE_FIN;

    cg$STAGE.cg$table(cg$STAGE.idx).LIEU := cg$rec.LIEU;
    cg$STAGE.cg$tableind(cg$STAGE.idx).LIEU := cg$ind.LIEU;

    cg$STAGE.cg$table(cg$STAGE.idx).ETAT_STAGE := cg$rec.ETAT_STAGE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).ETAT_STAGE := cg$ind.ETAT_STAGE;

    cg$STAGE.cg$table(cg$STAGE.idx).CLE_EVALUATION := cg$rec.CLE_EVALUATION;
    cg$STAGE.cg$tableind(cg$STAGE.idx).CLE_EVALUATION := cg$ind.CLE_EVALUATION;

    cg$STAGE.cg$table(cg$STAGE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$STAGE.cg$tableind(cg$STAGE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$STAGE.cg$table(cg$STAGE.idx).ETAT_CONVENTION := cg$rec.ETAT_CONVENTION;
    cg$STAGE.cg$tableind(cg$STAGE.idx).ETAT_CONVENTION := cg$ind.ETAT_CONVENTION;

    cg$STAGE.cg$table(cg$STAGE.idx).DATE_SIGNATURE_CONV := cg$rec.DATE_SIGNATURE_CONV;
    cg$STAGE.cg$tableind(cg$STAGE.idx).DATE_SIGNATURE_CONV := cg$ind.DATE_SIGNATURE_CONV;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$STAGE.cg$table(cg$STAGE.idx).COMMENTAIRE_TUTEUR := cg$rec.COMMENTAIRE_TUTEUR;
    cg$STAGE.cg$tableind(cg$STAGE.idx).COMMENTAIRE_TUTEUR := cg$ind.COMMENTAIRE_TUTEUR;

    cg$STAGE.cg$table(cg$STAGE.idx).DATE_RECEPTION_RAPPORT := cg$rec.DATE_RECEPTION_RAPPORT;
    cg$STAGE.cg$tableind(cg$STAGE.idx).DATE_RECEPTION_RAPPORT := cg$ind.DATE_RECEPTION_RAPPORT;

    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_ENTREPRISE := cg$rec.NOTE_ENTREPRISE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NOTE_ENTREPRISE := cg$ind.NOTE_ENTREPRISE;

    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_RAPPORT := cg$rec.NOTE_RAPPORT;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NOTE_RAPPORT := cg$ind.NOTE_RAPPORT;

    cg$STAGE.cg$table(cg$STAGE.idx).NO_SESSION := cg$rec.NO_SESSION;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NO_SESSION := cg$ind.NO_SESSION;

    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_SOUTENANCE := cg$rec.NOTE_SOUTENANCE;
    cg$STAGE.cg$tableind(cg$STAGE.idx).NOTE_SOUTENANCE := cg$ind.NOTE_SOUTENANCE;

    cg$STAGE.idx := cg$STAGE.idx + 1;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.NO_OFFRE := cg$rec.NO_OFFRE;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.INTITULE := cg$rec.INTITULE;
    :new.SUJET := cg$rec.SUJET;
    :new.DATE_DEB := cg$rec.DATE_DEB;
    :new.DATE_FIN := cg$rec.DATE_FIN;
    :new.LIEU := cg$rec.LIEU;
    :new.ETAT_STAGE := cg$rec.ETAT_STAGE;
    :new.CLE_EVALUATION := cg$rec.CLE_EVALUATION;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.ETAT_CONVENTION := cg$rec.ETAT_CONVENTION;
    :new.DATE_SIGNATURE_CONV := cg$rec.DATE_SIGNATURE_CONV;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.COMMENTAIRE_TUTEUR := cg$rec.COMMENTAIRE_TUTEUR;
    :new.DATE_RECEPTION_RAPPORT := cg$rec.DATE_RECEPTION_RAPPORT;
    :new.NOTE_ENTREPRISE := cg$rec.NOTE_ENTREPRISE;
    :new.NOTE_RAPPORT := cg$rec.NOTE_RAPPORT;
    :new.NO_SESSION := cg$rec.NO_SESSION;
    :new.NOTE_SOUTENANCE := cg$rec.NOTE_SOUTENANCE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_STAGE
AFTER INSERT ON STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_STAGE
/

PROMPT Creating After Insert Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$AIS_STAGE
AFTER INSERT ON STAGE
DECLARE
    idx      BINARY_INTEGER := cg$STAGE.cg$table.FIRST;
    cg$rec   cg$STAGE.cg$row_type;
    cg$old_rec   cg$STAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$STAGE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_ETUDIANT_NAT := cg$STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NO_ENTREPRISE := cg$STAGE.cg$table(idx).NO_ENTREPRISE;
            cg$rec.NO_OFFRE := cg$STAGE.cg$table(idx).NO_OFFRE;
            cg$rec.NO_CONTACT_ILI := cg$STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$rec.INTITULE := cg$STAGE.cg$table(idx).INTITULE;
            cg$rec.SUJET := cg$STAGE.cg$table(idx).SUJET;
            cg$rec.DATE_DEB := cg$STAGE.cg$table(idx).DATE_DEB;
            cg$rec.DATE_FIN := cg$STAGE.cg$table(idx).DATE_FIN;
            cg$rec.LIEU := cg$STAGE.cg$table(idx).LIEU;
            cg$rec.ETAT_STAGE := cg$STAGE.cg$table(idx).ETAT_STAGE;
            cg$rec.CLE_EVALUATION := cg$STAGE.cg$table(idx).CLE_EVALUATION;
            cg$rec.DESCRIPTION := cg$STAGE.cg$table(idx).DESCRIPTION;
            cg$rec.ETAT_CONVENTION := cg$STAGE.cg$table(idx).ETAT_CONVENTION;
            cg$rec.DATE_SIGNATURE_CONV := cg$STAGE.cg$table(idx).DATE_SIGNATURE_CONV;
            cg$rec.NO_ENSEIGNANT := cg$STAGE.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.COMMENTAIRE_TUTEUR := cg$STAGE.cg$table(idx).COMMENTAIRE_TUTEUR;
            cg$rec.DATE_RECEPTION_RAPPORT := cg$STAGE.cg$table(idx).DATE_RECEPTION_RAPPORT;
            cg$rec.NOTE_ENTREPRISE := cg$STAGE.cg$table(idx).NOTE_ENTREPRISE;
            cg$rec.NOTE_RAPPORT := cg$STAGE.cg$table(idx).NOTE_RAPPORT;
            cg$rec.NO_SESSION := cg$STAGE.cg$table(idx).NO_SESSION;
            cg$rec.NOTE_SOUTENANCE := cg$STAGE.cg$table(idx).NOTE_SOUTENANCE;

            cg$STAGE.validate_foreign_keys_ins(cg$rec);

            cg$STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$STAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BUS_STAGE
BEFORE UPDATE ON STAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$STAGE.cg$table.DELETE;
    cg$STAGE.cg$tableind.DELETE;
    cg$STAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BUR_STAGE
BEFORE UPDATE ON STAGE FOR EACH ROW
DECLARE
    cg$rec     cg$STAGE.cg$row_type;
    cg$ind     cg$STAGE.cg$ind_type;
    cg$old_rec cg$STAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$STAGE.cg$table(cg$STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_OFFRE := :new.NO_OFFRE;
    cg$ind.NO_OFFRE :=    (:new.NO_OFFRE IS NULL AND :old.NO_OFFRE IS NOT NULL )
                        OR (:new.NO_OFFRE IS NOT NULL AND :old.NO_OFFRE IS NULL)
                        OR NOT(:new.NO_OFFRE = :old.NO_OFFRE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_OFFRE := :old.NO_OFFRE;
    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI :=    (:new.NO_CONTACT_ILI IS NULL AND :old.NO_CONTACT_ILI IS NOT NULL )
                        OR (:new.NO_CONTACT_ILI IS NOT NULL AND :old.NO_CONTACT_ILI IS NULL)
                        OR NOT(:new.NO_CONTACT_ILI = :old.NO_CONTACT_ILI) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.INTITULE := :new.INTITULE;
    cg$ind.INTITULE :=    (:new.INTITULE IS NULL AND :old.INTITULE IS NOT NULL )
                        OR (:new.INTITULE IS NOT NULL AND :old.INTITULE IS NULL)
                        OR NOT(:new.INTITULE = :old.INTITULE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).INTITULE := :old.INTITULE;
    cg$rec.SUJET := :new.SUJET;
    cg$ind.SUJET :=    (:new.SUJET IS NULL AND :old.SUJET IS NOT NULL )
                        OR (:new.SUJET IS NOT NULL AND :old.SUJET IS NULL)
                        OR NOT(:new.SUJET = :old.SUJET) ;
    cg$STAGE.cg$table(cg$STAGE.idx).SUJET := :old.SUJET;
    cg$rec.DATE_DEB := :new.DATE_DEB;
    cg$ind.DATE_DEB :=    (:new.DATE_DEB IS NULL AND :old.DATE_DEB IS NOT NULL )
                        OR (:new.DATE_DEB IS NOT NULL AND :old.DATE_DEB IS NULL)
                        OR NOT(:new.DATE_DEB = :old.DATE_DEB) ;
    cg$STAGE.cg$table(cg$STAGE.idx).DATE_DEB := :old.DATE_DEB;
    cg$rec.DATE_FIN := :new.DATE_FIN;
    cg$ind.DATE_FIN :=    (:new.DATE_FIN IS NULL AND :old.DATE_FIN IS NOT NULL )
                        OR (:new.DATE_FIN IS NOT NULL AND :old.DATE_FIN IS NULL)
                        OR NOT(:new.DATE_FIN = :old.DATE_FIN) ;
    cg$STAGE.cg$table(cg$STAGE.idx).DATE_FIN := :old.DATE_FIN;
    cg$rec.LIEU := :new.LIEU;
    cg$ind.LIEU :=    (:new.LIEU IS NULL AND :old.LIEU IS NOT NULL )
                        OR (:new.LIEU IS NOT NULL AND :old.LIEU IS NULL)
                        OR NOT(:new.LIEU = :old.LIEU) ;
    cg$STAGE.cg$table(cg$STAGE.idx).LIEU := :old.LIEU;
    cg$rec.ETAT_STAGE := :new.ETAT_STAGE;
    cg$ind.ETAT_STAGE :=    (:new.ETAT_STAGE IS NULL AND :old.ETAT_STAGE IS NOT NULL )
                        OR (:new.ETAT_STAGE IS NOT NULL AND :old.ETAT_STAGE IS NULL)
                        OR NOT(:new.ETAT_STAGE = :old.ETAT_STAGE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).ETAT_STAGE := :old.ETAT_STAGE;
    cg$rec.CLE_EVALUATION := :new.CLE_EVALUATION;
    cg$ind.CLE_EVALUATION :=    (:new.CLE_EVALUATION IS NULL AND :old.CLE_EVALUATION IS NOT NULL )
                        OR (:new.CLE_EVALUATION IS NOT NULL AND :old.CLE_EVALUATION IS NULL)
                        OR NOT(:new.CLE_EVALUATION = :old.CLE_EVALUATION) ;
    cg$STAGE.cg$table(cg$STAGE.idx).CLE_EVALUATION := :old.CLE_EVALUATION;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION :=    (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL )
                        OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
                        OR NOT(:new.DESCRIPTION = :old.DESCRIPTION) ;
    cg$STAGE.cg$table(cg$STAGE.idx).DESCRIPTION := :old.DESCRIPTION;
    cg$rec.ETAT_CONVENTION := :new.ETAT_CONVENTION;
    cg$ind.ETAT_CONVENTION :=    (:new.ETAT_CONVENTION IS NULL AND :old.ETAT_CONVENTION IS NOT NULL )
                        OR (:new.ETAT_CONVENTION IS NOT NULL AND :old.ETAT_CONVENTION IS NULL)
                        OR NOT(:new.ETAT_CONVENTION = :old.ETAT_CONVENTION) ;
    cg$STAGE.cg$table(cg$STAGE.idx).ETAT_CONVENTION := :old.ETAT_CONVENTION;
    cg$rec.DATE_SIGNATURE_CONV := :new.DATE_SIGNATURE_CONV;
    cg$ind.DATE_SIGNATURE_CONV :=    (:new.DATE_SIGNATURE_CONV IS NULL AND :old.DATE_SIGNATURE_CONV IS NOT NULL )
                        OR (:new.DATE_SIGNATURE_CONV IS NOT NULL AND :old.DATE_SIGNATURE_CONV IS NULL)
                        OR NOT(:new.DATE_SIGNATURE_CONV = :old.DATE_SIGNATURE_CONV) ;
    cg$STAGE.cg$table(cg$STAGE.idx).DATE_SIGNATURE_CONV := :old.DATE_SIGNATURE_CONV;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.COMMENTAIRE_TUTEUR := :new.COMMENTAIRE_TUTEUR;
    cg$ind.COMMENTAIRE_TUTEUR :=    (:new.COMMENTAIRE_TUTEUR IS NULL AND :old.COMMENTAIRE_TUTEUR IS NOT NULL )
                        OR (:new.COMMENTAIRE_TUTEUR IS NOT NULL AND :old.COMMENTAIRE_TUTEUR IS NULL)
                        OR NOT(:new.COMMENTAIRE_TUTEUR = :old.COMMENTAIRE_TUTEUR) ;
    cg$STAGE.cg$table(cg$STAGE.idx).COMMENTAIRE_TUTEUR := :old.COMMENTAIRE_TUTEUR;
    cg$rec.DATE_RECEPTION_RAPPORT := :new.DATE_RECEPTION_RAPPORT;
    cg$ind.DATE_RECEPTION_RAPPORT :=    (:new.DATE_RECEPTION_RAPPORT IS NULL AND :old.DATE_RECEPTION_RAPPORT IS NOT NULL )
                        OR (:new.DATE_RECEPTION_RAPPORT IS NOT NULL AND :old.DATE_RECEPTION_RAPPORT IS NULL)
                        OR NOT(:new.DATE_RECEPTION_RAPPORT = :old.DATE_RECEPTION_RAPPORT) ;
    cg$STAGE.cg$table(cg$STAGE.idx).DATE_RECEPTION_RAPPORT := :old.DATE_RECEPTION_RAPPORT;
    cg$rec.NOTE_ENTREPRISE := :new.NOTE_ENTREPRISE;
    cg$ind.NOTE_ENTREPRISE :=    (:new.NOTE_ENTREPRISE IS NULL AND :old.NOTE_ENTREPRISE IS NOT NULL )
                        OR (:new.NOTE_ENTREPRISE IS NOT NULL AND :old.NOTE_ENTREPRISE IS NULL)
                        OR NOT(:new.NOTE_ENTREPRISE = :old.NOTE_ENTREPRISE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_ENTREPRISE := :old.NOTE_ENTREPRISE;
    cg$rec.NOTE_RAPPORT := :new.NOTE_RAPPORT;
    cg$ind.NOTE_RAPPORT :=    (:new.NOTE_RAPPORT IS NULL AND :old.NOTE_RAPPORT IS NOT NULL )
                        OR (:new.NOTE_RAPPORT IS NOT NULL AND :old.NOTE_RAPPORT IS NULL)
                        OR NOT(:new.NOTE_RAPPORT = :old.NOTE_RAPPORT) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_RAPPORT := :old.NOTE_RAPPORT;
    cg$rec.NO_SESSION := :new.NO_SESSION;
    cg$ind.NO_SESSION :=    (:new.NO_SESSION IS NULL AND :old.NO_SESSION IS NOT NULL )
                        OR (:new.NO_SESSION IS NOT NULL AND :old.NO_SESSION IS NULL)
                        OR NOT(:new.NO_SESSION = :old.NO_SESSION) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_SESSION := :old.NO_SESSION;
    cg$rec.NOTE_SOUTENANCE := :new.NOTE_SOUTENANCE;
    cg$ind.NOTE_SOUTENANCE :=    (:new.NOTE_SOUTENANCE IS NULL AND :old.NOTE_SOUTENANCE IS NOT NULL )
                        OR (:new.NOTE_SOUTENANCE IS NOT NULL AND :old.NOTE_SOUTENANCE IS NULL)
                        OR NOT(:new.NOTE_SOUTENANCE = :old.NOTE_SOUTENANCE) ;
    cg$STAGE.cg$table(cg$STAGE.idx).NOTE_SOUTENANCE := :old.NOTE_SOUTENANCE;


    cg$STAGE.idx := cg$STAGE.idx + 1;

    if not (cg$STAGE.called_from_package) then
        cg$STAGE.validate_arc(cg$rec);
        cg$STAGE.validate_domain(cg$rec, cg$ind);
        cg$STAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$STAGE.upd(cg$rec, cg$ind, FALSE);
        cg$STAGE.called_from_package := FALSE;
    end if;

    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.NO_OFFRE := cg$rec.NO_OFFRE;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.INTITULE := cg$rec.INTITULE;
    :new.SUJET := cg$rec.SUJET;
    :new.DATE_DEB := cg$rec.DATE_DEB;
    :new.DATE_FIN := cg$rec.DATE_FIN;
    :new.LIEU := cg$rec.LIEU;
    :new.ETAT_STAGE := cg$rec.ETAT_STAGE;
    :new.CLE_EVALUATION := cg$rec.CLE_EVALUATION;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.ETAT_CONVENTION := cg$rec.ETAT_CONVENTION;
    :new.DATE_SIGNATURE_CONV := cg$rec.DATE_SIGNATURE_CONV;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.COMMENTAIRE_TUTEUR := cg$rec.COMMENTAIRE_TUTEUR;
    :new.DATE_RECEPTION_RAPPORT := cg$rec.DATE_RECEPTION_RAPPORT;
    :new.NOTE_ENTREPRISE := cg$rec.NOTE_ENTREPRISE;
    :new.NOTE_RAPPORT := cg$rec.NOTE_RAPPORT;
    :new.NO_SESSION := cg$rec.NO_SESSION;
    :new.NOTE_SOUTENANCE := cg$rec.NOTE_SOUTENANCE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_STAGE
AFTER UPDATE ON STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_STAGE
/






PROMPT Creating After Update Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$AUS_STAGE
AFTER UPDATE ON STAGE
DECLARE
    idx        BINARY_INTEGER := cg$STAGE.cg$table.FIRST;
    cg$old_rec cg$STAGE.cg$row_type;
    cg$rec     cg$STAGE.cg$row_type;
    cg$ind     cg$STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ANNEE_PRO := cg$STAGE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_ETUDIANT_NAT := cg$STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NO_ENTREPRISE := cg$STAGE.cg$table(idx).NO_ENTREPRISE;
        cg$old_rec.NO_OFFRE := cg$STAGE.cg$table(idx).NO_OFFRE;
        cg$old_rec.NO_CONTACT_ILI := cg$STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$old_rec.INTITULE := cg$STAGE.cg$table(idx).INTITULE;
        cg$old_rec.SUJET := cg$STAGE.cg$table(idx).SUJET;
        cg$old_rec.DATE_DEB := cg$STAGE.cg$table(idx).DATE_DEB;
        cg$old_rec.DATE_FIN := cg$STAGE.cg$table(idx).DATE_FIN;
        cg$old_rec.LIEU := cg$STAGE.cg$table(idx).LIEU;
        cg$old_rec.ETAT_STAGE := cg$STAGE.cg$table(idx).ETAT_STAGE;
        cg$old_rec.CLE_EVALUATION := cg$STAGE.cg$table(idx).CLE_EVALUATION;
        cg$old_rec.DESCRIPTION := cg$STAGE.cg$table(idx).DESCRIPTION;
        cg$old_rec.ETAT_CONVENTION := cg$STAGE.cg$table(idx).ETAT_CONVENTION;
        cg$old_rec.DATE_SIGNATURE_CONV := cg$STAGE.cg$table(idx).DATE_SIGNATURE_CONV;
        cg$old_rec.NO_ENSEIGNANT := cg$STAGE.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.COMMENTAIRE_TUTEUR := cg$STAGE.cg$table(idx).COMMENTAIRE_TUTEUR;
        cg$old_rec.DATE_RECEPTION_RAPPORT := cg$STAGE.cg$table(idx).DATE_RECEPTION_RAPPORT;
        cg$old_rec.NOTE_ENTREPRISE := cg$STAGE.cg$table(idx).NOTE_ENTREPRISE;
        cg$old_rec.NOTE_RAPPORT := cg$STAGE.cg$table(idx).NOTE_RAPPORT;
        cg$old_rec.NO_SESSION := cg$STAGE.cg$table(idx).NO_SESSION;
        cg$old_rec.NOTE_SOUTENANCE := cg$STAGE.cg$table(idx).NOTE_SOUTENANCE;

    IF NOT (cg$STAGE.called_from_package) THEN
        idx := cg$STAGE.cg$table.NEXT(idx);
        cg$rec.ANNEE_PRO := cg$STAGE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_ETUDIANT_NAT := cg$STAGE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NO_ENTREPRISE := cg$STAGE.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');
        cg$rec.NO_OFFRE := cg$STAGE.cg$table(idx).NO_OFFRE;
        cg$ind.NO_OFFRE := updating('NO_OFFRE');
        cg$rec.NO_CONTACT_ILI := cg$STAGE.cg$table(idx).NO_CONTACT_ILI;
        cg$ind.NO_CONTACT_ILI := updating('NO_CONTACT_ILI');
        cg$rec.INTITULE := cg$STAGE.cg$table(idx).INTITULE;
        cg$ind.INTITULE := updating('INTITULE');
        cg$rec.SUJET := cg$STAGE.cg$table(idx).SUJET;
        cg$ind.SUJET := updating('SUJET');
        cg$rec.DATE_DEB := cg$STAGE.cg$table(idx).DATE_DEB;
        cg$ind.DATE_DEB := updating('DATE_DEB');
        cg$rec.DATE_FIN := cg$STAGE.cg$table(idx).DATE_FIN;
        cg$ind.DATE_FIN := updating('DATE_FIN');
        cg$rec.LIEU := cg$STAGE.cg$table(idx).LIEU;
        cg$ind.LIEU := updating('LIEU');
        cg$rec.ETAT_STAGE := cg$STAGE.cg$table(idx).ETAT_STAGE;
        cg$ind.ETAT_STAGE := updating('ETAT_STAGE');
        cg$rec.CLE_EVALUATION := cg$STAGE.cg$table(idx).CLE_EVALUATION;
        cg$ind.CLE_EVALUATION := updating('CLE_EVALUATION');
        cg$rec.DESCRIPTION := cg$STAGE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');
        cg$rec.ETAT_CONVENTION := cg$STAGE.cg$table(idx).ETAT_CONVENTION;
        cg$ind.ETAT_CONVENTION := updating('ETAT_CONVENTION');
        cg$rec.DATE_SIGNATURE_CONV := cg$STAGE.cg$table(idx).DATE_SIGNATURE_CONV;
        cg$ind.DATE_SIGNATURE_CONV := updating('DATE_SIGNATURE_CONV');
        cg$rec.NO_ENSEIGNANT := cg$STAGE.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.COMMENTAIRE_TUTEUR := cg$STAGE.cg$table(idx).COMMENTAIRE_TUTEUR;
        cg$ind.COMMENTAIRE_TUTEUR := updating('COMMENTAIRE_TUTEUR');
        cg$rec.DATE_RECEPTION_RAPPORT := cg$STAGE.cg$table(idx).DATE_RECEPTION_RAPPORT;
        cg$ind.DATE_RECEPTION_RAPPORT := updating('DATE_RECEPTION_RAPPORT');
        cg$rec.NOTE_ENTREPRISE := cg$STAGE.cg$table(idx).NOTE_ENTREPRISE;
        cg$ind.NOTE_ENTREPRISE := updating('NOTE_ENTREPRISE');
        cg$rec.NOTE_RAPPORT := cg$STAGE.cg$table(idx).NOTE_RAPPORT;
        cg$ind.NOTE_RAPPORT := updating('NOTE_RAPPORT');
        cg$rec.NO_SESSION := cg$STAGE.cg$table(idx).NO_SESSION;
        cg$ind.NO_SESSION := updating('NO_SESSION');
        cg$rec.NOTE_SOUTENANCE := cg$STAGE.cg$table(idx).NOTE_SOUTENANCE;
        cg$ind.NOTE_SOUTENANCE := updating('NOTE_SOUTENANCE');

        cg$STAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$STAGE.upd_denorm2( cg$rec,
                                       cg$STAGE.cg$tableind(idx)
                                     );
        cg$STAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$STAGE.cg$tableind(idx)
								                  );
        cg$STAGE.cascade_update(cg$rec, cg$old_rec);
        cg$STAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$STAGE.called_from_package := FALSE;
	END IF;
        idx := cg$STAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$STAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BDS_STAGE
BEFORE DELETE ON STAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$STAGE.cg$table.DELETE;
    cg$STAGE.cg$tableind.DELETE;
    cg$STAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$BDR_STAGE
BEFORE DELETE ON STAGE FOR EACH ROW
DECLARE
    cg$pk cg$STAGE.cg$pk_type;
    cg$rec cg$STAGE.cg$row_type;
    cg$ind cg$STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$pk.ANNEE_PRO  := :old.ANNEE_PRO;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$STAGE.cg$table(cg$STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_SESSION := :old.NO_SESSION;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_SESSION := :old.NO_SESSION;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$STAGE.cg$table(cg$STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$STAGE.cg$table(cg$STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_OFFRE := :old.NO_OFFRE;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_OFFRE := :old.NO_OFFRE;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$STAGE.cg$table(cg$STAGE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;


    cg$STAGE.idx := cg$STAGE.idx + 1;

    if not (cg$STAGE.called_from_package) then
        cg$STAGE.validate_domain_cascade_delete(cg$rec);   
        cg$STAGE.del(cg$pk, FALSE);
        cg$STAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_STAGE
AFTER DELETE ON STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_STAGE
/

PROMPT Creating After Delete Statement Trigger on 'STAGE'
CREATE OR REPLACE TRIGGER cg$ADS_STAGE
AFTER DELETE ON STAGE
DECLARE
    idx        BINARY_INTEGER := cg$STAGE.cg$table.FIRST;
    cg$rec   cg$STAGE.cg$row_type;
    cg$old_rec   cg$STAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ANNEE_PRO := cg$STAGE.cg$table(idx).ANNEE_PRO;
            cg$STAGE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$STAGE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$STAGE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NO_ENTREPRISE := cg$STAGE.cg$table(idx).NO_ENTREPRISE;
            cg$STAGE.cg$tableind(idx).NO_ENTREPRISE := TRUE;
            cg$rec.NO_OFFRE := cg$STAGE.cg$table(idx).NO_OFFRE;
            cg$STAGE.cg$tableind(idx).NO_OFFRE := TRUE;
            cg$rec.NO_CONTACT_ILI := cg$STAGE.cg$table(idx).NO_CONTACT_ILI;
            cg$STAGE.cg$tableind(idx).NO_CONTACT_ILI := TRUE;
            cg$rec.INTITULE := cg$STAGE.cg$table(idx).INTITULE;
            cg$STAGE.cg$tableind(idx).INTITULE := TRUE;
            cg$rec.SUJET := cg$STAGE.cg$table(idx).SUJET;
            cg$STAGE.cg$tableind(idx).SUJET := TRUE;
            cg$rec.DATE_DEB := cg$STAGE.cg$table(idx).DATE_DEB;
            cg$STAGE.cg$tableind(idx).DATE_DEB := TRUE;
            cg$rec.DATE_FIN := cg$STAGE.cg$table(idx).DATE_FIN;
            cg$STAGE.cg$tableind(idx).DATE_FIN := TRUE;
            cg$rec.LIEU := cg$STAGE.cg$table(idx).LIEU;
            cg$STAGE.cg$tableind(idx).LIEU := TRUE;
            cg$rec.ETAT_STAGE := cg$STAGE.cg$table(idx).ETAT_STAGE;
            cg$STAGE.cg$tableind(idx).ETAT_STAGE := TRUE;
            cg$rec.CLE_EVALUATION := cg$STAGE.cg$table(idx).CLE_EVALUATION;
            cg$STAGE.cg$tableind(idx).CLE_EVALUATION := TRUE;
            cg$rec.DESCRIPTION := cg$STAGE.cg$table(idx).DESCRIPTION;
            cg$STAGE.cg$tableind(idx).DESCRIPTION := TRUE;
            cg$rec.ETAT_CONVENTION := cg$STAGE.cg$table(idx).ETAT_CONVENTION;
            cg$STAGE.cg$tableind(idx).ETAT_CONVENTION := TRUE;
            cg$rec.DATE_SIGNATURE_CONV := cg$STAGE.cg$table(idx).DATE_SIGNATURE_CONV;
            cg$STAGE.cg$tableind(idx).DATE_SIGNATURE_CONV := TRUE;
            cg$rec.NO_ENSEIGNANT := cg$STAGE.cg$table(idx).NO_ENSEIGNANT;
            cg$STAGE.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.COMMENTAIRE_TUTEUR := cg$STAGE.cg$table(idx).COMMENTAIRE_TUTEUR;
            cg$STAGE.cg$tableind(idx).COMMENTAIRE_TUTEUR := TRUE;
            cg$rec.DATE_RECEPTION_RAPPORT := cg$STAGE.cg$table(idx).DATE_RECEPTION_RAPPORT;
            cg$STAGE.cg$tableind(idx).DATE_RECEPTION_RAPPORT := TRUE;
            cg$rec.NOTE_ENTREPRISE := cg$STAGE.cg$table(idx).NOTE_ENTREPRISE;
            cg$STAGE.cg$tableind(idx).NOTE_ENTREPRISE := TRUE;
            cg$rec.NOTE_RAPPORT := cg$STAGE.cg$table(idx).NOTE_RAPPORT;
            cg$STAGE.cg$tableind(idx).NOTE_RAPPORT := TRUE;
            cg$rec.NO_SESSION := cg$STAGE.cg$table(idx).NO_SESSION;
            cg$STAGE.cg$tableind(idx).NO_SESSION := TRUE;
            cg$rec.NOTE_SOUTENANCE := cg$STAGE.cg$table(idx).NOTE_SOUTENANCE;
            cg$STAGE.cg$tableind(idx).NOTE_SOUTENANCE := TRUE;

            cg$STAGE.validate_foreign_keys_del(cg$rec);
            cg$STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$STAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$STAGE.cascade_delete(cg$rec);
            cg$STAGE.domain_cascade_delete(cg$rec);             

            idx := cg$STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



