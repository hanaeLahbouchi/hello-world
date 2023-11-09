create or replace TRIGGER CG$BIR_ENTREPRISE BEFORE INSERT ON ENTREPRISE 
FOR EACH ROW 
DECLARE
    cg$rec cg$ENTREPRISE.cg$row_type;
    cg$ind cg$ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE := TRUE;
    cg$rec.REFERENCEE := :new.REFERENCEE;
    cg$ind.REFERENCEE := TRUE;
    cg$rec.DATE_REFERENCEMENT := :new.DATE_REFERENCEMENT;
    cg$ind.DATE_REFERENCEMENT := TRUE;
    cg$rec.LOGIN_CREA := :new.LOGIN_CREA;
    cg$ind.LOGIN_CREA := TRUE;
    cg$rec.DATE_CREA := :new.DATE_CREA;
    cg$ind.DATE_CREA := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.SIEGE_SOCIAL := :new.SIEGE_SOCIAL;
    cg$ind.SIEGE_SOCIAL := TRUE;
    cg$rec.DOMAINE_ACTIVITE := :new.DOMAINE_ACTIVITE;
    cg$ind.DOMAINE_ACTIVITE := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CP := :new.CP;
    cg$ind.CP := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS := TRUE;
    cg$rec.TEL := :new.TEL;
    cg$ind.TEL := TRUE;
    cg$rec.SITE_INTERNET := :new.SITE_INTERNET;
    cg$ind.SITE_INTERNET := TRUE;
    cg$rec.NOM_REPRESENTANT := :new.NOM_REPRESENTANT;
    cg$ind.NOM_REPRESENTANT := TRUE;
    cg$rec.PRENOM_REPRESENTANT := :new.PRENOM_REPRESENTANT;
    cg$ind.PRENOM_REPRESENTANT := TRUE;
    cg$rec.LOGIN_MAJ := :new.LOGIN_MAJ;
    cg$ind.LOGIN_MAJ := TRUE;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ := TRUE;
    cg$rec.OFFRE_STAGE := :new.OFFRE_STAGE;
    cg$ind.OFFRE_STAGE := TRUE;

    if not (cg$ENTREPRISE.called_from_package) then
        cg$ENTREPRISE.validate_arc(cg$rec);
        cg$ENTREPRISE.validate_domain(cg$rec);

        cg$ENTREPRISE.ins(cg$rec, cg$ind, FALSE);
        cg$ENTREPRISE.called_from_package := FALSE;
    end if;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).REFERENCEE := cg$rec.REFERENCEE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).REFERENCEE := cg$ind.REFERENCEE;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_REFERENCEMENT := cg$rec.DATE_REFERENCEMENT;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).DATE_REFERENCEMENT := cg$ind.DATE_REFERENCEMENT;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_CREA := cg$rec.LOGIN_CREA;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).LOGIN_CREA := cg$ind.LOGIN_CREA;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_CREA := cg$rec.DATE_CREA;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).DATE_CREA := cg$ind.DATE_CREA;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NOM := cg$rec.NOM;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).NOM := cg$ind.NOM;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).SIEGE_SOCIAL := cg$rec.SIEGE_SOCIAL;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).SIEGE_SOCIAL := cg$ind.SIEGE_SOCIAL;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DOMAINE_ACTIVITE := cg$rec.DOMAINE_ACTIVITE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).DOMAINE_ACTIVITE := cg$ind.DOMAINE_ACTIVITE;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).ADRESSE := cg$rec.ADRESSE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).ADRESSE := cg$ind.ADRESSE;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).CP := cg$rec.CP;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).CP := cg$ind.CP;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).VILLE := cg$rec.VILLE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).VILLE := cg$ind.VILLE;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).PAYS := cg$rec.PAYS;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).PAYS := cg$ind.PAYS;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).TEL := cg$rec.TEL;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).TEL := cg$ind.TEL;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).SITE_INTERNET := cg$rec.SITE_INTERNET;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).SITE_INTERNET := cg$ind.SITE_INTERNET;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NOM_REPRESENTANT := cg$rec.NOM_REPRESENTANT;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).NOM_REPRESENTANT := cg$ind.NOM_REPRESENTANT;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).PRENOM_REPRESENTANT := cg$rec.PRENOM_REPRESENTANT;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).PRENOM_REPRESENTANT := cg$ind.PRENOM_REPRESENTANT;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_MAJ := cg$rec.LOGIN_MAJ;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).LOGIN_MAJ := cg$ind.LOGIN_MAJ;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_MAJ := cg$rec.DATE_MAJ;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).DATE_MAJ := cg$ind.DATE_MAJ;

    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).OFFRE_STAGE := cg$rec.OFFRE_STAGE;
    cg$ENTREPRISE.cg$tableind(cg$ENTREPRISE.idx).OFFRE_STAGE := cg$ind.OFFRE_STAGE;

    cg$ENTREPRISE.idx := cg$ENTREPRISE.idx + 1;

    --SELECT ENT_SEQ.nextval INTO :NEW.NO_ENTREPRISE FROM DUAL;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.REFERENCEE := cg$rec.REFERENCEE;
    IF (:new.REFERENCEE = 'O') THEN
      :new.DATE_REFERENCEMENT := SYSDATE;
    ELSE
      :new.DATE_REFERENCEMENT := cg$rec.DATE_REFERENCEMENT;
    END IF;
    :new.LOGIN_CREA := cg$rec.LOGIN_CREA;
    :new.DATE_CREA := SYSDATE;
    :new.NOM := cg$rec.NOM;
    :new.SIEGE_SOCIAL := cg$rec.SIEGE_SOCIAL;
    :new.DOMAINE_ACTIVITE := cg$rec.DOMAINE_ACTIVITE;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS := cg$rec.PAYS;
    :new.TEL := cg$rec.TEL;
    :new.SITE_INTERNET := cg$rec.SITE_INTERNET;
    :new.NOM_REPRESENTANT := cg$rec.NOM_REPRESENTANT;
    :new.PRENOM_REPRESENTANT := cg$rec.PRENOM_REPRESENTANT;
    :new.LOGIN_MAJ := cg$rec.LOGIN_MAJ;
    :new.DATE_MAJ := cg$rec.DATE_MAJ;
    :new.OFFRE_STAGE := cg$rec.OFFRE_STAGE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/