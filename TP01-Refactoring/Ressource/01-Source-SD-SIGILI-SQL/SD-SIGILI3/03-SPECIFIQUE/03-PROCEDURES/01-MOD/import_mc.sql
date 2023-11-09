CREATE OR REPLACE 
PROCEDURE IMPORT_MC (urlFic VARCHAR2) IS

/* Procédure qui synchronise un fichier XML et les tables relatives aux modèles de compétences
 *  Crée le 27/03/2007 Par Alexis BELLION
 * 
 *  ACTIONS :
 *		ajoute dans la base les informations passées par un fichier XML
 *			Peut être étendu à de la synchronisation : Cf. FA13 CILI1-ILI5
 */
 	CURSOR  curs_mod_xml IS
		SELECT mc.CODE_MCP,mc.CODE_CRE,mc.DATE_CREATION,mc.DIPLOME,
					mc.DISCIPLINE,mc.EN_VIGUEUR,mc.ETAT,mc.COMMENTAIRE,
					mc.CONTACT,mc.DATE_MAJ,mc.DEBOUCHES,mc.DESCRIPTIF,
					mc.LIBELLE,mc.REFERENCE_STAGE,mc.VERSION
			FROM XMLTable(
			'for $i in fn:doc("/public/Mod_cpt_import.xml")//MOD_CPT
				return $i'
			COLUMNS 
				CODE_MCP 			VARCHAR2(8) 			PATH '/MOD_CPT/CODE_MCP' ,
				CODE_CRE 			VARCHAR2(10) 		PATH '/MOD_CPT/CODE_CRE',
				DATE_CREATION 	DATE						PATH '/MOD_CPT/DATE_CREATION',
				DIPLOME 			VARCHAR2(100) 		PATH '/MOD_CPT/DIPLOME',
				DISCIPLINE 		VARCHAR2(100) 		PATH '/MOD_CPT/DISCIPLINE',
				EN_VIGUEUR 		CHAR(1) 				PATH '/MOD_CPT/EN_VIGUEUR',
				ETAT 				VARCHAR2(3) 			PATH '/MOD_CPT/ETAT',
				COMMENTAIRE 	VARCHAR2(4000)		PATH '/MOD_CPT/COMMENTAIRE' 	DEFAULT NULL,
				CONTACT 			VARCHAR2(4000)		PATH '/MOD_CPT/CONTACT'			DEFAULT NULL,
				DATE_MAJ 			DATE 					PATH '/MOD_CPT/DATE_MAJ'			DEFAULT NULL,
				DEBOUCHES 		VARCHAR2(4000)		PATH '/MOD_CPT/DEBOUCHES'			DEFAULT NULL,
				DESCRIPTIF 		VARCHAR2(4000)		PATH '/MOD_CPT/DESCRIPTIF'		DEFAULT NULL,
				LIBELLE 				VARCHAR2(100) 		PATH '/MOD_CPT/LIBELLE'			DEFAULT NULL,
				REFERENCE_STAGE VARCHAR2(4000)	PATH '/MOD_CPT/REFERENCE_STAGE'		DEFAULT NULL,
				VERSION 			VARCHAR2(100) 		PATH '/MOD_CPT/VERSION'			DEFAULT NULL
		) mc;

 	CURSOR  curs_cptt_xml IS
		-- A FAIRE
		/*SELECT mc.CODE_MCP,mc.CODE_CRE,mc.DATE_CREATION,mc.DIPLOME,
					mc.DISCIPLINE,mc.EN_VIGUEUR,mc.ETAT,mc.COMMENTAIRE,
					mc.CONTACT,mc.DATE_MAJ,mc.DEBOUCHES,mc.DESCRIPTIF,
					mc.LIBELLE,mc.REFERENCE_STAGE,mc.VERSION
			FROM XMLTable(
			'for $i in fn:doc("/public/Mod_cpt_import.xml")//MOD_CPT
				return $i'
			COLUMNS 
				CODE_MCP 			VARCHAR2(8) 			PATH '/MOD_CPT/CODE_MCP' ,
				CODE_CRE 			VARCHAR2(10) 		PATH '/MOD_CPT/CODE_CRE',
				DATE_CREATION 	DATE						PATH '/MOD_CPT/DATE_CREATION',
				DIPLOME 			VARCHAR2(100) 		PATH '/MOD_CPT/DIPLOME',
				DISCIPLINE 		VARCHAR2(100) 		PATH '/MOD_CPT/DISCIPLINE',
				EN_VIGUEUR 		CHAR(1) 				PATH '/MOD_CPT/EN_VIGUEUR',
				ETAT 				VARCHAR2(3) 			PATH '/MOD_CPT/ETAT',
				COMMENTAIRE 	VARCHAR2(4000)		PATH '/MOD_CPT/COMMENTAIRE' 	DEFAULT NULL,
				CONTACT 			VARCHAR2(4000)		PATH '/MOD_CPT/CONTACT'			DEFAULT NULL,
				DATE_MAJ 			DATE 					PATH '/MOD_CPT/DATE_MAJ'			DEFAULT NULL,
				DEBOUCHES 		VARCHAR2(4000)		PATH '/MOD_CPT/DEBOUCHES'			DEFAULT NULL,
				DESCRIPTIF 		VARCHAR2(4000)		PATH '/MOD_CPT/DESCRIPTIF'		DEFAULT NULL,
				LIBELLE 				VARCHAR2(100) 		PATH '/MOD_CPT/LIBELLE'			DEFAULT NULL,
				REFERENCE_STAGE VARCHAR2(4000)	PATH '/MOD_CPT/REFERENCE_STAGE'		DEFAULT NULL,
				VERSION 			VARCHAR2(100) 		PATH '/MOD_CPT/VERSION'			DEFAULT NULL*/
		) cptt;



		index_xml 			curs_mod_xml%ROWTYPE;
		
	BEGIN
	SET SERVEUROUTPUT ON;
	DBMS_OUTPUT.PUT_LINE('DEBUT');
	-- On parcourt le fichier XML à l'aide du curseur
	-- pour toutes les données 'fournisseur' on regarde s'il y a lieu de 
	--		mettre à jour un enregistrement dans la base
	--		ajouter un enregistrement dans la base
	OPEN curs_mod_xml;
	DBMS_OUTPUT.PUT_LINE('OUVERTURE CURS');
	LOOP
		FETCH curs_mod_xml INTO index_xml;
		EXIT WHEN curs_mod_xml%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('Insertion du nouveau modèle de compétence ' || index_xml.CODE_MCP);
			INSERT INTO MODELE_COMPETENCE (CODE_MCP,CODE_CRE,DATE_CREATION,DIPLOME,
																DISCIPLINE,EN_VIGUEUR,ETAT,COMMENTAIRE,
																CONTACT,DATE_MAJ,DEBOUCHES,DESCRIPTIF,
																LIBELLE,REFERENCE_STAGE,VERSION)
			VALUES (index_xml.CODE_MCP,index_xml.CODE_CRE,index_xml.DATE_CREATION,index_xml.DIPLOME,
						index_xml.DISCIPLINE,index_xml.EN_VIGUEUR,index_xml.ETAT,index_xml.COMMENTAIRE,
						index_xml.CONTACT,index_xml.DATE_MAJ,index_xml.DEBOUCHES,index_xml.DESCRIPTIF,
						index_xml.LIBELLE,index_xml.REFERENCE_STAGE,index_xml.VERSION);

	END LOOP;
	CLOSE curs_mod_xml;
	DBMS_OUTPUT.PUT_LINE('FIN ');
	COMMIT;

	SET SERVEUROUTPUT OFF;
END;
/
