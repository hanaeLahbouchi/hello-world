create or replace PROCEDURE suppression_SPC (noSPC NUMBER) AS

    somme NUMBER(10);

BEGIN

  SELECT count(*) INTO somme FROM positionnement WHERE id_spc = noSPC AND ((niveau_competence IS NOT NULL) OR (niveau_maturite IS NOT NULL));

  IF (somme = 0) THEN

    DELETE FROM positionnement WHERE ID_SPC = noSPC;
    DELETE FROM journal_suivi_personnel WHERE id_spc=noSPC;

    DELETE FROM W_SPC_CAP WHERE id_spc=noSPC;
    DELETE FROM W_SPC_CPT WHERE id_spc=noSPC;
    DELETE FROM W_SPC_CPTT WHERE id_spc=noSPC;
    DELETE FROM W_SPC_FC WHERE id_spc=noSPC;

    DELETE FROM suivi_personnel_competence WHERE id_spc = noSPC;

   ELSE
        dbms_output.put_line('le suivi personnel de competence '||noSPC||' ne peut pas etre supprime') ;
        dbms_output.put_line('Il possede des enregistrements') ;
   END IF;

END;
/
