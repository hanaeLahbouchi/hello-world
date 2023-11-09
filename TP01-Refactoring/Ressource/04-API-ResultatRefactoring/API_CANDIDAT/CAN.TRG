
PROMPT Creating Trigger Logic for Table 'CANDIDAT'
PROMPT Creating Before Insert Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BIS_CANDIDAT
BEFORE INSERT ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BIR_CANDIDAT
BEFORE INSERT ON CANDIDAT FOR EACH ROW
DECLARE
    cg$rec cg$CANDIDAT.cg$row_type;
    cg$ind cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.DATE_NAISSANCE := :new.DATE_NAISSANCE;
    cg$ind.DATE_NAISSANCE := TRUE;
    cg$rec.LIEU_NAISSANCE := :new.LIEU_NAISSANCE;
    cg$ind.LIEU_NAISSANCE := TRUE;
    cg$rec.SITUATION := :new.SITUATION;
    cg$ind.SITUATION := TRUE;
    cg$rec.NATIONALITE := :new.NATIONALITE;
    cg$ind.NATIONALITE := TRUE;
    cg$rec.TEL_FIXE := :new.TEL_FIXE;
    cg$ind.TEL_FIXE := TRUE;
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT := TRUE;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL := TRUE;
    cg$rec.ACTU_ADRESSE := :new.ACTU_ADRESSE;
    cg$ind.ACTU_ADRESSE := TRUE;
    cg$rec.ACTU_CP := :new.ACTU_CP;
    cg$ind.ACTU_CP := TRUE;
    cg$rec.ACTU_VILLE := :new.ACTU_VILLE;
    cg$ind.ACTU_VILLE := TRUE;
    cg$rec.ACTU_PAYS := :new.ACTU_PAYS;
    cg$ind.ACTU_PAYS := TRUE;
    cg$rec.PERM_ADRESSE := :new.PERM_ADRESSE;
    cg$ind.PERM_ADRESSE := TRUE;
    cg$rec.PERM_CP := :new.PERM_CP;
    cg$ind.PERM_CP := TRUE;
    cg$rec.PERM_VILLE := :new.PERM_VILLE;
    cg$ind.PERM_VILLE := TRUE;
    cg$rec.PERM_PAYS := :new.PERM_PAYS;
    cg$ind.PERM_PAYS := TRUE;
    cg$rec.DERNIER_DIPLOME := :new.DERNIER_DIPLOME;
    cg$ind.DERNIER_DIPLOME := TRUE;
    cg$rec.UNIVERSITE := :new.UNIVERSITE;
    cg$ind.UNIVERSITE := TRUE;
    cg$rec.SELECTION_ORIGINE := :new.SELECTION_ORIGINE;
    cg$ind.SELECTION_ORIGINE := TRUE;
    cg$rec.SELECTION_COURANTE := :new.SELECTION_COURANTE;
    cg$ind.SELECTION_COURANTE := TRUE;
    cg$rec.REPONSE_ILI := :new.REPONSE_ILI;
    cg$ind.REPONSE_ILI := TRUE;
    cg$rec.DATE_REPONSE_ILI := :new.DATE_REPONSE_ILI;
    cg$ind.DATE_REPONSE_ILI := TRUE;
    cg$rec.REPONSE_CAN := :new.REPONSE_CAN;
    cg$ind.REPONSE_CAN := TRUE;
    cg$rec.DATE_REPONSE_CAN := :new.DATE_REPONSE_CAN;
    cg$ind.DATE_REPONSE_CAN := TRUE;
    cg$rec.NO_ORDRE := :new.NO_ORDRE;
    cg$ind.NO_ORDRE := TRUE;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_arc(cg$rec);
        cg$CANDIDAT.validate_domain(cg$rec);

        cg$CANDIDAT.ins(cg$rec, cg$ind, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SEXE := cg$rec.SEXE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SEXE := cg$ind.SEXE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NOM := cg$rec.NOM;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NOM := cg$ind.NOM;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PRENOM := cg$rec.PRENOM;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PRENOM := cg$ind.PRENOM;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DATE_NAISSANCE := cg$ind.DATE_NAISSANCE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).LIEU_NAISSANCE := cg$ind.LIEU_NAISSANCE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SITUATION := cg$rec.SITUATION;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SITUATION := cg$ind.SITUATION;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NATIONALITE := cg$rec.NATIONALITE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NATIONALITE := cg$ind.NATIONALITE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TEL_FIXE := cg$rec.TEL_FIXE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).TEL_FIXE := cg$ind.TEL_FIXE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TEL_PORT := cg$rec.TEL_PORT;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).TEL_PORT := cg$ind.TEL_PORT;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).EMAIL := cg$rec.EMAIL;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).EMAIL := cg$ind.EMAIL;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_ADRESSE := cg$rec.ACTU_ADRESSE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ACTU_ADRESSE := cg$ind.ACTU_ADRESSE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_CP := cg$rec.ACTU_CP;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ACTU_CP := cg$ind.ACTU_CP;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_VILLE := cg$rec.ACTU_VILLE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ACTU_VILLE := cg$ind.ACTU_VILLE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_PAYS := cg$rec.ACTU_PAYS;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).ACTU_PAYS := cg$ind.ACTU_PAYS;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_ADRESSE := cg$rec.PERM_ADRESSE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PERM_ADRESSE := cg$ind.PERM_ADRESSE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_CP := cg$rec.PERM_CP;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PERM_CP := cg$ind.PERM_CP;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_VILLE := cg$rec.PERM_VILLE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PERM_VILLE := cg$ind.PERM_VILLE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_PAYS := cg$rec.PERM_PAYS;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).PERM_PAYS := cg$ind.PERM_PAYS;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DERNIER_DIPLOME := cg$rec.DERNIER_DIPLOME;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DERNIER_DIPLOME := cg$ind.DERNIER_DIPLOME;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).UNIVERSITE := cg$rec.UNIVERSITE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).UNIVERSITE := cg$ind.UNIVERSITE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_ORIGINE := cg$rec.SELECTION_ORIGINE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SELECTION_ORIGINE := cg$ind.SELECTION_ORIGINE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_COURANTE := cg$rec.SELECTION_COURANTE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).SELECTION_COURANTE := cg$ind.SELECTION_COURANTE;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).REPONSE_ILI := cg$rec.REPONSE_ILI;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).REPONSE_ILI := cg$ind.REPONSE_ILI;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_ILI := cg$rec.DATE_REPONSE_ILI;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DATE_REPONSE_ILI := cg$ind.DATE_REPONSE_ILI;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).REPONSE_CAN := cg$rec.REPONSE_CAN;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).REPONSE_CAN := cg$ind.REPONSE_CAN;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_CAN := cg$rec.DATE_REPONSE_CAN;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).DATE_REPONSE_CAN := cg$ind.DATE_REPONSE_CAN;

    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_ORDRE := cg$rec.NO_ORDRE;
    cg$CANDIDAT.cg$tableind(cg$CANDIDAT.idx).NO_ORDRE := cg$ind.NO_ORDRE;

    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.SITUATION := cg$rec.SITUATION;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TEL_FIXE := cg$rec.TEL_FIXE;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.EMAIL := cg$rec.EMAIL;
    :new.ACTU_ADRESSE := cg$rec.ACTU_ADRESSE;
    :new.ACTU_CP := cg$rec.ACTU_CP;
    :new.ACTU_VILLE := cg$rec.ACTU_VILLE;
    :new.ACTU_PAYS := cg$rec.ACTU_PAYS;
    :new.PERM_ADRESSE := cg$rec.PERM_ADRESSE;
    :new.PERM_CP := cg$rec.PERM_CP;
    :new.PERM_VILLE := cg$rec.PERM_VILLE;
    :new.PERM_PAYS := cg$rec.PERM_PAYS;
    :new.DERNIER_DIPLOME := cg$rec.DERNIER_DIPLOME;
    :new.UNIVERSITE := cg$rec.UNIVERSITE;
    :new.SELECTION_ORIGINE := cg$rec.SELECTION_ORIGINE;
    :new.SELECTION_COURANTE := cg$rec.SELECTION_COURANTE;
    :new.REPONSE_ILI := cg$rec.REPONSE_ILI;
    :new.DATE_REPONSE_ILI := cg$rec.DATE_REPONSE_ILI;
    :new.REPONSE_CAN := cg$rec.REPONSE_CAN;
    :new.DATE_REPONSE_CAN := cg$rec.DATE_REPONSE_CAN;
    :new.NO_ORDRE := cg$rec.NO_ORDRE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_CANDIDAT
AFTER INSERT ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_CANDIDAT
/

PROMPT Creating After Insert Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$AIS_CANDIDAT
AFTER INSERT ON CANDIDAT
DECLARE
    idx      BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$rec   cg$CANDIDAT.cg$row_type;
    cg$old_rec   cg$CANDIDAT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$CANDIDAT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$CANDIDAT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.ANNEE_PRO := cg$CANDIDAT.cg$table(idx).ANNEE_PRO;
            cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
            cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
            cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
            cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
            cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
            cg$rec.SITUATION := cg$CANDIDAT.cg$table(idx).SITUATION;
            cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
            cg$rec.TEL_FIXE := cg$CANDIDAT.cg$table(idx).TEL_FIXE;
            cg$rec.TEL_PORT := cg$CANDIDAT.cg$table(idx).TEL_PORT;
            cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
            cg$rec.ACTU_ADRESSE := cg$CANDIDAT.cg$table(idx).ACTU_ADRESSE;
            cg$rec.ACTU_CP := cg$CANDIDAT.cg$table(idx).ACTU_CP;
            cg$rec.ACTU_VILLE := cg$CANDIDAT.cg$table(idx).ACTU_VILLE;
            cg$rec.ACTU_PAYS := cg$CANDIDAT.cg$table(idx).ACTU_PAYS;
            cg$rec.PERM_ADRESSE := cg$CANDIDAT.cg$table(idx).PERM_ADRESSE;
            cg$rec.PERM_CP := cg$CANDIDAT.cg$table(idx).PERM_CP;
            cg$rec.PERM_VILLE := cg$CANDIDAT.cg$table(idx).PERM_VILLE;
            cg$rec.PERM_PAYS := cg$CANDIDAT.cg$table(idx).PERM_PAYS;
            cg$rec.DERNIER_DIPLOME := cg$CANDIDAT.cg$table(idx).DERNIER_DIPLOME;
            cg$rec.UNIVERSITE := cg$CANDIDAT.cg$table(idx).UNIVERSITE;
            cg$rec.SELECTION_ORIGINE := cg$CANDIDAT.cg$table(idx).SELECTION_ORIGINE;
            cg$rec.SELECTION_COURANTE := cg$CANDIDAT.cg$table(idx).SELECTION_COURANTE;
            cg$rec.REPONSE_ILI := cg$CANDIDAT.cg$table(idx).REPONSE_ILI;
            cg$rec.DATE_REPONSE_ILI := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_ILI;
            cg$rec.REPONSE_CAN := cg$CANDIDAT.cg$table(idx).REPONSE_CAN;
            cg$rec.DATE_REPONSE_CAN := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CAN;
            cg$rec.NO_ORDRE := cg$CANDIDAT.cg$table(idx).NO_ORDRE;

            cg$CANDIDAT.validate_foreign_keys_ins(cg$rec);

            cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CANDIDAT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$CANDIDAT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BUS_CANDIDAT
BEFORE UPDATE ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BUR_CANDIDAT
BEFORE UPDATE ON CANDIDAT FOR EACH ROW
DECLARE
    cg$rec     cg$CANDIDAT.cg$row_type;
    cg$ind     cg$CANDIDAT.cg$ind_type;
    cg$old_rec cg$CANDIDAT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE :=    (:new.SEXE IS NULL AND :old.SEXE IS NOT NULL )
                        OR (:new.SEXE IS NOT NULL AND :old.SEXE IS NULL)
                        OR NOT(:new.SEXE = :old.SEXE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SEXE := :old.SEXE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PRENOM := :old.PRENOM;
    cg$rec.DATE_NAISSANCE := :new.DATE_NAISSANCE;
    cg$ind.DATE_NAISSANCE :=    (:new.DATE_NAISSANCE IS NULL AND :old.DATE_NAISSANCE IS NOT NULL )
                        OR (:new.DATE_NAISSANCE IS NOT NULL AND :old.DATE_NAISSANCE IS NULL)
                        OR NOT(:new.DATE_NAISSANCE = :old.DATE_NAISSANCE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_NAISSANCE := :old.DATE_NAISSANCE;
    cg$rec.LIEU_NAISSANCE := :new.LIEU_NAISSANCE;
    cg$ind.LIEU_NAISSANCE :=    (:new.LIEU_NAISSANCE IS NULL AND :old.LIEU_NAISSANCE IS NOT NULL )
                        OR (:new.LIEU_NAISSANCE IS NOT NULL AND :old.LIEU_NAISSANCE IS NULL)
                        OR NOT(:new.LIEU_NAISSANCE = :old.LIEU_NAISSANCE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).LIEU_NAISSANCE := :old.LIEU_NAISSANCE;
    cg$rec.SITUATION := :new.SITUATION;
    cg$ind.SITUATION :=    (:new.SITUATION IS NULL AND :old.SITUATION IS NOT NULL )
                        OR (:new.SITUATION IS NOT NULL AND :old.SITUATION IS NULL)
                        OR NOT(:new.SITUATION = :old.SITUATION) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SITUATION := :old.SITUATION;
    cg$rec.NATIONALITE := :new.NATIONALITE;
    cg$ind.NATIONALITE :=    (:new.NATIONALITE IS NULL AND :old.NATIONALITE IS NOT NULL )
                        OR (:new.NATIONALITE IS NOT NULL AND :old.NATIONALITE IS NULL)
                        OR NOT(:new.NATIONALITE = :old.NATIONALITE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NATIONALITE := :old.NATIONALITE;
    cg$rec.TEL_FIXE := :new.TEL_FIXE;
    cg$ind.TEL_FIXE :=    (:new.TEL_FIXE IS NULL AND :old.TEL_FIXE IS NOT NULL )
                        OR (:new.TEL_FIXE IS NOT NULL AND :old.TEL_FIXE IS NULL)
                        OR NOT(:new.TEL_FIXE = :old.TEL_FIXE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TEL_FIXE := :old.TEL_FIXE;
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT :=    (:new.TEL_PORT IS NULL AND :old.TEL_PORT IS NOT NULL )
                        OR (:new.TEL_PORT IS NOT NULL AND :old.TEL_PORT IS NULL)
                        OR NOT(:new.TEL_PORT = :old.TEL_PORT) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).TEL_PORT := :old.TEL_PORT;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL :=    (:new.EMAIL IS NULL AND :old.EMAIL IS NOT NULL )
                        OR (:new.EMAIL IS NOT NULL AND :old.EMAIL IS NULL)
                        OR NOT(:new.EMAIL = :old.EMAIL) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).EMAIL := :old.EMAIL;
    cg$rec.ACTU_ADRESSE := :new.ACTU_ADRESSE;
    cg$ind.ACTU_ADRESSE :=    (:new.ACTU_ADRESSE IS NULL AND :old.ACTU_ADRESSE IS NOT NULL )
                        OR (:new.ACTU_ADRESSE IS NOT NULL AND :old.ACTU_ADRESSE IS NULL)
                        OR NOT(:new.ACTU_ADRESSE = :old.ACTU_ADRESSE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_ADRESSE := :old.ACTU_ADRESSE;
    cg$rec.ACTU_CP := :new.ACTU_CP;
    cg$ind.ACTU_CP :=    (:new.ACTU_CP IS NULL AND :old.ACTU_CP IS NOT NULL )
                        OR (:new.ACTU_CP IS NOT NULL AND :old.ACTU_CP IS NULL)
                        OR NOT(:new.ACTU_CP = :old.ACTU_CP) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_CP := :old.ACTU_CP;
    cg$rec.ACTU_VILLE := :new.ACTU_VILLE;
    cg$ind.ACTU_VILLE :=    (:new.ACTU_VILLE IS NULL AND :old.ACTU_VILLE IS NOT NULL )
                        OR (:new.ACTU_VILLE IS NOT NULL AND :old.ACTU_VILLE IS NULL)
                        OR NOT(:new.ACTU_VILLE = :old.ACTU_VILLE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_VILLE := :old.ACTU_VILLE;
    cg$rec.ACTU_PAYS := :new.ACTU_PAYS;
    cg$ind.ACTU_PAYS :=    (:new.ACTU_PAYS IS NULL AND :old.ACTU_PAYS IS NOT NULL )
                        OR (:new.ACTU_PAYS IS NOT NULL AND :old.ACTU_PAYS IS NULL)
                        OR NOT(:new.ACTU_PAYS = :old.ACTU_PAYS) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ACTU_PAYS := :old.ACTU_PAYS;
    cg$rec.PERM_ADRESSE := :new.PERM_ADRESSE;
    cg$ind.PERM_ADRESSE :=    (:new.PERM_ADRESSE IS NULL AND :old.PERM_ADRESSE IS NOT NULL )
                        OR (:new.PERM_ADRESSE IS NOT NULL AND :old.PERM_ADRESSE IS NULL)
                        OR NOT(:new.PERM_ADRESSE = :old.PERM_ADRESSE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_ADRESSE := :old.PERM_ADRESSE;
    cg$rec.PERM_CP := :new.PERM_CP;
    cg$ind.PERM_CP :=    (:new.PERM_CP IS NULL AND :old.PERM_CP IS NOT NULL )
                        OR (:new.PERM_CP IS NOT NULL AND :old.PERM_CP IS NULL)
                        OR NOT(:new.PERM_CP = :old.PERM_CP) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_CP := :old.PERM_CP;
    cg$rec.PERM_VILLE := :new.PERM_VILLE;
    cg$ind.PERM_VILLE :=    (:new.PERM_VILLE IS NULL AND :old.PERM_VILLE IS NOT NULL )
                        OR (:new.PERM_VILLE IS NOT NULL AND :old.PERM_VILLE IS NULL)
                        OR NOT(:new.PERM_VILLE = :old.PERM_VILLE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_VILLE := :old.PERM_VILLE;
    cg$rec.PERM_PAYS := :new.PERM_PAYS;
    cg$ind.PERM_PAYS :=    (:new.PERM_PAYS IS NULL AND :old.PERM_PAYS IS NOT NULL )
                        OR (:new.PERM_PAYS IS NOT NULL AND :old.PERM_PAYS IS NULL)
                        OR NOT(:new.PERM_PAYS = :old.PERM_PAYS) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).PERM_PAYS := :old.PERM_PAYS;
    cg$rec.DERNIER_DIPLOME := :new.DERNIER_DIPLOME;
    cg$ind.DERNIER_DIPLOME :=    (:new.DERNIER_DIPLOME IS NULL AND :old.DERNIER_DIPLOME IS NOT NULL )
                        OR (:new.DERNIER_DIPLOME IS NOT NULL AND :old.DERNIER_DIPLOME IS NULL)
                        OR NOT(:new.DERNIER_DIPLOME = :old.DERNIER_DIPLOME) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DERNIER_DIPLOME := :old.DERNIER_DIPLOME;
    cg$rec.UNIVERSITE := :new.UNIVERSITE;
    cg$ind.UNIVERSITE :=    (:new.UNIVERSITE IS NULL AND :old.UNIVERSITE IS NOT NULL )
                        OR (:new.UNIVERSITE IS NOT NULL AND :old.UNIVERSITE IS NULL)
                        OR NOT(:new.UNIVERSITE = :old.UNIVERSITE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).UNIVERSITE := :old.UNIVERSITE;
    cg$rec.SELECTION_ORIGINE := :new.SELECTION_ORIGINE;
    cg$ind.SELECTION_ORIGINE :=    (:new.SELECTION_ORIGINE IS NULL AND :old.SELECTION_ORIGINE IS NOT NULL )
                        OR (:new.SELECTION_ORIGINE IS NOT NULL AND :old.SELECTION_ORIGINE IS NULL)
                        OR NOT(:new.SELECTION_ORIGINE = :old.SELECTION_ORIGINE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_ORIGINE := :old.SELECTION_ORIGINE;
    cg$rec.SELECTION_COURANTE := :new.SELECTION_COURANTE;
    cg$ind.SELECTION_COURANTE :=    (:new.SELECTION_COURANTE IS NULL AND :old.SELECTION_COURANTE IS NOT NULL )
                        OR (:new.SELECTION_COURANTE IS NOT NULL AND :old.SELECTION_COURANTE IS NULL)
                        OR NOT(:new.SELECTION_COURANTE = :old.SELECTION_COURANTE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).SELECTION_COURANTE := :old.SELECTION_COURANTE;
    cg$rec.REPONSE_ILI := :new.REPONSE_ILI;
    cg$ind.REPONSE_ILI :=    (:new.REPONSE_ILI IS NULL AND :old.REPONSE_ILI IS NOT NULL )
                        OR (:new.REPONSE_ILI IS NOT NULL AND :old.REPONSE_ILI IS NULL)
                        OR NOT(:new.REPONSE_ILI = :old.REPONSE_ILI) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).REPONSE_ILI := :old.REPONSE_ILI;
    cg$rec.DATE_REPONSE_ILI := :new.DATE_REPONSE_ILI;
    cg$ind.DATE_REPONSE_ILI :=    (:new.DATE_REPONSE_ILI IS NULL AND :old.DATE_REPONSE_ILI IS NOT NULL )
                        OR (:new.DATE_REPONSE_ILI IS NOT NULL AND :old.DATE_REPONSE_ILI IS NULL)
                        OR NOT(:new.DATE_REPONSE_ILI = :old.DATE_REPONSE_ILI) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_ILI := :old.DATE_REPONSE_ILI;
    cg$rec.REPONSE_CAN := :new.REPONSE_CAN;
    cg$ind.REPONSE_CAN :=    (:new.REPONSE_CAN IS NULL AND :old.REPONSE_CAN IS NOT NULL )
                        OR (:new.REPONSE_CAN IS NOT NULL AND :old.REPONSE_CAN IS NULL)
                        OR NOT(:new.REPONSE_CAN = :old.REPONSE_CAN) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).REPONSE_CAN := :old.REPONSE_CAN;
    cg$rec.DATE_REPONSE_CAN := :new.DATE_REPONSE_CAN;
    cg$ind.DATE_REPONSE_CAN :=    (:new.DATE_REPONSE_CAN IS NULL AND :old.DATE_REPONSE_CAN IS NOT NULL )
                        OR (:new.DATE_REPONSE_CAN IS NOT NULL AND :old.DATE_REPONSE_CAN IS NULL)
                        OR NOT(:new.DATE_REPONSE_CAN = :old.DATE_REPONSE_CAN) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).DATE_REPONSE_CAN := :old.DATE_REPONSE_CAN;
    cg$rec.NO_ORDRE := :new.NO_ORDRE;
    cg$ind.NO_ORDRE :=    (:new.NO_ORDRE IS NULL AND :old.NO_ORDRE IS NOT NULL )
                        OR (:new.NO_ORDRE IS NOT NULL AND :old.NO_ORDRE IS NULL)
                        OR NOT(:new.NO_ORDRE = :old.NO_ORDRE) ;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_ORDRE := :old.NO_ORDRE;


    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_arc(cg$rec);
        cg$CANDIDAT.validate_domain(cg$rec, cg$ind);
        cg$CANDIDAT.validate_domain_cascade_update(cg$old_rec);   

        cg$CANDIDAT.upd(cg$rec, cg$ind, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.SITUATION := cg$rec.SITUATION;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TEL_FIXE := cg$rec.TEL_FIXE;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.EMAIL := cg$rec.EMAIL;
    :new.ACTU_ADRESSE := cg$rec.ACTU_ADRESSE;
    :new.ACTU_CP := cg$rec.ACTU_CP;
    :new.ACTU_VILLE := cg$rec.ACTU_VILLE;
    :new.ACTU_PAYS := cg$rec.ACTU_PAYS;
    :new.PERM_ADRESSE := cg$rec.PERM_ADRESSE;
    :new.PERM_CP := cg$rec.PERM_CP;
    :new.PERM_VILLE := cg$rec.PERM_VILLE;
    :new.PERM_PAYS := cg$rec.PERM_PAYS;
    :new.DERNIER_DIPLOME := cg$rec.DERNIER_DIPLOME;
    :new.UNIVERSITE := cg$rec.UNIVERSITE;
    :new.SELECTION_ORIGINE := cg$rec.SELECTION_ORIGINE;
    :new.SELECTION_COURANTE := cg$rec.SELECTION_COURANTE;
    :new.REPONSE_ILI := cg$rec.REPONSE_ILI;
    :new.DATE_REPONSE_ILI := cg$rec.DATE_REPONSE_ILI;
    :new.REPONSE_CAN := cg$rec.REPONSE_CAN;
    :new.DATE_REPONSE_CAN := cg$rec.DATE_REPONSE_CAN;
    :new.NO_ORDRE := cg$rec.NO_ORDRE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_CANDIDAT
AFTER UPDATE ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_CANDIDAT
/






PROMPT Creating After Update Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$AUS_CANDIDAT
AFTER UPDATE ON CANDIDAT
DECLARE
    idx        BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$old_rec cg$CANDIDAT.cg$row_type;
    cg$rec     cg$CANDIDAT.cg$row_type;
    cg$ind     cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$CANDIDAT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.ANNEE_PRO := cg$CANDIDAT.cg$table(idx).ANNEE_PRO;
        cg$old_rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
        cg$old_rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
        cg$old_rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
        cg$old_rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
        cg$old_rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
        cg$old_rec.SITUATION := cg$CANDIDAT.cg$table(idx).SITUATION;
        cg$old_rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
        cg$old_rec.TEL_FIXE := cg$CANDIDAT.cg$table(idx).TEL_FIXE;
        cg$old_rec.TEL_PORT := cg$CANDIDAT.cg$table(idx).TEL_PORT;
        cg$old_rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
        cg$old_rec.ACTU_ADRESSE := cg$CANDIDAT.cg$table(idx).ACTU_ADRESSE;
        cg$old_rec.ACTU_CP := cg$CANDIDAT.cg$table(idx).ACTU_CP;
        cg$old_rec.ACTU_VILLE := cg$CANDIDAT.cg$table(idx).ACTU_VILLE;
        cg$old_rec.ACTU_PAYS := cg$CANDIDAT.cg$table(idx).ACTU_PAYS;
        cg$old_rec.PERM_ADRESSE := cg$CANDIDAT.cg$table(idx).PERM_ADRESSE;
        cg$old_rec.PERM_CP := cg$CANDIDAT.cg$table(idx).PERM_CP;
        cg$old_rec.PERM_VILLE := cg$CANDIDAT.cg$table(idx).PERM_VILLE;
        cg$old_rec.PERM_PAYS := cg$CANDIDAT.cg$table(idx).PERM_PAYS;
        cg$old_rec.DERNIER_DIPLOME := cg$CANDIDAT.cg$table(idx).DERNIER_DIPLOME;
        cg$old_rec.UNIVERSITE := cg$CANDIDAT.cg$table(idx).UNIVERSITE;
        cg$old_rec.SELECTION_ORIGINE := cg$CANDIDAT.cg$table(idx).SELECTION_ORIGINE;
        cg$old_rec.SELECTION_COURANTE := cg$CANDIDAT.cg$table(idx).SELECTION_COURANTE;
        cg$old_rec.REPONSE_ILI := cg$CANDIDAT.cg$table(idx).REPONSE_ILI;
        cg$old_rec.DATE_REPONSE_ILI := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_ILI;
        cg$old_rec.REPONSE_CAN := cg$CANDIDAT.cg$table(idx).REPONSE_CAN;
        cg$old_rec.DATE_REPONSE_CAN := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CAN;
        cg$old_rec.NO_ORDRE := cg$CANDIDAT.cg$table(idx).NO_ORDRE;

    IF NOT (cg$CANDIDAT.called_from_package) THEN
        idx := cg$CANDIDAT.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$CANDIDAT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.ANNEE_PRO := cg$CANDIDAT.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
        cg$ind.SEXE := updating('SEXE');
        cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
        cg$ind.PRENOM := updating('PRENOM');
        cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
        cg$ind.DATE_NAISSANCE := updating('DATE_NAISSANCE');
        cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
        cg$ind.LIEU_NAISSANCE := updating('LIEU_NAISSANCE');
        cg$rec.SITUATION := cg$CANDIDAT.cg$table(idx).SITUATION;
        cg$ind.SITUATION := updating('SITUATION');
        cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
        cg$ind.NATIONALITE := updating('NATIONALITE');
        cg$rec.TEL_FIXE := cg$CANDIDAT.cg$table(idx).TEL_FIXE;
        cg$ind.TEL_FIXE := updating('TEL_FIXE');
        cg$rec.TEL_PORT := cg$CANDIDAT.cg$table(idx).TEL_PORT;
        cg$ind.TEL_PORT := updating('TEL_PORT');
        cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
        cg$ind.EMAIL := updating('EMAIL');
        cg$rec.ACTU_ADRESSE := cg$CANDIDAT.cg$table(idx).ACTU_ADRESSE;
        cg$ind.ACTU_ADRESSE := updating('ACTU_ADRESSE');
        cg$rec.ACTU_CP := cg$CANDIDAT.cg$table(idx).ACTU_CP;
        cg$ind.ACTU_CP := updating('ACTU_CP');
        cg$rec.ACTU_VILLE := cg$CANDIDAT.cg$table(idx).ACTU_VILLE;
        cg$ind.ACTU_VILLE := updating('ACTU_VILLE');
        cg$rec.ACTU_PAYS := cg$CANDIDAT.cg$table(idx).ACTU_PAYS;
        cg$ind.ACTU_PAYS := updating('ACTU_PAYS');
        cg$rec.PERM_ADRESSE := cg$CANDIDAT.cg$table(idx).PERM_ADRESSE;
        cg$ind.PERM_ADRESSE := updating('PERM_ADRESSE');
        cg$rec.PERM_CP := cg$CANDIDAT.cg$table(idx).PERM_CP;
        cg$ind.PERM_CP := updating('PERM_CP');
        cg$rec.PERM_VILLE := cg$CANDIDAT.cg$table(idx).PERM_VILLE;
        cg$ind.PERM_VILLE := updating('PERM_VILLE');
        cg$rec.PERM_PAYS := cg$CANDIDAT.cg$table(idx).PERM_PAYS;
        cg$ind.PERM_PAYS := updating('PERM_PAYS');
        cg$rec.DERNIER_DIPLOME := cg$CANDIDAT.cg$table(idx).DERNIER_DIPLOME;
        cg$ind.DERNIER_DIPLOME := updating('DERNIER_DIPLOME');
        cg$rec.UNIVERSITE := cg$CANDIDAT.cg$table(idx).UNIVERSITE;
        cg$ind.UNIVERSITE := updating('UNIVERSITE');
        cg$rec.SELECTION_ORIGINE := cg$CANDIDAT.cg$table(idx).SELECTION_ORIGINE;
        cg$ind.SELECTION_ORIGINE := updating('SELECTION_ORIGINE');
        cg$rec.SELECTION_COURANTE := cg$CANDIDAT.cg$table(idx).SELECTION_COURANTE;
        cg$ind.SELECTION_COURANTE := updating('SELECTION_COURANTE');
        cg$rec.REPONSE_ILI := cg$CANDIDAT.cg$table(idx).REPONSE_ILI;
        cg$ind.REPONSE_ILI := updating('REPONSE_ILI');
        cg$rec.DATE_REPONSE_ILI := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_ILI;
        cg$ind.DATE_REPONSE_ILI := updating('DATE_REPONSE_ILI');
        cg$rec.REPONSE_CAN := cg$CANDIDAT.cg$table(idx).REPONSE_CAN;
        cg$ind.REPONSE_CAN := updating('REPONSE_CAN');
        cg$rec.DATE_REPONSE_CAN := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CAN;
        cg$ind.DATE_REPONSE_CAN := updating('DATE_REPONSE_CAN');
        cg$rec.NO_ORDRE := cg$CANDIDAT.cg$table(idx).NO_ORDRE;
        cg$ind.NO_ORDRE := updating('NO_ORDRE');

        cg$CANDIDAT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$CANDIDAT.upd_denorm2( cg$rec,
                                       cg$CANDIDAT.cg$tableind(idx)
                                     );
        cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$CANDIDAT.cg$tableind(idx)
								                  );
        cg$CANDIDAT.cascade_update(cg$rec, cg$old_rec);
        cg$CANDIDAT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$CANDIDAT.called_from_package := FALSE;
	END IF;
        idx := cg$CANDIDAT.cg$table.NEXT(idx);
    END LOOP;

    cg$CANDIDAT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BDS_CANDIDAT
BEFORE DELETE ON CANDIDAT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$CANDIDAT.cg$table.DELETE;
    cg$CANDIDAT.cg$tableind.DELETE;
    cg$CANDIDAT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$BDR_CANDIDAT
BEFORE DELETE ON CANDIDAT FOR EACH ROW
DECLARE
    cg$pk cg$CANDIDAT.cg$pk_type;
    cg$rec cg$CANDIDAT.cg$row_type;
    cg$ind cg$CANDIDAT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$CANDIDAT.cg$table(cg$CANDIDAT.idx).ANNEE_PRO := :old.ANNEE_PRO;


    cg$CANDIDAT.idx := cg$CANDIDAT.idx + 1;

    if not (cg$CANDIDAT.called_from_package) then
        cg$CANDIDAT.validate_domain_cascade_delete(cg$rec);   
        cg$CANDIDAT.del(cg$pk, FALSE);
        cg$CANDIDAT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_CANDIDAT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_CANDIDAT
AFTER DELETE ON CANDIDAT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_CANDIDAT
/

PROMPT Creating After Delete Statement Trigger on 'CANDIDAT'
CREATE OR REPLACE TRIGGER cg$ADS_CANDIDAT
AFTER DELETE ON CANDIDAT
DECLARE
    idx        BINARY_INTEGER := cg$CANDIDAT.cg$table.FIRST;
    cg$rec   cg$CANDIDAT.cg$row_type;
    cg$old_rec   cg$CANDIDAT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$CANDIDAT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$CANDIDAT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$CANDIDAT.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.ANNEE_PRO := cg$CANDIDAT.cg$table(idx).ANNEE_PRO;
            cg$CANDIDAT.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.SEXE := cg$CANDIDAT.cg$table(idx).SEXE;
            cg$CANDIDAT.cg$tableind(idx).SEXE := TRUE;
            cg$rec.NOM := cg$CANDIDAT.cg$table(idx).NOM;
            cg$CANDIDAT.cg$tableind(idx).NOM := TRUE;
            cg$rec.PRENOM := cg$CANDIDAT.cg$table(idx).PRENOM;
            cg$CANDIDAT.cg$tableind(idx).PRENOM := TRUE;
            cg$rec.DATE_NAISSANCE := cg$CANDIDAT.cg$table(idx).DATE_NAISSANCE;
            cg$CANDIDAT.cg$tableind(idx).DATE_NAISSANCE := TRUE;
            cg$rec.LIEU_NAISSANCE := cg$CANDIDAT.cg$table(idx).LIEU_NAISSANCE;
            cg$CANDIDAT.cg$tableind(idx).LIEU_NAISSANCE := TRUE;
            cg$rec.SITUATION := cg$CANDIDAT.cg$table(idx).SITUATION;
            cg$CANDIDAT.cg$tableind(idx).SITUATION := TRUE;
            cg$rec.NATIONALITE := cg$CANDIDAT.cg$table(idx).NATIONALITE;
            cg$CANDIDAT.cg$tableind(idx).NATIONALITE := TRUE;
            cg$rec.TEL_FIXE := cg$CANDIDAT.cg$table(idx).TEL_FIXE;
            cg$CANDIDAT.cg$tableind(idx).TEL_FIXE := TRUE;
            cg$rec.TEL_PORT := cg$CANDIDAT.cg$table(idx).TEL_PORT;
            cg$CANDIDAT.cg$tableind(idx).TEL_PORT := TRUE;
            cg$rec.EMAIL := cg$CANDIDAT.cg$table(idx).EMAIL;
            cg$CANDIDAT.cg$tableind(idx).EMAIL := TRUE;
            cg$rec.ACTU_ADRESSE := cg$CANDIDAT.cg$table(idx).ACTU_ADRESSE;
            cg$CANDIDAT.cg$tableind(idx).ACTU_ADRESSE := TRUE;
            cg$rec.ACTU_CP := cg$CANDIDAT.cg$table(idx).ACTU_CP;
            cg$CANDIDAT.cg$tableind(idx).ACTU_CP := TRUE;
            cg$rec.ACTU_VILLE := cg$CANDIDAT.cg$table(idx).ACTU_VILLE;
            cg$CANDIDAT.cg$tableind(idx).ACTU_VILLE := TRUE;
            cg$rec.ACTU_PAYS := cg$CANDIDAT.cg$table(idx).ACTU_PAYS;
            cg$CANDIDAT.cg$tableind(idx).ACTU_PAYS := TRUE;
            cg$rec.PERM_ADRESSE := cg$CANDIDAT.cg$table(idx).PERM_ADRESSE;
            cg$CANDIDAT.cg$tableind(idx).PERM_ADRESSE := TRUE;
            cg$rec.PERM_CP := cg$CANDIDAT.cg$table(idx).PERM_CP;
            cg$CANDIDAT.cg$tableind(idx).PERM_CP := TRUE;
            cg$rec.PERM_VILLE := cg$CANDIDAT.cg$table(idx).PERM_VILLE;
            cg$CANDIDAT.cg$tableind(idx).PERM_VILLE := TRUE;
            cg$rec.PERM_PAYS := cg$CANDIDAT.cg$table(idx).PERM_PAYS;
            cg$CANDIDAT.cg$tableind(idx).PERM_PAYS := TRUE;
            cg$rec.DERNIER_DIPLOME := cg$CANDIDAT.cg$table(idx).DERNIER_DIPLOME;
            cg$CANDIDAT.cg$tableind(idx).DERNIER_DIPLOME := TRUE;
            cg$rec.UNIVERSITE := cg$CANDIDAT.cg$table(idx).UNIVERSITE;
            cg$CANDIDAT.cg$tableind(idx).UNIVERSITE := TRUE;
            cg$rec.SELECTION_ORIGINE := cg$CANDIDAT.cg$table(idx).SELECTION_ORIGINE;
            cg$CANDIDAT.cg$tableind(idx).SELECTION_ORIGINE := TRUE;
            cg$rec.SELECTION_COURANTE := cg$CANDIDAT.cg$table(idx).SELECTION_COURANTE;
            cg$CANDIDAT.cg$tableind(idx).SELECTION_COURANTE := TRUE;
            cg$rec.REPONSE_ILI := cg$CANDIDAT.cg$table(idx).REPONSE_ILI;
            cg$CANDIDAT.cg$tableind(idx).REPONSE_ILI := TRUE;
            cg$rec.DATE_REPONSE_ILI := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_ILI;
            cg$CANDIDAT.cg$tableind(idx).DATE_REPONSE_ILI := TRUE;
            cg$rec.REPONSE_CAN := cg$CANDIDAT.cg$table(idx).REPONSE_CAN;
            cg$CANDIDAT.cg$tableind(idx).REPONSE_CAN := TRUE;
            cg$rec.DATE_REPONSE_CAN := cg$CANDIDAT.cg$table(idx).DATE_REPONSE_CAN;
            cg$CANDIDAT.cg$tableind(idx).DATE_REPONSE_CAN := TRUE;
            cg$rec.NO_ORDRE := cg$CANDIDAT.cg$table(idx).NO_ORDRE;
            cg$CANDIDAT.cg$tableind(idx).NO_ORDRE := TRUE;

            cg$CANDIDAT.validate_foreign_keys_del(cg$rec);
            cg$CANDIDAT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$CANDIDAT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$CANDIDAT.cascade_delete(cg$rec);
            cg$CANDIDAT.domain_cascade_delete(cg$rec);             

            idx := cg$CANDIDAT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



