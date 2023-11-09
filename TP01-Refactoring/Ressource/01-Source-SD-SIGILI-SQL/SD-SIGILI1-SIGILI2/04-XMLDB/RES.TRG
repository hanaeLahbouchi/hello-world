
--PROMPT Creating Trigger Logic for Table 'RESSOURCE'
--PROMPT Creating Before Insert Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BIS_RESSOURCE
BEFORE INSERT ON RESSOURCE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$RESSOURCE.cg$table.DELETE;
    cg$RESSOURCE.cg$tableind.DELETE;
    cg$RESSOURCE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

--PROMPT Creating Before Insert Row Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BIR_RESSOURCE
BEFORE INSERT ON RESSOURCE FOR EACH ROW
DECLARE
    cg$rec cg$RESSOURCE.cg$row_type;
    cg$ind cg$RESSOURCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_RES := :new.ID_RES;
    cg$ind.ID_RES := TRUE;
    cg$rec.ID_RUB := :new.ID_RUB;
    cg$ind.ID_RUB := TRUE;
    cg$rec.TYPE_RES := :new.TYPE_RES;
    cg$ind.TYPE_RES := TRUE;
    cg$rec.NO_ORDRE := :new.NO_ORDRE;
    cg$ind.NO_ORDRE := TRUE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION := TRUE;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION := TRUE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;
    cg$rec.OUV_TITRE := :new.OUV_TITRE;
    cg$ind.OUV_TITRE := TRUE;
    cg$rec.OUV_RESUME := :new.OUV_RESUME;
    cg$ind.OUV_RESUME := TRUE;
    cg$rec.OUV_AUTEUR := :new.OUV_AUTEUR;
    cg$ind.OUV_AUTEUR := TRUE;
    cg$rec.OUV_EDITEUR := :new.OUV_EDITEUR;
    cg$ind.OUV_EDITEUR := TRUE;
    cg$rec.OUV_CODE_ISBN := :new.OUV_CODE_ISBN;
    cg$ind.OUV_CODE_ISBN := TRUE;
    cg$rec.OUV_DATE_PARUTION := :new.OUV_DATE_PARUTION;
    cg$ind.OUV_DATE_PARUTION := TRUE;
    cg$rec.OUV_PROPRIETAIRE := :new.OUV_PROPRIETAIRE;
    cg$ind.OUV_PROPRIETAIRE := TRUE;
    cg$rec.OUV_LOCALISATION := :new.OUV_LOCALISATION;
    cg$ind.OUV_LOCALISATION := TRUE;
    cg$rec.URL_ADRESSE := :new.URL_ADRESSE;
    cg$ind.URL_ADRESSE := TRUE;
    cg$rec.LOG_NOM := :new.LOG_NOM;
    cg$ind.LOG_NOM := TRUE;
    cg$rec.LOG_VERSION := :new.LOG_VERSION;
    cg$ind.LOG_VERSION := TRUE;
    cg$rec.LOG_TYPE_SUPPORT := :new.LOG_TYPE_SUPPORT;
    cg$ind.LOG_TYPE_SUPPORT := TRUE;
    cg$rec.LOG_EDITEUR := :new.LOG_EDITEUR;
    cg$ind.LOG_EDITEUR := TRUE;
    cg$rec.LOG_URL := :new.LOG_URL;
    cg$ind.LOG_URL := TRUE;
    cg$rec.LOG_OS := :new.LOG_OS;
    cg$ind.LOG_OS := TRUE;
    cg$rec.CD_FOURNISSEUR := :new.CD_FOURNISSEUR;
    cg$ind.CD_FOURNISSEUR := TRUE;
    cg$rec.CD_LOCALISATION := :new.CD_LOCALISATION;
    cg$ind.CD_LOCALISATION := TRUE;
    cg$rec.DOC_TITRE := :new.DOC_TITRE;
    cg$ind.DOC_TITRE := TRUE;
    cg$rec.DOC_AUTEUR := :new.DOC_AUTEUR;
    cg$ind.DOC_AUTEUR := TRUE;
    cg$rec.DOC_DATE_PARUTION := :new.DOC_DATE_PARUTION;
    cg$ind.DOC_DATE_PARUTION := TRUE;
    cg$rec.DOC_TYPE__DOC := :new.DOC_TYPE__DOC;
    cg$ind.DOC_TYPE__DOC := TRUE;
    cg$rec.DOC_FORMAT_DOC := :new.DOC_FORMAT_DOC;
    cg$ind.DOC_FORMAT_DOC := TRUE;

    if not (cg$RESSOURCE.called_from_package) then
        cg$RESSOURCE.validate_arc(cg$rec);
        cg$RESSOURCE.validate_domain(cg$rec);

        cg$RESSOURCE.ins(cg$rec, cg$ind, FALSE);
        cg$RESSOURCE.called_from_package := FALSE;
    end if;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RES := cg$rec.ID_RES;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).ID_RES := cg$ind.ID_RES;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RUB := cg$rec.ID_RUB;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).ID_RUB := cg$ind.ID_RUB;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).TYPE_RES := cg$rec.TYPE_RES;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).TYPE_RES := cg$ind.TYPE_RES;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).NO_ORDRE := cg$rec.NO_ORDRE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).NO_ORDRE := cg$ind.NO_ORDRE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DESIGNATION := cg$rec.DESIGNATION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DESIGNATION := cg$ind.DESIGNATION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DESCRIPTION := cg$rec.DESCRIPTION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DESCRIPTION := cg$ind.DESCRIPTION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_TITRE := cg$rec.OUV_TITRE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_TITRE := cg$ind.OUV_TITRE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_RESUME := cg$rec.OUV_RESUME;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_RESUME := cg$ind.OUV_RESUME;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_AUTEUR := cg$rec.OUV_AUTEUR;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_AUTEUR := cg$ind.OUV_AUTEUR;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_EDITEUR := cg$rec.OUV_EDITEUR;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_EDITEUR := cg$ind.OUV_EDITEUR;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_CODE_ISBN := cg$rec.OUV_CODE_ISBN;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_CODE_ISBN := cg$ind.OUV_CODE_ISBN;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_DATE_PARUTION := cg$rec.OUV_DATE_PARUTION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_DATE_PARUTION := cg$ind.OUV_DATE_PARUTION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_PROPRIETAIRE := cg$rec.OUV_PROPRIETAIRE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_PROPRIETAIRE := cg$ind.OUV_PROPRIETAIRE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_LOCALISATION := cg$rec.OUV_LOCALISATION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).OUV_LOCALISATION := cg$ind.OUV_LOCALISATION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).URL_ADRESSE := cg$rec.URL_ADRESSE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).URL_ADRESSE := cg$ind.URL_ADRESSE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_NOM := cg$rec.LOG_NOM;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_NOM := cg$ind.LOG_NOM;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_VERSION := cg$rec.LOG_VERSION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_VERSION := cg$ind.LOG_VERSION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_TYPE_SUPPORT := cg$rec.LOG_TYPE_SUPPORT;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_TYPE_SUPPORT := cg$ind.LOG_TYPE_SUPPORT;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_EDITEUR := cg$rec.LOG_EDITEUR;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_EDITEUR := cg$ind.LOG_EDITEUR;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_URL := cg$rec.LOG_URL;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_URL := cg$ind.LOG_URL;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_OS := cg$rec.LOG_OS;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).LOG_OS := cg$ind.LOG_OS;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).CD_FOURNISSEUR := cg$rec.CD_FOURNISSEUR;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).CD_FOURNISSEUR := cg$ind.CD_FOURNISSEUR;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).CD_LOCALISATION := cg$rec.CD_LOCALISATION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).CD_LOCALISATION := cg$ind.CD_LOCALISATION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_TITRE := cg$rec.DOC_TITRE;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DOC_TITRE := cg$ind.DOC_TITRE;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_AUTEUR := cg$rec.DOC_AUTEUR;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DOC_AUTEUR := cg$ind.DOC_AUTEUR;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_DATE_PARUTION := cg$rec.DOC_DATE_PARUTION;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DOC_DATE_PARUTION := cg$ind.DOC_DATE_PARUTION;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_TYPE__DOC := cg$rec.DOC_TYPE__DOC;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DOC_TYPE__DOC := cg$ind.DOC_TYPE__DOC;

    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_FORMAT_DOC := cg$rec.DOC_FORMAT_DOC;
    cg$RESSOURCE.cg$tableind(cg$RESSOURCE.idx).DOC_FORMAT_DOC := cg$ind.DOC_FORMAT_DOC;

    cg$RESSOURCE.idx := cg$RESSOURCE.idx + 1;

    :new.ID_RES := cg$rec.ID_RES;
    :new.ID_RUB := cg$rec.ID_RUB;
    :new.TYPE_RES := cg$rec.TYPE_RES;
    :new.NO_ORDRE := cg$rec.NO_ORDRE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.OUV_TITRE := cg$rec.OUV_TITRE;
    :new.OUV_RESUME := cg$rec.OUV_RESUME;
    :new.OUV_AUTEUR := cg$rec.OUV_AUTEUR;
    :new.OUV_EDITEUR := cg$rec.OUV_EDITEUR;
    :new.OUV_CODE_ISBN := cg$rec.OUV_CODE_ISBN;
    :new.OUV_DATE_PARUTION := cg$rec.OUV_DATE_PARUTION;
    :new.OUV_PROPRIETAIRE := cg$rec.OUV_PROPRIETAIRE;
    :new.OUV_LOCALISATION := cg$rec.OUV_LOCALISATION;
    :new.URL_ADRESSE := cg$rec.URL_ADRESSE;
    :new.LOG_NOM := cg$rec.LOG_NOM;
    :new.LOG_VERSION := cg$rec.LOG_VERSION;
    :new.LOG_TYPE_SUPPORT := cg$rec.LOG_TYPE_SUPPORT;
    :new.LOG_EDITEUR := cg$rec.LOG_EDITEUR;
    :new.LOG_URL := cg$rec.LOG_URL;
    :new.LOG_OS := cg$rec.LOG_OS;
    :new.CD_FOURNISSEUR := cg$rec.CD_FOURNISSEUR;
    :new.CD_LOCALISATION := cg$rec.CD_LOCALISATION;
    :new.DOC_TITRE := cg$rec.DOC_TITRE;
    :new.DOC_AUTEUR := cg$rec.DOC_AUTEUR;
    :new.DOC_DATE_PARUTION := cg$rec.DOC_DATE_PARUTION;
    :new.DOC_TYPE__DOC := cg$rec.DOC_TYPE__DOC;
    :new.DOC_FORMAT_DOC := cg$rec.DOC_FORMAT_DOC;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_RESSOURCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_RESSOURCE
AFTER INSERT ON RESSOURCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_RESSOURCE
/

--PROMPT Creating After Insert Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$AIS_RESSOURCE
AFTER INSERT ON RESSOURCE
DECLARE
    idx      BINARY_INTEGER := cg$RESSOURCE.cg$table.FIRST;
    cg$rec   cg$RESSOURCE.cg$row_type;
    cg$old_rec   cg$RESSOURCE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$RESSOURCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_RES := cg$RESSOURCE.cg$table(idx).ID_RES;
            cg$rec.ID_RUB := cg$RESSOURCE.cg$table(idx).ID_RUB;
            cg$rec.TYPE_RES := cg$RESSOURCE.cg$table(idx).TYPE_RES;
            cg$rec.NO_ORDRE := cg$RESSOURCE.cg$table(idx).NO_ORDRE;
            cg$rec.DESIGNATION := cg$RESSOURCE.cg$table(idx).DESIGNATION;
            cg$rec.DESCRIPTION := cg$RESSOURCE.cg$table(idx).DESCRIPTION;
            cg$rec.COMMENTAIRE := cg$RESSOURCE.cg$table(idx).COMMENTAIRE;
            cg$rec.OUV_TITRE := cg$RESSOURCE.cg$table(idx).OUV_TITRE;
            cg$rec.OUV_RESUME := cg$RESSOURCE.cg$table(idx).OUV_RESUME;
            cg$rec.OUV_AUTEUR := cg$RESSOURCE.cg$table(idx).OUV_AUTEUR;
            cg$rec.OUV_EDITEUR := cg$RESSOURCE.cg$table(idx).OUV_EDITEUR;
            cg$rec.OUV_CODE_ISBN := cg$RESSOURCE.cg$table(idx).OUV_CODE_ISBN;
            cg$rec.OUV_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).OUV_DATE_PARUTION;
            cg$rec.OUV_PROPRIETAIRE := cg$RESSOURCE.cg$table(idx).OUV_PROPRIETAIRE;
            cg$rec.OUV_LOCALISATION := cg$RESSOURCE.cg$table(idx).OUV_LOCALISATION;
            cg$rec.URL_ADRESSE := cg$RESSOURCE.cg$table(idx).URL_ADRESSE;
            cg$rec.LOG_NOM := cg$RESSOURCE.cg$table(idx).LOG_NOM;
            cg$rec.LOG_VERSION := cg$RESSOURCE.cg$table(idx).LOG_VERSION;
            cg$rec.LOG_TYPE_SUPPORT := cg$RESSOURCE.cg$table(idx).LOG_TYPE_SUPPORT;
            cg$rec.LOG_EDITEUR := cg$RESSOURCE.cg$table(idx).LOG_EDITEUR;
            cg$rec.LOG_URL := cg$RESSOURCE.cg$table(idx).LOG_URL;
            cg$rec.LOG_OS := cg$RESSOURCE.cg$table(idx).LOG_OS;
            cg$rec.CD_FOURNISSEUR := cg$RESSOURCE.cg$table(idx).CD_FOURNISSEUR;
            cg$rec.CD_LOCALISATION := cg$RESSOURCE.cg$table(idx).CD_LOCALISATION;
            cg$rec.DOC_TITRE := cg$RESSOURCE.cg$table(idx).DOC_TITRE;
            cg$rec.DOC_AUTEUR := cg$RESSOURCE.cg$table(idx).DOC_AUTEUR;
            cg$rec.DOC_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).DOC_DATE_PARUTION;
            cg$rec.DOC_TYPE__DOC := cg$RESSOURCE.cg$table(idx).DOC_TYPE__DOC;
            cg$rec.DOC_FORMAT_DOC := cg$RESSOURCE.cg$table(idx).DOC_FORMAT_DOC;

            cg$RESSOURCE.validate_foreign_keys_ins(cg$rec);

            cg$RESSOURCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$RESSOURCE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$RESSOURCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

--PROMPT Creating Before Update Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BUS_RESSOURCE
BEFORE UPDATE ON RESSOURCE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$RESSOURCE.cg$table.DELETE;
    cg$RESSOURCE.cg$tableind.DELETE;
    cg$RESSOURCE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

--PROMPT Creating Before Update Row Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BUR_RESSOURCE
BEFORE UPDATE ON RESSOURCE FOR EACH ROW
DECLARE
    cg$rec     cg$RESSOURCE.cg$row_type;
    cg$ind     cg$RESSOURCE.cg$ind_type;
    cg$old_rec cg$RESSOURCE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.ID_RES := :new.ID_RES;
    cg$ind.ID_RES :=    (:new.ID_RES IS NULL AND :old.ID_RES IS NOT NULL )
                        OR (:new.ID_RES IS NOT NULL AND :old.ID_RES IS NULL)
                        OR NOT(:new.ID_RES = :old.ID_RES) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RES := :old.ID_RES;
    cg$rec.ID_RUB := :new.ID_RUB;
    cg$ind.ID_RUB :=    (:new.ID_RUB IS NULL AND :old.ID_RUB IS NOT NULL )
                        OR (:new.ID_RUB IS NOT NULL AND :old.ID_RUB IS NULL)
                        OR NOT(:new.ID_RUB = :old.ID_RUB) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RUB := :old.ID_RUB;
    cg$rec.TYPE_RES := :new.TYPE_RES;
    cg$ind.TYPE_RES :=    (:new.TYPE_RES IS NULL AND :old.TYPE_RES IS NOT NULL )
                        OR (:new.TYPE_RES IS NOT NULL AND :old.TYPE_RES IS NULL)
                        OR NOT(:new.TYPE_RES = :old.TYPE_RES) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).TYPE_RES := :old.TYPE_RES;
    cg$rec.NO_ORDRE := :new.NO_ORDRE;
    cg$ind.NO_ORDRE :=    (:new.NO_ORDRE IS NULL AND :old.NO_ORDRE IS NOT NULL )
                        OR (:new.NO_ORDRE IS NOT NULL AND :old.NO_ORDRE IS NULL)
                        OR NOT(:new.NO_ORDRE = :old.NO_ORDRE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).NO_ORDRE := :old.NO_ORDRE;
    cg$rec.DESIGNATION := :new.DESIGNATION;
    cg$ind.DESIGNATION :=    (:new.DESIGNATION IS NULL AND :old.DESIGNATION IS NOT NULL )
                        OR (:new.DESIGNATION IS NOT NULL AND :old.DESIGNATION IS NULL)
                        OR NOT(:new.DESIGNATION = :old.DESIGNATION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DESIGNATION := :old.DESIGNATION;
    cg$rec.DESCRIPTION := :new.DESCRIPTION;
    cg$ind.DESCRIPTION :=    (:new.DESCRIPTION IS NULL AND :old.DESCRIPTION IS NOT NULL )
                        OR (:new.DESCRIPTION IS NOT NULL AND :old.DESCRIPTION IS NULL)
                        OR NOT(:new.DESCRIPTION = :old.DESCRIPTION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DESCRIPTION := :old.DESCRIPTION;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).COMMENTAIRE := :old.COMMENTAIRE;
    cg$rec.OUV_TITRE := :new.OUV_TITRE;
    cg$ind.OUV_TITRE :=    (:new.OUV_TITRE IS NULL AND :old.OUV_TITRE IS NOT NULL )
                        OR (:new.OUV_TITRE IS NOT NULL AND :old.OUV_TITRE IS NULL)
                        OR NOT(:new.OUV_TITRE = :old.OUV_TITRE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_TITRE := :old.OUV_TITRE;
    cg$rec.OUV_RESUME := :new.OUV_RESUME;
    cg$ind.OUV_RESUME :=    (:new.OUV_RESUME IS NULL AND :old.OUV_RESUME IS NOT NULL )
                        OR (:new.OUV_RESUME IS NOT NULL AND :old.OUV_RESUME IS NULL)
                        OR NOT(:new.OUV_RESUME = :old.OUV_RESUME) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_RESUME := :old.OUV_RESUME;
    cg$rec.OUV_AUTEUR := :new.OUV_AUTEUR;
    cg$ind.OUV_AUTEUR :=    (:new.OUV_AUTEUR IS NULL AND :old.OUV_AUTEUR IS NOT NULL )
                        OR (:new.OUV_AUTEUR IS NOT NULL AND :old.OUV_AUTEUR IS NULL)
                        OR NOT(:new.OUV_AUTEUR = :old.OUV_AUTEUR) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_AUTEUR := :old.OUV_AUTEUR;
    cg$rec.OUV_EDITEUR := :new.OUV_EDITEUR;
    cg$ind.OUV_EDITEUR :=    (:new.OUV_EDITEUR IS NULL AND :old.OUV_EDITEUR IS NOT NULL )
                        OR (:new.OUV_EDITEUR IS NOT NULL AND :old.OUV_EDITEUR IS NULL)
                        OR NOT(:new.OUV_EDITEUR = :old.OUV_EDITEUR) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_EDITEUR := :old.OUV_EDITEUR;
    cg$rec.OUV_CODE_ISBN := :new.OUV_CODE_ISBN;
    cg$ind.OUV_CODE_ISBN :=    (:new.OUV_CODE_ISBN IS NULL AND :old.OUV_CODE_ISBN IS NOT NULL )
                        OR (:new.OUV_CODE_ISBN IS NOT NULL AND :old.OUV_CODE_ISBN IS NULL)
                        OR NOT(:new.OUV_CODE_ISBN = :old.OUV_CODE_ISBN) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_CODE_ISBN := :old.OUV_CODE_ISBN;
    cg$rec.OUV_DATE_PARUTION := :new.OUV_DATE_PARUTION;
    cg$ind.OUV_DATE_PARUTION :=    (:new.OUV_DATE_PARUTION IS NULL AND :old.OUV_DATE_PARUTION IS NOT NULL )
                        OR (:new.OUV_DATE_PARUTION IS NOT NULL AND :old.OUV_DATE_PARUTION IS NULL)
                        OR NOT(:new.OUV_DATE_PARUTION = :old.OUV_DATE_PARUTION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_DATE_PARUTION := :old.OUV_DATE_PARUTION;
    cg$rec.OUV_PROPRIETAIRE := :new.OUV_PROPRIETAIRE;
    cg$ind.OUV_PROPRIETAIRE :=    (:new.OUV_PROPRIETAIRE IS NULL AND :old.OUV_PROPRIETAIRE IS NOT NULL )
                        OR (:new.OUV_PROPRIETAIRE IS NOT NULL AND :old.OUV_PROPRIETAIRE IS NULL)
                        OR NOT(:new.OUV_PROPRIETAIRE = :old.OUV_PROPRIETAIRE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_PROPRIETAIRE := :old.OUV_PROPRIETAIRE;
    cg$rec.OUV_LOCALISATION := :new.OUV_LOCALISATION;
    cg$ind.OUV_LOCALISATION :=    (:new.OUV_LOCALISATION IS NULL AND :old.OUV_LOCALISATION IS NOT NULL )
                        OR (:new.OUV_LOCALISATION IS NOT NULL AND :old.OUV_LOCALISATION IS NULL)
                        OR NOT(:new.OUV_LOCALISATION = :old.OUV_LOCALISATION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).OUV_LOCALISATION := :old.OUV_LOCALISATION;
    cg$rec.URL_ADRESSE := :new.URL_ADRESSE;
    cg$ind.URL_ADRESSE :=    (:new.URL_ADRESSE IS NULL AND :old.URL_ADRESSE IS NOT NULL )
                        OR (:new.URL_ADRESSE IS NOT NULL AND :old.URL_ADRESSE IS NULL)
                        OR NOT(:new.URL_ADRESSE = :old.URL_ADRESSE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).URL_ADRESSE := :old.URL_ADRESSE;
    cg$rec.LOG_NOM := :new.LOG_NOM;
    cg$ind.LOG_NOM :=    (:new.LOG_NOM IS NULL AND :old.LOG_NOM IS NOT NULL )
                        OR (:new.LOG_NOM IS NOT NULL AND :old.LOG_NOM IS NULL)
                        OR NOT(:new.LOG_NOM = :old.LOG_NOM) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_NOM := :old.LOG_NOM;
    cg$rec.LOG_VERSION := :new.LOG_VERSION;
    cg$ind.LOG_VERSION :=    (:new.LOG_VERSION IS NULL AND :old.LOG_VERSION IS NOT NULL )
                        OR (:new.LOG_VERSION IS NOT NULL AND :old.LOG_VERSION IS NULL)
                        OR NOT(:new.LOG_VERSION = :old.LOG_VERSION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_VERSION := :old.LOG_VERSION;
    cg$rec.LOG_TYPE_SUPPORT := :new.LOG_TYPE_SUPPORT;
    cg$ind.LOG_TYPE_SUPPORT :=    (:new.LOG_TYPE_SUPPORT IS NULL AND :old.LOG_TYPE_SUPPORT IS NOT NULL )
                        OR (:new.LOG_TYPE_SUPPORT IS NOT NULL AND :old.LOG_TYPE_SUPPORT IS NULL)
                        OR NOT(:new.LOG_TYPE_SUPPORT = :old.LOG_TYPE_SUPPORT) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_TYPE_SUPPORT := :old.LOG_TYPE_SUPPORT;
    cg$rec.LOG_EDITEUR := :new.LOG_EDITEUR;
    cg$ind.LOG_EDITEUR :=    (:new.LOG_EDITEUR IS NULL AND :old.LOG_EDITEUR IS NOT NULL )
                        OR (:new.LOG_EDITEUR IS NOT NULL AND :old.LOG_EDITEUR IS NULL)
                        OR NOT(:new.LOG_EDITEUR = :old.LOG_EDITEUR) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_EDITEUR := :old.LOG_EDITEUR;
    cg$rec.LOG_URL := :new.LOG_URL;
    cg$ind.LOG_URL :=    (:new.LOG_URL IS NULL AND :old.LOG_URL IS NOT NULL )
                        OR (:new.LOG_URL IS NOT NULL AND :old.LOG_URL IS NULL)
                        OR NOT(:new.LOG_URL = :old.LOG_URL) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_URL := :old.LOG_URL;
    cg$rec.LOG_OS := :new.LOG_OS;
    cg$ind.LOG_OS :=    (:new.LOG_OS IS NULL AND :old.LOG_OS IS NOT NULL )
                        OR (:new.LOG_OS IS NOT NULL AND :old.LOG_OS IS NULL)
                        OR NOT(:new.LOG_OS = :old.LOG_OS) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).LOG_OS := :old.LOG_OS;
    cg$rec.CD_FOURNISSEUR := :new.CD_FOURNISSEUR;
    cg$ind.CD_FOURNISSEUR :=    (:new.CD_FOURNISSEUR IS NULL AND :old.CD_FOURNISSEUR IS NOT NULL )
                        OR (:new.CD_FOURNISSEUR IS NOT NULL AND :old.CD_FOURNISSEUR IS NULL)
                        OR NOT(:new.CD_FOURNISSEUR = :old.CD_FOURNISSEUR) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).CD_FOURNISSEUR := :old.CD_FOURNISSEUR;
    cg$rec.CD_LOCALISATION := :new.CD_LOCALISATION;
    cg$ind.CD_LOCALISATION :=    (:new.CD_LOCALISATION IS NULL AND :old.CD_LOCALISATION IS NOT NULL )
                        OR (:new.CD_LOCALISATION IS NOT NULL AND :old.CD_LOCALISATION IS NULL)
                        OR NOT(:new.CD_LOCALISATION = :old.CD_LOCALISATION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).CD_LOCALISATION := :old.CD_LOCALISATION;
    cg$rec.DOC_TITRE := :new.DOC_TITRE;
    cg$ind.DOC_TITRE :=    (:new.DOC_TITRE IS NULL AND :old.DOC_TITRE IS NOT NULL )
                        OR (:new.DOC_TITRE IS NOT NULL AND :old.DOC_TITRE IS NULL)
                        OR NOT(:new.DOC_TITRE = :old.DOC_TITRE) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_TITRE := :old.DOC_TITRE;
    cg$rec.DOC_AUTEUR := :new.DOC_AUTEUR;
    cg$ind.DOC_AUTEUR :=    (:new.DOC_AUTEUR IS NULL AND :old.DOC_AUTEUR IS NOT NULL )
                        OR (:new.DOC_AUTEUR IS NOT NULL AND :old.DOC_AUTEUR IS NULL)
                        OR NOT(:new.DOC_AUTEUR = :old.DOC_AUTEUR) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_AUTEUR := :old.DOC_AUTEUR;
    cg$rec.DOC_DATE_PARUTION := :new.DOC_DATE_PARUTION;
    cg$ind.DOC_DATE_PARUTION :=    (:new.DOC_DATE_PARUTION IS NULL AND :old.DOC_DATE_PARUTION IS NOT NULL )
                        OR (:new.DOC_DATE_PARUTION IS NOT NULL AND :old.DOC_DATE_PARUTION IS NULL)
                        OR NOT(:new.DOC_DATE_PARUTION = :old.DOC_DATE_PARUTION) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_DATE_PARUTION := :old.DOC_DATE_PARUTION;
    cg$rec.DOC_TYPE__DOC := :new.DOC_TYPE__DOC;
    cg$ind.DOC_TYPE__DOC :=    (:new.DOC_TYPE__DOC IS NULL AND :old.DOC_TYPE__DOC IS NOT NULL )
                        OR (:new.DOC_TYPE__DOC IS NOT NULL AND :old.DOC_TYPE__DOC IS NULL)
                        OR NOT(:new.DOC_TYPE__DOC = :old.DOC_TYPE__DOC) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_TYPE__DOC := :old.DOC_TYPE__DOC;
    cg$rec.DOC_FORMAT_DOC := :new.DOC_FORMAT_DOC;
    cg$ind.DOC_FORMAT_DOC :=    (:new.DOC_FORMAT_DOC IS NULL AND :old.DOC_FORMAT_DOC IS NOT NULL )
                        OR (:new.DOC_FORMAT_DOC IS NOT NULL AND :old.DOC_FORMAT_DOC IS NULL)
                        OR NOT(:new.DOC_FORMAT_DOC = :old.DOC_FORMAT_DOC) ;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).DOC_FORMAT_DOC := :old.DOC_FORMAT_DOC;


    cg$RESSOURCE.idx := cg$RESSOURCE.idx + 1;

    if not (cg$RESSOURCE.called_from_package) then
        cg$RESSOURCE.validate_arc(cg$rec);
        cg$RESSOURCE.validate_domain(cg$rec, cg$ind);
        cg$RESSOURCE.validate_domain_cascade_update(cg$old_rec);   

        cg$RESSOURCE.upd(cg$rec, cg$ind, FALSE);
        cg$RESSOURCE.called_from_package := FALSE;
    end if;

    :new.ID_RUB := cg$rec.ID_RUB;
    :new.TYPE_RES := cg$rec.TYPE_RES;
    :new.NO_ORDRE := cg$rec.NO_ORDRE;
    :new.DESIGNATION := cg$rec.DESIGNATION;
    :new.DESCRIPTION := cg$rec.DESCRIPTION;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
    :new.OUV_TITRE := cg$rec.OUV_TITRE;
    :new.OUV_RESUME := cg$rec.OUV_RESUME;
    :new.OUV_AUTEUR := cg$rec.OUV_AUTEUR;
    :new.OUV_EDITEUR := cg$rec.OUV_EDITEUR;
    :new.OUV_CODE_ISBN := cg$rec.OUV_CODE_ISBN;
    :new.OUV_DATE_PARUTION := cg$rec.OUV_DATE_PARUTION;
    :new.OUV_PROPRIETAIRE := cg$rec.OUV_PROPRIETAIRE;
    :new.OUV_LOCALISATION := cg$rec.OUV_LOCALISATION;
    :new.URL_ADRESSE := cg$rec.URL_ADRESSE;
    :new.LOG_NOM := cg$rec.LOG_NOM;
    :new.LOG_VERSION := cg$rec.LOG_VERSION;
    :new.LOG_TYPE_SUPPORT := cg$rec.LOG_TYPE_SUPPORT;
    :new.LOG_EDITEUR := cg$rec.LOG_EDITEUR;
    :new.LOG_URL := cg$rec.LOG_URL;
    :new.LOG_OS := cg$rec.LOG_OS;
    :new.CD_FOURNISSEUR := cg$rec.CD_FOURNISSEUR;
    :new.CD_LOCALISATION := cg$rec.CD_LOCALISATION;
    :new.DOC_TITRE := cg$rec.DOC_TITRE;
    :new.DOC_AUTEUR := cg$rec.DOC_AUTEUR;
    :new.DOC_DATE_PARUTION := cg$rec.DOC_DATE_PARUTION;
    :new.DOC_TYPE__DOC := cg$rec.DOC_TYPE__DOC;
    :new.DOC_FORMAT_DOC := cg$rec.DOC_FORMAT_DOC;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_RESSOURCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_RESSOURCE
AFTER UPDATE ON RESSOURCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_RESSOURCE
/






--PROMPT Creating After Update Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$AUS_RESSOURCE
AFTER UPDATE ON RESSOURCE
DECLARE
    idx        BINARY_INTEGER := cg$RESSOURCE.cg$table.FIRST;
    cg$old_rec cg$RESSOURCE.cg$row_type;
    cg$rec     cg$RESSOURCE.cg$row_type;
    cg$ind     cg$RESSOURCE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.ID_RES := cg$RESSOURCE.cg$table(idx).ID_RES;
        cg$old_rec.ID_RUB := cg$RESSOURCE.cg$table(idx).ID_RUB;
        cg$old_rec.TYPE_RES := cg$RESSOURCE.cg$table(idx).TYPE_RES;
        cg$old_rec.NO_ORDRE := cg$RESSOURCE.cg$table(idx).NO_ORDRE;
        cg$old_rec.DESIGNATION := cg$RESSOURCE.cg$table(idx).DESIGNATION;
        cg$old_rec.DESCRIPTION := cg$RESSOURCE.cg$table(idx).DESCRIPTION;
        cg$old_rec.COMMENTAIRE := cg$RESSOURCE.cg$table(idx).COMMENTAIRE;
        cg$old_rec.OUV_TITRE := cg$RESSOURCE.cg$table(idx).OUV_TITRE;
        cg$old_rec.OUV_RESUME := cg$RESSOURCE.cg$table(idx).OUV_RESUME;
        cg$old_rec.OUV_AUTEUR := cg$RESSOURCE.cg$table(idx).OUV_AUTEUR;
        cg$old_rec.OUV_EDITEUR := cg$RESSOURCE.cg$table(idx).OUV_EDITEUR;
        cg$old_rec.OUV_CODE_ISBN := cg$RESSOURCE.cg$table(idx).OUV_CODE_ISBN;
        cg$old_rec.OUV_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).OUV_DATE_PARUTION;
        cg$old_rec.OUV_PROPRIETAIRE := cg$RESSOURCE.cg$table(idx).OUV_PROPRIETAIRE;
        cg$old_rec.OUV_LOCALISATION := cg$RESSOURCE.cg$table(idx).OUV_LOCALISATION;
        cg$old_rec.URL_ADRESSE := cg$RESSOURCE.cg$table(idx).URL_ADRESSE;
        cg$old_rec.LOG_NOM := cg$RESSOURCE.cg$table(idx).LOG_NOM;
        cg$old_rec.LOG_VERSION := cg$RESSOURCE.cg$table(idx).LOG_VERSION;
        cg$old_rec.LOG_TYPE_SUPPORT := cg$RESSOURCE.cg$table(idx).LOG_TYPE_SUPPORT;
        cg$old_rec.LOG_EDITEUR := cg$RESSOURCE.cg$table(idx).LOG_EDITEUR;
        cg$old_rec.LOG_URL := cg$RESSOURCE.cg$table(idx).LOG_URL;
        cg$old_rec.LOG_OS := cg$RESSOURCE.cg$table(idx).LOG_OS;
        cg$old_rec.CD_FOURNISSEUR := cg$RESSOURCE.cg$table(idx).CD_FOURNISSEUR;
        cg$old_rec.CD_LOCALISATION := cg$RESSOURCE.cg$table(idx).CD_LOCALISATION;
        cg$old_rec.DOC_TITRE := cg$RESSOURCE.cg$table(idx).DOC_TITRE;
        cg$old_rec.DOC_AUTEUR := cg$RESSOURCE.cg$table(idx).DOC_AUTEUR;
        cg$old_rec.DOC_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).DOC_DATE_PARUTION;
        cg$old_rec.DOC_TYPE__DOC := cg$RESSOURCE.cg$table(idx).DOC_TYPE__DOC;
        cg$old_rec.DOC_FORMAT_DOC := cg$RESSOURCE.cg$table(idx).DOC_FORMAT_DOC;

    IF NOT (cg$RESSOURCE.called_from_package) THEN
        idx := cg$RESSOURCE.cg$table.NEXT(idx);
        cg$rec.ID_RES := cg$RESSOURCE.cg$table(idx).ID_RES;
        cg$ind.ID_RES := updating('ID_RES');
        cg$rec.ID_RUB := cg$RESSOURCE.cg$table(idx).ID_RUB;
        cg$ind.ID_RUB := updating('ID_RUB');
        cg$rec.TYPE_RES := cg$RESSOURCE.cg$table(idx).TYPE_RES;
        cg$ind.TYPE_RES := updating('TYPE_RES');
        cg$rec.NO_ORDRE := cg$RESSOURCE.cg$table(idx).NO_ORDRE;
        cg$ind.NO_ORDRE := updating('NO_ORDRE');
        cg$rec.DESIGNATION := cg$RESSOURCE.cg$table(idx).DESIGNATION;
        cg$ind.DESIGNATION := updating('DESIGNATION');
        cg$rec.DESCRIPTION := cg$RESSOURCE.cg$table(idx).DESCRIPTION;
        cg$ind.DESCRIPTION := updating('DESCRIPTION');
        cg$rec.COMMENTAIRE := cg$RESSOURCE.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');
        cg$rec.OUV_TITRE := cg$RESSOURCE.cg$table(idx).OUV_TITRE;
        cg$ind.OUV_TITRE := updating('OUV_TITRE');
        cg$rec.OUV_RESUME := cg$RESSOURCE.cg$table(idx).OUV_RESUME;
        cg$ind.OUV_RESUME := updating('OUV_RESUME');
        cg$rec.OUV_AUTEUR := cg$RESSOURCE.cg$table(idx).OUV_AUTEUR;
        cg$ind.OUV_AUTEUR := updating('OUV_AUTEUR');
        cg$rec.OUV_EDITEUR := cg$RESSOURCE.cg$table(idx).OUV_EDITEUR;
        cg$ind.OUV_EDITEUR := updating('OUV_EDITEUR');
        cg$rec.OUV_CODE_ISBN := cg$RESSOURCE.cg$table(idx).OUV_CODE_ISBN;
        cg$ind.OUV_CODE_ISBN := updating('OUV_CODE_ISBN');
        cg$rec.OUV_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).OUV_DATE_PARUTION;
        cg$ind.OUV_DATE_PARUTION := updating('OUV_DATE_PARUTION');
        cg$rec.OUV_PROPRIETAIRE := cg$RESSOURCE.cg$table(idx).OUV_PROPRIETAIRE;
        cg$ind.OUV_PROPRIETAIRE := updating('OUV_PROPRIETAIRE');
        cg$rec.OUV_LOCALISATION := cg$RESSOURCE.cg$table(idx).OUV_LOCALISATION;
        cg$ind.OUV_LOCALISATION := updating('OUV_LOCALISATION');
        cg$rec.URL_ADRESSE := cg$RESSOURCE.cg$table(idx).URL_ADRESSE;
        cg$ind.URL_ADRESSE := updating('URL_ADRESSE');
        cg$rec.LOG_NOM := cg$RESSOURCE.cg$table(idx).LOG_NOM;
        cg$ind.LOG_NOM := updating('LOG_NOM');
        cg$rec.LOG_VERSION := cg$RESSOURCE.cg$table(idx).LOG_VERSION;
        cg$ind.LOG_VERSION := updating('LOG_VERSION');
        cg$rec.LOG_TYPE_SUPPORT := cg$RESSOURCE.cg$table(idx).LOG_TYPE_SUPPORT;
        cg$ind.LOG_TYPE_SUPPORT := updating('LOG_TYPE_SUPPORT');
        cg$rec.LOG_EDITEUR := cg$RESSOURCE.cg$table(idx).LOG_EDITEUR;
        cg$ind.LOG_EDITEUR := updating('LOG_EDITEUR');
        cg$rec.LOG_URL := cg$RESSOURCE.cg$table(idx).LOG_URL;
        cg$ind.LOG_URL := updating('LOG_URL');
        cg$rec.LOG_OS := cg$RESSOURCE.cg$table(idx).LOG_OS;
        cg$ind.LOG_OS := updating('LOG_OS');
        cg$rec.CD_FOURNISSEUR := cg$RESSOURCE.cg$table(idx).CD_FOURNISSEUR;
        cg$ind.CD_FOURNISSEUR := updating('CD_FOURNISSEUR');
        cg$rec.CD_LOCALISATION := cg$RESSOURCE.cg$table(idx).CD_LOCALISATION;
        cg$ind.CD_LOCALISATION := updating('CD_LOCALISATION');
        cg$rec.DOC_TITRE := cg$RESSOURCE.cg$table(idx).DOC_TITRE;
        cg$ind.DOC_TITRE := updating('DOC_TITRE');
        cg$rec.DOC_AUTEUR := cg$RESSOURCE.cg$table(idx).DOC_AUTEUR;
        cg$ind.DOC_AUTEUR := updating('DOC_AUTEUR');
        cg$rec.DOC_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).DOC_DATE_PARUTION;
        cg$ind.DOC_DATE_PARUTION := updating('DOC_DATE_PARUTION');
        cg$rec.DOC_TYPE__DOC := cg$RESSOURCE.cg$table(idx).DOC_TYPE__DOC;
        cg$ind.DOC_TYPE__DOC := updating('DOC_TYPE__DOC');
        cg$rec.DOC_FORMAT_DOC := cg$RESSOURCE.cg$table(idx).DOC_FORMAT_DOC;
        cg$ind.DOC_FORMAT_DOC := updating('DOC_FORMAT_DOC');

        cg$RESSOURCE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$RESSOURCE.upd_denorm2( cg$rec,
                                       cg$RESSOURCE.cg$tableind(idx)
                                     );
        cg$RESSOURCE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$RESSOURCE.cg$tableind(idx)
								                  );
        cg$RESSOURCE.cascade_update(cg$rec, cg$old_rec);
        cg$RESSOURCE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$RESSOURCE.called_from_package := FALSE;
	END IF;
        idx := cg$RESSOURCE.cg$table.NEXT(idx);
    END LOOP;

    cg$RESSOURCE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

--PROMPT Creating Before Delete Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BDS_RESSOURCE
BEFORE DELETE ON RESSOURCE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$RESSOURCE.cg$table.DELETE;
    cg$RESSOURCE.cg$tableind.DELETE;
    cg$RESSOURCE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

--PROMPT Creating Before Delete Row Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$BDR_RESSOURCE
BEFORE DELETE ON RESSOURCE FOR EACH ROW
DECLARE
    cg$pk cg$RESSOURCE.cg$pk_type;
    cg$rec cg$RESSOURCE.cg$row_type;
    cg$ind cg$RESSOURCE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.ID_RES  := :old.ID_RES;
    cg$rec.ID_RES := :old.ID_RES;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RES := :old.ID_RES;
    cg$rec.ID_RUB := :old.ID_RUB;
    cg$RESSOURCE.cg$table(cg$RESSOURCE.idx).ID_RUB := :old.ID_RUB;


    cg$RESSOURCE.idx := cg$RESSOURCE.idx + 1;

    if not (cg$RESSOURCE.called_from_package) then
        cg$RESSOURCE.validate_domain_cascade_delete(cg$rec);   
        cg$RESSOURCE.del(cg$pk, FALSE);
        cg$RESSOURCE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_RESSOURCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_RESSOURCE
AFTER DELETE ON RESSOURCE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_RESSOURCE
/

--PROMPT Creating After Delete Statement Trigger on 'RESSOURCE'
CREATE OR REPLACE TRIGGER cg$ADS_RESSOURCE
AFTER DELETE ON RESSOURCE
DECLARE
    idx        BINARY_INTEGER := cg$RESSOURCE.cg$table.FIRST;
    cg$rec   cg$RESSOURCE.cg$row_type;
    cg$old_rec   cg$RESSOURCE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$RESSOURCE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.ID_RES := cg$RESSOURCE.cg$table(idx).ID_RES;
            cg$RESSOURCE.cg$tableind(idx).ID_RES := TRUE;
            cg$rec.ID_RUB := cg$RESSOURCE.cg$table(idx).ID_RUB;
            cg$RESSOURCE.cg$tableind(idx).ID_RUB := TRUE;
            cg$rec.TYPE_RES := cg$RESSOURCE.cg$table(idx).TYPE_RES;
            cg$RESSOURCE.cg$tableind(idx).TYPE_RES := TRUE;
            cg$rec.NO_ORDRE := cg$RESSOURCE.cg$table(idx).NO_ORDRE;
            cg$RESSOURCE.cg$tableind(idx).NO_ORDRE := TRUE;
            cg$rec.DESIGNATION := cg$RESSOURCE.cg$table(idx).DESIGNATION;
            cg$RESSOURCE.cg$tableind(idx).DESIGNATION := TRUE;
            cg$rec.DESCRIPTION := cg$RESSOURCE.cg$table(idx).DESCRIPTION;
            cg$RESSOURCE.cg$tableind(idx).DESCRIPTION := TRUE;
            cg$rec.COMMENTAIRE := cg$RESSOURCE.cg$table(idx).COMMENTAIRE;
            cg$RESSOURCE.cg$tableind(idx).COMMENTAIRE := TRUE;
            cg$rec.OUV_TITRE := cg$RESSOURCE.cg$table(idx).OUV_TITRE;
            cg$RESSOURCE.cg$tableind(idx).OUV_TITRE := TRUE;
            cg$rec.OUV_RESUME := cg$RESSOURCE.cg$table(idx).OUV_RESUME;
            cg$RESSOURCE.cg$tableind(idx).OUV_RESUME := TRUE;
            cg$rec.OUV_AUTEUR := cg$RESSOURCE.cg$table(idx).OUV_AUTEUR;
            cg$RESSOURCE.cg$tableind(idx).OUV_AUTEUR := TRUE;
            cg$rec.OUV_EDITEUR := cg$RESSOURCE.cg$table(idx).OUV_EDITEUR;
            cg$RESSOURCE.cg$tableind(idx).OUV_EDITEUR := TRUE;
            cg$rec.OUV_CODE_ISBN := cg$RESSOURCE.cg$table(idx).OUV_CODE_ISBN;
            cg$RESSOURCE.cg$tableind(idx).OUV_CODE_ISBN := TRUE;
            cg$rec.OUV_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).OUV_DATE_PARUTION;
            cg$RESSOURCE.cg$tableind(idx).OUV_DATE_PARUTION := TRUE;
            cg$rec.OUV_PROPRIETAIRE := cg$RESSOURCE.cg$table(idx).OUV_PROPRIETAIRE;
            cg$RESSOURCE.cg$tableind(idx).OUV_PROPRIETAIRE := TRUE;
            cg$rec.OUV_LOCALISATION := cg$RESSOURCE.cg$table(idx).OUV_LOCALISATION;
            cg$RESSOURCE.cg$tableind(idx).OUV_LOCALISATION := TRUE;
            cg$rec.URL_ADRESSE := cg$RESSOURCE.cg$table(idx).URL_ADRESSE;
            cg$RESSOURCE.cg$tableind(idx).URL_ADRESSE := TRUE;
            cg$rec.LOG_NOM := cg$RESSOURCE.cg$table(idx).LOG_NOM;
            cg$RESSOURCE.cg$tableind(idx).LOG_NOM := TRUE;
            cg$rec.LOG_VERSION := cg$RESSOURCE.cg$table(idx).LOG_VERSION;
            cg$RESSOURCE.cg$tableind(idx).LOG_VERSION := TRUE;
            cg$rec.LOG_TYPE_SUPPORT := cg$RESSOURCE.cg$table(idx).LOG_TYPE_SUPPORT;
            cg$RESSOURCE.cg$tableind(idx).LOG_TYPE_SUPPORT := TRUE;
            cg$rec.LOG_EDITEUR := cg$RESSOURCE.cg$table(idx).LOG_EDITEUR;
            cg$RESSOURCE.cg$tableind(idx).LOG_EDITEUR := TRUE;
            cg$rec.LOG_URL := cg$RESSOURCE.cg$table(idx).LOG_URL;
            cg$RESSOURCE.cg$tableind(idx).LOG_URL := TRUE;
            cg$rec.LOG_OS := cg$RESSOURCE.cg$table(idx).LOG_OS;
            cg$RESSOURCE.cg$tableind(idx).LOG_OS := TRUE;
            cg$rec.CD_FOURNISSEUR := cg$RESSOURCE.cg$table(idx).CD_FOURNISSEUR;
            cg$RESSOURCE.cg$tableind(idx).CD_FOURNISSEUR := TRUE;
            cg$rec.CD_LOCALISATION := cg$RESSOURCE.cg$table(idx).CD_LOCALISATION;
            cg$RESSOURCE.cg$tableind(idx).CD_LOCALISATION := TRUE;
            cg$rec.DOC_TITRE := cg$RESSOURCE.cg$table(idx).DOC_TITRE;
            cg$RESSOURCE.cg$tableind(idx).DOC_TITRE := TRUE;
            cg$rec.DOC_AUTEUR := cg$RESSOURCE.cg$table(idx).DOC_AUTEUR;
            cg$RESSOURCE.cg$tableind(idx).DOC_AUTEUR := TRUE;
            cg$rec.DOC_DATE_PARUTION := cg$RESSOURCE.cg$table(idx).DOC_DATE_PARUTION;
            cg$RESSOURCE.cg$tableind(idx).DOC_DATE_PARUTION := TRUE;
            cg$rec.DOC_TYPE__DOC := cg$RESSOURCE.cg$table(idx).DOC_TYPE__DOC;
            cg$RESSOURCE.cg$tableind(idx).DOC_TYPE__DOC := TRUE;
            cg$rec.DOC_FORMAT_DOC := cg$RESSOURCE.cg$table(idx).DOC_FORMAT_DOC;
            cg$RESSOURCE.cg$tableind(idx).DOC_FORMAT_DOC := TRUE;

            cg$RESSOURCE.validate_foreign_keys_del(cg$rec);
            cg$RESSOURCE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$RESSOURCE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$RESSOURCE.cascade_delete(cg$rec);
            cg$RESSOURCE.domain_cascade_delete(cg$rec);             

            idx := cg$RESSOURCE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



