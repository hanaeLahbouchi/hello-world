create or replace TRIGGER cg$AIS_ENTREPRISE
AFTER INSERT ON ENTREPRISE
DECLARE
    idx      BINARY_INTEGER := cg$ENTREPRISE.cg$table.FIRST;
    cg$rec   cg$ENTREPRISE.cg$row_type;
    cg$old_rec   cg$ENTREPRISE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$ENTREPRISE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ENTREPRISE := cg$ENTREPRISE.cg$table(idx).NO_ENTREPRISE;
            cg$rec.REFERENCEE := cg$ENTREPRISE.cg$table(idx).REFERENCEE;
            cg$rec.DATE_REFERENCEMENT := cg$ENTREPRISE.cg$table(idx).DATE_REFERENCEMENT;
            cg$rec.LOGIN_CREA := cg$ENTREPRISE.cg$table(idx).LOGIN_CREA;
            cg$rec.DATE_CREA := cg$ENTREPRISE.cg$table(idx).DATE_CREA;
            cg$rec.NOM := cg$ENTREPRISE.cg$table(idx).NOM;
            cg$rec.SIEGE_SOCIAL := cg$ENTREPRISE.cg$table(idx).SIEGE_SOCIAL;
            cg$rec.DOMAINE_ACTIVITE := cg$ENTREPRISE.cg$table(idx).DOMAINE_ACTIVITE;
            cg$rec.ADRESSE := cg$ENTREPRISE.cg$table(idx).ADRESSE;
            cg$rec.CP := cg$ENTREPRISE.cg$table(idx).CP;
            cg$rec.VILLE := cg$ENTREPRISE.cg$table(idx).VILLE;
            cg$rec.PAYS := cg$ENTREPRISE.cg$table(idx).PAYS;
            cg$rec.TEL := cg$ENTREPRISE.cg$table(idx).TEL;
            cg$rec.SITE_INTERNET := cg$ENTREPRISE.cg$table(idx).SITE_INTERNET;
            cg$rec.NOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).NOM_REPRESENTANT;
            cg$rec.PRENOM_REPRESENTANT := cg$ENTREPRISE.cg$table(idx).PRENOM_REPRESENTANT;
            cg$rec.LOGIN_MAJ := cg$ENTREPRISE.cg$table(idx).LOGIN_MAJ;
            cg$rec.DATE_MAJ := cg$ENTREPRISE.cg$table(idx).DATE_MAJ;
            cg$rec.OFFRE_STAGE := cg$ENTREPRISE.cg$table(idx).OFFRE_STAGE;

            cg$ENTREPRISE.validate_foreign_keys_ins(cg$rec);

            cg$ENTREPRISE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ENTREPRISE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$ENTREPRISE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/