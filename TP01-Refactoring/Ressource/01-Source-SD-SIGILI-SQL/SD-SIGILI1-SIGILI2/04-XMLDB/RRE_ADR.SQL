-- Se trouve dans 02-Migration/MIGRATION.SQL dans ETAPE 4
-- Dans le trigger de suppression du répertoire associé au groupement dans l'espace de gestion de contenu
-- 
create or replace TRIGGER cg$ADR_REGROUPEMENT_RES
AFTER DELETE ON REGROUPEMENT_RES FOR EACH ROW 

declare 
  chemin VARCHAR(2000);
begin
  -- Suppression du répertoire
  dbms_xdb.DeleteResource('/RAP/' || :old.DESIGNATION);
  
  --Suppression dans la table temporaire de synchro
  chemin := '/RAP/' || :old.DESIGNATION;
  DELETE FROM bck_lst_path WHERE ANY_PATH = chemin;
  
end;
/
-- Fin du trigger de suppression de groupement