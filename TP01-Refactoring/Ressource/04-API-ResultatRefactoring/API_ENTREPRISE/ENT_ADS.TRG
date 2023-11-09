create or replace TRIGGER cg$ADS_ENTREPRISE
AFTER DELETE ON ENTREPRISE
DECLARE
    idx        BINARY_INTEGER := cg$ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$ENTREPRISE.cg$row_type;
    cg$old_rec   cg$ENTREPRISE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ENTREPRISE := cg$ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
            cg$ENTREPRISE.cg$tableind(idx).NO_ENTREPRISE := TRUE;
            cg$rec.REFERENCEE := cg$ENTREPRISE.cg$table(idx).REFERENCEE;
            cg$ENTREPRISE.cg$tableind(idx).REFERENCEE := TRUE;
            cg$rec.DATE_REFERENCEMENT := cg$ENTREPRISE.cg$table(idx).DATE_REFERENCEMENT;
            cg$ENTREPRISE.cg$tableind(idx).DATE_REFERENCEMENT := TRUE;
            cg$rec.LOGIN_CREA := cg$ENTREPRISE.cg$table(idx).LOGIN_CREA;
            cg$ENTREPRISE.cg$tableind(idx).LOGIN_CREA := TRUE;
            cg$rec.DATE_CREA := cg$ENTREPRISE.cg$table(idx).DATE_CREA;
            cg$ENTREPRISE.cg$tableind(idx).DATE_CREA := TRUE;
            cg$rec.NOM := cg$ENTREPRISE.cg$table(idx).NOM;
            cg$ENTREPRISE.cg$tableind(idx).NOM := TRUE;
            cg$rec.SIEGE_SOCIAL := cg$ENTREPRISE.cg$table(idx).SIEGE_SOCIAL;
            cg$ENTREPRISE.cg$tableind(idx).SIEGE_SOCIAL := TRUE;
            cg$rec.DOMAINE_ACTIVITE := cg$ENTREPRISE.cg$table(idx).DOMAINE_ACTIVITE;
            cg$ENTREPRISE.cg$tableind(idx).DOMAINE_ACTIVITE := TRUE;
            cg$rec.ADRESSE := cg$ENTREPRISE.cg$table(idx).ADRESSE;
            cg$ENTREPRISE.cg$tableind(idx).ADRESSE := TRUE;
            cg$rec.CP := cg$ENTREPRISE.cg$table(idx).CP;
            cg$ENTREPRISE.cg$tableind(idx).CP := TRUE;
            cg$rec.VILLE := cg$ENTREPRISE.cg$table(idx).VILLE;
            cg$ENTREPRISE.cg$tableind(idx).VILLE := TRUE;
            cg$rec.PAYS := cg$ENTREPRISE.cg$table(idx).PAYS;
            cg$ENTREPRISE.cg$tableind(idx).PAYS := TRUE;
            cg$rec.TEL := cg$ENTREPRISE.cg$table(idx).TEL;
            cg$ENTREPRISE.cg$tableind(idx).TEL := TRUE;
            cg$rec.SITE_INTERNET := cg$ENTREPRISE.cg$table(idx).SITE_INTERNET;
            cg$ENTREPRISE.cg$tableind(idx).SITE_INTERNET := TRUE;
            cg$rec.NOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).NOM_REPRESENTANT;
            cg$ENTREPRISE.cg$tableind(idx).NOM_REPRESENTANT := TRUE;
            cg$rec.PRENOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).PRENOM_REPRESENTANT;
            cg$ENTREPRISE.cg$tableind(idx).PRENOM_REPRESENTANT := TRUE;
            cg$rec.LOGIN_MAJ := cg$ENTREPRISE.cg$table(idx).LOGIN_MAJ;
            cg$ENTREPRISE.cg$tableind(idx).LOGIN_MAJ := TRUE;
            cg$rec.DATE_MAJ := cg$ENTREPRISE.cg$table(idx).DATE_MAJ;
            cg$ENTREPRISE.cg$tableind(idx).DATE_MAJ := TRUE;
            cg$rec.OFFRE_STAGE := cg$ENTREPRISE.cg$table(idx).OFFRE_STAGE;
            cg$ENTREPRISE.cg$tableind(idx).OFFRE_STAGE := TRUE;

            cg$ENTREPRISE.validate_foreign_keys_del(cg$rec);
            cg$ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ENTREPRISE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$ENTREPRISE.cascade_delete(cg$rec);
            cg$ENTREPRISE.domain_cascade_delete(cg$rec);             

            idx := cg$ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/