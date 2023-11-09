CREATE OR REPLACE
TRIGGER CG$BUR_STAGE BEFORE UPDATE ON STAGE 
FOR EACH ROW 
DECLARE
    cg$rec     cg$STAGE.cg$row_type;
    cg$ind     cg$STAGE.cg$ind_type;
    cg$old_rec cg$STAGE.cg$row_type;
    
    NO_ENTREPRISE_STAGE STAGE.no_entreprise%type;
    INTITULE_STAGE STAGE.intitule%type;
    SUJET_STAGE STAGE.sujet%type;
    LIEU_STAGE STAGE.lieu%type;
    DESCRIPTION_STAGE STAGE.description%type;
    
    POURVUE OFFRE_STAGE.etat_offre%type;
    dejaPourvue EXCEPTION;
BEGIN

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
    -- Warning: Column DESCRIPTION is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;
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
  
    :new.NO_OFFRE := cg$rec.NO_OFFRE;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.DATE_DEB := cg$rec.DATE_DEB;
    :new.DATE_FIN := cg$rec.DATE_FIN;
    :new.ETAT_STAGE := cg$rec.ETAT_STAGE;
    
    --IF (:new.no_offre != :old.no_offre) THEN
    -- Si on affecte une offre
    IF (LENGTH(:new.NO_OFFRE) <> 0) THEN
    -- Si y'avait déjà une offre
      IF (LENGTH(:old.NO_OFFRE) <> 0) THEN
        -- Si l'offre à été modifiée
        IF (:new.no_offre != :old.no_offre) THEN
          SELECT etat_offre INTO POURVUE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
          IF POURVUE = 'POU' THEN
            RAISE dejaPourvue;
          ELSE
            SELECT no_entreprise, intitule, sujet, lieu, description INTO NO_ENTREPRISE_STAGE, INTITULE_STAGE, SUJET_STAGE, LIEU_STAGE, DESCRIPTION_STAGE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
            :new.NO_ENTREPRISE := NO_ENTREPRISE_STAGE;
            :new.INTITULE := INTITULE_STAGE;
            :new.SUJET := SUJET_STAGE;
            :new.LIEU := LIEU_STAGE;
            :new.DESCRIPTION := DESCRIPTION_STAGE;
            UPDATE OFFRE_STAGE SET etat_offre = 'POU' WHERE no_offre = :new.no_offre;
            UPDATE OFFRE_STAGE SET etat_offre = 'OUV' WHERE no_offre = :old.no_offre;
          END IF;
        END IF;-- Si l'offre à été modifiée
      -- y'avait pas d'offre
      ELSE
        SELECT etat_offre INTO POURVUE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
        IF POURVUE = 'POU' THEN
          RAISE dejaPourvue;
        ELSE
          SELECT no_entreprise, intitule, sujet, lieu, description INTO NO_ENTREPRISE_STAGE, INTITULE_STAGE, SUJET_STAGE, LIEU_STAGE, DESCRIPTION_STAGE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
          :new.NO_ENTREPRISE := NO_ENTREPRISE_STAGE;
          :new.INTITULE := INTITULE_STAGE;
          :new.SUJET := SUJET_STAGE;
          :new.LIEU := LIEU_STAGE;
          :new.DESCRIPTION := DESCRIPTION_STAGE;
          UPDATE OFFRE_STAGE SET etat_offre = 'POU' WHERE no_offre = :new.no_offre;
        END IF;
      END IF; -- Si y'avait déjà une offre
    ELSE -- Si on affecte pas une offre
      IF (LENGTH(:old.NO_OFFRE) <> 0) THEN
        UPDATE OFFRE_STAGE SET etat_offre = 'OUV' WHERE no_offre = :old.no_offre;
      END IF;
      :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
      :new.INTITULE := cg$rec.INTITULE;
      :new.SUJET := cg$rec.SUJET;
      :new.LIEU := cg$rec.LIEU;
      :new.DESCRIPTION := cg$rec.DESCRIPTION;
    END IF;-- Si on affecte une offre
    --END IF;
    
    :new.CLE_EVALUATION := cg$rec.CLE_EVALUATION;
    :new.ETAT_CONVENTION := cg$rec.ETAT_CONVENTION;
    :new.DATE_SIGNATURE_CONV := cg$rec.DATE_SIGNATURE_CONV;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.COMMENTAIRE_TUTEUR := cg$rec.COMMENTAIRE_TUTEUR;
    :new.DATE_RECEPTION_RAPPORT := cg$rec.DATE_RECEPTION_RAPPORT;
    :new.NOTE_ENTREPRISE := cg$rec.NOTE_ENTREPRISE;
    :new.NOTE_RAPPORT := cg$rec.NOTE_RAPPORT;
    :new.NO_SESSION := cg$rec.NO_SESSION;
    :new.NOTE_SOUTENANCE := cg$rec.NOTE_SOUTENANCE;

  EXCEPTION
    WHEN dejaPourvue THEN
      raise_application_error(-20001 , 'Cette offre de stage a déjà été pourvue');
END;
/

create or replace TRIGGER AIR_STAGE_OFF AFTER INSERT ON STAGE 
FOR EACH ROW 
BEGIN
  IF (LENGTH(:new.NO_OFFRE) <> 0) THEN
    UPDATE OFFRE_STAGE SET etat_offre = 'POU' WHERE no_offre = :new.no_offre;
  END IF;
END;
/

create or replace TRIGGER AUR_STAGE_OFF AFTER UPDATE ON STAGE 
FOR EACH ROW 
BEGIN
  IF (:new.no_offre != :old.no_offre) THEN
    IF (LENGTH(:new.NO_OFFRE) != 0) THEN
        UPDATE OFFRE_STAGE SET etat_offre = 'POU' WHERE no_offre = :new.no_offre;
    END IF;
  END IF;
  IF(LENGTH(:old.NO_OFFRE) != 0) THEN
    UPDATE OFFRE_STAGE SET etat_offre = 'OUV' WHERE no_offre = :old.no_offre;
  END IF;
END;
/