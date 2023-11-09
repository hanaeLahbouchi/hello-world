CREATE OR REPLACE PROCEDURE Editer_RIC (url_ric IN VARCHAR2, no_ric IN INTEGER) IS
	-----------------------------------------------------------------------------
	-- Editer_RIC : permet d extraire des donnees pour generer un fichier XML  --
	-- Arguments :                                                             --
	--     url_ric => adresse physique ou sera stocke le fichier XML           --
	--     no_ric  => numero du ric a extraire                                 --
	--                          ©Reservoir Soft 2007                           --
	--                     Alexis BELLION / Fabienne ROSEC                     --
	--                               13/03/2007                                --
	-----------------------------------------------------------------------------
	XMLidentif XMLType; XMLcptt XMLType; XMLcpt XMLType;  -- Differentes parties du fichier XML final
	XMLdoc XMLType;  -- Document XML global et final
	XMLNul_FC XMLType;XMLBr_FC XMLType; XMLNot_FC XMLType; XMLUtil_FC XMLType; XMLExp_FC XMLType; XMLAut_FC XMLType;  -- Tableaux pour le positionnement des cpt
	XMLNul XMLType;XMLBr XMLType; XMLNot XMLType; XMLUtil XMLType; XMLExp XMLType; XMLAut XMLType;  -- Tableaux pour le positionnement des cpt
	XMLlvNul XMLType;XMLlv1 XMLType;XMLlv2 XMLType;XMLlv3 XMLType;XMLlv4 XMLType;XMLlv5 XMLType;  -- Tableau pour le positionnement des cptt
	FICHIER_EXISTE NUMBER(1);  -- Fichier physique
BEGIN
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV_FC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_FC>' RETURNING CONTENT) INTO XMLNul_FC FROM DUAL;
	SELECT XMLQuery('<LV_FC><BROU>X</BROU><NOT/><UTIL/><AUT/><EXP/></LV_FC>' RETURNING CONTENT) INTO XMLBr_FC FROM DUAL;
	SELECT XMLQuery('<LV_FC><BROU/><NOT>X</NOT><UTIL/><AUT/><EXP/></LV_FC>' RETURNING CONTENT) INTO XMLNot_FC FROM DUAL;
	SELECT XMLQuery('<LV_FC><BROU/><NOT/><UTIL>X</UTIL><AUT/><EXP/></LV_FC>' RETURNING CONTENT) INTO XMLUtil_FC FROM DUAL;
	SELECT XMLQuery('<LV_FC><BROU/><NOT/><UTIL/><AUT>X</AUT><EXP/></LV_FC>' RETURNING CONTENT) INTO XMLAut_FC FROM DUAL;
	SELECT XMLQuery('<LV_FC><BROU/><NOT/><UTIL/><AUT/><EXP>X</EXP></LV_FC>' RETURNING CONTENT) INTO XMLExp_FC FROM DUAL;
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV><BROU/><NOT/><UTIL/><AUT/><EXP/></LV>' RETURNING CONTENT) INTO XMLNul FROM DUAL;
	SELECT XMLQuery('<LV><BROU>X</BROU><NOT/><UTIL/><AUT/><EXP/></LV>' RETURNING CONTENT) INTO XMLBr FROM DUAL;
	SELECT XMLQuery('<LV><BROU/><NOT>X</NOT><UTIL/><AUT/><EXP/></LV>' RETURNING CONTENT) INTO XMLNot FROM DUAL;
	SELECT XMLQuery('<LV><BROU/><NOT/><UTIL>X</UTIL><AUT/><EXP/></LV>' RETURNING CONTENT) INTO XMLUtil FROM DUAL;
	SELECT XMLQuery('<LV><BROU/><NOT/><UTIL/><AUT>X</AUT><EXP/></LV>' RETURNING CONTENT) INTO XMLAut FROM DUAL;
	SELECT XMLQuery('<LV><BROU/><NOT/><UTIL/><AUT/><EXP>X</EXP></LV>' RETURNING CONTENT) INTO XMLExp FROM DUAL;
	-- Creation de la structure 1/2/3 4/5 pour les compentences transversales
	SELECT XMLQuery('<LV_CPTT><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_CPTT>' RETURNING CONTENT) INTO XMLlvNul FROM DUAL;
	SELECT XMLQuery('<LV_CPTT><LV1>X</LV1><LV2/><LV3/><LV4/><LV5/></LV_CPTT>' RETURNING CONTENT) INTO XMLlv1 FROM DUAL;
	SELECT XMLQuery('<LV_CPTT><LV1/><LV2>X</LV2><LV3/><LV4/><LV5/></LV_CPTT>' RETURNING CONTENT) INTO XMLlv2 FROM DUAL;
	SELECT XMLQuery('<LV_CPTT><LV1/><LV2/><LV3>X</LV3><LV4/><LV5/></LV_CPTT>' RETURNING CONTENT) INTO XMLlv3 FROM DUAL;
	SELECT XMLQuery('<LV_CPTT><LV1/><LV2/><LV3/><LV4>X</LV4><LV5/></LV_CPTT>' RETURNING CONTENT) INTO XMLlv4 FROM DUAL;
	SELECT XMLQuery('<LV_CPTT><LV1/><LV2/><LV3/><LV4/><LV5>X</LV5></LV_CPTT>' RETURNING CONTENT) INTO XMLlv5 FROM DUAL;
	-- Recuperation de l entete du RIC (identification RIC+Personne associee)
	SELECT 
		XMLQuery('for $ent in ora:view("V_RIC_IDENTIFICATION")/ROW
				where $ent/ID_RIC = $no_ric
				return (
					<ENTETE>
						<TITRE>
							{$ent/DIPLOME}
							{$ent/DISCIPLINE}
						</TITRE>
						{$ent/DESCRIPTIF}
						<IDENTIFICATION>
							{$ent/ANNEE_PRO}
							{$ent/NOM}
							{$ent/PRENOM}
							{$ent/TYPE_RIC}				
						</IDENTIFICATION>
					</ENTETE>
				)'
	PASSING BY VALUE xmlElement("no_ric",no_ric) as "no_ric"
	RETURNING CONTENT) 
	INTO XMLidentif
	FROM DUAL;
	-- Recuperation de l'ensemble des domaines de competence pour ce RIC et pour chacun de ces domaines des familles de competence (FC)
	-- et pour chacune de ces FC les domaines de connaissances associees ainsi que les capacites avec leur notation
	SELECT 
		XMLQuery(
			'<DOMAINE_COMPETENCES> {
				for $dc in ora:view("V_RIC_DC")/ROW
				where $dc/ID_RIC = $no_ric
				return (
					<DOMAINE_COMPETENCE>
						<DESIGN_DC>{$dc/DESIGNATION/text()}</DESIGN_DC>
						<FCS>{
							for $fc in ora:view("V_RIC_FC_POSITIONNEMENT")/ROW
							where $fc/ID_DC = $dc/ID_DC
							and $fc/ID_RIC = $no_ric
							return (
								<FC> 
									{$fc/DESIGN_FC}
									{
										if ($fc/NIVEAU_MATURITE/text() = xs:string(1)) then <NIV>{$brou_FC/brou_FC/LV_FC}</NIV> else
										if ($fc/NIVEAU_MATURITE/text() = xs:string(2)) then <NIV>{$not_FC/not_FC/LV_FC}</NIV> else 
										if ($fc/NIVEAU_MATURITE/text() = xs:string(3)) then <NIV>{$util_FC/util_FC/LV_FC}</NIV> else 
										if ($fc/NIVEAU_MATURITE/text() = xs:string(4)) then <NIV>{$aut_FC/aut_FC/LV_FC}</NIV> else 
										if ($fc/NIVEAU_MATURITE/text() = xs:string(5)) then <NIV>{$exp_FC/exp_FC/LV_FC}</NIV> else 
										<NIV>{$nul_FC/nul_FC/LV_FC}</NIV>
									}
									<DCOS>{
										for $dco in ora:view("DOMAINE_CONNAISSANCE")/ROW
										where $dco/ID_FC = $fc/ID_FC
										return (
											<DCO>
												<DESIGN_DCO>{$dco/DESIGNATION/text()}</DESIGN_DCO>
											</DCO>
										)
									} </DCOS>
									<CAPS>{
										for $cap in ora:view("V_RIC_CPT_POSITIONNEMENT")/ROW
										where $cap/ID_FC=$fc/ID_FC
										and $cap/ID_RIC=$no_ric
										return (
											<CAPACITE>
												<DESIGN_CAP>{$cap/DESIGNATION/text()}</DESIGN_CAP>
												{	
													if ($cap/NIVEAU_MATURITE/text() = xs:string(1)) then <NIV>{$brou/brou/LV}</NIV> else
													if ($cap/NIVEAU_MATURITE/text() = xs:string(2)) then <NIV>{$not/not/LV}</NIV> else 
													if ($cap/NIVEAU_MATURITE/text() = xs:string(3)) then <NIV>{$util/util/LV}</NIV> else 
													if ($cap/NIVEAU_MATURITE/text() = xs:string(4)) then <NIV>{$aut/aut/LV}</NIV> else 
													if ($cap/NIVEAU_MATURITE/text() = xs:string(5)) then <NIV>{$exp/exp/LV}</NIV> else 
													<NIV>{$nul/nul/LV}</NIV>
												}
											</CAPACITE>)
									}</CAPS>
								</FC>
							)
						}</FCS>
					</DOMAINE_COMPETENCE>)}
					</DOMAINE_COMPETENCES>'
	PASSING BY VALUE xmlElement("no_ric",no_ric) as "no_ric",
		xmlElement("nul_FC",XMLNul_FC) as "nul_FC",
		xmlElement("brou_FC",XMLBr_FC) as "brou_FC",
		xmlElement("not_FC",XMLNot_FC) as "not_FC",
		xmlElement("util_FC",XMLUtil_FC) as "util_FC",
		xmlElement("aut_FC",XMLAut_FC) as "aut_FC",
		xmlElement("exp_FC",XMLExp_FC) as "exp_FC",
		xmlElement("nul",XMLExp_FC) as "nul",
		xmlElement("brou",XMLBr) as "brou",
		xmlElement("not",XMLNot) as "not",
		xmlElement("util",XMLUtil) as "util",
		xmlElement("aut",XMLAut) as "aut",
		xmlElement("exp",XMLExp) as "exp"
	RETURNING CONTENT) 
	INTO XMLcpt
	FROM DUAL;
	-- Recuperation pour un RIC de l ensemble des competences transversales et des notation pour celles-ci
	SELECT 
		XMLQuery(
			'<COMPETENCE_TRANSVERSALES> {
				for $cptt in ora:view("V_RIC_CPTT_POSITIONNEMENT")/ROW
				where $cptt/ID_RIC = $no_ric
				return (
					<COMPETENCE_TRANSVERSALE>
						<DESIGNATION_CPTT>{$cptt/DESIGNATION/text()}</DESIGNATION_CPTT>
						<DESCRIPTION_CPTT>{$cptt/DESCRIPTION/text()}</DESCRIPTION_CPTT>
							{	if ($cptt/NIVEAU_COMPETENCE/text() = 1) then <NIV>{$lv1/lv1/LV_CPTT}</NIV> else
								if ($cptt/NIVEAU_COMPETENCE/text() = 2) then <NIV>{$lv2/lv2/LV_CPTT}</NIV> else 
								if ($cptt/NIVEAU_COMPETENCE/text() = 3) then <NIV>{$lv3/lv3/LV_CPTT}</NIV> else 
								if ($cptt/NIVEAU_COMPETENCE/text() = 4) then <NIV>{$lv4/lv4/LV_CPTT}</NIV> else 
								if ($cptt/NIVEAU_COMPETENCE/text() = 5) then <NIV>{$lv5/lv5/LV_CPTT}</NIV> else 
								<NIV>{$lvNul/lvNul/LV_CPTT}</NIV>
							}
					</COMPETENCE_TRANSVERSALE>)}
					</COMPETENCE_TRANSVERSALES>'
	PASSING BY VALUE xmlElement("no_ric",no_ric) as "no_ric", 
		xmlElement("lv1",XMLlv1) as "lv1",
		xmlElement("lv2",XMLlv2) as "lv2",
		xmlElement("lv3",XMLlv3) as "lv3",
		xmlElement("lv4",XMLlv4) as "lv4",
		xmlElement("lv5",XMLlv5) as "lv5",
		xmlElement("lvNul",XMLlvNul) as "lvNul"
	RETURNING CONTENT) 
	INTO XMLcptt
	FROM DUAL;	

	-- Construction de la structure du RIC avec en premier lieu l identification, puis les notations pour les competences standards, enfin les notations pour les competences transversales
	SELECT XMLType('<RIC>' ||XMLidentif.getClobVal() || XMLcpt.getClobVal()|| XMLcptt.getClobVal() || '</RIC>') INTO XMLdoc FROM DUAL;
	-- Ajout d une entete au fichier
	SELECT XMLType('<?xml version="1.0" encoding="ISO-8859-1"?>'|| XMLdoc.getClobVal()) INTO XMLdoc FROM DUAL;
	-- Destruction du précédent fichier s'il existe
	select count(*) INTO FICHIER_EXISTE from resource_view WHERE any_path LIKE url_ric;
	IF  FICHIER_EXISTE=1 THEN
		DBMS_XDB.deleteResource(url_ric);
	END IF;
IF(DBMS_XDB.CREATERESOURCE(url_ric, XMLdoc)) THEN
DBMS_OUTPUT.PUT_LINE('Resource is created');
ELSE
DBMS_OUTPUT.PUT_LINE('Cannot create resource');
END IF;
COMMIT;
END;
/
