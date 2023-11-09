-- Se trouve dans 02-Migration/MIGRATION.SQL dans ETAPE 4
-- Dans le delete de suppression de rubrique
create or replace TRIGGER cg$BDR_RUBRIQUE
BEFORE DELETE ON RUBRIQUE FOR EACH ROW 
  
begin
  -- Suppression du répertoire
  dbms_xdb.DELETERESOURCE(:old.PATH_RUB);
  
  --Suppression dans la table temporaire de synchro
  DELETE FROM bck_lst_path WHERE ANY_PATH = :old.PATH_RUB;
  
end;
/

-- Fin du trigger de suppression de rubrique