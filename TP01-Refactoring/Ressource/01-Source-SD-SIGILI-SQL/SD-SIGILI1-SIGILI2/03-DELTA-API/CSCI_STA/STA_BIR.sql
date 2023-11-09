create or replace TRIGGER CG$BIR_STAGE BEFORE INSERT ON STAGE 
FOR EACH ROW 
DECLARE
    cg$rec cg$STAGE.cg$row_type;
    cg$ind cg$STAGE.cg$ind_type;
    
    NO_ENTREPRISE_STAGE STAGE.no_entreprise%type;
    INTITULE_STAGE STAGE.intitule%type;
    SUJET_STAGE STAGE.sujet%type;
    LIEU_STAGE STAGE.lieu%type;
    DESCRIPTION_STAGE STAGE.description%type;
    
    NVELLE_CLE STAGE.cle_evaluation%type;
    POURVUE OFFRE_STAGE.etat_offre%type;
    dejaPourvue EXCEPTION;
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
    -- Warning: Column DESCRIPTION is of type LONG and not allowed in triggers
	cg$ind.DESCRIPTION := FALSE;
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
    :new.NO_OFFRE := cg$rec.NO_OFFRE;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.DATE_DEB := cg$rec.DATE_DEB;
    :new.DATE_FIN := cg$rec.DATE_FIN;
    :new.ETAT_STAGE := cg$rec.ETAT_STAGE;
    
    -- Référence à une offre de stage
    IF (LENGTH(:new.NO_OFFRE) <> 0) THEN
      SELECT no_entreprise, intitule, sujet, lieu, description INTO NO_ENTREPRISE_STAGE, INTITULE_STAGE, SUJET_STAGE, LIEU_STAGE, DESCRIPTION_STAGE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
      SELECT etat_offre INTO POURVUE FROM OFFRE_STAGE WHERE no_offre = :new.no_offre;
      IF POURVUE = 'POU' THEN
        RAISE dejaPourvue;
      ELSE
        :new.NO_ENTREPRISE := NO_ENTREPRISE_STAGE;
        :new.INTITULE := INTITULE_STAGE;
        :new.SUJET := SUJET_STAGE;
        :new.LIEU := LIEU_STAGE;
        :new.DESCRIPTION := DESCRIPTION_STAGE;
        UPDATE OFFRE_STAGE SET etat_offre = 'POU' WHERE no_offre = :new.no_offre;
      END IF;
    ELSE
      :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
      :new.INTITULE := cg$rec.INTITULE;
      :new.SUJET := cg$rec.SUJET;
      :new.LIEU := cg$rec.LIEU;
      :new.DESCRIPTION := cg$rec.DESCRIPTION;
    END IF;
      
    -- Cle d'evalution unique
    NVELLE_CLE := TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') || dbms_random.string('X', 12);  
    :new.CLE_EVALUATION := NVELLE_CLE;
    
    -- Warning: Column DESCRIPTION is of type LONG and not allowed in triggers
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
  EXCEPTION
    WHEN dejaPourvue THEN
      raise_application_error(-20001 , 'Cette offre de stage a déjà été pourvue');
END;
/