create or replace PROCEDURE      STAT01_NBPOSITIONNEMENT_CPTT AS
cursor cursor_prin is
select
DISTINCT
  DRIC.ANNEE_PRO,
  DRIC.NO_DEMANDE_RIC,
    CPTT.ID_CPTT,
  MC.CODE_MCP


from
MODELE_COMPETENCE  MC,
SUIVI_PERSONNEL_COMPETENCE SPC,
RECUEIL_INDIVIDUEL_COMPETENCE RIC,
DEMANDE_RIC DRIC,
COMPETENCE_TRANSVERSALE CPTT

WHERE

SPC.CODE_MCP = MC.CODE_MCP AND
RIC.ID_SPC = SPC.ID_SPC AND
RIC.NO_DEMANDE_RIC = DRIC.NO_DEMANDE_RIC AND
CPTT.CODE_MCP = MC.CODE_MCP
order by DRIC.ANNEE_PRO, DRIC.NO_DEMANDE_RIC, CPTT.ID_CPTT;


val_nb1 NUMBER; val_nb2 NUMBER; val_nb3 NUMBER; val_nb4 NUMBER; val_nb5 NUMBER; nbTmp NUMBER; nbTotalEtu NUMBER;
tmp cursor_prin%ROWTYPE;
BEGIN
delete from STAT01_NBPOS_CPTT;
open cursor_prin;
loop
  val_nb1 := 0;
  val_nb2 := 0;
  val_nb3 := 0;
  val_nb4 := 0;
  val_nb5 := 0;
  fetch cursor_prin into tmp;
  EXIT WHEN cursor_prin%NOTFOUND;

  INSERT INTO STAT01_NBPOS_CPTT (ANNEE_PRO, NODRIC, ID_CPTT, CODE_MCP)   VALUES (TMP.ANNEE_PRO, TMP.NO_DEMANDE_RIC,  TMP.ID_CPTT, TMP.CODE_MCP );

  UPDATE STAT01_NBPOS_CPTT tb set tb.description = (Select DESCRIPTION from COMPETENCE_TRANSVERSALE where id_CPTT = TMP.ID_CPTT)    WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;


  UPDATE STAT01_NBPOS_CPTT tb set tb.designation = (Select Designation from COMPETENCE_TRANSVERSALE where id_CPTT = TMP.ID_CPTT)    WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;

    --1
  SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_CPTT_1 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;


 if(nbTmp > 0) then

   SELECT nb1 INTO val_nb1 FROM V_NB_POSITIONNEMENT_CPTT_1 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.NB1 = val_nb1 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

      --2
  SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_CPTT_2 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;


 if(nbTmp > 0) then

   SELECT nb1 INTO val_nb2 FROM V_NB_POSITIONNEMENT_CPTT_2 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.NB2 = val_nb2 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

        --3
  SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_CPTT_3 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;


 if(nbTmp > 0) then

   SELECT nb1 INTO val_nb3 FROM V_NB_POSITIONNEMENT_CPTT_3 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.NB3 = val_nb3 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

          --4
  SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_CPTT_4 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;


 if(nbTmp > 0) then

   SELECT nb1 INTO val_nb4 FROM V_NB_POSITIONNEMENT_CPTT_4 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.NB4 = val_nb4 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

            --5
  SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_CPTT_5 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;


 if(nbTmp > 0) then

   SELECT nb1 INTO val_nb5 FROM V_NB_POSITIONNEMENT_CPTT_5 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.NB5 = val_nb5 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

  --Etudiants non positionnés

    SELECT count (no_etudiant_nat) into nbTmp from etudiant etu WHERE etu.annee_pro = TMP.ANNEE_PRO;

    nbTmp := nbTmp - (val_nb1 + val_nb2 + val_nb3 + val_nb4 + val_nb5);

    UPDATE STAT01_NBPOS_CPTT tb set tb.nb_np = nbTmp WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;

    --Moyenne
    SELECT count(moyenne) INTO nbTmp FROM V_CPT_STAT02_CPTT theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;

  if(nbTmp > 0) then

    SELECT moyenne INTO nbTmp FROM V_CPT_STAT02_CPTT theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.CPTT = TMP.ID_CPTT AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_CPTT tb set tb.moyenne = nbTmp WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_CPTT = TMP.ID_CPTT;
  end if;

end loop;
close cursor_prin;
END;
/
