create or replace PROCEDURE duplication (MC_old VARCHAR, MC_new VARCHAR) AS
   noDC INTEGER;
   noFC INTEGER;
   noFCT INTEGER;
   noCT INTEGER;

   CURSOR CURS_MC IS
      SELECT * FROM MODELE_COMPETENCE WHERE CODE_MCP = MC_old;
   CURSOR CURS_DC IS
      SELECT * FROM DOMAINE_COMPETENCE WHERE CODE_MCP = MC_old;
   CURSOR CURS_FC IS
      SELECT fc.* FROM FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE fc.ID_DC = dc.ID_DC AND fc.STD_PERSO = 'FCS' AND dc.CODE_MCP = MC_old;
   CURSOR CURS_DCO IS
      SELECT dco.* FROM DOMAINE_CONNAISSANCE dco, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE dco.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = MC_old;
  CURSOR CURS_CAP IS
      SELECT cap.* FROM CAPACITE cap, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE cap.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = MC_old;
  CURSOR CURS_CPT IS
      SELECT cpt.* FROM COMPETENCE cpt, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE cpt.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = MC_old;
  CURSOR CURS_FCT IS
      SELECT * FROM FAMILLE_COMPETENCE_TRANSVERSAL WHERE CODE_MCP = MC_old;
  CURSOR CURS_CPTT IS
      SELECT * FROM COMPETENCE_TRANSVERSALE WHERE CODE_MCP = MC_old AND STD_PERSO = 'CTS';
  CURSOR CURS_CTFC IS
      SELECT ctfc.* FROM CT_FC ctfc, FAMILLE_COMPETENCE fc, Domaine_competence dc WHERE ctfc.id_fc = fc.id_fc AND fc.ID_DC = dc.ID_DC AND dc.CODE_MCP = MC_old;

BEGIN
  FOR m IN CURS_MC
    LOOP
       INSERT INTO modele_competence("CODE_MCP","CODE_CRE","DATE_CREATION","DIPLOME","DISCIPLINE","EN_VIGUEUR","ETAT","COMMENTAIRE","CONTACT","DATE_MAJ","DEBOUCHES","DESCRIPTIF","LIBELLE","REFERENCE_STAGE","VERSION")
       VALUES (MC_new, m.code_cre, SYSDATE, m.diplome, m.discipline, 'N', 'ELA', m.commentaire, m.contact, m.date_maj, m.debouches, m.descriptif, m.libelle, m.reference_stage, m.version);
    END LOOP;

  FOR dc IN CURS_DC
    LOOP
       INSERT INTO domaine_competence("CODE_MCP","ID_UE","TYPE_COMPETENCE","DESIGNATION","ORDRE","DESCRIPTION")
       VALUES (MC_new, dc.id_ue, dc.type_competence, dc.designation, dc.ordre, dc.description);
    END LOOP;

 FOR fc IN CURS_FC
    LOOP
      SELECT dc2.id_dc INTO noDC FROM domaine_competence dc1, domaine_competence dc2
      WHERE fc.id_dc = dc1.id_dc AND dc1.designation = dc2.designation AND dc2.code_mcp = MC_new;
      INSERT INTO famille_competence("ID_DC","ID_EC","STD_PERSO","TYPE_COMPETENCE","DESIGNATION","ORDRE","DESCRIPTION")
      VALUES (noDC, fc.id_ec,'FCS',fc.type_competence, fc.designation, fc.ordre, fc.description);
 END LOOP;

 FOR dco IN CURS_DCO
    LOOP
      SELECT fc2.id_fc INTO noFC FROM famille_competence fc1, famille_competence fc2, domaine_competence dc1, domaine_competence dc2
      WHERE dco.id_fc = fc1.id_fc AND fc1.id_dc = dc1.id_dc AND fc1.designation = fc2.designation AND fc2.id_dc = dc2.id_dc AND dc1.designation = dc2.designation AND dc2.code_mcp = MC_new;
      INSERT INTO domaine_connaissance("ID_FC","DESIGNATION","ORDRE","DESCRIPTION")
      VALUES (noFC, dco.designation, dco.ordre, dco.description);
 END LOOP;

 FOR cap IN CURS_CAP
    LOOP
      SELECT fc2.id_fc INTO noFC FROM famille_competence fc1, famille_competence fc2, domaine_competence dc1, domaine_competence dc2
      WHERE cap.id_fc = fc1.id_fc AND fc1.id_dc = dc1.id_dc AND fc1.designation = fc2.designation AND fc2.id_dc = dc2.id_dc AND dc1.designation = dc2.designation AND dc2.code_mcp = MC_new;
      INSERT INTO capacite("ID_FC","DESIGNATION","ORDRE","DESCRIPTION")
      VALUES (noFC, cap.designation, cap.ordre, cap.description);
 END LOOP;

 FOR cpt IN CURS_CPT
    LOOP
      SELECT fc2.id_fc INTO noFC FROM famille_competence fc1, famille_competence fc2, domaine_competence dc1, domaine_competence dc2
      WHERE cpt.id_fc = fc1.id_fc AND fc1.id_dc = dc1.id_dc AND fc1.designation = fc2.designation AND fc2.id_dc = dc2.id_dc AND dc1.designation = dc2.designation AND dc2.code_mcp = MC_new;
      INSERT INTO competence("ID_FC","TYPE_COMPETENCE","DESIGNATION","ORDRE","DESCRIPTION")
      VALUES (noFC, cpt.type_competence, cpt.designation, cpt.ordre, cpt.description);
 END LOOP;

  FOR fct IN CURS_FCT
    LOOP
      INSERT INTO famille_competence_transversal("CODE_MCP","DESIGNATION","ORDRE","DESCRIPTION")
      VALUES (MC_new, fct.designation, fct.ordre, fct.description);
  END LOOP;

  FOR cptt IN CURS_CPTT
    LOOP
        IF (cptt.id_fct != 0) THEN
      	   SELECT fct2.id_fct INTO noFCT FROM famille_competence_transversal fct1, famille_competence_transversal fct2
      	   WHERE cptt.id_fct = fct1.id_fct AND fct1.ordre = fct2.ordre AND fct2.code_mcp = MC_new;
           INSERT INTO competence_transversale("CODE_MCP","ID_FCT","CODE_COMPETENCE","STD_PERSO","DESIGNATION","ORDRE","DESCRIPTION")
           VALUES (MC_new, noFCT, cptt.code_competence,'CTS',cptt.designation, cptt.ordre, cptt.description);
	ELSE
           INSERT INTO competence_transversale("CODE_MCP","CODE_COMPETENCE","STD_PERSO","DESIGNATION","ORDRE","DESCRIPTION")
           VALUES (MC_new, cptt.code_competence,'CTS',cptt.designation, cptt.ordre, cptt.description);
	END IF;
  END LOOP;

  FOR ctfc IN CURS_CTFC
    LOOP
      SELECT fc2.id_fc INTO noFC FROM famille_competence fc1, famille_competence fc2, domaine_competence dc2
      WHERE ctfc.id_fc = fc1.id_fc AND fc1.designation = fc2.designation AND fc2.id_dc = dc2.id_dc AND dc2.code_mcp = MC_new; --  domaine_competence dc1, AND dc1.designation = dc2.designation AND fc1.id_dc = dc1.id_dc

      SELECT ct2.id_cptt INTO noCT FROM competence_transversale ct1, competence_transversale ct2
      WHERE ctfc.id_cptt = ct1.id_cptt AND ct1.designation = ct2.designation AND ct2.code_mcp = MC_new;
      INSERT INTO ct_fc("ID_FC","ID_CPTT")
      VALUES (noFC, noCT);

  END LOOP;
END;
/
