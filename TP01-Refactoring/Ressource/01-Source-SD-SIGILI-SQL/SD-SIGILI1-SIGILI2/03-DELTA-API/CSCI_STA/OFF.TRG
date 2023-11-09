
PROMPT Creating Trigger Logic for Table 'OFFRE_STAGE'
PROMPT Creating Before Insert Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$BIS_OFFRE_STAGE
BEFORE INSERT ON OFFRE_STAGE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$OFFRE_STAGE.cg$table.DELETE;
    cg$OFFRE_STAGE.cg$tableind.DELETE;
    cg$OFFRE_STAGE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE
TRIGGER CG$BIR_OFFRE_STAGE BEFORE INSERT ON OFFRE_STAGE 
FOR EACH ROW 
DECLARE
    cg$rec cg$OFFRE_STAGE.cg$row_type;
    cg$ind cg$OFFRE_STAGE.cg$ind_type;
BEGIN
      cg$rec.NO_OFFRE := :new.NO_OFFRE;
      cg$ind.NO_OFFRE := TRUE;
      cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
      cg$ind.NO_ENTREPRISE := TRUE;
      cg$rec.NO_OFFRE_ENTREPRISE := :new.NO_OFFRE_ENTREPRISE;
      cg$ind.NO_OFFRE_ENTREPRISE := TRUE;
      if(LENGTH(:new.ANNEE_PRO)!=0) THEN
        cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
      ELSE
        SELECT VALEUR INTO :new.ANNEE_PRO FROM parametre where CODE = 'PROMOTION_COURANTE';
        cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
      END IF;
      cg$ind.ANNEE_PRO := TRUE;
      cg$rec.INTITULE := :new.INTITULE;
      cg$ind.INTITULE := TRUE;
      cg$rec.SUJET := :new.SUJET;
      cg$ind.SUJET := TRUE;
      cg$rec.DATE_CREATION := :new.DATE_CREATION;
      cg$ind.DATE_CREATION := TRUE;
      -- Warning: Column DESCRIPTION is of type LONG and not allowed in triggers
          cg$ind.DESCRIPTION := FALSE;
      cg$rec.DUREE := :new.DUREE;
      cg$ind.DUREE := TRUE;
      cg$rec.ETAT_OFFRE := :new.ETAT_OFFRE;
      cg$ind.ETAT_OFFRE := TRUE;
      cg$rec.LIEU := :new.LIEU;
      cg$ind.LIEU := TRUE;
      cg$rec.NIVEAU_REQUIS := :new.NIVEAU_REQUIS;
      cg$ind.NIVEAU_REQUIS := TRUE;
      cg$rec.PERIODE := :new.PERIODE;
      cg$ind.PERIODE := TRUE;
      cg$rec.NOM_RESPONSABLE := :new.NOM_RESPONSABLE;
      cg$ind.NOM_RESPONSABLE := TRUE;
      cg$rec.PRENOM_RESPONSABLE := :new.PRENOM_RESPONSABLE;
      cg$ind.PRENOM_RESPONSABLE := TRUE;
      cg$rec.TEL_RESPONSABLE := :new.TEL_RESPONSABLE;
      cg$ind.TEL_RESPONSABLE := TRUE;
      cg$rec.MAIL_RESPONSABLE := :new.MAIL_RESPONSABLE;
      cg$ind.MAIL_RESPONSABLE := TRUE;
      cg$rec.REMUNERATION := :new.REMUNERATION;
      cg$ind.REMUNERATION := TRUE;
  
      if not (cg$OFFRE_STAGE.called_from_package) then
          cg$OFFRE_STAGE.validate_arc(cg$rec);
          cg$OFFRE_STAGE.validate_domain(cg$rec);
  
          cg$OFFRE_STAGE.ins(cg$rec, cg$ind, FALSE);
          cg$OFFRE_STAGE.called_from_package := FALSE;
      end if;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_OFFRE := cg$rec.NO_OFFRE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).NO_OFFRE := cg$ind.NO_OFFRE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_OFFRE_ENTREPRISE := cg$rec.NO_OFFRE_ENTREPRISE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).NO_OFFRE_ENTREPRISE := cg$ind.NO_OFFRE_ENTREPRISE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).INTITULE := cg$rec.INTITULE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).INTITULE := cg$ind.INTITULE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).SUJET := cg$rec.SUJET;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).SUJET := cg$ind.SUJET;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DATE_CREATION := cg$rec.DATE_CREATION;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).DATE_CREATION := cg$ind.DATE_CREATION;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).DESCRIPTION := cg$ind.DESCRIPTION;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DUREE := cg$rec.DUREE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).DUREE := cg$ind.DUREE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).ETAT_OFFRE := cg$rec.ETAT_OFFRE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).ETAT_OFFRE := cg$ind.ETAT_OFFRE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).LIEU := cg$rec.LIEU;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).LIEU := cg$ind.LIEU;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NIVEAU_REQUIS := cg$rec.NIVEAU_REQUIS;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).NIVEAU_REQUIS := cg$ind.NIVEAU_REQUIS;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).PERIODE := cg$rec.PERIODE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).PERIODE := cg$ind.PERIODE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NOM_RESPONSABLE := cg$rec.NOM_RESPONSABLE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).NOM_RESPONSABLE := cg$ind.NOM_RESPONSABLE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).PRENOM_RESPONSABLE := cg$rec.PRENOM_RESPONSABLE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).PRENOM_RESPONSABLE := cg$ind.PRENOM_RESPONSABLE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).TEL_RESPONSABLE := cg$rec.TEL_RESPONSABLE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).TEL_RESPONSABLE := cg$ind.TEL_RESPONSABLE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).MAIL_RESPONSABLE := cg$rec.MAIL_RESPONSABLE;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).MAIL_RESPONSABLE := cg$ind.MAIL_RESPONSABLE;
  
      cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).REMUNERATION := cg$rec.REMUNERATION;
      cg$OFFRE_STAGE.cg$tableind(cg$OFFRE_STAGE.idx).REMUNERATION := cg$ind.REMUNERATION;
  
      cg$OFFRE_STAGE.idx := cg$OFFRE_STAGE.idx + 1;
  
      :new.NO_OFFRE := cg$rec.NO_OFFRE;
      :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
      :new.NO_OFFRE_ENTREPRISE := cg$rec.NO_OFFRE_ENTREPRISE;
      :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
      :new.INTITULE := cg$rec.INTITULE;
      :new.SUJET := cg$rec.SUJET;
      :new.DATE_CREATION := SYSDATE;
      -- Warning: Column DESCRIPTION is of type LONG and not allowed in triggers
      :new.DUREE := cg$rec.DUREE;
      :new.ETAT_OFFRE := cg$rec.ETAT_OFFRE;
      :new.LIEU := cg$rec.LIEU;
      :new.NIVEAU_REQUIS := cg$rec.NIVEAU_REQUIS;
      :new.PERIODE := cg$rec.PERIODE;
      :new.NOM_RESPONSABLE := cg$rec.NOM_RESPONSABLE;
      :new.PRENOM_RESPONSABLE := cg$rec.PRENOM_RESPONSABLE;
      :new.TEL_RESPONSABLE := cg$rec.TEL_RESPONSABLE;
      :new.MAIL_RESPONSABLE := cg$rec.MAIL_RESPONSABLE;
      :new.REMUNERATION := cg$rec.REMUNERATION;
END;
/

-- No application logic defined for Trigger cg$AIR_OFFRE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_OFFRE_STAGE
AFTER INSERT ON OFFRE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_OFFRE_STAGE
/

PROMPT Creating After Insert Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$AIS_OFFRE_STAGE
AFTER INSERT ON OFFRE_STAGE
DECLARE
    idx      BINARY_INTEGER := cg$OFFRE_STAGE.cg$table.FIRST;
    cg$rec   cg$OFFRE_STAGE.cg$row_type;
    cg$old_rec   cg$OFFRE_STAGE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$OFFRE_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_OFFRE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE;
            cg$rec.NO_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_ENTREPRISE;
            cg$rec.NO_OFFRE_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE_ENTREPRISE;
            cg$rec.ANNEE_PRO := cg$OFFRE_STAGE.cg$table(idx).ANNEE_PRO;
            cg$rec.INTITULE := cg$OFFRE_STAGE.cg$table(idx).INTITULE;
            cg$rec.SUJET := cg$OFFRE_STAGE.cg$table(idx).SUJET;
            cg$rec.DATE_CREATION := cg$OFFRE_STAGE.cg$table(idx).DATE_CREATION;
            cg$rec.DESCRIPTION := cg$OFFRE_STAGE.cg$table(idx).DESCRIPTION;
            cg$rec.DUREE := cg$OFFRE_STAGE.cg$table(idx).DUREE;
            cg$rec.ETAT_OFFRE := cg$OFFRE_STAGE.cg$table(idx).ETAT_OFFRE;
            cg$rec.LIEU := cg$OFFRE_STAGE.cg$table(idx).LIEU;
            cg$rec.NIVEAU_REQUIS := cg$OFFRE_STAGE.cg$table(idx).NIVEAU_REQUIS;
            cg$rec.PERIODE := cg$OFFRE_STAGE.cg$table(idx).PERIODE;
            cg$rec.NOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).NOM_RESPONSABLE;
            cg$rec.PRENOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).PRENOM_RESPONSABLE;
            cg$rec.TEL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).TEL_RESPONSABLE;
            cg$rec.MAIL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).MAIL_RESPONSABLE;
            cg$rec.REMUNERATION := cg$OFFRE_STAGE.cg$table(idx).REMUNERATION;

            cg$OFFRE_STAGE.validate_foreign_keys_ins(cg$rec);

            cg$OFFRE_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$OFFRE_STAGE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$OFFRE_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$BUS_OFFRE_STAGE
BEFORE UPDATE ON OFFRE_STAGE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$OFFRE_STAGE.cg$table.DELETE;
    cg$OFFRE_STAGE.cg$tableind.DELETE;
    cg$OFFRE_STAGE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$BUR_OFFRE_STAGE
BEFORE UPDATE ON OFFRE_STAGE FOR EACH ROW
DECLARE
    cg$rec     cg$OFFRE_STAGE.cg$row_type;
    cg$ind     cg$OFFRE_STAGE.cg$ind_type;
    cg$old_rec cg$OFFRE_STAGE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_OFFRE := :new.NO_OFFRE;
    cg$ind.NO_OFFRE :=    (:new.NO_OFFRE IS NULL AND :old.NO_OFFRE IS NOT NULL )
                        OR (:new.NO_OFFRE IS NOT NULL AND :old.NO_OFFRE IS NULL)
                        OR NOT(:new.NO_OFFRE = :old.NO_OFFRE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_OFFRE := :old.NO_OFFRE;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_OFFRE_ENTREPRISE := :new.NO_OFFRE_ENTREPRISE;
    cg$ind.NO_OFFRE_ENTREPRISE :=    (:new.NO_OFFRE_ENTREPRISE IS NULL AND :old.NO_OFFRE_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_OFFRE_ENTREPRISE IS NOT NULL AND :old.NO_OFFRE_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_OFFRE_ENTREPRISE = :old.NO_OFFRE_ENTREPRISE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_OFFRE_ENTREPRISE := :old.NO_OFFRE_ENTREPRISE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.INTITULE := :new.INTITULE;
    cg$ind.INTITULE :=    (:new.INTITULE IS NULL AND :old.INTITULE IS NOT NULL )
                        OR (:new.INTITULE IS NOT NULL AND :old.INTITULE IS NULL)
                        OR NOT(:new.INTITULE = :old.INTITULE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).INTITULE := :old.INTITULE;
    cg$rec.SUJET := :new.SUJET;
    cg$ind.SUJET :=    (:new.SUJET IS NULL AND :old.SUJET IS NOT NULL )
                        OR (:new.SUJET IS NOT NULL AND :old.SUJET IS NULL)
                        OR NOT(:new.SUJET = :old.SUJET) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).SUJET := :old.SUJET;
    cg$rec.DATE_CREATION := :new.DATE_CREATION;
    cg$ind.DATE_CREATION :=    (:new.DATE_CREATION IS NULL AND :old.DATE_CREATION IS NOT NULL )
                        OR (:new.DATE_CREATION IS NOT NULL AND :old.DATE_CREATION IS NULL)
                        OR NOT(:new.DATE_CREATION = :old.DATE_CREATION) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DATE_CREATION := :old.DATE_CREATION;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION :=    (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL )
                        OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
                        OR NOT(:new.DESCRIPTION = :old.DESCRIPTION) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DESCRIPTION := :old.DESCRIPTION;
    cg$rec.DUREE := :new.DUREE;
    cg$ind.DUREE :=    (:new.DUREE IS NULL AND :old.DUREE IS NOT NULL )
                        OR (:new.DUREE IS NOT NULL AND :old.DUREE IS NULL)
                        OR NOT(:new.DUREE = :old.DUREE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).DUREE := :old.DUREE;
    cg$rec.ETAT_OFFRE := :new.ETAT_OFFRE;
    cg$ind.ETAT_OFFRE :=    (:new.ETAT_OFFRE IS NULL AND :old.ETAT_OFFRE IS NOT NULL )
                        OR (:new.ETAT_OFFRE IS NOT NULL AND :old.ETAT_OFFRE IS NULL)
                        OR NOT(:new.ETAT_OFFRE = :old.ETAT_OFFRE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).ETAT_OFFRE := :old.ETAT_OFFRE;
    cg$rec.LIEU := :new.LIEU;
    cg$ind.LIEU :=    (:new.LIEU IS NULL AND :old.LIEU IS NOT NULL )
                        OR (:new.LIEU IS NOT NULL AND :old.LIEU IS NULL)
                        OR NOT(:new.LIEU = :old.LIEU) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).LIEU := :old.LIEU;
    cg$rec.NIVEAU_REQUIS := :new.NIVEAU_REQUIS;
    cg$ind.NIVEAU_REQUIS :=    (:new.NIVEAU_REQUIS IS NULL AND :old.NIVEAU_REQUIS IS NOT NULL )
                        OR (:new.NIVEAU_REQUIS IS NOT NULL AND :old.NIVEAU_REQUIS IS NULL)
                        OR NOT(:new.NIVEAU_REQUIS = :old.NIVEAU_REQUIS) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NIVEAU_REQUIS := :old.NIVEAU_REQUIS;
    cg$rec.PERIODE := :new.PERIODE;
    cg$ind.PERIODE :=    (:new.PERIODE IS NULL AND :old.PERIODE IS NOT NULL )
                        OR (:new.PERIODE IS NOT NULL AND :old.PERIODE IS NULL)
                        OR NOT(:new.PERIODE = :old.PERIODE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).PERIODE := :old.PERIODE;
    cg$rec.NOM_RESPONSABLE := :new.NOM_RESPONSABLE;
    cg$ind.NOM_RESPONSABLE :=    (:new.NOM_RESPONSABLE IS NULL AND :old.NOM_RESPONSABLE IS NOT NULL )
                        OR (:new.NOM_RESPONSABLE IS NOT NULL AND :old.NOM_RESPONSABLE IS NULL)
                        OR NOT(:new.NOM_RESPONSABLE = :old.NOM_RESPONSABLE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NOM_RESPONSABLE := :old.NOM_RESPONSABLE;
    cg$rec.PRENOM_RESPONSABLE := :new.PRENOM_RESPONSABLE;
    cg$ind.PRENOM_RESPONSABLE :=    (:new.PRENOM_RESPONSABLE IS NULL AND :old.PRENOM_RESPONSABLE IS NOT NULL )
                        OR (:new.PRENOM_RESPONSABLE IS NOT NULL AND :old.PRENOM_RESPONSABLE IS NULL)
                        OR NOT(:new.PRENOM_RESPONSABLE = :old.PRENOM_RESPONSABLE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).PRENOM_RESPONSABLE := :old.PRENOM_RESPONSABLE;
    cg$rec.TEL_RESPONSABLE := :new.TEL_RESPONSABLE;
    cg$ind.TEL_RESPONSABLE :=    (:new.TEL_RESPONSABLE IS NULL AND :old.TEL_RESPONSABLE IS NOT NULL )
                        OR (:new.TEL_RESPONSABLE IS NOT NULL AND :old.TEL_RESPONSABLE IS NULL)
                        OR NOT(:new.TEL_RESPONSABLE = :old.TEL_RESPONSABLE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).TEL_RESPONSABLE := :old.TEL_RESPONSABLE;
    cg$rec.MAIL_RESPONSABLE := :new.MAIL_RESPONSABLE;
    cg$ind.MAIL_RESPONSABLE :=    (:new.MAIL_RESPONSABLE IS NULL AND :old.MAIL_RESPONSABLE IS NOT NULL )
                        OR (:new.MAIL_RESPONSABLE IS NOT NULL AND :old.MAIL_RESPONSABLE IS NULL)
                        OR NOT(:new.MAIL_RESPONSABLE = :old.MAIL_RESPONSABLE) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).MAIL_RESPONSABLE := :old.MAIL_RESPONSABLE;
    cg$rec.REMUNERATION := :new.REMUNERATION;
    cg$ind.REMUNERATION :=    (:new.REMUNERATION IS NULL AND :old.REMUNERATION IS NOT NULL )
                        OR (:new.REMUNERATION IS NOT NULL AND :old.REMUNERATION IS NULL)
                        OR NOT(:new.REMUNERATION = :old.REMUNERATION) ;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).REMUNERATION := :old.REMUNERATION;


    cg$OFFRE_STAGE.idx := cg$OFFRE_STAGE.idx + 1;

    if not (cg$OFFRE_STAGE.called_from_package) then
        cg$OFFRE_STAGE.validate_arc(cg$rec);
        cg$OFFRE_STAGE.validate_domain(cg$rec, cg$ind);
        cg$OFFRE_STAGE.validate_domain_cascade_update(cg$old_rec);   

        cg$OFFRE_STAGE.upd(cg$rec, cg$ind, FALSE);
        cg$OFFRE_STAGE.called_from_package := FALSE;
    end if;

    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.NO_OFFRE_ENTREPRISE := cg$rec.NO_OFFRE_ENTREPRISE;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.INTITULE := cg$rec.INTITULE;
    :new.SUJET := cg$rec.SUJET;
    :new.DATE_CREATION := cg$rec.DATE_CREATION;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.DUREE := cg$rec.DUREE;
    :new.ETAT_OFFRE := cg$rec.ETAT_OFFRE;
    :new.LIEU := cg$rec.LIEU;
    :new.NIVEAU_REQUIS := cg$rec.NIVEAU_REQUIS;
    :new.PERIODE := cg$rec.PERIODE;
    :new.NOM_RESPONSABLE := cg$rec.NOM_RESPONSABLE;
    :new.PRENOM_RESPONSABLE := cg$rec.PRENOM_RESPONSABLE;
    :new.TEL_RESPONSABLE := cg$rec.TEL_RESPONSABLE;
    :new.MAIL_RESPONSABLE := cg$rec.MAIL_RESPONSABLE;
    :new.REMUNERATION := cg$rec.REMUNERATION;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_OFFRE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_OFFRE_STAGE
AFTER UPDATE ON OFFRE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_OFFRE_STAGE
/






PROMPT Creating After Update Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$AUS_OFFRE_STAGE
AFTER UPDATE ON OFFRE_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$OFFRE_STAGE.cg$table.FIRST;
    cg$old_rec cg$OFFRE_STAGE.cg$row_type;
    cg$rec     cg$OFFRE_STAGE.cg$row_type;
    cg$ind     cg$OFFRE_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_OFFRE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE;
        cg$old_rec.NO_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_ENTREPRISE;
        cg$old_rec.NO_OFFRE_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE_ENTREPRISE;
        cg$old_rec.ANNEE_PRO := cg$OFFRE_STAGE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.INTITULE := cg$OFFRE_STAGE.cg$table(idx).INTITULE;
        cg$old_rec.SUJET := cg$OFFRE_STAGE.cg$table(idx).SUJET;
        cg$old_rec.DATE_CREATION := cg$OFFRE_STAGE.cg$table(idx).DATE_CREATION;
        cg$old_rec.DESCRIPTION := cg$OFFRE_STAGE.cg$table(idx).DESCRIPTION;
        cg$old_rec.DUREE := cg$OFFRE_STAGE.cg$table(idx).DUREE;
        cg$old_rec.ETAT_OFFRE := cg$OFFRE_STAGE.cg$table(idx).ETAT_OFFRE;
        cg$old_rec.LIEU := cg$OFFRE_STAGE.cg$table(idx).LIEU;
        cg$old_rec.NIVEAU_REQUIS := cg$OFFRE_STAGE.cg$table(idx).NIVEAU_REQUIS;
        cg$old_rec.PERIODE := cg$OFFRE_STAGE.cg$table(idx).PERIODE;
        cg$old_rec.NOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).NOM_RESPONSABLE;
        cg$old_rec.PRENOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).PRENOM_RESPONSABLE;
        cg$old_rec.TEL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).TEL_RESPONSABLE;
        cg$old_rec.MAIL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).MAIL_RESPONSABLE;
        cg$old_rec.REMUNERATION := cg$OFFRE_STAGE.cg$table(idx).REMUNERATION;

    IF NOT (cg$OFFRE_STAGE.called_from_package) THEN
        idx := cg$OFFRE_STAGE.cg$table.NEXT(idx);
        cg$rec.NO_OFFRE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE;
        cg$ind.NO_OFFRE := updating('NO_OFFRE');
        cg$rec.NO_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');
        cg$rec.NO_OFFRE_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE_ENTREPRISE;
        cg$ind.NO_OFFRE_ENTREPRISE := updating('NO_OFFRE_ENTREPRISE');
        cg$rec.ANNEE_PRO := cg$OFFRE_STAGE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.INTITULE := cg$OFFRE_STAGE.cg$table(idx).INTITULE;
        cg$ind.INTITULE := updating('INTITULE');
        cg$rec.SUJET := cg$OFFRE_STAGE.cg$table(idx).SUJET;
        cg$ind.SUJET := updating('SUJET');
        cg$rec.DATE_CREATION := cg$OFFRE_STAGE.cg$table(idx).DATE_CREATION;
        cg$ind.DATE_CREATION := updating('DATE_CREATION');
        cg$rec.DESCRIPTION := cg$OFFRE_STAGE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');
        cg$rec.DUREE := cg$OFFRE_STAGE.cg$table(idx).DUREE;
        cg$ind.DUREE := updating('DUREE');
        cg$rec.ETAT_OFFRE := cg$OFFRE_STAGE.cg$table(idx).ETAT_OFFRE;
        cg$ind.ETAT_OFFRE := updating('ETAT_OFFRE');
        cg$rec.LIEU := cg$OFFRE_STAGE.cg$table(idx).LIEU;
        cg$ind.LIEU := updating('LIEU');
        cg$rec.NIVEAU_REQUIS := cg$OFFRE_STAGE.cg$table(idx).NIVEAU_REQUIS;
        cg$ind.NIVEAU_REQUIS := updating('NIVEAU_REQUIS');
        cg$rec.PERIODE := cg$OFFRE_STAGE.cg$table(idx).PERIODE;
        cg$ind.PERIODE := updating('PERIODE');
        cg$rec.NOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).NOM_RESPONSABLE;
        cg$ind.NOM_RESPONSABLE := updating('NOM_RESPONSABLE');
        cg$rec.PRENOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).PRENOM_RESPONSABLE;
        cg$ind.PRENOM_RESPONSABLE := updating('PRENOM_RESPONSABLE');
        cg$rec.TEL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).TEL_RESPONSABLE;
        cg$ind.TEL_RESPONSABLE := updating('TEL_RESPONSABLE');
        cg$rec.MAIL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).MAIL_RESPONSABLE;
        cg$ind.MAIL_RESPONSABLE := updating('MAIL_RESPONSABLE');
        cg$rec.REMUNERATION := cg$OFFRE_STAGE.cg$table(idx).REMUNERATION;
        cg$ind.REMUNERATION := updating('REMUNERATION');

        cg$OFFRE_STAGE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$OFFRE_STAGE.upd_denorm2( cg$rec,
                                       cg$OFFRE_STAGE.cg$tableind(idx)
                                     );
        cg$OFFRE_STAGE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$OFFRE_STAGE.cg$tableind(idx)
								                  );
        cg$OFFRE_STAGE.cascade_update(cg$rec, cg$old_rec);
        cg$OFFRE_STAGE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$OFFRE_STAGE.called_from_package := FALSE;
	END IF;
        idx := cg$OFFRE_STAGE.cg$table.NEXT(idx);
    END LOOP;

    cg$OFFRE_STAGE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$BDS_OFFRE_STAGE
BEFORE DELETE ON OFFRE_STAGE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$OFFRE_STAGE.cg$table.DELETE;
    cg$OFFRE_STAGE.cg$tableind.DELETE;
    cg$OFFRE_STAGE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$BDR_OFFRE_STAGE
BEFORE DELETE ON OFFRE_STAGE FOR EACH ROW
DECLARE
    cg$pk cg$OFFRE_STAGE.cg$pk_type;
    cg$rec cg$OFFRE_STAGE.cg$row_type;
    cg$ind cg$OFFRE_STAGE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_OFFRE  := :old.NO_OFFRE;
    cg$rec.NO_OFFRE := :old.NO_OFFRE;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_OFFRE := :old.NO_OFFRE;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$OFFRE_STAGE.cg$table(cg$OFFRE_STAGE.idx).ANNEE_PRO := :old.ANNEE_PRO;


    cg$OFFRE_STAGE.idx := cg$OFFRE_STAGE.idx + 1;

    if not (cg$OFFRE_STAGE.called_from_package) then
        cg$OFFRE_STAGE.validate_domain_cascade_delete(cg$rec);   
        cg$OFFRE_STAGE.del(cg$pk, FALSE);
        cg$OFFRE_STAGE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_OFFRE_STAGE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_OFFRE_STAGE
AFTER DELETE ON OFFRE_STAGE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_OFFRE_STAGE
/

PROMPT Creating After Delete Statement Trigger on 'OFFRE_STAGE'
CREATE OR REPLACE TRIGGER cg$ADS_OFFRE_STAGE
AFTER DELETE ON OFFRE_STAGE
DECLARE
    idx        BINARY_INTEGER := cg$OFFRE_STAGE.cg$table.FIRST;
    cg$rec   cg$OFFRE_STAGE.cg$row_type;
    cg$old_rec   cg$OFFRE_STAGE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$OFFRE_STAGE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_OFFRE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE;
            cg$OFFRE_STAGE.cg$tableind(idx).NO_OFFRE := TRUE;
            cg$rec.NO_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_ENTREPRISE;
            cg$OFFRE_STAGE.cg$tableind(idx).NO_ENTREPRISE := TRUE;
            cg$rec.NO_OFFRE_ENTREPRISE := cg$OFFRE_STAGE.cg$table(idx).NO_OFFRE_ENTREPRISE;
            cg$OFFRE_STAGE.cg$tableind(idx).NO_OFFRE_ENTREPRISE := TRUE;
            cg$rec.ANNEE_PRO := cg$OFFRE_STAGE.cg$table(idx).ANNEE_PRO;
            cg$OFFRE_STAGE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.INTITULE := cg$OFFRE_STAGE.cg$table(idx).INTITULE;
            cg$OFFRE_STAGE.cg$tableind(idx).INTITULE := TRUE;
            cg$rec.SUJET := cg$OFFRE_STAGE.cg$table(idx).SUJET;
            cg$OFFRE_STAGE.cg$tableind(idx).SUJET := TRUE;
            cg$rec.DATE_CREATION := cg$OFFRE_STAGE.cg$table(idx).DATE_CREATION;
            cg$OFFRE_STAGE.cg$tableind(idx).DATE_CREATION := TRUE;
            cg$rec.DESCRIPTION := cg$OFFRE_STAGE.cg$table(idx).DESCRIPTION;
            cg$OFFRE_STAGE.cg$tableind(idx).DESCRIPTION := TRUE;
            cg$rec.DUREE := cg$OFFRE_STAGE.cg$table(idx).DUREE;
            cg$OFFRE_STAGE.cg$tableind(idx).DUREE := TRUE;
            cg$rec.ETAT_OFFRE := cg$OFFRE_STAGE.cg$table(idx).ETAT_OFFRE;
            cg$OFFRE_STAGE.cg$tableind(idx).ETAT_OFFRE := TRUE;
            cg$rec.LIEU := cg$OFFRE_STAGE.cg$table(idx).LIEU;
            cg$OFFRE_STAGE.cg$tableind(idx).LIEU := TRUE;
            cg$rec.NIVEAU_REQUIS := cg$OFFRE_STAGE.cg$table(idx).NIVEAU_REQUIS;
            cg$OFFRE_STAGE.cg$tableind(idx).NIVEAU_REQUIS := TRUE;
            cg$rec.PERIODE := cg$OFFRE_STAGE.cg$table(idx).PERIODE;
            cg$OFFRE_STAGE.cg$tableind(idx).PERIODE := TRUE;
            cg$rec.NOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).NOM_RESPONSABLE;
            cg$OFFRE_STAGE.cg$tableind(idx).NOM_RESPONSABLE := TRUE;
            cg$rec.PRENOM_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).PRENOM_RESPONSABLE;
            cg$OFFRE_STAGE.cg$tableind(idx).PRENOM_RESPONSABLE := TRUE;
            cg$rec.TEL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).TEL_RESPONSABLE;
            cg$OFFRE_STAGE.cg$tableind(idx).TEL_RESPONSABLE := TRUE;
            cg$rec.MAIL_RESPONSABLE := cg$OFFRE_STAGE.cg$table(idx).MAIL_RESPONSABLE;
            cg$OFFRE_STAGE.cg$tableind(idx).MAIL_RESPONSABLE := TRUE;
            cg$rec.REMUNERATION := cg$OFFRE_STAGE.cg$table(idx).REMUNERATION;
            cg$OFFRE_STAGE.cg$tableind(idx).REMUNERATION := TRUE;

            cg$OFFRE_STAGE.validate_foreign_keys_del(cg$rec);
            cg$OFFRE_STAGE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$OFFRE_STAGE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$OFFRE_STAGE.cascade_delete(cg$rec);
            cg$OFFRE_STAGE.domain_cascade_delete(cg$rec);             

            idx := cg$OFFRE_STAGE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



