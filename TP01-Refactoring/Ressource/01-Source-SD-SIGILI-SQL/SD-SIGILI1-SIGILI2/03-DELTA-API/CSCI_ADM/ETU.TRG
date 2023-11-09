
PROMPT Creating Trigger Logic for Table 'ETUDIANT'
PROMPT Creating Before Insert Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BIS_ETUDIANT
BEFORE INSERT ON ETUDIANT
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$ETUDIANT.cg$table.DELETE;
    cg$ETUDIANT.cg$tableind.DELETE;
    cg$ETUDIANT.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BIR_ETUDIANT
BEFORE INSERT ON ETUDIANT FOR EACH ROW
DECLARE
    cg$rec cg$ETUDIANT.cg$row_type;
    cg$ind cg$ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM := TRUE;
    cg$rec.NO_ETUDIANT_UBO := :new.NO_ETUDIANT_UBO;
    cg$ind.NO_ETUDIANT_UBO := TRUE;
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
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT := TRUE;
    cg$rec.TEL_FIXE := :new.TEL_FIXE;
    cg$ind.TEL_FIXE := TRUE;
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
    cg$rec.SIGLE_ETU := :new.SIGLE_ETU;
    cg$ind.SIGLE_ETU := TRUE;
    cg$rec.COMPTE_CRI := :new.COMPTE_CRI;
    cg$ind.COMPTE_CRI := TRUE;
    cg$rec.UBO_EMAIL := :new.UBO_EMAIL;
    cg$ind.UBO_EMAIL := TRUE;
    cg$rec.GRPE_ANGLAIS := :new.GRPE_ANGLAIS;
    cg$ind.GRPE_ANGLAIS := TRUE;
    cg$rec.ABANDON_MOTIF := :new.ABANDON_MOTIF;
    cg$ind.ABANDON_MOTIF := TRUE;
    cg$rec.ABANDON_DATE := :new.ABANDON_DATE;
    cg$ind.ABANDON_DATE := TRUE;
    cg$rec.EST_DIPLOME := :new.EST_DIPLOME;
    cg$ind.EST_DIPLOME := TRUE;

    if not (cg$ETUDIANT.called_from_package) then
        cg$ETUDIANT.validate_arc(cg$rec);
        cg$ETUDIANT.validate_domain(cg$rec);

        cg$ETUDIANT.ins(cg$rec, cg$ind, FALSE);
        cg$ETUDIANT.called_from_package := FALSE;
    end if;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).CODE_COM := cg$rec.CODE_COM;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).CODE_COM := cg$ind.CODE_COM;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NO_ETUDIANT_UBO := cg$rec.NO_ETUDIANT_UBO;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).NO_ETUDIANT_UBO := cg$ind.NO_ETUDIANT_UBO;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SEXE := cg$rec.SEXE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).SEXE := cg$ind.SEXE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NOM := cg$rec.NOM;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).NOM := cg$ind.NOM;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PRENOM := cg$rec.PRENOM;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).PRENOM := cg$ind.PRENOM;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).DATE_NAISSANCE := cg$ind.DATE_NAISSANCE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).LIEU_NAISSANCE := cg$ind.LIEU_NAISSANCE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SITUATION := cg$rec.SITUATION;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).SITUATION := cg$ind.SITUATION;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NATIONALITE := cg$rec.NATIONALITE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).NATIONALITE := cg$ind.NATIONALITE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).TEL_PORT := cg$rec.TEL_PORT;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).TEL_PORT := cg$ind.TEL_PORT;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).TEL_FIXE := cg$rec.TEL_FIXE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).TEL_FIXE := cg$ind.TEL_FIXE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).EMAIL := cg$rec.EMAIL;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).EMAIL := cg$ind.EMAIL;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_ADRESSE := cg$rec.ACTU_ADRESSE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ACTU_ADRESSE := cg$ind.ACTU_ADRESSE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_CP := cg$rec.ACTU_CP;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ACTU_CP := cg$ind.ACTU_CP;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_VILLE := cg$rec.ACTU_VILLE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ACTU_VILLE := cg$ind.ACTU_VILLE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_PAYS := cg$rec.ACTU_PAYS;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ACTU_PAYS := cg$ind.ACTU_PAYS;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_ADRESSE := cg$rec.PERM_ADRESSE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).PERM_ADRESSE := cg$ind.PERM_ADRESSE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_CP := cg$rec.PERM_CP;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).PERM_CP := cg$ind.PERM_CP;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_VILLE := cg$rec.PERM_VILLE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).PERM_VILLE := cg$ind.PERM_VILLE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_PAYS := cg$rec.PERM_PAYS;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).PERM_PAYS := cg$ind.PERM_PAYS;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).DERNIER_DIPLOME := cg$rec.DERNIER_DIPLOME;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).DERNIER_DIPLOME := cg$ind.DERNIER_DIPLOME;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).UNIVERSITE := cg$rec.UNIVERSITE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).UNIVERSITE := cg$ind.UNIVERSITE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SIGLE_ETU := cg$rec.SIGLE_ETU;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).SIGLE_ETU := cg$ind.SIGLE_ETU;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).COMPTE_CRI := cg$rec.COMPTE_CRI;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).COMPTE_CRI := cg$ind.COMPTE_CRI;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).UBO_EMAIL := cg$rec.UBO_EMAIL;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).UBO_EMAIL := cg$ind.UBO_EMAIL;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).GRPE_ANGLAIS := cg$rec.GRPE_ANGLAIS;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).GRPE_ANGLAIS := cg$ind.GRPE_ANGLAIS;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ABANDON_MOTIF := cg$rec.ABANDON_MOTIF;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ABANDON_MOTIF := cg$ind.ABANDON_MOTIF;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ABANDON_DATE := cg$rec.ABANDON_DATE;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).ABANDON_DATE := cg$ind.ABANDON_DATE;

    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).EST_DIPLOME := cg$rec.EST_DIPLOME;
    cg$ETUDIANT.cg$tableind(cg$ETUDIANT.idx).EST_DIPLOME := cg$ind.EST_DIPLOME;

    cg$ETUDIANT.idx := cg$ETUDIANT.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.CODE_COM := cg$rec.CODE_COM;
    :new.NO_ETUDIANT_UBO := cg$rec.NO_ETUDIANT_UBO;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.SITUATION := cg$rec.SITUATION;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.TEL_FIXE := cg$rec.TEL_FIXE;
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
    :new.SIGLE_ETU := cg$rec.SIGLE_ETU;
    :new.COMPTE_CRI := cg$rec.COMPTE_CRI;
    :new.UBO_EMAIL := cg$rec.UBO_EMAIL;
    :new.GRPE_ANGLAIS := cg$rec.GRPE_ANGLAIS;
    :new.ABANDON_MOTIF := cg$rec.ABANDON_MOTIF;
    :new.ABANDON_DATE := cg$rec.ABANDON_DATE;
    :new.EST_DIPLOME := cg$rec.EST_DIPLOME;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
create or replace TRIGGER CG$AIR_ETUDIANT AFTER INSERT ON ETUDIANT 
FOR EACH ROW 
BEGIN
  INSERT INTO STAGE (ANNEE_PRO, NO_ETUDIANT_NAT, NO_ENTREPRISE, NO_CONTACT_ILI, DATE_DEB, DATE_FIN, LIEU, INTITULE, SUJET) VALUES (:new.annee_pro, :new.no_etudiant_nat, '0', '0', SYSDATE, SYSDATE, 'Non Défini', 'Non Défini', 'Non Défini');
  NULL;
END;
/

PROMPT Creating After Insert Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$AIS_ETUDIANT
AFTER INSERT ON ETUDIANT
DECLARE
    idx      BINARY_INTEGER := cg$ETUDIANT.cg$table.FIRST;
    cg$rec   cg$ETUDIANT.cg$row_type;
    cg$old_rec   cg$ETUDIANT.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$ETUDIANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.ANNEE_PRO := cg$ETUDIANT.cg$table(idx).ANNEE_PRO;
            cg$rec.CODE_COM := cg$ETUDIANT.cg$table(idx).CODE_COM;
            cg$rec.NO_ETUDIANT_UBO := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_UBO;
            cg$rec.SEXE := cg$ETUDIANT.cg$table(idx).SEXE;
            cg$rec.NOM := cg$ETUDIANT.cg$table(idx).NOM;
            cg$rec.PRENOM := cg$ETUDIANT.cg$table(idx).PRENOM;
            cg$rec.DATE_NAISSANCE := cg$ETUDIANT.cg$table(idx).DATE_NAISSANCE;
            cg$rec.LIEU_NAISSANCE := cg$ETUDIANT.cg$table(idx).LIEU_NAISSANCE;
            cg$rec.SITUATION := cg$ETUDIANT.cg$table(idx).SITUATION;
            cg$rec.NATIONALITE := cg$ETUDIANT.cg$table(idx).NATIONALITE;
            cg$rec.TEL_PORT := cg$ETUDIANT.cg$table(idx).TEL_PORT;
            cg$rec.TEL_FIXE := cg$ETUDIANT.cg$table(idx).TEL_FIXE;
            cg$rec.EMAIL := cg$ETUDIANT.cg$table(idx).EMAIL;
            cg$rec.ACTU_ADRESSE := cg$ETUDIANT.cg$table(idx).ACTU_ADRESSE;
            cg$rec.ACTU_CP := cg$ETUDIANT.cg$table(idx).ACTU_CP;
            cg$rec.ACTU_VILLE := cg$ETUDIANT.cg$table(idx).ACTU_VILLE;
            cg$rec.ACTU_PAYS := cg$ETUDIANT.cg$table(idx).ACTU_PAYS;
            cg$rec.PERM_ADRESSE := cg$ETUDIANT.cg$table(idx).PERM_ADRESSE;
            cg$rec.PERM_CP := cg$ETUDIANT.cg$table(idx).PERM_CP;
            cg$rec.PERM_VILLE := cg$ETUDIANT.cg$table(idx).PERM_VILLE;
            cg$rec.PERM_PAYS := cg$ETUDIANT.cg$table(idx).PERM_PAYS;
            cg$rec.DERNIER_DIPLOME := cg$ETUDIANT.cg$table(idx).DERNIER_DIPLOME;
            cg$rec.UNIVERSITE := cg$ETUDIANT.cg$table(idx).UNIVERSITE;
            cg$rec.SIGLE_ETU := cg$ETUDIANT.cg$table(idx).SIGLE_ETU;
            cg$rec.COMPTE_CRI := cg$ETUDIANT.cg$table(idx).COMPTE_CRI;
            cg$rec.UBO_EMAIL := cg$ETUDIANT.cg$table(idx).UBO_EMAIL;
            cg$rec.GRPE_ANGLAIS := cg$ETUDIANT.cg$table(idx).GRPE_ANGLAIS;
            cg$rec.ABANDON_MOTIF := cg$ETUDIANT.cg$table(idx).ABANDON_MOTIF;
            cg$rec.ABANDON_DATE := cg$ETUDIANT.cg$table(idx).ABANDON_DATE;
            cg$rec.EST_DIPLOME := cg$ETUDIANT.cg$table(idx).EST_DIPLOME;

            cg$ETUDIANT.validate_foreign_keys_ins(cg$rec);

            cg$ETUDIANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ETUDIANT.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$ETUDIANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BUS_ETUDIANT
BEFORE UPDATE ON ETUDIANT
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$ETUDIANT.cg$table.DELETE;
    cg$ETUDIANT.cg$tableind.DELETE;
    cg$ETUDIANT.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BUR_ETUDIANT
BEFORE UPDATE ON ETUDIANT FOR EACH ROW
DECLARE
    cg$rec     cg$ETUDIANT.cg$row_type;
    cg$ind     cg$ETUDIANT.cg$ind_type;
    cg$old_rec cg$ETUDIANT.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM :=    (:new.CODE_COM IS NULL AND :old.CODE_COM IS NOT NULL )
                        OR (:new.CODE_COM IS NOT NULL AND :old.CODE_COM IS NULL)
                        OR NOT(:new.CODE_COM = :old.CODE_COM) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).CODE_COM := :old.CODE_COM;
    cg$rec.NO_ETUDIANT_UBO := :new.NO_ETUDIANT_UBO;
    cg$ind.NO_ETUDIANT_UBO :=    (:new.NO_ETUDIANT_UBO IS NULL AND :old.NO_ETUDIANT_UBO IS NOT NULL )
                        OR (:new.NO_ETUDIANT_UBO IS NOT NULL AND :old.NO_ETUDIANT_UBO IS NULL)
                        OR NOT(:new.NO_ETUDIANT_UBO = :old.NO_ETUDIANT_UBO) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NO_ETUDIANT_UBO := :old.NO_ETUDIANT_UBO;
    cg$rec.SEXE := :new.SEXE;
    cg$ind.SEXE :=    (:new.SEXE IS NULL AND :old.SEXE IS NOT NULL )
                        OR (:new.SEXE IS NOT NULL AND :old.SEXE IS NULL)
                        OR NOT(:new.SEXE = :old.SEXE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SEXE := :old.SEXE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PRENOM := :old.PRENOM;
    cg$rec.DATE_NAISSANCE := :new.DATE_NAISSANCE;
    cg$ind.DATE_NAISSANCE :=    (:new.DATE_NAISSANCE IS NULL AND :old.DATE_NAISSANCE IS NOT NULL )
                        OR (:new.DATE_NAISSANCE IS NOT NULL AND :old.DATE_NAISSANCE IS NULL)
                        OR NOT(:new.DATE_NAISSANCE = :old.DATE_NAISSANCE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).DATE_NAISSANCE := :old.DATE_NAISSANCE;
    cg$rec.LIEU_NAISSANCE := :new.LIEU_NAISSANCE;
    cg$ind.LIEU_NAISSANCE :=    (:new.LIEU_NAISSANCE IS NULL AND :old.LIEU_NAISSANCE IS NOT NULL )
                        OR (:new.LIEU_NAISSANCE IS NOT NULL AND :old.LIEU_NAISSANCE IS NULL)
                        OR NOT(:new.LIEU_NAISSANCE = :old.LIEU_NAISSANCE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).LIEU_NAISSANCE := :old.LIEU_NAISSANCE;
    cg$rec.SITUATION := :new.SITUATION;
    cg$ind.SITUATION :=    (:new.SITUATION IS NULL AND :old.SITUATION IS NOT NULL )
                        OR (:new.SITUATION IS NOT NULL AND :old.SITUATION IS NULL)
                        OR NOT(:new.SITUATION = :old.SITUATION) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SITUATION := :old.SITUATION;
    cg$rec.NATIONALITE := :new.NATIONALITE;
    cg$ind.NATIONALITE :=    (:new.NATIONALITE IS NULL AND :old.NATIONALITE IS NOT NULL )
                        OR (:new.NATIONALITE IS NOT NULL AND :old.NATIONALITE IS NULL)
                        OR NOT(:new.NATIONALITE = :old.NATIONALITE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NATIONALITE := :old.NATIONALITE;
    cg$rec.TEL_PORT := :new.TEL_PORT;
    cg$ind.TEL_PORT :=    (:new.TEL_PORT IS NULL AND :old.TEL_PORT IS NOT NULL )
                        OR (:new.TEL_PORT IS NOT NULL AND :old.TEL_PORT IS NULL)
                        OR NOT(:new.TEL_PORT = :old.TEL_PORT) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).TEL_PORT := :old.TEL_PORT;
    cg$rec.TEL_FIXE := :new.TEL_FIXE;
    cg$ind.TEL_FIXE :=    (:new.TEL_FIXE IS NULL AND :old.TEL_FIXE IS NOT NULL )
                        OR (:new.TEL_FIXE IS NOT NULL AND :old.TEL_FIXE IS NULL)
                        OR NOT(:new.TEL_FIXE = :old.TEL_FIXE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).TEL_FIXE := :old.TEL_FIXE;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL :=    (:new.EMAIL IS NULL AND :old.EMAIL IS NOT NULL )
                        OR (:new.EMAIL IS NOT NULL AND :old.EMAIL IS NULL)
                        OR NOT(:new.EMAIL = :old.EMAIL) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).EMAIL := :old.EMAIL;
    cg$rec.ACTU_ADRESSE := :new.ACTU_ADRESSE;
    cg$ind.ACTU_ADRESSE :=    (:new.ACTU_ADRESSE IS NULL AND :old.ACTU_ADRESSE IS NOT NULL )
                        OR (:new.ACTU_ADRESSE IS NOT NULL AND :old.ACTU_ADRESSE IS NULL)
                        OR NOT(:new.ACTU_ADRESSE = :old.ACTU_ADRESSE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_ADRESSE := :old.ACTU_ADRESSE;
    cg$rec.ACTU_CP := :new.ACTU_CP;
    cg$ind.ACTU_CP :=    (:new.ACTU_CP IS NULL AND :old.ACTU_CP IS NOT NULL )
                        OR (:new.ACTU_CP IS NOT NULL AND :old.ACTU_CP IS NULL)
                        OR NOT(:new.ACTU_CP = :old.ACTU_CP) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_CP := :old.ACTU_CP;
    cg$rec.ACTU_VILLE := :new.ACTU_VILLE;
    cg$ind.ACTU_VILLE :=    (:new.ACTU_VILLE IS NULL AND :old.ACTU_VILLE IS NOT NULL )
                        OR (:new.ACTU_VILLE IS NOT NULL AND :old.ACTU_VILLE IS NULL)
                        OR NOT(:new.ACTU_VILLE = :old.ACTU_VILLE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_VILLE := :old.ACTU_VILLE;
    cg$rec.ACTU_PAYS := :new.ACTU_PAYS;
    cg$ind.ACTU_PAYS :=    (:new.ACTU_PAYS IS NULL AND :old.ACTU_PAYS IS NOT NULL )
                        OR (:new.ACTU_PAYS IS NOT NULL AND :old.ACTU_PAYS IS NULL)
                        OR NOT(:new.ACTU_PAYS = :old.ACTU_PAYS) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ACTU_PAYS := :old.ACTU_PAYS;
    cg$rec.PERM_ADRESSE := :new.PERM_ADRESSE;
    cg$ind.PERM_ADRESSE :=    (:new.PERM_ADRESSE IS NULL AND :old.PERM_ADRESSE IS NOT NULL )
                        OR (:new.PERM_ADRESSE IS NOT NULL AND :old.PERM_ADRESSE IS NULL)
                        OR NOT(:new.PERM_ADRESSE = :old.PERM_ADRESSE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_ADRESSE := :old.PERM_ADRESSE;
    cg$rec.PERM_CP := :new.PERM_CP;
    cg$ind.PERM_CP :=    (:new.PERM_CP IS NULL AND :old.PERM_CP IS NOT NULL )
                        OR (:new.PERM_CP IS NOT NULL AND :old.PERM_CP IS NULL)
                        OR NOT(:new.PERM_CP = :old.PERM_CP) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_CP := :old.PERM_CP;
    cg$rec.PERM_VILLE := :new.PERM_VILLE;
    cg$ind.PERM_VILLE :=    (:new.PERM_VILLE IS NULL AND :old.PERM_VILLE IS NOT NULL )
                        OR (:new.PERM_VILLE IS NOT NULL AND :old.PERM_VILLE IS NULL)
                        OR NOT(:new.PERM_VILLE = :old.PERM_VILLE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_VILLE := :old.PERM_VILLE;
    cg$rec.PERM_PAYS := :new.PERM_PAYS;
    cg$ind.PERM_PAYS :=    (:new.PERM_PAYS IS NULL AND :old.PERM_PAYS IS NOT NULL )
                        OR (:new.PERM_PAYS IS NOT NULL AND :old.PERM_PAYS IS NULL)
                        OR NOT(:new.PERM_PAYS = :old.PERM_PAYS) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).PERM_PAYS := :old.PERM_PAYS;
    cg$rec.DERNIER_DIPLOME := :new.DERNIER_DIPLOME;
    cg$ind.DERNIER_DIPLOME :=    (:new.DERNIER_DIPLOME IS NULL AND :old.DERNIER_DIPLOME IS NOT NULL )
                        OR (:new.DERNIER_DIPLOME IS NOT NULL AND :old.DERNIER_DIPLOME IS NULL)
                        OR NOT(:new.DERNIER_DIPLOME = :old.DERNIER_DIPLOME) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).DERNIER_DIPLOME := :old.DERNIER_DIPLOME;
    cg$rec.UNIVERSITE := :new.UNIVERSITE;
    cg$ind.UNIVERSITE :=    (:new.UNIVERSITE IS NULL AND :old.UNIVERSITE IS NOT NULL )
                        OR (:new.UNIVERSITE IS NOT NULL AND :old.UNIVERSITE IS NULL)
                        OR NOT(:new.UNIVERSITE = :old.UNIVERSITE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).UNIVERSITE := :old.UNIVERSITE;
    cg$rec.SIGLE_ETU := :new.SIGLE_ETU;
    cg$ind.SIGLE_ETU :=    (:new.SIGLE_ETU IS NULL AND :old.SIGLE_ETU IS NOT NULL )
                        OR (:new.SIGLE_ETU IS NOT NULL AND :old.SIGLE_ETU IS NULL)
                        OR NOT(:new.SIGLE_ETU = :old.SIGLE_ETU) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).SIGLE_ETU := :old.SIGLE_ETU;
    cg$rec.COMPTE_CRI := :new.COMPTE_CRI;
    cg$ind.COMPTE_CRI :=    (:new.COMPTE_CRI IS NULL AND :old.COMPTE_CRI IS NOT NULL )
                        OR (:new.COMPTE_CRI IS NOT NULL AND :old.COMPTE_CRI IS NULL)
                        OR NOT(:new.COMPTE_CRI = :old.COMPTE_CRI) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).COMPTE_CRI := :old.COMPTE_CRI;
    cg$rec.UBO_EMAIL := :new.UBO_EMAIL;
    cg$ind.UBO_EMAIL :=    (:new.UBO_EMAIL IS NULL AND :old.UBO_EMAIL IS NOT NULL )
                        OR (:new.UBO_EMAIL IS NOT NULL AND :old.UBO_EMAIL IS NULL)
                        OR NOT(:new.UBO_EMAIL = :old.UBO_EMAIL) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).UBO_EMAIL := :old.UBO_EMAIL;
    cg$rec.GRPE_ANGLAIS := :new.GRPE_ANGLAIS;
    cg$ind.GRPE_ANGLAIS :=    (:new.GRPE_ANGLAIS IS NULL AND :old.GRPE_ANGLAIS IS NOT NULL )
                        OR (:new.GRPE_ANGLAIS IS NOT NULL AND :old.GRPE_ANGLAIS IS NULL)
                        OR NOT(:new.GRPE_ANGLAIS = :old.GRPE_ANGLAIS) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).GRPE_ANGLAIS := :old.GRPE_ANGLAIS;
    cg$rec.ABANDON_MOTIF := :new.ABANDON_MOTIF;
    cg$ind.ABANDON_MOTIF :=    (:new.ABANDON_MOTIF IS NULL AND :old.ABANDON_MOTIF IS NOT NULL )
                        OR (:new.ABANDON_MOTIF IS NOT NULL AND :old.ABANDON_MOTIF IS NULL)
                        OR NOT(:new.ABANDON_MOTIF = :old.ABANDON_MOTIF) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ABANDON_MOTIF := :old.ABANDON_MOTIF;
    cg$rec.ABANDON_DATE := :new.ABANDON_DATE;
    cg$ind.ABANDON_DATE :=    (:new.ABANDON_DATE IS NULL AND :old.ABANDON_DATE IS NOT NULL )
                        OR (:new.ABANDON_DATE IS NOT NULL AND :old.ABANDON_DATE IS NULL)
                        OR NOT(:new.ABANDON_DATE = :old.ABANDON_DATE) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ABANDON_DATE := :old.ABANDON_DATE;
    cg$rec.EST_DIPLOME := :new.EST_DIPLOME;
    cg$ind.EST_DIPLOME :=    (:new.EST_DIPLOME IS NULL AND :old.EST_DIPLOME IS NOT NULL )
                        OR (:new.EST_DIPLOME IS NOT NULL AND :old.EST_DIPLOME IS NULL)
                        OR NOT(:new.EST_DIPLOME = :old.EST_DIPLOME) ;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).EST_DIPLOME := :old.EST_DIPLOME;


    cg$ETUDIANT.idx := cg$ETUDIANT.idx + 1;

    if not (cg$ETUDIANT.called_from_package) then
        cg$ETUDIANT.validate_arc(cg$rec);
        cg$ETUDIANT.validate_domain(cg$rec, cg$ind);
        cg$ETUDIANT.validate_domain_cascade_update(cg$old_rec);   

        cg$ETUDIANT.upd(cg$rec, cg$ind, FALSE);
        cg$ETUDIANT.called_from_package := FALSE;
    end if;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.CODE_COM := cg$rec.CODE_COM;
    :new.NO_ETUDIANT_UBO := cg$rec.NO_ETUDIANT_UBO;
    :new.SEXE := cg$rec.SEXE;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
    :new.LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
    :new.SITUATION := cg$rec.SITUATION;
    :new.NATIONALITE := cg$rec.NATIONALITE;
    :new.TEL_PORT := cg$rec.TEL_PORT;
    :new.TEL_FIXE := cg$rec.TEL_FIXE;
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
    :new.SIGLE_ETU := cg$rec.SIGLE_ETU;
    :new.COMPTE_CRI := cg$rec.COMPTE_CRI;
    :new.UBO_EMAIL := cg$rec.UBO_EMAIL;
    :new.GRPE_ANGLAIS := cg$rec.GRPE_ANGLAIS;
    :new.ABANDON_MOTIF := cg$rec.ABANDON_MOTIF;
    :new.ABANDON_DATE := cg$rec.ABANDON_DATE;
    :new.EST_DIPLOME := cg$rec.EST_DIPLOME;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
create or replace TRIGGER CG$AUR_ETUDIANT AFTER UPDATE ON ETUDIANT 
FOR EACH ROW 
BEGIN
  IF (:old.est_diplome != :new.est_diplome AND :new.est_diplome='O') THEN
    INSERT INTO DIPLOME (no_etudiant_nat,nom,prenom,autorisation_annuaire,type_emploi,cp,ville,email_perso,tel_perso,portable) VALUES (:old.NO_ETUDIANT_NAT,:old.NOM,:old.PRENOM,'N','SE',:old.PERM_CP,:old.PERM_VILLE,:old.EMAIL,:old.TEL_FIXE,:old.TEL_PORT);
    UPDATE AUTHENTIFICATION SET TYPE_AUTHENTIFICATION = 'DIP' WHERE NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT;
  END IF;
END;
/



PROMPT Creating After Update Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$AUS_ETUDIANT
AFTER UPDATE ON ETUDIANT
DECLARE
    idx        BINARY_INTEGER := cg$ETUDIANT.cg$table.FIRST;
    cg$old_rec cg$ETUDIANT.cg$row_type;
    cg$rec     cg$ETUDIANT.cg$row_type;
    cg$ind     cg$ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.ANNEE_PRO := cg$ETUDIANT.cg$table(idx).ANNEE_PRO;
        cg$old_rec.CODE_COM := cg$ETUDIANT.cg$table(idx).CODE_COM;
        cg$old_rec.NO_ETUDIANT_UBO := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_UBO;
        cg$old_rec.SEXE := cg$ETUDIANT.cg$table(idx).SEXE;
        cg$old_rec.NOM := cg$ETUDIANT.cg$table(idx).NOM;
        cg$old_rec.PRENOM := cg$ETUDIANT.cg$table(idx).PRENOM;
        cg$old_rec.DATE_NAISSANCE := cg$ETUDIANT.cg$table(idx).DATE_NAISSANCE;
        cg$old_rec.LIEU_NAISSANCE := cg$ETUDIANT.cg$table(idx).LIEU_NAISSANCE;
        cg$old_rec.SITUATION := cg$ETUDIANT.cg$table(idx).SITUATION;
        cg$old_rec.NATIONALITE := cg$ETUDIANT.cg$table(idx).NATIONALITE;
        cg$old_rec.TEL_PORT := cg$ETUDIANT.cg$table(idx).TEL_PORT;
        cg$old_rec.TEL_FIXE := cg$ETUDIANT.cg$table(idx).TEL_FIXE;
        cg$old_rec.EMAIL := cg$ETUDIANT.cg$table(idx).EMAIL;
        cg$old_rec.ACTU_ADRESSE := cg$ETUDIANT.cg$table(idx).ACTU_ADRESSE;
        cg$old_rec.ACTU_CP := cg$ETUDIANT.cg$table(idx).ACTU_CP;
        cg$old_rec.ACTU_VILLE := cg$ETUDIANT.cg$table(idx).ACTU_VILLE;
        cg$old_rec.ACTU_PAYS := cg$ETUDIANT.cg$table(idx).ACTU_PAYS;
        cg$old_rec.PERM_ADRESSE := cg$ETUDIANT.cg$table(idx).PERM_ADRESSE;
        cg$old_rec.PERM_CP := cg$ETUDIANT.cg$table(idx).PERM_CP;
        cg$old_rec.PERM_VILLE := cg$ETUDIANT.cg$table(idx).PERM_VILLE;
        cg$old_rec.PERM_PAYS := cg$ETUDIANT.cg$table(idx).PERM_PAYS;
        cg$old_rec.DERNIER_DIPLOME := cg$ETUDIANT.cg$table(idx).DERNIER_DIPLOME;
        cg$old_rec.UNIVERSITE := cg$ETUDIANT.cg$table(idx).UNIVERSITE;
        cg$old_rec.SIGLE_ETU := cg$ETUDIANT.cg$table(idx).SIGLE_ETU;
        cg$old_rec.COMPTE_CRI := cg$ETUDIANT.cg$table(idx).COMPTE_CRI;
        cg$old_rec.UBO_EMAIL := cg$ETUDIANT.cg$table(idx).UBO_EMAIL;
        cg$old_rec.GRPE_ANGLAIS := cg$ETUDIANT.cg$table(idx).GRPE_ANGLAIS;
        cg$old_rec.ABANDON_MOTIF := cg$ETUDIANT.cg$table(idx).ABANDON_MOTIF;
        cg$old_rec.ABANDON_DATE := cg$ETUDIANT.cg$table(idx).ABANDON_DATE;
        cg$old_rec.EST_DIPLOME := cg$ETUDIANT.cg$table(idx).EST_DIPLOME;

    IF NOT (cg$ETUDIANT.called_from_package) THEN
        idx := cg$ETUDIANT.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.ANNEE_PRO := cg$ETUDIANT.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.CODE_COM := cg$ETUDIANT.cg$table(idx).CODE_COM;
        cg$ind.CODE_COM := updating('CODE_COM');
        cg$rec.NO_ETUDIANT_UBO := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_UBO;
        cg$ind.NO_ETUDIANT_UBO := updating('NO_ETUDIANT_UBO');
        cg$rec.SEXE := cg$ETUDIANT.cg$table(idx).SEXE;
        cg$ind.SEXE := updating('SEXE');
        cg$rec.NOM := cg$ETUDIANT.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.PRENOM := cg$ETUDIANT.cg$table(idx).PRENOM;
        cg$ind.PRENOM := updating('PRENOM');
        cg$rec.DATE_NAISSANCE := cg$ETUDIANT.cg$table(idx).DATE_NAISSANCE;
        cg$ind.DATE_NAISSANCE := updating('DATE_NAISSANCE');
        cg$rec.LIEU_NAISSANCE := cg$ETUDIANT.cg$table(idx).LIEU_NAISSANCE;
        cg$ind.LIEU_NAISSANCE := updating('LIEU_NAISSANCE');
        cg$rec.SITUATION := cg$ETUDIANT.cg$table(idx).SITUATION;
        cg$ind.SITUATION := updating('SITUATION');
        cg$rec.NATIONALITE := cg$ETUDIANT.cg$table(idx).NATIONALITE;
        cg$ind.NATIONALITE := updating('NATIONALITE');
        cg$rec.TEL_PORT := cg$ETUDIANT.cg$table(idx).TEL_PORT;
        cg$ind.TEL_PORT := updating('TEL_PORT');
        cg$rec.TEL_FIXE := cg$ETUDIANT.cg$table(idx).TEL_FIXE;
        cg$ind.TEL_FIXE := updating('TEL_FIXE');
        cg$rec.EMAIL := cg$ETUDIANT.cg$table(idx).EMAIL;
        cg$ind.EMAIL := updating('EMAIL');
        cg$rec.ACTU_ADRESSE := cg$ETUDIANT.cg$table(idx).ACTU_ADRESSE;
        cg$ind.ACTU_ADRESSE := updating('ACTU_ADRESSE');
        cg$rec.ACTU_CP := cg$ETUDIANT.cg$table(idx).ACTU_CP;
        cg$ind.ACTU_CP := updating('ACTU_CP');
        cg$rec.ACTU_VILLE := cg$ETUDIANT.cg$table(idx).ACTU_VILLE;
        cg$ind.ACTU_VILLE := updating('ACTU_VILLE');
        cg$rec.ACTU_PAYS := cg$ETUDIANT.cg$table(idx).ACTU_PAYS;
        cg$ind.ACTU_PAYS := updating('ACTU_PAYS');
        cg$rec.PERM_ADRESSE := cg$ETUDIANT.cg$table(idx).PERM_ADRESSE;
        cg$ind.PERM_ADRESSE := updating('PERM_ADRESSE');
        cg$rec.PERM_CP := cg$ETUDIANT.cg$table(idx).PERM_CP;
        cg$ind.PERM_CP := updating('PERM_CP');
        cg$rec.PERM_VILLE := cg$ETUDIANT.cg$table(idx).PERM_VILLE;
        cg$ind.PERM_VILLE := updating('PERM_VILLE');
        cg$rec.PERM_PAYS := cg$ETUDIANT.cg$table(idx).PERM_PAYS;
        cg$ind.PERM_PAYS := updating('PERM_PAYS');
        cg$rec.DERNIER_DIPLOME := cg$ETUDIANT.cg$table(idx).DERNIER_DIPLOME;
        cg$ind.DERNIER_DIPLOME := updating('DERNIER_DIPLOME');
        cg$rec.UNIVERSITE := cg$ETUDIANT.cg$table(idx).UNIVERSITE;
        cg$ind.UNIVERSITE := updating('UNIVERSITE');
        cg$rec.SIGLE_ETU := cg$ETUDIANT.cg$table(idx).SIGLE_ETU;
        cg$ind.SIGLE_ETU := updating('SIGLE_ETU');
        cg$rec.COMPTE_CRI := cg$ETUDIANT.cg$table(idx).COMPTE_CRI;
        cg$ind.COMPTE_CRI := updating('COMPTE_CRI');
        cg$rec.UBO_EMAIL := cg$ETUDIANT.cg$table(idx).UBO_EMAIL;
        cg$ind.UBO_EMAIL := updating('UBO_EMAIL');
        cg$rec.GRPE_ANGLAIS := cg$ETUDIANT.cg$table(idx).GRPE_ANGLAIS;
        cg$ind.GRPE_ANGLAIS := updating('GRPE_ANGLAIS');
        cg$rec.ABANDON_MOTIF := cg$ETUDIANT.cg$table(idx).ABANDON_MOTIF;
        cg$ind.ABANDON_MOTIF := updating('ABANDON_MOTIF');
        cg$rec.ABANDON_DATE := cg$ETUDIANT.cg$table(idx).ABANDON_DATE;
        cg$ind.ABANDON_DATE := updating('ABANDON_DATE');
        cg$rec.EST_DIPLOME := cg$ETUDIANT.cg$table(idx).EST_DIPLOME;
        cg$ind.EST_DIPLOME := updating('EST_DIPLOME');

        cg$ETUDIANT.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$ETUDIANT.upd_denorm2( cg$rec,
                                       cg$ETUDIANT.cg$tableind(idx)
                                     );
        cg$ETUDIANT.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$ETUDIANT.cg$tableind(idx)
								                  );
        cg$ETUDIANT.cascade_update(cg$rec, cg$old_rec);
        cg$ETUDIANT.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$ETUDIANT.called_from_package := FALSE;
	END IF;
        idx := cg$ETUDIANT.cg$table.NEXT(idx);
    END LOOP;

    cg$ETUDIANT.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BDS_ETUDIANT
BEFORE DELETE ON ETUDIANT
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$ETUDIANT.cg$table.DELETE;
    cg$ETUDIANT.cg$tableind.DELETE;
    cg$ETUDIANT.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$BDR_ETUDIANT
BEFORE DELETE ON ETUDIANT FOR EACH ROW
DECLARE
    cg$pk cg$ETUDIANT.cg$pk_type;
    cg$rec cg$ETUDIANT.cg$row_type;
    cg$ind cg$ETUDIANT.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$ETUDIANT.cg$table(cg$ETUDIANT.idx).CODE_COM := :old.CODE_COM;


    cg$ETUDIANT.idx := cg$ETUDIANT.idx + 1;

    if not (cg$ETUDIANT.called_from_package) then
        cg$ETUDIANT.validate_domain_cascade_delete(cg$rec);   
        cg$ETUDIANT.del(cg$pk, FALSE);
        cg$ETUDIANT.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_ETUDIANT, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_ETUDIANT
AFTER DELETE ON ETUDIANT FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_ETUDIANT
/

PROMPT Creating After Delete Statement Trigger on 'ETUDIANT'
CREATE OR REPLACE TRIGGER cg$ADS_ETUDIANT
AFTER DELETE ON ETUDIANT
DECLARE
    idx        BINARY_INTEGER := cg$ETUDIANT.cg$table.FIRST;
    cg$rec   cg$ETUDIANT.cg$row_type;
    cg$old_rec   cg$ETUDIANT.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$ETUDIANT.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_NAT;
            cg$ETUDIANT.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.ANNEE_PRO := cg$ETUDIANT.cg$table(idx).ANNEE_PRO;
            cg$ETUDIANT.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.CODE_COM := cg$ETUDIANT.cg$table(idx).CODE_COM;
            cg$ETUDIANT.cg$tableind(idx).CODE_COM := TRUE;
            cg$rec.NO_ETUDIANT_UBO := cg$ETUDIANT.cg$table(idx).NO_ETUDIANT_UBO;
            cg$ETUDIANT.cg$tableind(idx).NO_ETUDIANT_UBO := TRUE;
            cg$rec.SEXE := cg$ETUDIANT.cg$table(idx).SEXE;
            cg$ETUDIANT.cg$tableind(idx).SEXE := TRUE;
            cg$rec.NOM := cg$ETUDIANT.cg$table(idx).NOM;
            cg$ETUDIANT.cg$tableind(idx).NOM := TRUE;
            cg$rec.PRENOM := cg$ETUDIANT.cg$table(idx).PRENOM;
            cg$ETUDIANT.cg$tableind(idx).PRENOM := TRUE;
            cg$rec.DATE_NAISSANCE := cg$ETUDIANT.cg$table(idx).DATE_NAISSANCE;
            cg$ETUDIANT.cg$tableind(idx).DATE_NAISSANCE := TRUE;
            cg$rec.LIEU_NAISSANCE := cg$ETUDIANT.cg$table(idx).LIEU_NAISSANCE;
            cg$ETUDIANT.cg$tableind(idx).LIEU_NAISSANCE := TRUE;
            cg$rec.SITUATION := cg$ETUDIANT.cg$table(idx).SITUATION;
            cg$ETUDIANT.cg$tableind(idx).SITUATION := TRUE;
            cg$rec.NATIONALITE := cg$ETUDIANT.cg$table(idx).NATIONALITE;
            cg$ETUDIANT.cg$tableind(idx).NATIONALITE := TRUE;
            cg$rec.TEL_PORT := cg$ETUDIANT.cg$table(idx).TEL_PORT;
            cg$ETUDIANT.cg$tableind(idx).TEL_PORT := TRUE;
            cg$rec.TEL_FIXE := cg$ETUDIANT.cg$table(idx).TEL_FIXE;
            cg$ETUDIANT.cg$tableind(idx).TEL_FIXE := TRUE;
            cg$rec.EMAIL := cg$ETUDIANT.cg$table(idx).EMAIL;
            cg$ETUDIANT.cg$tableind(idx).EMAIL := TRUE;
            cg$rec.ACTU_ADRESSE := cg$ETUDIANT.cg$table(idx).ACTU_ADRESSE;
            cg$ETUDIANT.cg$tableind(idx).ACTU_ADRESSE := TRUE;
            cg$rec.ACTU_CP := cg$ETUDIANT.cg$table(idx).ACTU_CP;
            cg$ETUDIANT.cg$tableind(idx).ACTU_CP := TRUE;
            cg$rec.ACTU_VILLE := cg$ETUDIANT.cg$table(idx).ACTU_VILLE;
            cg$ETUDIANT.cg$tableind(idx).ACTU_VILLE := TRUE;
            cg$rec.ACTU_PAYS := cg$ETUDIANT.cg$table(idx).ACTU_PAYS;
            cg$ETUDIANT.cg$tableind(idx).ACTU_PAYS := TRUE;
            cg$rec.PERM_ADRESSE := cg$ETUDIANT.cg$table(idx).PERM_ADRESSE;
            cg$ETUDIANT.cg$tableind(idx).PERM_ADRESSE := TRUE;
            cg$rec.PERM_CP := cg$ETUDIANT.cg$table(idx).PERM_CP;
            cg$ETUDIANT.cg$tableind(idx).PERM_CP := TRUE;
            cg$rec.PERM_VILLE := cg$ETUDIANT.cg$table(idx).PERM_VILLE;
            cg$ETUDIANT.cg$tableind(idx).PERM_VILLE := TRUE;
            cg$rec.PERM_PAYS := cg$ETUDIANT.cg$table(idx).PERM_PAYS;
            cg$ETUDIANT.cg$tableind(idx).PERM_PAYS := TRUE;
            cg$rec.DERNIER_DIPLOME := cg$ETUDIANT.cg$table(idx).DERNIER_DIPLOME;
            cg$ETUDIANT.cg$tableind(idx).DERNIER_DIPLOME := TRUE;
            cg$rec.UNIVERSITE := cg$ETUDIANT.cg$table(idx).UNIVERSITE;
            cg$ETUDIANT.cg$tableind(idx).UNIVERSITE := TRUE;
            cg$rec.SIGLE_ETU := cg$ETUDIANT.cg$table(idx).SIGLE_ETU;
            cg$ETUDIANT.cg$tableind(idx).SIGLE_ETU := TRUE;
            cg$rec.COMPTE_CRI := cg$ETUDIANT.cg$table(idx).COMPTE_CRI;
            cg$ETUDIANT.cg$tableind(idx).COMPTE_CRI := TRUE;
            cg$rec.UBO_EMAIL := cg$ETUDIANT.cg$table(idx).UBO_EMAIL;
            cg$ETUDIANT.cg$tableind(idx).UBO_EMAIL := TRUE;
            cg$rec.GRPE_ANGLAIS := cg$ETUDIANT.cg$table(idx).GRPE_ANGLAIS;
            cg$ETUDIANT.cg$tableind(idx).GRPE_ANGLAIS := TRUE;
            cg$rec.ABANDON_MOTIF := cg$ETUDIANT.cg$table(idx).ABANDON_MOTIF;
            cg$ETUDIANT.cg$tableind(idx).ABANDON_MOTIF := TRUE;
            cg$rec.ABANDON_DATE := cg$ETUDIANT.cg$table(idx).ABANDON_DATE;
            cg$ETUDIANT.cg$tableind(idx).ABANDON_DATE := TRUE;
            cg$rec.EST_DIPLOME := cg$ETUDIANT.cg$table(idx).EST_DIPLOME;
            cg$ETUDIANT.cg$tableind(idx).EST_DIPLOME := TRUE;

            cg$ETUDIANT.validate_foreign_keys_del(cg$rec);
            cg$ETUDIANT.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$ETUDIANT.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$ETUDIANT.cascade_delete(cg$rec);
            cg$ETUDIANT.domain_cascade_delete(cg$rec);             

            idx := cg$ETUDIANT.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



