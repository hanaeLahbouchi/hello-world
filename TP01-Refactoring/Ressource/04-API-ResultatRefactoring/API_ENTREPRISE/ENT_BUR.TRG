create or replace TRIGGER CG$BUR_ENTREPRISE BEFORE UPDATE ON ENTREPRISE 
FOR EACH ROW 
DECLARE
    cg$rec     cg$ENTREPRISE.cg$row_type;
    cg$ind     cg$ENTREPRISE.cg$ind_type;
    cg$old_rec cg$ENTREPRISE.cg$row_type;
    v_ref number;
    ex_ent_n_ref EXCEPTION;
BEGIN
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.REFERENCEE := :new.REFERENCEE;
    cg$ind.REFERENCEE :=    (:new.REFERENCEE IS NULL AND :old.REFERENCEE IS NOT NULL )
                        OR (:new.REFERENCEE IS NOT NULL AND :old.REFERENCEE IS NULL)
                        OR NOT(:new.REFERENCEE = :old.REFERENCEE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).REFERENCEE := :old.REFERENCEE;
    cg$rec.DATE_REFERENCEMENT := :new.DATE_REFERENCEMENT;
    cg$ind.DATE_REFERENCEMENT :=    (:new.DATE_REFERENCEMENT IS NULL AND :old.DATE_REFERENCEMENT IS NOT NULL )
                        OR (:new.DATE_REFERENCEMENT IS NOT NULL AND :old.DATE_REFERENCEMENT IS NULL)
                        OR NOT(:new.DATE_REFERENCEMENT = :old.DATE_REFERENCEMENT) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_REFERENCEMENT := :old.DATE_REFERENCEMENT;
    cg$rec.LOGIN_CREA := :old.LOGIN_CREA;
   
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_CREA := :old.LOGIN_CREA;
    cg$rec.DATE_CREA := :new.DATE_CREA;
    cg$ind.DATE_CREA :=    (:new.DATE_CREA IS NULL AND :old.DATE_CREA IS NOT NULL )
                        OR (:new.DATE_CREA IS NOT NULL AND :old.DATE_CREA IS NULL)
                        OR NOT(:new.DATE_CREA = :old.DATE_CREA) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_CREA := :old.DATE_CREA;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NOM := :old.NOM;
    cg$rec.SIEGE_SOCIAL := :new.SIEGE_SOCIAL;
    cg$ind.SIEGE_SOCIAL :=    (:new.SIEGE_SOCIAL IS NULL AND :old.SIEGE_SOCIAL IS NOT NULL )
                        OR (:new.SIEGE_SOCIAL IS NOT NULL AND :old.SIEGE_SOCIAL IS NULL)
                        OR NOT(:new.SIEGE_SOCIAL = :old.SIEGE_SOCIAL) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).SIEGE_SOCIAL := :old.SIEGE_SOCIAL;
    cg$rec.DOMAINE_ACTIVITE := :new.DOMAINE_ACTIVITE;
    cg$ind.DOMAINE_ACTIVITE :=    (:new.DOMAINE_ACTIVITE IS NULL AND :old.DOMAINE_ACTIVITE IS NOT NULL )
                        OR (:new.DOMAINE_ACTIVITE IS NOT NULL AND :old.DOMAINE_ACTIVITE IS NULL)
                        OR NOT(:new.DOMAINE_ACTIVITE = :old.DOMAINE_ACTIVITE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DOMAINE_ACTIVITE := :old.DOMAINE_ACTIVITE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CP := :new.CP;
    cg$ind.CP :=    (:new.CP IS NULL AND :old.CP IS NOT NULL )
                        OR (:new.CP IS NOT NULL AND :old.CP IS NULL)
                        OR NOT(:new.CP = :old.CP) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).CP := :old.CP;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).VILLE := :old.VILLE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS :=    (:new.PAYS IS NULL AND :old.PAYS IS NOT NULL )
                        OR (:new.PAYS IS NOT NULL AND :old.PAYS IS NULL)
                        OR NOT(:new.PAYS = :old.PAYS) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).PAYS := :old.PAYS;
    cg$rec.TEL := :new.TEL;
    cg$ind.TEL :=    (:new.TEL IS NULL AND :old.TEL IS NOT NULL )
                        OR (:new.TEL IS NOT NULL AND :old.TEL IS NULL)
                        OR NOT(:new.TEL = :old.TEL) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).TEL := :old.TEL;
    cg$rec.SITE_INTERNET := :new.SITE_INTERNET;
    cg$ind.SITE_INTERNET :=    (:new.SITE_INTERNET IS NULL AND :old.SITE_INTERNET IS NOT NULL )
                        OR (:new.SITE_INTERNET IS NOT NULL AND :old.SITE_INTERNET IS NULL)
                        OR NOT(:new.SITE_INTERNET = :old.SITE_INTERNET) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).SITE_INTERNET := :old.SITE_INTERNET;
    cg$rec.NOM_REPRESENTANT := :new.NOM_REPRESENTANT;
    cg$ind.NOM_REPRESENTANT :=    (:new.NOM_REPRESENTANT IS NULL AND :old.NOM_REPRESENTANT IS NOT NULL )
                        OR (:new.NOM_REPRESENTANT IS NOT NULL AND :old.NOM_REPRESENTANT IS NULL)
                        OR NOT(:new.NOM_REPRESENTANT = :old.NOM_REPRESENTANT) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).NOM_REPRESENTANT := :old.NOM_REPRESENTANT;
    cg$rec.PRENOM_REPRESENTANT := :new.PRENOM_REPRESENTANT;
    cg$ind.PRENOM_REPRESENTANT :=    (:new.PRENOM_REPRESENTANT IS NULL AND :old.PRENOM_REPRESENTANT IS NOT NULL )
                        OR (:new.PRENOM_REPRESENTANT IS NOT NULL AND :old.PRENOM_REPRESENTANT IS NULL)
                        OR NOT(:new.PRENOM_REPRESENTANT = :old.PRENOM_REPRESENTANT) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).PRENOM_REPRESENTANT := :old.PRENOM_REPRESENTANT;
    cg$rec.LOGIN_MAJ := :new.LOGIN_MAJ;
    cg$ind.LOGIN_MAJ :=    (:new.LOGIN_MAJ IS NULL AND :old.LOGIN_MAJ IS NOT NULL )
                        OR (:new.LOGIN_MAJ IS NOT NULL AND :old.LOGIN_MAJ IS NULL)
                        OR NOT(:new.LOGIN_MAJ = :old.LOGIN_MAJ) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).LOGIN_MAJ := :old.LOGIN_MAJ;
    cg$rec.DATE_MAJ := :new.DATE_MAJ;
    cg$ind.DATE_MAJ :=    (:new.DATE_MAJ IS NULL AND :old.DATE_MAJ IS NOT NULL )
                        OR (:new.DATE_MAJ IS NOT NULL AND :old.DATE_MAJ IS NULL)
                        OR NOT(:new.DATE_MAJ = :old.DATE_MAJ) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).DATE_MAJ := :old.DATE_MAJ;
    cg$rec.OFFRE_STAGE := :new.OFFRE_STAGE;
    cg$ind.OFFRE_STAGE :=    (:new.OFFRE_STAGE IS NULL AND :old.OFFRE_STAGE IS NOT NULL )
                        OR (:new.OFFRE_STAGE IS NOT NULL AND :old.OFFRE_STAGE IS NULL)
                        OR NOT(:new.OFFRE_STAGE = :old.OFFRE_STAGE) ;
    cg$ENTREPRISE.cg$table(cg$ENTREPRISE.idx).OFFRE_STAGE := :old.OFFRE_STAGE;


    cg$ENTREPRISE.idx := cg$ENTREPRISE.idx + 1;

    if not (cg$ENTREPRISE.called_from_package) then
        cg$ENTREPRISE.validate_arc(cg$rec);
        cg$ENTREPRISE.validate_domain(cg$rec, cg$ind);
        cg$ENTREPRISE.validate_domain_cascade_update(cg$old_rec);

        cg$ENTREPRISE.upd(cg$rec, cg$ind, FALSE);
        cg$ENTREPRISE.called_from_package := FALSE;
    end if;

    :new.REFERENCEE := cg$rec.REFERENCEE;
    if(:new.REFERENCEE != :old.REFERENCEE AND :new.REFERENCEE = 'O') THEN
      :new.DATE_REFERENCEMENT := SYSDATE;
    ELSE
      :new.DATE_REFERENCEMENT := cg$rec.DATE_REFERENCEMENT;
    END IF;
    :new.LOGIN_CREA := cg$rec.LOGIN_CREA;
    :new.DATE_CREA := cg$rec.DATE_CREA;
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
    :new.DATE_MAJ := SYSDATE;
    --IF :old.OFFRE_STAGE != :new.OFFRE_STAGE AND :new.OFFRE_STAGE = 'O' THEN
    --  SELECT count(login) into v_ref from AUTHENTIFICATION WHERE no_entreprise = :new.NO_ENTREPRISE;
    -- IF v_ref < 1 THEN
    --    raise ex_ent_n_ref;
    --  END IF;
    --END IF;
    :new.OFFRE_STAGE := cg$rec.OFFRE_STAGE;
EXCEPTION
  WHEN ex_ent_n_ref THEN
      raise_application_error(-20003 , 'L''entreprise ne possède pas d''authentification, elle ne peut donc pas avoir le droit de déposer des offres de stage.');
END;
/