create or replace PROCEDURE suppression_Modele_Competence (noMC VARCHAR) AS

   CURSOR CURS_MC IS
      SELECT * FROM MODELE_COMPETENCE WHERE CODE_MCP = noMC;

   CURSOR CURS_DC IS
      SELECT * FROM DOMAINE_COMPETENCE WHERE CODE_MCP = noMC;

   CURSOR CURS_FC IS
      SELECT fc.* FROM FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = noMC;

   CURSOR CURS_DCO IS
      SELECT dco.* FROM DOMAINE_CONNAISSANCE dco, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE dco.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = noMC;

  CURSOR CURS_CAP IS
      SELECT cap.* FROM CAPACITE cap, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE cap.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = noMC;

  CURSOR CURS_CPT IS
      SELECT cpt.* FROM COMPETENCE cpt, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE cpt.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = noMC;

  CURSOR CURS_FCT IS
      SELECT * FROM FAMILLE_COMPETENCE_TRANSVERSAL WHERE CODE_MCP = noMC;

  CURSOR CURS_CPTT IS
      SELECT * FROM COMPETENCE_TRANSVERSALE WHERE CODE_MCP = noMC;

  CURSOR CURS_CTFC IS
      SELECT ctfc.* FROM CT_FC ctfc, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE ctfc.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = noMC;

BEGIN

  FOR mc IN CURS_MC
    LOOP
 IF (mc.etat = 'ELA') THEN

    FOR ctfc IN CURS_CTFC
           LOOP
   DELETE FROM ct_fc WHERE id_fc=ctfc.id_fc;
             END LOOP;

    FOR cptt IN CURS_CPTT
           LOOP
   DELETE FROM competence_transversale WHERE id_cptt=cptt.id_cptt;
             END LOOP;

    FOR fct IN CURS_FCT
           LOOP
   DELETE FROM famille_competence_transversal WHERE id_fct=fct.id_fct;
             END LOOP;

    FOR cpt IN CURS_CPT
           LOOP
   DELETE FROM competence WHERE id_cpt=cpt.id_cpt;
             END LOOP;

    FOR cap IN CURS_CAP
           LOOP
   DELETE FROM capacite WHERE id_cap=cap.id_cap;
             END LOOP;

    FOR dco IN CURS_DCO
           LOOP
   DELETE FROM domaine_connaissance WHERE id_dco=dco.id_dco;
             END LOOP;

    FOR fc IN CURS_FC
           LOOP
   DELETE FROM famille_competence WHERE id_fc=fc.id_fc;
             END LOOP;

    FOR dc IN CURS_DC
           LOOP
   DELETE FROM domaine_competence WHERE id_dc=dc.id_dc;
             END LOOP;

    DELETE FROM modele_competence WHERE code_mcp = noMC;

 ELSE

    dbms_output.put('le modele de competence '||noMC||' ne peut pas etre supprime') ;
    dbms_output.put('Son etat n''est pas positionne a ""en cours d''elaboration""') ;

 END IF;
    END LOOP;

END;
/
