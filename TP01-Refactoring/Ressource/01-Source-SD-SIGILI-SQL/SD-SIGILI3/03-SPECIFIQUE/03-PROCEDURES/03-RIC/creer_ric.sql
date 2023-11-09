create or replace PROCEDURE creer_ric (SPC integer, NUM VARCHAR, typeAutre INTEGER, LIBEL VARCHAR) AS

   demande VARCHAR(8);
   typeRIC VARCHAR(5);
   noRIC INTEGER;
   DateRic DATE;

   CURSOR CURS_Pos IS
      SELECT * FROM POSITIONNEMENT WHERE ID_SPC = SPC;

   CURSOR CURS_W_SPC_CPTT IS
      SELECT * FROM W_SPC_CPTT WHERE ID_SPC = SPC;

   CURSOR CURS_W_SPC_CAP IS
      SELECT * FROM W_SPC_CAP WHERE ID_SPC = SPC;

   CURSOR CURS_W_SPC_FC IS
      SELECT * FROM W_SPC_FC WHERE ID_SPC = SPC;

BEGIN

   DateRic := SYSDATE;

   IF typeAutre = 0 then

-- SELECT d.no_demande_ric into demande FROM demande_ric d, suivi_personnel_competence s, etudiant e
-- WHERE (d.date_debut - DateRic)<0 AND (DateRic - d.date_fin)<0 AND s.id_spc = SPC AND s.no_etudiant_nat=e.no_etudiant_nat AND e.annee_pro = d.annee_pro;

-- SELECT d.type_ric into typeRIC FROM demande_ric d, suivi_personnel_competence s, etudiant e
-- WHERE (d.date_debut - DateRic)<0 AND (DateRic - d.date_fin)<0 AND s.id_spc = SPC AND s.no_etudiant_nat=e.no_etudiant_nat AND e.annee_pro = d.annee_pro;
   
   SELECT d.no_demande_ric into demande FROM demande_ric d, suivi_personnel_competence s, etudiant e
   WHERE (d.date_debut - DateRic)<0 AND (DateRic <= d.date_fin+1) AND s.id_spc = SPC AND s.no_etudiant_nat=e.no_etudiant_nat AND e.annee_pro = d.annee_pro;

   SELECT d.type_ric into typeRIC FROM demande_ric d, suivi_personnel_competence s, etudiant e
   WHERE (d.date_debut - DateRic)<0 AND (DateRic <= d.date_fin+1) AND s.id_spc = SPC AND s.no_etudiant_nat=e.no_etudiant_nat AND e.annee_pro = d.annee_pro;

   ELSE

  typeRIC := 'AUT';
 demande := NULL;

   END IF;


   INSERT INTO recueil_individuel_competence("ID_SPC","NO_DEMANDE_RIC","NUMERO_RIC","DATE_PHOTOGRAPHIE","TYPE_RIC", "LIBELLE_RIC")
   VALUES (SPC,demande,NUM,DateRic,typeRIC, LIBEL);

   select SEQ_RIC.CURRVAL INTO noRIC from DUAL;

   FOR p IN CURS_Pos
   LOOP
 INSERT INTO ric_positionnement("ID_RIC","ID_CAP","ID_FC","ID_CPT","ID_CPTT","TYPE_POSITIONNEMENT","NIVEAU_MATURITE","NIVEAU_COMPETENCE")
 VALUES (noRIC,p.id_cap, p.id_fc, p.id_cpt, p.id_cptt, p.type_positionnement, p.niveau_maturite, p.niveau_competence);
   END LOOP;

   FOR w IN CURS_W_SPC_CPTT
   LOOP
      UPDATE W_SPC_CPTT SET niveau_ric=W.niveau_spc
      WHERE id_spc = w.id_spc AND id_cptt = w.id_cptt;
   END LOOP;

   FOR w IN CURS_W_SPC_CAP
   LOOP
      UPDATE W_SPC_CAP SET niveau_ric=W.niveau_spc
      WHERE id_spc = w.id_spc AND id_cap = w.id_cap;
   END LOOP;

   FOR w IN CURS_W_SPC_FC
   LOOP
      UPDATE W_SPC_FC SET niveau_ric=W.niveau_spc
      WHERE id_spc = w.id_spc AND id_fc = w.id_fc;
   END LOOP;

END;
/
