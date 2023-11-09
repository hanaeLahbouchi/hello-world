create or replace PROCEDURE      STAT01_NBPOSITIONNEMENT_FC AS

cursor cursor_prin is 
select 
DISTINCT 
  DRIC.ANNEE_PRO,
    
  FC.ID_FC,
  FC.DESIGNATION,
  DRIC.NO_DEMANDE_RIC,
  DC.ID_DC,
  MC.CODE_MCP

from
FAMILLE_COMPETENCE FC,
DOMAINE_COMPETENCE DC,
MODELE_COMPETENCE  MC,
SUIVI_PERSONNEL_COMPETENCE SPC,
RECUEIL_INDIVIDUEL_COMPETENCE RIC,
DEMANDE_RIC DRIC

WHERE
FC.ID_DC = DC.ID_DC AND
MC.CODE_MCP = DC.CODE_MCP AND
SPC.CODE_MCP = MC.CODE_MCP AND
RIC.ID_SPC = SPC.ID_SPC AND
RIC.NO_DEMANDE_RIC = DRIC.NO_DEMANDE_RIC
order by DRIC.ANNEE_PRO, DRIC.NO_DEMANDE_RIC,FC.ID_FC;

val_nb1 NUMBER; val_nb2 NUMBER; val_nb3 NUMBER; val_nb4 NUMBER; val_nb5 NUMBER; nbTmp NUMBER; nbTotalEtu NUMBER;
tmp cursor_prin%ROWTYPE;
BEGIN
delete from STAT01_NBPOS_FC;
open cursor_prin;
loop
  val_nb1 := 0;
  val_nb2 := 0;
  val_nb3 := 0;
  val_nb4 := 0;
  val_nb5 := 0;
  fetch cursor_prin into tmp;
  EXIT WHEN cursor_prin%NOTFOUND;
  
  INSERT INTO STAT01_NBPOS_FC (ANNEE_PRO, NODRIC, ID_DC, ID_FC, FC_DESIGNATION)   VALUES (TMP.ANNEE_PRO, TMP.NO_DEMANDE_RIC, TMP.ID_DC, TMP.ID_FC, TMP.DESIGNATION);
  
  
  
  --1
    SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_FC_1 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;

  
  if(nbTmp > 0) then
  
    SELECT nb1 INTO val_nb1 FROM V_NB_POSITIONNEMENT_FC_1 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.NB1 = val_nb1 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  
  --2
    SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_FC_2 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
  
  if(nbTmp > 0) then
  
    SELECT nb1 INTO val_nb2 FROM V_NB_POSITIONNEMENT_FC_2 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.NB2 = val_nb2 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  
  --3
    SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_FC_3 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
  
  if(nbTmp > 0) then
  
    SELECT nb1 INTO val_nb3 FROM V_NB_POSITIONNEMENT_FC_3 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.NB3 = val_nb3 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  
  --4
    SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_FC_4 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
  
  if(nbTmp > 0) then
  
    SELECT nb1 INTO val_nb4 FROM V_NB_POSITIONNEMENT_FC_4 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.NB4 = val_nb4 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  
  --5
    SELECT count(nb1) INTO nbTmp FROM V_NB_POSITIONNEMENT_FC_5 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
  
  if(nbTmp > 0) then
  
    SELECT nb1 INTO val_nb5 FROM V_NB_POSITIONNEMENT_FC_5 theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.NB5 = val_nb5 WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  

  
  --Etudiants non positionnés
  
    SELECT count (no_etudiant_nat) into nbTmp from etudiant etu WHERE etu.annee_pro = TMP.ANNEE_PRO;
    
    nbTmp := nbTmp - (val_nb1 + val_nb2 + val_nb3 + val_nb4 + val_nb5);
    
    UPDATE STAT01_NBPOS_FC tb set tb.nb_np = nbTmp WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  
  
    --Moyenne
    SELECT count(moyenne) INTO nbTmp FROM V_CPT_STAT02_FC theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
  
  if(nbTmp > 0) then
  
    SELECT moyenne INTO nbTmp FROM V_CPT_STAT02_FC theView WHERE theView.pro = TMP.ANNEE_PRO AND theView.fc = TMP.ID_FC AND theView.nodric = TMP.NO_DEMANDE_RIC;
    UPDATE STAT01_NBPOS_FC tb set tb.moyenne = nbTmp WHERE tb.annee_pro = TMP.ANNEE_PRO AND tb.nodric = TMP.NO_DEMANDE_RIC AND tb.id_fc = TMP.ID_FC; 
  end if;
  
  
end loop;
close cursor_prin;
END;
/