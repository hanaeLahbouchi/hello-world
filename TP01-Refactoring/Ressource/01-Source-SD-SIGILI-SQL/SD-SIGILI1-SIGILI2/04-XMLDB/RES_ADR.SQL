-- Mettre à jour celui de /MIGRATION/


-- No application logic defined for Trigger cg$ADR_RESSOURCE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_RESSOURCE
AFTER DELETE ON RESSOURCE FOR EACH ROW
BEGIN
-- On ne fait le traitement que si c'est une ressource associé à un fichier
-- supprimer dans l'espace de GC (gestion contenu) le fichier de ressource associé
  IF(:old.URL_PATH_FICHIER IS NOT NULL) THEN 
    dbms_xdb.DeleteResource(:old.URL_PATH_FICHIER);
  END IF;
-- Fin de l'ajout dans le trigger AFTER DELETE FOREACH ROW de RESSOURCE
END;
/

