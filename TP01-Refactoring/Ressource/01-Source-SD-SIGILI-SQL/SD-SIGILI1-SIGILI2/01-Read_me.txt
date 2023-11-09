********************************* CREATIONS ***********************************
A partir de Designer, générer les scripts API des tables

Pour CSCI_ADM :
	- CANDIDAT
	- DIPLOME
	- POSTE_ENTREPRISE

Pour CSCI_CON
	Aucune table à regénérer

Pour CSCI_RAP
	- CADRE_REFERENT
	- UE

Pour CSCI_SAC
	- AFFECTATION_CRR_ETUDIANT
	- AFFECTATION_ETUDIANT
	- AFFECTATION_PRODUIT
	- AFFECTATION_PRODUIT_VFAS
	- COMPTE_RENDU_REUNION
	- FA
	- SEQUENCE
	- VERSION


Pour CSCI_STA
	- AVENANT
	- CRITERE_ENTREPRISE
	- NOTE_ENTREPRISE
	- SOUTENANCE
	- STAGE
	- VISITE_STAGE

****************************** MODIFICATIONS ***********************************

1/ Dans les scripts :	Mettre en commentaire la ligne :
	csci_adm.sql		csci_adm.tab
	csci_con.sql		csci_con.tab
	csci_rap.sql		csci_rap.tab
	csci_sac.sql		csci_sac.tab
	csci_sta.sql		csci_sta.tab
	global.sql		global.tab


2/ Dans les scripts :	
	csci_adm.tab
	csci_con.tab
	csci_sac.tab
	csci_sta.tab

Supprimer le script de creation de la table CG_REF_CODES :

	PROMPT Creating Table 'CG_REF_CODES'
	CREATE TABLE CG_REF_CODES
	 (RV_DOMAIN VARCHAR2(100) NOT NULL
	 ,RV_LOW_VALUE VARCHAR2(240) NOT NULL
	 ,RV_HIGH_VALUE VARCHAR2(240)
	 ,RV_ABBREVIATION VARCHAR2(240)
	 ,RV_MEANING VARCHAR2(240)
	 )
	/

Puis le recopier dans le fichier "global.tab"


3/ Dans les scripts :	
	csci_adm.ind
	csci_con.ind
	csci_sac.ind
	csci_sta.ind

Supprimer le script de creation d'index de la table CG_REF_CODES :

	PROMPT Creating Index 'X_CG_REF_CODES_1'
	CREATE INDEX X_CG_REF_CODES_1 ON CG_REF_CODES
	 (RV_DOMAIN
	 ,RV_LOW_VALUE)
	/

Puis le recopier dans le fichier "global.ind"


4/ Dans les pans fonctionnels adequats, créer les scripts :	
	csci_adm_fk.con
	csci_con_fk.con
	csci_sac_fk.con

Couper les creations de "Foreign Key" disponibles dans les fichiers :
	csci_adm.con
	csci_con.con
	csci_sac.con

Puis les coller dans les nouveaux fichiers.





********************************* LANCEMENT ***********************************

Créer un utilisateur --> "Script_création_utilisateur_FA09.sql"

Puis se connecter avec l'utilisateur FA09 et lancer sous SQL+ le script "Install_globale.sql"


