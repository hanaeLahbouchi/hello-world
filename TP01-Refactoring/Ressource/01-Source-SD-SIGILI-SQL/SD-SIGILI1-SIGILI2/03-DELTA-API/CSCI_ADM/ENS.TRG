
PROMPT Creating Trigger Logic for Table 'ENSEIGNANT'
PROMPT Creating Before Insert Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BIS_ENSEIGNANT
BEFORE INSERT ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BIR_ENSEIGNANT
BEFORE INSERT ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$rec cg$ENSEIGNANT.cg$row_type;
    cg$ind cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.TYPE := :new.TYPE;
    cg$ind.TYPE := TRUE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CP := :new.CP;
    cg$ind.CP := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS := TRUE;
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT := TRUE;
    cg$rec.ENC_PERSO_TEL := :new.ENC_PERSO_TEL;
    cg$ind.ENC_PERSO_TEL := TRUE;
    cg$rec.ENC_UBO_TEL := :new.ENC_UBO_TEL;
    cg$ind.ENC_UBO_TEL := TRUE;
    cg$rec.ENC_PERSO_EMAIL := :new.ENC_PERSO_EMAIL;
    cg$ind.ENC_PERSO_EMAIL := TRUE;
    cg$rec.ENC_UBO_EMAIL := :new.ENC_UBO_EMAIL;
    cg$ind.ENC_UBO_EMAIL := TRUE;
    cg$rec.INT_NO_INSEE := :new.INT_NO_INSEE;
    cg$ind.INT_NO_INSEE := TRUE;
    cg$rec.INT_SOC_NOM := :new.INT_SOC_NOM;
    cg$ind.INT_SOC_NOM := TRUE;
    cg$rec.INT_SOC_ADRESSE := :new.INT_SOC_ADRESSE;
    cg$ind.INT_SOC_ADRESSE := TRUE;
    cg$rec.INT_SOC_CP := :new.INT_SOC_CP;
    cg$ind.INT_SOC_CP := TRUE;
    cg$rec.INT_SOC_VILLE := :new.INT_SOC_VILLE;
    cg$ind.INT_SOC_VILLE := TRUE;
    cg$rec.INT_SOC_PAYS := :new.INT_SOC_PAYS;
    cg$ind.INT_SOC_PAYS := TRUE;
    cg$rec.INT_FONCTION := :new.INT_FONCTION;
    cg$ind.INT_FONCTION := TRUE;
    cg$rec.INT_PROF_EMAIL := :new.INT_PROF_EMAIL;
    cg$ind.INT_PROF_EMAIL := TRUE;
    cg$rec.INT_PROF_TEL := :new.INT_PROF_TEL;
    cg$ind.INT_PROF_TEL := TRUE;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_arc(cg$rec);
        cg$ENSEIGNANT.validate_domain(cg$rec);

        cg$ENSEIGNANT.ins(cg$rec, cg$ind, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TYPE := cg$rec.TYPE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).TYPE := cg$ind.TYPE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).SEXE := cg$rec.SEXE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).SEXE := cg$ind.SEXE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NOM := cg$rec.NOM;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).NOM := cg$ind.NOM;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PRENOM := cg$rec.PRENOM;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).PRENOM := cg$ind.PRENOM;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ADRESSE := cg$rec.ADRESSE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ADRESSE := cg$ind.ADRESSE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).CP := cg$rec.CP;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).CP := cg$ind.CP;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).VILLE := cg$rec.VILLE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).VILLE := cg$ind.VILLE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PAYS := cg$rec.PAYS;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).PAYS := cg$ind.PAYS;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TEL_PORT := cg$rec.TEL_PORT;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).TEL_PORT := cg$ind.TEL_PORT;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_PERSO_TEL := cg$rec.ENC_PERSO_TEL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ENC_PERSO_TEL := cg$ind.ENC_PERSO_TEL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_UBO_TEL := cg$rec.ENC_UBO_TEL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ENC_UBO_TEL := cg$ind.ENC_UBO_TEL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_PERSO_EMAIL := cg$rec.ENC_PERSO_EMAIL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ENC_PERSO_EMAIL := cg$ind.ENC_PERSO_EMAIL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_UBO_EMAIL := cg$rec.ENC_UBO_EMAIL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).ENC_UBO_EMAIL := cg$ind.ENC_UBO_EMAIL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_NO_INSEE := cg$rec.INT_NO_INSEE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_NO_INSEE := cg$ind.INT_NO_INSEE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_NOM := cg$rec.INT_SOC_NOM;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_SOC_NOM := cg$ind.INT_SOC_NOM;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_ADRESSE := cg$rec.INT_SOC_ADRESSE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_SOC_ADRESSE := cg$ind.INT_SOC_ADRESSE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_CP := cg$rec.INT_SOC_CP;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_SOC_CP := cg$ind.INT_SOC_CP;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_VILLE := cg$rec.INT_SOC_VILLE;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_SOC_VILLE := cg$ind.INT_SOC_VILLE;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_PAYS := cg$rec.INT_SOC_PAYS;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_SOC_PAYS := cg$ind.INT_SOC_PAYS;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_FONCTION := cg$rec.INT_FONCTION;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_FONCTION := cg$ind.INT_FONCTION;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_PROF_EMAIL := cg$rec.INT_PROF_EMAIL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_PROF_EMAIL := cg$ind.INT_PROF_EMAIL;

    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_PROF_TEL := cg$rec.INT_PROF_TEL;
    cg$ENSEIGNANT.cg$tableind(cg$ENSEIGNANT.idx).INT_PROF_TEL := cg$ind.INT_PROF_TEL;

    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.TYPE := cg$rec.TYPE;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS := cg$rec.PAYS;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.ENC_PERSO_TEL := cg$rec.ENC_PERSO_TEL;
    :new.ENC_UBO_TEL := cg$rec.ENC_UBO_TEL;
    :new.ENC_PERSO_EMAIL := cg$rec.ENC_PERSO_EMAIL;
    :new.ENC_UBO_EMAIL := cg$rec.ENC_UBO_EMAIL;
    :new.INT_NO_INSEE := cg$rec.INT_NO_INSEE;
    :new.INT_SOC_NOM := cg$rec.INT_SOC_NOM;
    :new.INT_SOC_ADRESSE := cg$rec.INT_SOC_ADRESSE;
    :new.INT_SOC_CP := cg$rec.INT_SOC_CP;
    :new.INT_SOC_VILLE := cg$rec.INT_SOC_VILLE;
    :new.INT_SOC_PAYS := cg$rec.INT_SOC_PAYS;
    :new.INT_FONCTION := cg$rec.INT_FONCTION;
    :new.INT_PROF_EMAIL := cg$rec.INT_PROF_EMAIL;
    :new.INT_PROF_TEL := cg$rec.INT_PROF_TEL;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_ENSEIGNANT
AFTER INSERT ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_ENSEIGNANT
/

PROMPT Creating After Insert Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$AIS_ENSEIGNANT
AFTER INSERT ON ENSEIGNANT
DECLARE
    idx      BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$rec   cg$ENSEIGNANT.cg$row_type;
    cg$old_rec   cg$ENSEIGNANT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$ENSEIGNANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
            cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
            cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
            cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
            cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
            cg$rec.CP := cg$ENSEIGNANT.cg$table(idx).CP;
            cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
            cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
            cg$rec.TEL_PORT := cg$ENSEIGNANT.cg$table(idx).TEL_PORT;
            cg$rec.ENC_PERSO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_TEL;
            cg$rec.ENC_UBO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_TEL;
            cg$rec.ENC_PERSO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_EMAIL;
            cg$rec.ENC_UBO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_EMAIL;
            cg$rec.INT_NO_INSEE := cg$ENSEIGNANT.cg$table(idx).INT_NO_INSEE;
            cg$rec.INT_SOC_NOM := cg$ENSEIGNANT.cg$table(idx).INT_SOC_NOM;
            cg$rec.INT_SOC_ADRESSE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_ADRESSE;
            cg$rec.INT_SOC_CP := cg$ENSEIGNANT.cg$table(idx).INT_SOC_CP;
            cg$rec.INT_SOC_VILLE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_VILLE;
            cg$rec.INT_SOC_PAYS := cg$ENSEIGNANT.cg$table(idx).INT_SOC_PAYS;
            cg$rec.INT_FONCTION := cg$ENSEIGNANT.cg$table(idx).INT_FONCTION;
            cg$rec.INT_PROF_EMAIL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_EMAIL;
            cg$rec.INT_PROF_TEL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_TEL;

            cg$ENSEIGNANT.validate_foreign_keys_ins(cg$rec);

            cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ENSEIGNANT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BUS_ENSEIGNANT
BEFORE UPDATE ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BUR_ENSEIGNANT
BEFORE UPDATE ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$rec     cg$ENSEIGNANT.cg$row_type;
    cg$ind     cg$ENSEIGNANT.cg$ind_type;
    cg$old_rec cg$ENSEIGNANT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.TYPE := :new.TYPE;
    cg$ind.TYPE :=    (:new.TYPE IS NULL AND :old.TYPE IS NOT NULL )
                        OR (:new.TYPE IS NOT NULL AND :old.TYPE IS NULL)
                        OR NOT(:new.TYPE = :old.TYPE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TYPE := :old.TYPE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE :=    (:new.SEXE IS NULL AND :old.SEXE IS NOT NULL )
                        OR (:new.SEXE IS NOT NULL AND :old.SEXE IS NULL)
                        OR NOT(:new.SEXE = :old.SEXE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).SEXE := :old.SEXE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PRENOM := :old.PRENOM;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CP := :new.CP;
    cg$ind.CP :=    (:new.CP IS NULL AND :old.CP IS NOT NULL )
                        OR (:new.CP IS NOT NULL AND :old.CP IS NULL)
                        OR NOT(:new.CP = :old.CP) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).CP := :old.CP;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).VILLE := :old.VILLE;
    cg$rec.PAYS := :new.PAYS;
    cg$ind.PAYS :=    (:new.PAYS IS NULL AND :old.PAYS IS NOT NULL )
                        OR (:new.PAYS IS NOT NULL AND :old.PAYS IS NULL)
                        OR NOT(:new.PAYS = :old.PAYS) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).PAYS := :old.PAYS;
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT :=    (:new.TEL_PORT IS NULL AND :old.TEL_PORT IS NOT NULL )
                        OR (:new.TEL_PORT IS NOT NULL AND :old.TEL_PORT IS NULL)
                        OR NOT(:new.TEL_PORT = :old.TEL_PORT) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).TEL_PORT := :old.TEL_PORT;
    cg$rec.ENC_PERSO_TEL := :new.ENC_PERSO_TEL;
    cg$ind.ENC_PERSO_TEL :=    (:new.ENC_PERSO_TEL IS NULL AND :old.ENC_PERSO_TEL IS NOT NULL )
                        OR (:new.ENC_PERSO_TEL IS NOT NULL AND :old.ENC_PERSO_TEL IS NULL)
                        OR NOT(:new.ENC_PERSO_TEL = :old.ENC_PERSO_TEL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_PERSO_TEL := :old.ENC_PERSO_TEL;
    cg$rec.ENC_UBO_TEL := :new.ENC_UBO_TEL;
    cg$ind.ENC_UBO_TEL :=    (:new.ENC_UBO_TEL IS NULL AND :old.ENC_UBO_TEL IS NOT NULL )
                        OR (:new.ENC_UBO_TEL IS NOT NULL AND :old.ENC_UBO_TEL IS NULL)
                        OR NOT(:new.ENC_UBO_TEL = :old.ENC_UBO_TEL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_UBO_TEL := :old.ENC_UBO_TEL;
    cg$rec.ENC_PERSO_EMAIL := :new.ENC_PERSO_EMAIL;
    cg$ind.ENC_PERSO_EMAIL :=    (:new.ENC_PERSO_EMAIL IS NULL AND :old.ENC_PERSO_EMAIL IS NOT NULL )
                        OR (:new.ENC_PERSO_EMAIL IS NOT NULL AND :old.ENC_PERSO_EMAIL IS NULL)
                        OR NOT(:new.ENC_PERSO_EMAIL = :old.ENC_PERSO_EMAIL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_PERSO_EMAIL := :old.ENC_PERSO_EMAIL;
    cg$rec.ENC_UBO_EMAIL := :new.ENC_UBO_EMAIL;
    cg$ind.ENC_UBO_EMAIL :=    (:new.ENC_UBO_EMAIL IS NULL AND :old.ENC_UBO_EMAIL IS NOT NULL )
                        OR (:new.ENC_UBO_EMAIL IS NOT NULL AND :old.ENC_UBO_EMAIL IS NULL)
                        OR NOT(:new.ENC_UBO_EMAIL = :old.ENC_UBO_EMAIL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).ENC_UBO_EMAIL := :old.ENC_UBO_EMAIL;
    cg$rec.INT_NO_INSEE := :new.INT_NO_INSEE;
    cg$ind.INT_NO_INSEE :=    (:new.INT_NO_INSEE IS NULL AND :old.INT_NO_INSEE IS NOT NULL )
                        OR (:new.INT_NO_INSEE IS NOT NULL AND :old.INT_NO_INSEE IS NULL)
                        OR NOT(:new.INT_NO_INSEE = :old.INT_NO_INSEE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_NO_INSEE := :old.INT_NO_INSEE;
    cg$rec.INT_SOC_NOM := :new.INT_SOC_NOM;
    cg$ind.INT_SOC_NOM :=    (:new.INT_SOC_NOM IS NULL AND :old.INT_SOC_NOM IS NOT NULL )
                        OR (:new.INT_SOC_NOM IS NOT NULL AND :old.INT_SOC_NOM IS NULL)
                        OR NOT(:new.INT_SOC_NOM = :old.INT_SOC_NOM) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_NOM := :old.INT_SOC_NOM;
    cg$rec.INT_SOC_ADRESSE := :new.INT_SOC_ADRESSE;
    cg$ind.INT_SOC_ADRESSE :=    (:new.INT_SOC_ADRESSE IS NULL AND :old.INT_SOC_ADRESSE IS NOT NULL )
                        OR (:new.INT_SOC_ADRESSE IS NOT NULL AND :old.INT_SOC_ADRESSE IS NULL)
                        OR NOT(:new.INT_SOC_ADRESSE = :old.INT_SOC_ADRESSE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_ADRESSE := :old.INT_SOC_ADRESSE;
    cg$rec.INT_SOC_CP := :new.INT_SOC_CP;
    cg$ind.INT_SOC_CP :=    (:new.INT_SOC_CP IS NULL AND :old.INT_SOC_CP IS NOT NULL )
                        OR (:new.INT_SOC_CP IS NOT NULL AND :old.INT_SOC_CP IS NULL)
                        OR NOT(:new.INT_SOC_CP = :old.INT_SOC_CP) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_CP := :old.INT_SOC_CP;
    cg$rec.INT_SOC_VILLE := :new.INT_SOC_VILLE;
    cg$ind.INT_SOC_VILLE :=    (:new.INT_SOC_VILLE IS NULL AND :old.INT_SOC_VILLE IS NOT NULL )
                        OR (:new.INT_SOC_VILLE IS NOT NULL AND :old.INT_SOC_VILLE IS NULL)
                        OR NOT(:new.INT_SOC_VILLE = :old.INT_SOC_VILLE) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_VILLE := :old.INT_SOC_VILLE;
    cg$rec.INT_SOC_PAYS := :new.INT_SOC_PAYS;
    cg$ind.INT_SOC_PAYS :=    (:new.INT_SOC_PAYS IS NULL AND :old.INT_SOC_PAYS IS NOT NULL )
                        OR (:new.INT_SOC_PAYS IS NOT NULL AND :old.INT_SOC_PAYS IS NULL)
                        OR NOT(:new.INT_SOC_PAYS = :old.INT_SOC_PAYS) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_SOC_PAYS := :old.INT_SOC_PAYS;
    cg$rec.INT_FONCTION := :new.INT_FONCTION;
    cg$ind.INT_FONCTION :=    (:new.INT_FONCTION IS NULL AND :old.INT_FONCTION IS NOT NULL )
                        OR (:new.INT_FONCTION IS NOT NULL AND :old.INT_FONCTION IS NULL)
                        OR NOT(:new.INT_FONCTION = :old.INT_FONCTION) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_FONCTION := :old.INT_FONCTION;
    cg$rec.INT_PROF_EMAIL := :new.INT_PROF_EMAIL;
    cg$ind.INT_PROF_EMAIL :=    (:new.INT_PROF_EMAIL IS NULL AND :old.INT_PROF_EMAIL IS NOT NULL )
                        OR (:new.INT_PROF_EMAIL IS NOT NULL AND :old.INT_PROF_EMAIL IS NULL)
                        OR NOT(:new.INT_PROF_EMAIL = :old.INT_PROF_EMAIL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_PROF_EMAIL := :old.INT_PROF_EMAIL;
    cg$rec.INT_PROF_TEL := :new.INT_PROF_TEL;
    cg$ind.INT_PROF_TEL :=    (:new.INT_PROF_TEL IS NULL AND :old.INT_PROF_TEL IS NOT NULL )
                        OR (:new.INT_PROF_TEL IS NOT NULL AND :old.INT_PROF_TEL IS NULL)
                        OR NOT(:new.INT_PROF_TEL = :old.INT_PROF_TEL) ;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).INT_PROF_TEL := :old.INT_PROF_TEL;


    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_arc(cg$rec);
        cg$ENSEIGNANT.validate_domain(cg$rec, cg$ind);
        cg$ENSEIGNANT.validate_domain_cascade_update(cg$old_rec);   

        cg$ENSEIGNANT.upd(cg$rec, cg$ind, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

    :new.TYPE := cg$rec.TYPE;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.PAYS := cg$rec.PAYS;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.ENC_PERSO_TEL := cg$rec.ENC_PERSO_TEL;
    :new.ENC_UBO_TEL := cg$rec.ENC_UBO_TEL;
    :new.ENC_PERSO_EMAIL := cg$rec.ENC_PERSO_EMAIL;
    :new.ENC_UBO_EMAIL := cg$rec.ENC_UBO_EMAIL;
    :new.INT_NO_INSEE := cg$rec.INT_NO_INSEE;
    :new.INT_SOC_NOM := cg$rec.INT_SOC_NOM;
    :new.INT_SOC_ADRESSE := cg$rec.INT_SOC_ADRESSE;
    :new.INT_SOC_CP := cg$rec.INT_SOC_CP;
    :new.INT_SOC_VILLE := cg$rec.INT_SOC_VILLE;
    :new.INT_SOC_PAYS := cg$rec.INT_SOC_PAYS;
    :new.INT_FONCTION := cg$rec.INT_FONCTION;
    :new.INT_PROF_EMAIL := cg$rec.INT_PROF_EMAIL;
    :new.INT_PROF_TEL := cg$rec.INT_PROF_TEL;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_ENSEIGNANT
AFTER UPDATE ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_ENSEIGNANT
/






PROMPT Creating After Update Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$AUS_ENSEIGNANT
AFTER UPDATE ON ENSEIGNANT
DECLARE
    idx        BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$old_rec cg$ENSEIGNANT.cg$row_type;
    cg$rec     cg$ENSEIGNANT.cg$row_type;
    cg$ind     cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
        cg$old_rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
        cg$old_rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
        cg$old_rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
        cg$old_rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
        cg$old_rec.CP := cg$ENSEIGNANT.cg$table(idx).CP;
        cg$old_rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
        cg$old_rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
        cg$old_rec.TEL_PORT := cg$ENSEIGNANT.cg$table(idx).TEL_PORT;
        cg$old_rec.ENC_PERSO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_TEL;
        cg$old_rec.ENC_UBO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_TEL;
        cg$old_rec.ENC_PERSO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_EMAIL;
        cg$old_rec.ENC_UBO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_EMAIL;
        cg$old_rec.INT_NO_INSEE := cg$ENSEIGNANT.cg$table(idx).INT_NO_INSEE;
        cg$old_rec.INT_SOC_NOM := cg$ENSEIGNANT.cg$table(idx).INT_SOC_NOM;
        cg$old_rec.INT_SOC_ADRESSE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_ADRESSE;
        cg$old_rec.INT_SOC_CP := cg$ENSEIGNANT.cg$table(idx).INT_SOC_CP;
        cg$old_rec.INT_SOC_VILLE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_VILLE;
        cg$old_rec.INT_SOC_PAYS := cg$ENSEIGNANT.cg$table(idx).INT_SOC_PAYS;
        cg$old_rec.INT_FONCTION := cg$ENSEIGNANT.cg$table(idx).INT_FONCTION;
        cg$old_rec.INT_PROF_EMAIL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_EMAIL;
        cg$old_rec.INT_PROF_TEL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_TEL;

    IF NOT (cg$ENSEIGNANT.called_from_package) THEN
        idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
        cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
        cg$ind.TYPE := updating('TYPE');
        cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
        cg$ind.SEXE := updating('SEXE');
        cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
        cg$ind.PRENOM := updating('PRENOM');
        cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
        cg$ind.ADRESSE := updating('ADRESSE');
        cg$rec.CP := cg$ENSEIGNANT.cg$table(idx).CP;
        cg$ind.CP := updating('CP');
        cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
        cg$ind.VILLE := updating('VILLE');
        cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
        cg$ind.PAYS := updating('PAYS');
        cg$rec.TEL_PORT := cg$ENSEIGNANT.cg$table(idx).TEL_PORT;
        cg$ind.TEL_PORT := updating('TEL_PORT');
        cg$rec.ENC_PERSO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_TEL;
        cg$ind.ENC_PERSO_TEL := updating('ENC_PERSO_TEL');
        cg$rec.ENC_UBO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_TEL;
        cg$ind.ENC_UBO_TEL := updating('ENC_UBO_TEL');
        cg$rec.ENC_PERSO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_EMAIL;
        cg$ind.ENC_PERSO_EMAIL := updating('ENC_PERSO_EMAIL');
        cg$rec.ENC_UBO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_EMAIL;
        cg$ind.ENC_UBO_EMAIL := updating('ENC_UBO_EMAIL');
        cg$rec.INT_NO_INSEE := cg$ENSEIGNANT.cg$table(idx).INT_NO_INSEE;
        cg$ind.INT_NO_INSEE := updating('INT_NO_INSEE');
        cg$rec.INT_SOC_NOM := cg$ENSEIGNANT.cg$table(idx).INT_SOC_NOM;
        cg$ind.INT_SOC_NOM := updating('INT_SOC_NOM');
        cg$rec.INT_SOC_ADRESSE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_ADRESSE;
        cg$ind.INT_SOC_ADRESSE := updating('INT_SOC_ADRESSE');
        cg$rec.INT_SOC_CP := cg$ENSEIGNANT.cg$table(idx).INT_SOC_CP;
        cg$ind.INT_SOC_CP := updating('INT_SOC_CP');
        cg$rec.INT_SOC_VILLE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_VILLE;
        cg$ind.INT_SOC_VILLE := updating('INT_SOC_VILLE');
        cg$rec.INT_SOC_PAYS := cg$ENSEIGNANT.cg$table(idx).INT_SOC_PAYS;
        cg$ind.INT_SOC_PAYS := updating('INT_SOC_PAYS');
        cg$rec.INT_FONCTION := cg$ENSEIGNANT.cg$table(idx).INT_FONCTION;
        cg$ind.INT_FONCTION := updating('INT_FONCTION');
        cg$rec.INT_PROF_EMAIL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_EMAIL;
        cg$ind.INT_PROF_EMAIL := updating('INT_PROF_EMAIL');
        cg$rec.INT_PROF_TEL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_TEL;
        cg$ind.INT_PROF_TEL := updating('INT_PROF_TEL');

        cg$ENSEIGNANT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$ENSEIGNANT.upd_denorm2( cg$rec,
                                       cg$ENSEIGNANT.cg$tableind(idx)
                                     );
        cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$ENSEIGNANT.cg$tableind(idx)
								                  );
        cg$ENSEIGNANT.cascade_update(cg$rec, cg$old_rec);
        cg$ENSEIGNANT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$ENSEIGNANT.called_from_package := FALSE;
	END IF;
        idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
    END LOOP;

    cg$ENSEIGNANT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BDS_ENSEIGNANT
BEFORE DELETE ON ENSEIGNANT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$ENSEIGNANT.cg$table.DELETE;
    cg$ENSEIGNANT.cg$tableind.DELETE;
    cg$ENSEIGNANT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$BDR_ENSEIGNANT
BEFORE DELETE ON ENSEIGNANT FOR EACH ROW
DECLARE
    cg$pk cg$ENSEIGNANT.cg$pk_type;
    cg$rec cg$ENSEIGNANT.cg$row_type;
    cg$ind cg$ENSEIGNANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ENSEIGNANT  := :old.NO_ENSEIGNANT;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$ENSEIGNANT.cg$table(cg$ENSEIGNANT.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;


    cg$ENSEIGNANT.idx := cg$ENSEIGNANT.idx + 1;

    if not (cg$ENSEIGNANT.called_from_package) then
        cg$ENSEIGNANT.validate_domain_cascade_delete(cg$rec);   
        cg$ENSEIGNANT.del(cg$pk, FALSE);
        cg$ENSEIGNANT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_ENSEIGNANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_ENSEIGNANT
AFTER DELETE ON ENSEIGNANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_ENSEIGNANT
/

PROMPT Creating After Delete Statement Trigger on 'ENSEIGNANT'
CREATE OR REPLACE TRIGGER cg$ADS_ENSEIGNANT
AFTER DELETE ON ENSEIGNANT
DECLARE
    idx        BINARY_INTEGER := cg$ENSEIGNANT.cg$table.FIRST;
    cg$rec   cg$ENSEIGNANT.cg$row_type;
    cg$old_rec   cg$ENSEIGNANT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$ENSEIGNANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ENSEIGNANT := cg$ENSEIGNANT.cg$table(idx).NO_ENSEIGNANT;
            cg$ENSEIGNANT.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.TYPE := cg$ENSEIGNANT.cg$table(idx).TYPE;
            cg$ENSEIGNANT.cg$tableind(idx).TYPE := TRUE;
            cg$rec.SEXE := cg$ENSEIGNANT.cg$table(idx).SEXE;
            cg$ENSEIGNANT.cg$tableind(idx).SEXE := TRUE;
            cg$rec.NOM := cg$ENSEIGNANT.cg$table(idx).NOM;
            cg$ENSEIGNANT.cg$tableind(idx).NOM := TRUE;
            cg$rec.PRENOM := cg$ENSEIGNANT.cg$table(idx).PRENOM;
            cg$ENSEIGNANT.cg$tableind(idx).PRENOM := TRUE;
            cg$rec.ADRESSE := cg$ENSEIGNANT.cg$table(idx).ADRESSE;
            cg$ENSEIGNANT.cg$tableind(idx).ADRESSE := TRUE;
            cg$rec.CP := cg$ENSEIGNANT.cg$table(idx).CP;
            cg$ENSEIGNANT.cg$tableind(idx).CP := TRUE;
            cg$rec.VILLE := cg$ENSEIGNANT.cg$table(idx).VILLE;
            cg$ENSEIGNANT.cg$tableind(idx).VILLE := TRUE;
            cg$rec.PAYS := cg$ENSEIGNANT.cg$table(idx).PAYS;
            cg$ENSEIGNANT.cg$tableind(idx).PAYS := TRUE;
            cg$rec.TEL_PORT := cg$ENSEIGNANT.cg$table(idx).TEL_PORT;
            cg$ENSEIGNANT.cg$tableind(idx).TEL_PORT := TRUE;
            cg$rec.ENC_PERSO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_TEL;
            cg$ENSEIGNANT.cg$tableind(idx).ENC_PERSO_TEL := TRUE;
            cg$rec.ENC_UBO_TEL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_TEL;
            cg$ENSEIGNANT.cg$tableind(idx).ENC_UBO_TEL := TRUE;
            cg$rec.ENC_PERSO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_PERSO_EMAIL;
            cg$ENSEIGNANT.cg$tableind(idx).ENC_PERSO_EMAIL := TRUE;
            cg$rec.ENC_UBO_EMAIL := cg$ENSEIGNANT.cg$table(idx).ENC_UBO_EMAIL;
            cg$ENSEIGNANT.cg$tableind(idx).ENC_UBO_EMAIL := TRUE;
            cg$rec.INT_NO_INSEE := cg$ENSEIGNANT.cg$table(idx).INT_NO_INSEE;
            cg$ENSEIGNANT.cg$tableind(idx).INT_NO_INSEE := TRUE;
            cg$rec.INT_SOC_NOM := cg$ENSEIGNANT.cg$table(idx).INT_SOC_NOM;
            cg$ENSEIGNANT.cg$tableind(idx).INT_SOC_NOM := TRUE;
            cg$rec.INT_SOC_ADRESSE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_ADRESSE;
            cg$ENSEIGNANT.cg$tableind(idx).INT_SOC_ADRESSE := TRUE;
            cg$rec.INT_SOC_CP := cg$ENSEIGNANT.cg$table(idx).INT_SOC_CP;
            cg$ENSEIGNANT.cg$tableind(idx).INT_SOC_CP := TRUE;
            cg$rec.INT_SOC_VILLE := cg$ENSEIGNANT.cg$table(idx).INT_SOC_VILLE;
            cg$ENSEIGNANT.cg$tableind(idx).INT_SOC_VILLE := TRUE;
            cg$rec.INT_SOC_PAYS := cg$ENSEIGNANT.cg$table(idx).INT_SOC_PAYS;
            cg$ENSEIGNANT.cg$tableind(idx).INT_SOC_PAYS := TRUE;
            cg$rec.INT_FONCTION := cg$ENSEIGNANT.cg$table(idx).INT_FONCTION;
            cg$ENSEIGNANT.cg$tableind(idx).INT_FONCTION := TRUE;
            cg$rec.INT_PROF_EMAIL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_EMAIL;
            cg$ENSEIGNANT.cg$tableind(idx).INT_PROF_EMAIL := TRUE;
            cg$rec.INT_PROF_TEL := cg$ENSEIGNANT.cg$table(idx).INT_PROF_TEL;
            cg$ENSEIGNANT.cg$tableind(idx).INT_PROF_TEL := TRUE;

            cg$ENSEIGNANT.validate_foreign_keys_del(cg$rec);
            cg$ENSEIGNANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ENSEIGNANT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$ENSEIGNANT.cascade_delete(cg$rec);
            cg$ENSEIGNANT.domain_cascade_delete(cg$rec);             

            idx := cg$ENSEIGNANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



