-- Se trouve dans 02-Migration/MIGRATION.SQL dans ETAPE 4

-- Dans le trigger de création de domaine
create or replace TRIGGER cg$AIR_DOMAINE_RES
AFTER INSERT ON DOMAINE_RES FOR EACH ROW 
declare 
  resultat boolean;
  groupement REGROUPEMENT_RES.DESIGNATION%TYPE;
begin
  -- Récupération du groupement
  select DESIGNATION INTO groupement FROM REGROUPEMENT_RES WHERE REGROUPEMENT_RES.ID_RRE = :new.ID_RRE;
  
  -- Création du répertoire
  resultat := dbms_xdb.createFolder('/RAP/' || groupement || '/' || :new.DESIGNATION);
  
  -- Application des droits sur le nouveau répertoire
  dbms_xdb.setAcl('/RAP/' || groupement || '/' || :new.DESIGNATION,'/sys/acls/DroitRepertoire.xml');
  
  -- Insertion dans la table de Synchronisation
  INSERT INTO bck_lst_path VALUES('/RAP/' || groupement || '/' || :new.DESIGNATION);
  
end;
/
-- Fin du trigger d'insertion de domaine
