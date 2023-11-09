-- Se trouve dans 02-Migration/MIGRATION.SQL dans ETAPE 4

-- Dans le trigger de creation de rubrique
create or replace TRIGGER cg$BIR_RUBRIQUE
BEFORE INSERT ON RUBRIQUE FOR EACH ROW 
declare 
  resultat boolean; 
  chemin VARCHAR(3000);   -- Contient le chemin finale de la rubrique
  path_rub_ VARCHAR(2000); -- Permet de récupérer la désignation
  des_temp VARCHAR(300); -- Permet de récupérer la désignation
  id_rre_ INTEGER;  -- Permet de récupérer l'identifiant du groupement
  
begin
  -- Initialisation de chemin
  chemin := :new.DESIGNATION;
  
  --Si la rubrique est contenu dans une rubrique
  IF :new.ID_RUB_SUP IS NOT NULL THEN
    -- On récupère le path de la rubrique
    Select PATH_RUB INTO path_rub_ FROM RUBRIQUE WHERE :new.ID_RUB_SUP = RUBRIQUE.ID_RUB; 
    chemin := path_rub_ || '/' || chemin;
  ELSE  -- Il n'y a pas de sous rubrique donc on récupere le domain et le groupement
    -- Récupération du domaine
    SELECT DESIGNATION,ID_RRE INTO des_temp,id_rre_ FROM DOMAINE_RES WHERE :new.ID_DRE = DOMAINE_RES.ID_DRE;
    chemin := des_temp || '/' || chemin;
    
    -- Récupération du groupement 
     SELECT DESIGNATION INTO des_temp FROM REGROUPEMENT_RES WHERE id_rre_ = REGROUPEMENT_RES.ID_RRE;
     chemin := des_temp || '/' || chemin; 
     
    -- On ajoute au chemin le répertoire de base du référentiel
    chemin := '/RAP/' || chemin;
  END IF;

  -- On affecte le chamin dans la vriable PATH_RUB
  :new.PATH_RUB := chemin;
  
  -- Création du répertoire
  resultat := dbms_xdb.createFolder(chemin);
  
  -- Application de la politique de droit
  dbms_xdb.setAcl(chemin,'/sys/acls/DroitRepertoire.xml');
  
  -- Insertion dans la table de Synchronisation
  INSERT INTO bck_lst_path (ANY_PATH) VALUES (chemin);
  
end;
/
-- Fin du trigger d'insertion dans rubrique
