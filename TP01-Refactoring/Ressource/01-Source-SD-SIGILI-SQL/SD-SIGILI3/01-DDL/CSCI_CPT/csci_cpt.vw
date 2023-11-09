-- C:\Documents and Settings\rosec\Bureau\ddl_cpt\csci_cpt.vw
--
-- Generated for Oracle 10g on Fri Mar 23  10:08:33 2007 by Server Generator 10.1.2.6.18
 

PROMPT Creating View 'V_RIC_CPT_POSITIONNEMENT'
CREATE OR REPLACE FORCE VIEW V_RIC_CPT_POSITIONNEMENT
 (ID_CAP
 ,DESIGNATION
 ,ID_FC
 ,NIVEAU_MATURITE
 ,ID_RIC)
 AS SELECT CAP.ID_CAP, CAP.DESIGNATION, CAP.ID_FC,POS_CPT.NIVEAU_MATURITE, POS_CPT.ID_RIC
FROM CAPACITE CAP, RIC_POSITIONNEMENT POS_CPT
  WHERE CAP.ID_CAP = POS_CPT.ID_CAP
ORDER BY CAP.ORDRE ASC
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_FC_3'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_FC_3
 (PRO
 ,FC
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		fc1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				fc.id_fc fc1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_fc=fc.id_fc
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 3
				group by
				pro.annee_pro , ric.no_demande_ric,
				fc.id_fc )
    group by
		pro1, fc1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPTT_5'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPTT_5
 (PRO
 ,CPTT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cptt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cptt.id_cptt cptt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cptt=cptt.id_cptt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 5
				group by
				pro.annee_pro , ric.no_demande_ric,
				cptt.id_cptt )
    group by
		pro1, cptt1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CAP_4'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CAP_4
 (PRO
 ,CAP
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cap1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cap.id_cap cap1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cap=cap.id_cap
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 4
				group by
				pro.annee_pro , ric.no_demande_ric,
				cap.id_cap )
    group by
		pro1, cap1, nodric1,NB1
/

PROMPT Creating View 'V_RIC_FC_POSITIONNEMENT'
CREATE OR REPLACE FORCE VIEW V_RIC_FC_POSITIONNEMENT
 (DESIGN_FC
 ,ID_FC
 ,NIVEAU_MATURITE
 ,ID_DC
 ,ID_RIC)
 AS SELECT FC.DESIGNATION DESIGN_FC
          ,FC.ID_FC ID_FC
          ,POS_FC.NIVEAU_MATURITE NIVEAU_MATURITE
          ,FC.ID_DC ID_DC
          ,POS_FC.ID_RIC ID_RIC
FROM FAMILLE_COMPETENCE FC
    ,RIC_POSITIONNEMENT POS_FC
  WHERE FC.ID_FC = POS_FC.ID_FC
/

PROMPT Creating View 'V_SPC_DC'
CREATE OR REPLACE FORCE VIEW V_SPC_DC
 (ID_SPC
 ,ID_DC
 ,DESIGNATION
 ,DESCRIPTION)
 AS SELECT SPC.ID_SPC, DC.ID_DC, DC.DESIGNATION, DC.DESCRIPTION
FROM SUIVI_PERSONNEL_COMPETENCE SPC,
  MODELE_COMPETENCE MCP,
  DOMAINE_COMPETENCE DC
  WHERE SPC.CODE_MCP = MCP.CODE_MCP
 AND MCP.CODE_MCP = DC.CODE_MCP
ORDER BY ID_SPC ASC, ORDRE ASC
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_FC_4'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_FC_4
 (PRO
 ,FC
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		fc1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				fc.id_fc fc1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_fc=fc.id_fc
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 4
				group by
				pro.annee_pro , ric.no_demande_ric,
				fc.id_fc )
    group by
		pro1, fc1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CAP_5'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CAP_5
 (PRO
 ,CAP
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cap1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cap.id_cap cap1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cap=cap.id_cap
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 5
				group by
				pro.annee_pro , ric.no_demande_ric,
				cap.id_cap )
    group by
		pro1, cap1, nodric1,NB1
/

PROMPT Creating View 'V_DC_SPC'
CREATE OR REPLACE FORCE VIEW V_DC_SPC
 (ID_SPC
 ,ID_DC)
 AS SELECT SPC.ID_SPC ID_SPC
          ,DC.ID_DC ID_DC
FROM SUIVI_PERSONNEL_COMPETENCE SPC
    ,DOMAINE_COMPETENCE DC
  WHERE spc.CODE_MCP = dc.CODE_MCP
/

PROMPT Creating View 'V_DEMANDERIC_PAR_PROMO'
CREATE OR REPLACE FORCE VIEW V_DEMANDERIC_PAR_PROMO
 (PRO
 ,NODRIC
 ,DES1)
 AS SELECT pro,
		nodric,
		des1
		FROM
(
		select
					pro.annee_pro pro,
                                        ric.no_demande_ric nodric,
	                   dric.designation des1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro
					where
						ric.id_ric=vrc.id_ric
					and
						ric.no_demande_ric=dric.no_demande_ric
					and
						pro.annee_pro=dric.annee_pro
					group by
					pro.annee_pro , ric.no_demande_ric, dric.designation
					)
    group by
		pro, nodric,des1
/

PROMPT Creating View 'V_SPC_CPTT_POS'
CREATE OR REPLACE FORCE VIEW V_SPC_CPTT_POS
 (ID_SPC
 ,NIVEAU_RIC
 ,NIVEAU_SPC
 ,DESIGNATION
 ,DESCRIPTION)
 AS SELECT W_CPTT.ID_SPC,W_CPTT.NIVEAU_RIC, W_CPTT.NIVEAU_SPC, CPTT.DESIGNATION, CPTT.DESCRIPTION
FROM W_SPC_CPTT W_CPTT, COMPETENCE_TRANSVERSALE CPTT
  WHERE W_CPTT.ID_CPTT = CPTT.ID_CPTT
ORDER BY W_CPTT.ID_SPC ASC, W_CPTT.ID_CPTT ASC
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_FC_5'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_FC_5
 (PRO
 ,FC
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		fc1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				fc.id_fc fc1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_fc=fc.id_fc
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 5
				group by
				pro.annee_pro , ric.no_demande_ric,
				fc.id_fc )
    group by
		pro1, fc1, nodric1,NB1
/

PROMPT Creating View 'V_CPT_STAT02_CPT'
CREATE OR REPLACE FORCE VIEW V_CPT_STAT02_CPT
 (PRO
 ,CPT
 ,NODRIC
 ,MOYENNE)
 AS SELECT pro.annee_pro pro, vrc.id_cpt cpt, ric.no_demande_ric nodric, sum(niveau_competence*NB)/sum(NB) moyenne from(
select pro.annee_pro pro, vrc.id_cpt cpt, count(*) NB
from recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
where ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and dric.annee_pro=pro.annee_pro 
and vrc.id_cpt=cpt.id_cpt and type_positionnement='CPT' 
group by pro.annee_pro, vrc.id_cpt
), 
recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
  WHERE ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and vrc.id_cpt=cpt.id_cpt 
and pro.annee_pro=dric.annee_pro
and type_positionnement='CPT' 
group by pro.annee_pro, ric.no_demande_ric, vrc.id_cpt
order by vrc.id_cpt
/

PROMPT Creating View 'V_SPC_'
CREATE OR REPLACE FORCE VIEW V_SPC_IDENTIFICATION
 (ID_SPC
 ,ANNEE_PRO
 ,NOM
 ,PRENOM
 ,DIPLOME
 ,DISCIPLINE
 ,DESCRIPTIF)
 AS SELECT SPC.ID_SPC,ETU.ANNEE_PRO,ETU.NOM, ETU.PRENOM, MOD.DIPLOME, MOD.DISCIPLINE, MOD.DESCRIPTIF
FROM SUIVI_PERSONNEL_COMPETENCE SPC, ETUDIANT ETU,MODELE_COMPETENCE MOD
  WHERE ETU.NO_ETUDIANT_NAT = SPC.NO_ETUDIANT_NAT
 AND SPC.CODE_MCP = MOD.CODE_MCP
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPT_1'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPT_1
 (PRO
 ,CPT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cpt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cpt.id_cpt cpt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cpt=cpt.id_cpt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 1
				group by
				pro.annee_pro , ric.no_demande_ric,
				cpt.id_cpt )
    group by
		pro1, cpt1, nodric1,NB1
/

PROMPT Creating View 'V_NIVEAU_MATURITE'
CREATE OR REPLACE FORCE VIEW V_NIVEAU_MATURITE
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'NIVEAU_MATURITE'
/

PROMPT Creating View 'V_ETAT_MC'
CREATE OR REPLACE FORCE VIEW V_ETAT_MC
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'ETAT_MC'
/

PROMPT Creating View 'V_RIC_IDENTIFICATION'
CREATE OR REPLACE FORCE VIEW V_RIC_IDENTIFICATION
 (ID_RIC
 ,ID_SPC
 ,NO_DEMANDE_RIC
 ,NUMERO_RIC
 ,TYPE_RIC
 ,ANNEE_PRO
 ,NOM
 ,PRENOM
 ,DIPLOME
 ,DISCIPLINE
 ,DESCRIPTIF)
 AS SELECT RIC.ID_RIC,RIC.ID_SPC,RIC.NO_DEMANDE_RIC,RIC.NUMERO_RIC,RIC.TYPE_RIC, ETU.ANNEE_PRO,ETU.NOM, ETU.PRENOM, MOD.DIPLOME,MOD.DISCIPLINE,MOD.DESCRIPTIF
FROM RECUEIL_INDIVIDUEL_COMPETENCE RIC , SUIVI_PERSONNEL_COMPETENCE SPC, ETUDIANT ETU, MODELE_COMPETENCE MOD
  WHERE RIC.ID_SPC = SPC.ID_SPC
	AND ETU.NO_ETUDIANT_NAT = SPC.NO_ETUDIANT_NAT
	AND SPC.CODE_MCP = MOD.CODE_MCP
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPT_2'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPT_2
 (PRO
 ,CPT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cpt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cpt.id_cpt cpt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cpt=cpt.id_cpt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 2
				group by
				pro.annee_pro , ric.no_demande_ric,
				cpt.id_cpt )
    group by
		pro1, cpt1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPT_3'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPT_3
 (PRO
 ,CPT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cpt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cpt.id_cpt cpt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cpt=cpt.id_cpt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 3
				group by
				pro.annee_pro , ric.no_demande_ric,
				cpt.id_cpt )
    group by
		pro1, cpt1, nodric1,NB1
/

PROMPT Creating View 'V_NIVEAU_COMPETENCE'
CREATE OR REPLACE FORCE VIEW V_NIVEAU_COMPETENCE
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'NIVEAU_COMPETENCE'
/

PROMPT Creating View 'V_CPT_STAT02_CPTT'
CREATE OR REPLACE FORCE VIEW V_CPT_STAT02_CPTT
 (PRO
 ,CPTT
 ,NODRIC
 ,MOYENNE)
 AS SELECT pro.annee_pro pro, vrc.id_cptt cptt, ric.no_demande_ric nodric, sum(niveau_competence*NB)/sum(NB) moyenne from(
select pro.annee_pro pro, vrc.id_cptt cptt, count(*) NB
from recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
where ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and dric.annee_pro=pro.annee_pro 
and vrc.id_cptt=cptt.id_cptt and type_positionnement='CPT' 
group by pro.annee_pro, vrc.id_cptt
), 
recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
  WHERE ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and vrc.id_cptt=cptt.id_cptt 
and pro.annee_pro=dric.annee_pro
and type_positionnement='CPT' 
group by pro.annee_pro, ric.no_demande_ric, vrc.id_cptt
order by vrc.id_cptt
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPT_4'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPT_4
 (PRO
 ,CPT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cpt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cpt.id_cpt cpt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cpt=cpt.id_cpt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 4
				group by
				pro.annee_pro , ric.no_demande_ric,
				cpt.id_cpt )
    group by
		pro1, cpt1, nodric1,NB1
/

PROMPT Creating View 'V_AUTHORIS_CREER_RIC'
CREATE OR REPLACE FORCE VIEW V_AUTHORIS_CREER_RIC
 (NO_ETUDIANT
 ,DATE_D
 ,DATE_F
 ,TYPERIC
 ,DESIGNATION
 ,ENCOURS)
 AS SELECT etu.NO_ETUDIANT_NAT no_etudiant, dric.DATE_DEBUT date_d, dric.DATE_FIN date_f, dric.type_ric typeric, dric.designation designation,
get_AuthorisationCreerRic(etu.NO_ETUDIANT_NAT, dric.NO_DEMANDE_RIC) as enCours
from ETUDIANT etu, DEMANDE_RIC dric
  WHERE etu.ANNEE_PRO = dric.ANNEE_PRO
AND dric.DATE_DEBUT = (Select MAX(DATE_DEBUT) from DEMANDE_RIC Where ANNEE_PRO = etu.ANNEE_PRO)
AND (dric.date_debut - SYSDATE)<0
AND SYSDATE <= dric.date_fin+1
/


PROMPT Creating View 'V_NB_POSITIONNEMENT_CPT_5'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPT_5
 (PRO
 ,CPT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cpt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cpt.id_cpt cpt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence cpt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cpt=cpt.id_cpt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 5
				group by
				pro.annee_pro , ric.no_demande_ric,
				cpt.id_cpt )
    group by
		pro1, cpt1, nodric1,NB1
/

PROMPT Creating View 'V_CPT_STAT02_FC'
CREATE OR REPLACE FORCE VIEW V_CPT_STAT02_FC
 (PRO
 ,FC
 ,NODRIC
 ,MOYENNE)
 AS SELECT pro.annee_pro pro, vrc.id_fc fc, ric.no_demande_ric nodric, sum(niveau_maturite*NB)/sum(NB) moyenne from(
select pro.annee_pro pro, vrc.id_fc fc, count(*) NB
from recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
where ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and dric.annee_pro=pro.annee_pro 
and vrc.id_fc=fc.id_fc and type_positionnement='MAT' 
group by pro.annee_pro, vrc.id_fc
), 
recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
  WHERE ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and vrc.id_fc=fc.id_fc 
and pro.annee_pro=dric.annee_pro
and type_positionnement='MAT' 
group by pro.annee_pro, ric.no_demande_ric, vrc.id_fc
order by vrc.id_fc
/

PROMPT Creating View 'V_SPC_CAP_POS'
CREATE OR REPLACE FORCE VIEW V_SPC_CAP_POS
 (ID_SPC
 ,ID_FC
 ,DESIGNATION
 ,NIVEAU_RIC
 ,NIVEAU_SPC)
 AS SELECT W_CAP.ID_SPC ID_SPC
          ,W_CAP.ID_FC ID_FC
          ,CAP.DESIGNATION DESIGNATION
          ,W_CAP.NIVEAU_RIC NIVEAU_RIC
          ,W_CAP.NIVEAU_SPC NIVEAU_SPC
FROM W_SPC_CAP W_CAP
    ,CAPACITE CAP
  WHERE W_CAP.ID_CAP=CAP.ID_CAP
/

PROMPT Creating View 'V_SPC_FC_POS'
CREATE OR REPLACE FORCE VIEW V_SPC_FC_POS
 (ID_SPC
 ,DESIGN_FC
 ,NIVEAU_RIC
 ,NIVEAU_SPC
 ,ID_DC
 ,ID_FC)
 AS SELECT W_FC.ID_SPC ID_SPC
          ,FC.DESIGNATION DESIGN_FC
          ,W_FC.NIVEAU_RIC NIVEAU_RIC
          ,W_FC.NIVEAU_SPC NIVEAU_SPC
          ,FC.ID_DC ID_DC
          ,FC.ID_FC ID_FC
FROM W_SPC_FC W_FC
    ,FAMILLE_COMPETENCE FC
  WHERE W_FC.ID_FC = FC.ID_FC
/

PROMPT Creating View 'V_TYPE_COMPETENCE'
CREATE OR REPLACE FORCE VIEW V_TYPE_COMPETENCE
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'TYPE_COMPETENCE'
/

PROMPT Creating View 'V_TYPE_JOURNAL'
CREATE OR REPLACE FORCE VIEW V_TYPE_JOURNAL
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'TYPE_JOURNAL'
/

PROMPT Creating View 'V_RIC_DC'
CREATE OR REPLACE FORCE VIEW V_RIC_DC
 (ID_RIC
 ,TYPE_RIC
 ,ID_SPC
 ,ID_DC
 ,DESIGNATION
 ,DESCRIPTION)
 AS SELECT RIC.ID_RIC, RIC.TYPE_RIC, SPC.ID_SPC, DC.ID_DC, DC.DESIGNATION, DC.DESCRIPTION
FROM RECUEIL_INDIVIDUEL_COMPETENCE RIC,
  SUIVI_PERSONNEL_COMPETENCE SPC,
  MODELE_COMPETENCE MCP,
  DOMAINE_COMPETENCE DC
  WHERE RIC.ID_SPC = SPC.ID_SPC
 AND SPC.CODE_MCP = MCP.CODE_MCP
 AND MCP.CODE_MCP = DC.CODE_MCP
ORDER BY ID_RIC ASC, ORDRE ASC
/

PROMPT Creating View 'V_CPT_STAT02_CAP'
CREATE OR REPLACE FORCE VIEW V_CPT_STAT02_CAP
 (PRO
 ,CAP
 ,NODRIC
 ,MOYENNE)
 AS SELECT pro.annee_pro pro, vrc.id_cap cap, ric.no_demande_ric nodric, sum(niveau_maturite*NB)/sum(NB) moyenne from(
select pro.annee_pro pro, vrc.id_cap cap, count(*) NB
from recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
where ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and dric.annee_pro=pro.annee_pro 
and vrc.id_cap=cap.id_cap and type_positionnement='MAT' 
group by pro.annee_pro, vrc.id_cap
), 
recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
  WHERE ric.id_ric=vrc.id_ric and ric.no_demande_ric=dric.no_demande_ric and vrc.id_cap=cap.id_cap  
and pro.annee_pro=dric.annee_pro
and type_positionnement='MAT' 
group by pro.annee_pro, ric.no_demande_ric , vrc.id_cap
order by vrc.id_cap
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPTT_1'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPTT_1
 (PRO
 ,CPTT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cptt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cptt.id_cptt cptt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cptt=cptt.id_cptt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 1
				group by
				pro.annee_pro , ric.no_demande_ric,
				cptt.id_cptt )
    group by
		pro1, cptt1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPTT_2'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPTT_2
 (PRO
 ,CPTT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cptt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cptt.id_cptt cptt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cptt=cptt.id_cptt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 2
				group by
				pro.annee_pro , ric.no_demande_ric,
				cptt.id_cptt )
    group by
		pro1, cptt1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CAP_1'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CAP_1
 (PRO
 ,CAP
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cap1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cap.id_cap cap1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cap=cap.id_cap
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 1
				group by
				pro.annee_pro , ric.no_demande_ric,
				cap.id_cap )
    group by
		pro1, cap1, nodric1,NB1
/

PROMPT Creating View 'V_TYPE_RIC'
CREATE OR REPLACE FORCE VIEW V_TYPE_RIC
 (CODE_VALEUR
 ,SIGLE_DOMAINE
 ,ABREVIATION
 ,DESIGNATION)
 AS SELECT RV_LOW_VALUE,RV_DOMAIN,RV_ABBREVIATION,RV_MEANING
FROM CG_REF_CODES
  WHERE RV_DOMAIN = 'TYPE_RIC'
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CAP_2'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CAP_2
 (PRO
 ,CAP
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cap1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cap.id_cap cap1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cap=cap.id_cap
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 2
				group by
				pro.annee_pro , ric.no_demande_ric,
				cap.id_cap )
    group by
		pro1, cap1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_FC_1'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_FC_1
 (PRO
 ,FC
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		fc1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				fc.id_fc fc1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_fc=fc.id_fc
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 1
				group by
				pro.annee_pro , ric.no_demande_ric,
				fc.id_fc )
    group by
		pro1, fc1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPTT_3'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPTT_3
 (PRO
 ,CPTT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cptt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cptt.id_cptt cptt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cptt=cptt.id_cptt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 3
				group by
				pro.annee_pro , ric.no_demande_ric,
				cptt.id_cptt )
    group by
		pro1, cptt1, nodric1,NB1
/

PROMPT Creating View 'V_RIC_CPTT_POSITIONNEMENT'
CREATE OR REPLACE FORCE VIEW V_RIC_CPTT_POSITIONNEMENT
 (ID_RIC
 ,TYPE_RIC
 ,ID_SPC
 ,CODE_COMPETENCE
 ,DESIGNATION
 ,DESCRIPTION
 ,NIVEAU_COMPETENCE)
 AS SELECT RIC.ID_RIC, RIC.TYPE_RIC, SPC.ID_SPC, CPTT.CODE_COMPETENCE, CPTT.DESIGNATION, CPTT.DESCRIPTION, POS_CPTT.NIVEAU_COMPETENCE
FROM RECUEIL_INDIVIDUEL_COMPETENCE RIC ,
  SUIVI_PERSONNEL_COMPETENCE SPC,
  COMPETENCE_TRANSVERSALE CPTT,
  RIC_POSITIONNEMENT POS_CPTT
  WHERE RIC.ID_SPC = SPC.ID_SPC
AND SPC.CODE_MCP = CPTT.CODE_MCP
AND POS_CPTT.ID_CPTT = CPTT.ID_CPTT
AND RIC.ID_RIC = POS_CPTT.ID_RIC
ORDER BY ID_RIC ASC
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_FC_2'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_FC_2
 (PRO
 ,FC
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		fc1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				fc.id_fc fc1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, famille_competence fc
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_fc=fc.id_fc
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 2
				group by
				pro.annee_pro , ric.no_demande_ric,
				fc.id_fc )
    group by
		pro1, fc1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CAP_3'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CAP_3
 (PRO
 ,CAP
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cap1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cap.id_cap cap1,
                                ric.no_demande_ric nodric1,
				count(niveau_maturite) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, capacite cap
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cap=cap.id_cap
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='MAT'
				and
					vrc.niveau_maturite = 3
				group by
				pro.annee_pro , ric.no_demande_ric,
				cap.id_cap )
    group by
		pro1, cap1, nodric1,NB1
/

PROMPT Creating View 'V_NB_POSITIONNEMENT_CPTT_4'
CREATE OR REPLACE FORCE VIEW V_NB_POSITIONNEMENT_CPTT_4
 (PRO
 ,CPTT
 ,NODRIC
 ,NB1)
 AS SELECT pro1,
		cptt1,
                nodric1,
		max(NB1) nbBrou
		FROM
(
		select
				pro.annee_pro pro1,
				cptt.id_cptt cptt1,
                                ric.no_demande_ric nodric1,
				count(niveau_competence) NB1
				from  recueil_individuel_competence ric, ric_positionnement vrc, demande_ric dric, promotion pro, competence_transversale cptt
				where
					ric.id_ric=vrc.id_ric
				and
					ric.no_demande_ric=dric.no_demande_ric
				and
					vrc.id_cptt=cptt.id_cptt
				and
					pro.annee_pro=dric.annee_pro
				and
					type_positionnement='CPT'
				and
					vrc.niveau_competence = 4
				group by
				pro.annee_pro , ric.no_demande_ric,
				cptt.id_cptt )
    group by
		pro1, cptt1, nodric1,NB1
/

PROMPT Creating View 'V_JRN_SPC'
CREATE OR REPLACE FORCE VIEW V_JRN_SPC
 (TYPE_ENTREE
 ,DATE_CREATION
 ,LIBELLE
 ,DESCRIPTION
 ,ID_SPC)
 AS SELECT TYPE_ENTREE, DATE_CREATION, LIBELLE, DESCRIPTION,ID_SPC
FROM JOURNAL_SUIVI_PERSONNEL
    ORDER BY TYPE_ENTREE ASC
/



COMMENT ON COLUMN V_RIC_FC_POSITIONNEMENT.DESIGN_FC IS 'court texte décrivant la famille compétences'
/

COMMENT ON COLUMN V_RIC_FC_POSITIONNEMENT.NIVEAU_MATURITE IS 'niveau d''une capacité pour le ric'
/

COMMENT ON COLUMN V_SPC_IDENTIFICATION.DIPLOME IS 'Nom du diplôme ou de l''année de formation (ex : master 2  pro IUP)'
/

COMMENT ON COLUMN V_SPC_IDENTIFICATION.DISCIPLINE IS 'Domaine métier. Ex : Ingénierie du Logiciel'
/

COMMENT ON COLUMN V_RIC_IDENTIFICATION.NO_DEMANDE_RIC IS 'Identifiant de la demande de RIC'
/

COMMENT ON COLUMN V_RIC_IDENTIFICATION.NUMERO_RIC IS 'Identifiant du recueil individuel de compétences'
/

COMMENT ON COLUMN V_RIC_IDENTIFICATION.TYPE_RIC IS 'Type du recueil (voir domaine type_ric)'
/

COMMENT ON COLUMN V_RIC_IDENTIFICATION.DIPLOME IS 'Nom du diplôme ou de l''année de formation (ex : master 2  pro IUP)'
/

COMMENT ON COLUMN V_RIC_IDENTIFICATION.DISCIPLINE IS 'Domaine métier. Ex : Ingénierie du Logiciel'
/

COMMENT ON COLUMN V_AUTHORIS_CREER_RIC.DATE_D IS 'Date de début de la période de création du RIC'
/

COMMENT ON COLUMN V_AUTHORIS_CREER_RIC.DATE_F IS 'Date de fin de la période de création du RIC'
/

COMMENT ON COLUMN V_SPC_CAP_POS.DESIGNATION IS 'désignation de la capacité'
/

COMMENT ON COLUMN V_SPC_FC_POS.DESIGN_FC IS 'court texte décrivant la famille compétences'
/
