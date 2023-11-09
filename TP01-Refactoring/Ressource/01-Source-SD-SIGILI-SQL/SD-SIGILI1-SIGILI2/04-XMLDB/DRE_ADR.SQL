-- Se trouve dans 02-Migration/MIGRATION.SQL dans ETAPE 4
-- Dans le trigger de suppression du répertoire associé au domaine dans l'espace de gestion de contenu
-- Dans le trigger de suppression de domaine 
create or replace TRIGGER cg$ADR_DOMAINE_RES
AFTER DELETE ON DOMAINE_RES FOR EACH ROW 

declare 
  groupement REGROUPEMENT_RES.DESIGNATION%TYPE;
  chemin VARCHAR(2000);
begin
  -- Récupération du groupement
  select DESIGNATION INTO groupement FROM REGROUPEMENT_RES WHERE REGROUPEMENT_RES.ID_RRE = :old.ID_RRE;
  
  -- Suppression du répertoire
  dbms_xdb.DeleteResource('/RAP/' || groupement || '/' || :old.DESIGNATION);
      
  --Suppression dans la table temporaire de synchro
  chemin := '/RAP/' || groupement || '/' || :old.DESIGNATION;
  DELETE FROM bck_lst_path WHERE ANY_PATH = chemin;
  
end;
/
-- Fin du trigger de suppression de domaine