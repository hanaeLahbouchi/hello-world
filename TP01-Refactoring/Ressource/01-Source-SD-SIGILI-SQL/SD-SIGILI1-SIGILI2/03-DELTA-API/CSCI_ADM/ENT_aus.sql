CREATE OR REPLACE
TRIGGER CG$AUS_ENTREPRISE AFTER UPDATE ON ENTREPRISE 
DECLARE
    idx        BINARY_INTEGER := cg$ENTREPRISE.cg$table.FIRST;
    cg$old_rec cg$ENTREPRISE.cg$row_type;
    cg$rec     cg$ENTREPRISE.cg$row_type;
    cg$ind     cg$ENTREPRISE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ENTREPRISE := cg$ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
        cg$old_rec.REFERENCEE := cg$ENTREPRISE.cg$table(idx).REFERENCEE;
        cg$old_rec.DATE_REFERENCEMENT := cg$ENTREPRISE.cg$table(idx).DATE_REFERENCEMENT;
        cg$old_rec.LOGIN_CREA := cg$ENTREPRISE.cg$table(idx).LOGIN_CREA;
        cg$old_rec.DATE_CREA := cg$ENTREPRISE.cg$table(idx).DATE_CREA;
        cg$old_rec.NOM := cg$ENTREPRISE.cg$table(idx).NOM;
        cg$old_rec.SIEGE_SOCIAL := cg$ENTREPRISE.cg$table(idx).SIEGE_SOCIAL;
        cg$old_rec.DOMAINE_ACTIVITE := cg$ENTREPRISE.cg$table(idx).DOMAINE_ACTIVITE;
        cg$old_rec.ADRESSE := cg$ENTREPRISE.cg$table(idx).ADRESSE;
        cg$old_rec.CP := cg$ENTREPRISE.cg$table(idx).CP;
        cg$old_rec.VILLE := cg$ENTREPRISE.cg$table(idx).VILLE;
        cg$old_rec.PAYS := cg$ENTREPRISE.cg$table(idx).PAYS;
        cg$old_rec.TEL := cg$ENTREPRISE.cg$table(idx).TEL;
        cg$old_rec.SITE_INTERNET := cg$ENTREPRISE.cg$table(idx).SITE_INTERNET;
        cg$old_rec.NOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).NOM_REPRESENTANT;
        cg$old_rec.PRENOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).PRENOM_REPRESENTANT;
        cg$old_rec.LOGIN_MAJ := cg$ENTREPRISE.cg$table(idx).LOGIN_MAJ;
        cg$old_rec.DATE_MAJ := cg$ENTREPRISE.cg$table(idx).DATE_MAJ;
        cg$old_rec.OFFRE_STAGE := cg$ENTREPRISE.cg$table(idx).OFFRE_STAGE;

    IF NOT (cg$ENTREPRISE.called_from_package) THEN
        idx := cg$ENTREPRISE.cg$table.NEXT(idx);
        cg$rec.NO_ENTREPRISE := cg$ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');
        cg$rec.REFERENCEE := cg$ENTREPRISE.cg$table(idx).REFERENCEE;
        cg$ind.REFERENCEE := updating('REFERENCEE');
        cg$rec.DATE_REFERENCEMENT := cg$ENTREPRISE.cg$table(idx).DATE_REFERENCEMENT;
        cg$ind.DATE_REFERENCEMENT := updating('DATE_REFERENCEMENT');
        cg$rec.LOGIN_CREA := cg$ENTREPRISE.cg$table(idx).LOGIN_CREA;
        cg$ind.LOGIN_CREA := updating('LOGIN_CREA');
        cg$rec.DATE_CREA := cg$ENTREPRISE.cg$table(idx).DATE_CREA;
        cg$ind.DATE_CREA := updating('DATE_CREA');
        cg$rec.NOM := cg$ENTREPRISE.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.SIEGE_SOCIAL := cg$ENTREPRISE.cg$table(idx).SIEGE_SOCIAL;
        cg$ind.SIEGE_SOCIAL := updating('SIEGE_SOCIAL');
        cg$rec.DOMAINE_ACTIVITE := cg$ENTREPRISE.cg$table(idx).DOMAINE_ACTIVITE;
        cg$ind.DOMAINE_ACTIVITE := updating('DOMAINE_ACTIVITE');
        cg$rec.ADRESSE := cg$ENTREPRISE.cg$table(idx).ADRESSE;
        cg$ind.ADRESSE := updating('ADRESSE');
        cg$rec.CP := cg$ENTREPRISE.cg$table(idx).CP;
        cg$ind.CP := updating('CP');
        cg$rec.VILLE := cg$ENTREPRISE.cg$table(idx).VILLE;
        cg$ind.VILLE := updating('VILLE');
        cg$rec.PAYS := cg$ENTREPRISE.cg$table(idx).PAYS;
        cg$ind.PAYS := updating('PAYS');
        cg$rec.TEL := cg$ENTREPRISE.cg$table(idx).TEL;
        cg$ind.TEL := updating('TEL');
        cg$rec.SITE_INTERNET := cg$ENTREPRISE.cg$table(idx).SITE_INTERNET;
        cg$ind.SITE_INTERNET := updating('SITE_INTERNET');
        cg$rec.NOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).NOM_REPRESENTANT;
        cg$ind.NOM_REPRESENTANT := updating('NOM_REPRESENTANT');
        cg$rec.PRENOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).PRENOM_REPRESENTANT;
        cg$ind.PRENOM_REPRESENTANT := updating('PRENOM_REPRESENTANT');
        cg$rec.LOGIN_MAJ := cg$ENTREPRISE.cg$table(idx).LOGIN_MAJ;
        cg$ind.LOGIN_MAJ := updating('LOGIN_MAJ');
        cg$rec.DATE_MAJ := cg$ENTREPRISE.cg$table(idx).DATE_MAJ;
        cg$ind.DATE_MAJ := updating('DATE_MAJ');
        cg$rec.OFFRE_STAGE := cg$ENTREPRISE.cg$table(idx).OFFRE_STAGE;
        cg$ind.OFFRE_STAGE := updating('OFFRE_STAGE');

        cg$ENTREPRISE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$ENTREPRISE.upd_denorm2( cg$rec,
                                       cg$ENTREPRISE.cg$tableind(idx)
                                     );
        cg$ENTREPRISE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$ENTREPRISE.cg$tableind(idx)
								                  );
        cg$ENTREPRISE.cascade_update(cg$rec, cg$old_rec);
        cg$ENTREPRISE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$ENTREPRISE.called_from_package := FALSE;
	END IF;
        idx := cg$ENTREPRISE.cg$table.NEXT(idx);
    END LOOP;

    cg$ENTREPRISE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/