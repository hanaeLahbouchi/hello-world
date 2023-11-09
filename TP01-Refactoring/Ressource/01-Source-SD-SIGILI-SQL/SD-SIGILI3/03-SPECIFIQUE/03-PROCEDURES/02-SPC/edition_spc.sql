CREATE OR REPLACE PROCEDURE Editer_SPC (url_spc IN VARCHAR2, no_spc IN INTEGER) IS
	-----------------------------------------------------------------------------
	-- Editer_RIC : permet d extraire des donnees pour generer un fichier XML  --
	-- Arguments :                                                             --
	--     url_spc => adresse physique ou sera stocke le fichier XML           --
	--     no_spc  => numero du ric a extraire                                 --
	--                          ©Reservoir Soft 2007                           --
	--                     Alexis BELLION / Fabienne ROSEC                     --
	--                               13/03/2007                                --
	-----------------------------------------------------------------------------
	XMLidentif XMLType; XMLcptt XMLType; XMLcpt XMLType;  XMLjrn XMLType;-- Differentes parties du fichier XML final
	XMLdoc XMLType;  -- Document XML global et final
	--RIC
	XMLNul_FC_RIC XMLType;XMLBr_FC_RIC XMLType; XMLNot_FC_RIC XMLType; XMLUtil_FC_RIC XMLType; XMLExp_FC_RIC XMLType; XMLAut_FC_RIC XMLType;  -- Tableaux pour le positionnement des cpt
	XMLNul_RIC XMLType;XMLBr_RIC XMLType; XMLNot_RIC XMLType; XMLUtil_RIC XMLType; XMLExp_RIC XMLType; XMLAut_RIC XMLType;  -- Tableaux pour le positionnement des cpt
	XMLlvNul_RIC XMLType;XMLlv1_RIC XMLType;XMLlv2_RIC XMLType;XMLlv3_RIC XMLType;XMLlv4_RIC XMLType;XMLlv5_RIC XMLType;  -- Tableau pour le positionnement des cptt
	--SPC
	XMLNul_FC_SPC XMLType;XMLBr_FC_SPC XMLType; XMLNot_FC_SPC XMLType; XMLUtil_FC_SPC XMLType; XMLExp_FC_SPC XMLType; XMLAut_FC_SPC XMLType;  -- Tableaux pour le positionnement des cpt
	XMLNul_SPC XMLType;XMLBr_SPC XMLType; XMLNot_SPC XMLType; XMLUtil_SPC XMLType; XMLExp_SPC XMLType; XMLAut_SPC XMLType;  -- Tableaux pour le positionnement des cpt
	XMLlvNul_SPC XMLType;XMLlv1_SPC XMLType;XMLlv2_SPC XMLType;XMLlv3_SPC XMLType;XMLlv4_SPC XMLType;XMLlv5_SPC XMLType;  -- Tableau pour le positionnement des cptt
	FICHIER_EXISTE NUMBER(1);  -- Fichier physique
BEGIN
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV_FC_RIC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_FC_RIC>' RETURNING CONTENT) INTO XMLNul_FC_RIC FROM DUAL;
	SELECT XMLQuery('<LV_FC_RIC><BROU>O</BROU><NOT/><UTIL/><AUT/><EXP/></LV_FC_RIC>' RETURNING CONTENT) INTO XMLBr_FC_RIC FROM DUAL;
	SELECT XMLQuery('<LV_FC_RIC><BROU/><NOT>O</NOT><UTIL/><AUT/><EXP/></LV_FC_RIC>' RETURNING CONTENT) INTO XMLNot_FC_RIC FROM DUAL;
	SELECT XMLQuery('<LV_FC_RIC><BROU/><NOT/><UTIL>O</UTIL><AUT/><EXP/></LV_FC_RIC>' RETURNING CONTENT) INTO XMLUtil_FC_RIC FROM DUAL;
	SELECT XMLQuery('<LV_FC_RIC><BROU/><NOT/><UTIL/><AUT>O</AUT><EXP/></LV_FC_RIC>' RETURNING CONTENT) INTO XMLAut_FC_RIC FROM DUAL;
	SELECT XMLQuery('<LV_FC_RIC><BROU/><NOT/><UTIL/><AUT/><EXP>O</EXP></LV_FC_RIC>' RETURNING CONTENT) INTO XMLExp_FC_RIC FROM DUAL;
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV_CAP_RIC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLNul_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_RIC><BROU>O</BROU><NOT/><UTIL/><AUT/><EXP/></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLBr_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_RIC><BROU/><NOT>O</NOT><UTIL/><AUT/><EXP/></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLNot_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_RIC><BROU/><NOT/><UTIL>O</UTIL><AUT/><EXP/></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLUtil_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_RIC><BROU/><NOT/><UTIL/><AUT>O</AUT><EXP/></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLAut_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_RIC><BROU/><NOT/><UTIL/><AUT/><EXP>O</EXP></LV_CAP_RIC>' RETURNING CONTENT) INTO XMLExp_RIC FROM DUAL;
	-- Creation de la structure 1/2/3 4/5 pour les compentences transversales
	SELECT XMLQuery('<LV_CPTT_RIC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlvNul_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_RIC><LV1>O</LV1><LV2/><LV3/><LV4/><LV5/></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlv1_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_RIC><LV1/><LV2>O</LV2><LV3/><LV4/><LV5/></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlv2_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_RIC><LV1/><LV2/><LV3>O</LV3><LV4/><LV5/></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlv3_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_RIC><LV1/><LV2/><LV3/><LV4>O</LV4><LV5/></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlv4_RIC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_RIC><LV1/><LV2/><LV3/><LV4/><LV5>O</LV5></LV_CPTT_RIC>' RETURNING CONTENT) INTO XMLlv5_RIC FROM DUAL;
	--------------
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV_FC_SPC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_FC_SPC>' RETURNING CONTENT) INTO XMLNul_FC_SPC FROM DUAL;
	SELECT XMLQuery('<LV_FC_SPC><BROU>X</BROU><NOT/><UTIL/><AUT/><EXP/></LV_FC_SPC>' RETURNING CONTENT) INTO XMLBr_FC_SPC FROM DUAL;
	SELECT XMLQuery('<LV_FC_SPC><BROU/><NOT>X</NOT><UTIL/><AUT/><EXP/></LV_FC_SPC>' RETURNING CONTENT) INTO XMLNot_FC_SPC FROM DUAL;
	SELECT XMLQuery('<LV_FC_SPC><BROU/><NOT/><UTIL>X</UTIL><AUT/><EXP/></LV_FC_SPC>' RETURNING CONTENT) INTO XMLUtil_FC_SPC FROM DUAL;
	SELECT XMLQuery('<LV_FC_SPC><BROU/><NOT/><UTIL/><AUT>X</AUT><EXP/></LV_FC_SPC>' RETURNING CONTENT) INTO XMLAut_FC_SPC FROM DUAL;
	SELECT XMLQuery('<LV_FC_SPC><BROU/><NOT/><UTIL/><AUT/><EXP>X</EXP></LV_FC_SPC>' RETURNING CONTENT) INTO XMLExp_FC_SPC FROM DUAL;
	-- Creation de la structure brouillard/notion/utilisateur/autonome/expert pour les compentences
	SELECT XMLQuery('<LV_CAP_SPC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLNul_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_SPC><BROU>X</BROU><NOT/><UTIL/><AUT/><EXP/></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLBr_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_SPC><BROU/><NOT>X</NOT><UTIL/><AUT/><EXP/></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLNot_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_SPC><BROU/><NOT/><UTIL>X</UTIL><AUT/><EXP/></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLUtil_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_SPC><BROU/><NOT/><UTIL/><AUT>X</AUT><EXP/></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLAut_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CAP_SPC><BROU/><NOT/><UTIL/><AUT/><EXP>X</EXP></LV_CAP_SPC>' RETURNING CONTENT) INTO XMLExp_SPC FROM DUAL;
	-- Creation de la structure 1/2/3 4/5 pour les compentences transversales
	SELECT XMLQuery('<LV_CPTT_SPC><BROU/><NOT/><UTIL/><AUT/><EXP/></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlvNul_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_SPC><LV1>X</LV1><LV2/><LV3/><LV4/><LV5/></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlv1_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_SPC><LV1/><LV2>X</LV2><LV3/><LV4/><LV5/></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlv2_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_SPC><LV1/><LV2/><LV3>X</LV3><LV4/><LV5/></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlv3_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_SPC><LV1/><LV2/><LV3/><LV4>X</LV4><LV5/></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlv4_SPC FROM DUAL;
	SELECT XMLQuery('<LV_CPTT_SPC><LV1/><LV2/><LV3/><LV4/><LV5>X</LV5></LV_CPTT_SPC>' RETURNING CONTENT) INTO XMLlv5_SPC FROM DUAL;
	
	
	
	-- Recuperation de l entete du RIC (identification RIC+Personne associee)
	SELECT 
		XMLQuery('for $ent in ora:view("V_SPC_IDENTIFICATION")/ROW
				where $ent/ID_SPC = $no_spc
				return (
					<ENTETE>
						<TITRE>
							{$ent/DIPLOME}
							{$ent/DISCIPLINE}
						</TITRE>
						<IDENTIFICATION>
							{$ent/ANNEE_PRO}
							{$ent/NOM}
							{$ent/PRENOM}				
						</IDENTIFICATION>
						{$ent/DESCRIPTIF}
					</ENTETE>
				)'
	PASSING BY VALUE xmlElement("no_spc",no_spc) as "no_spc"
	RETURNING CONTENT) 
	INTO XMLidentif
	FROM DUAL;
	-- Recuperation de l'ensemble des domaines de competence pour ce RIC et pour chacun de ces domaines des familles de competence (FC)
	-- et pour chacune de ces FC les domaines de connaissances associees ainsi que les capacites avec leur notation
	SELECT 
		XMLQuery(
			'<DOMAINE_COMPETENCES> {
				for $dc in ora:view("V_SPC_DC")/ROW
				where $dc/ID_SPC = $no_spc
				return (
					<DOMAINE_COMPETENCE>
						<DESIGN_DC>{$dc/DESIGNATION/text()}</DESIGN_DC>		
						<FCS>{
							for $fc in ora:view("V_SPC_FC_POS")/ROW
							where $fc/ID_DC = $dc/ID_DC
							and $fc/ID_SPC = $no_spc
							return (
								<FC> 
									{$fc/DESIGN_FC}
									{	if ($fc/NIVEAU_RIC/text()=xs:string(1)) then <NIV_RIC>{$brou_FC_RIC/brou_FC_RIC/LV_FC_RIC}</NIV_RIC> else
										if ($fc/NIVEAU_RIC/text()=xs:string(2)) then <NIV_RIC>{$not_FC_RIC/not_FC_RIC/LV_FC_RIC}</NIV_RIC> else 
										if ($fc/NIVEAU_RIC/text()=xs:string(3)) then <NIV_RIC>{$util_FC_RIC/util_FC_RIC/LV_FC_RIC}</NIV_RIC> else 
										if ($fc/NIVEAU_RIC/text()=xs:string(4)) then <NIV_RIC>{$aut_FC_RIC/aut_FC_RIC/LV_FC_RIC}</NIV_RIC> else 
										if ($fc/NIVEAU_RIC/text()=xs:string(5)) then <NIV_RIC>{$exp_FC_RIC/exp_FC_RIC/LV_FC_RIC}</NIV_RIC> else 
										<NIV>{$nul_FC_RIC/nul_FC_RIC/LV_FC_RIC}</NIV>
									}
									{	if ($fc/NIVEAU_SPC/text()=xs:string(1)) then <NIV_SPC>{$brou_FC_SPC/brou_FC_SPC/LV_FC_SPC}</NIV_SPC> else
										if ($fc/NIVEAU_SPC/text()=xs:string(2)) then <NIV_SPC>{$not_FC_SPC/not_FC_SPC/LV_FC_SPC}</NIV_SPC> else 
										if ($fc/NIVEAU_SPC/text()=xs:string(3)) then <NIV_SPC>{$util_FC_SPC/util_FC_SPC/LV_FC_SPC}</NIV_SPC> else 
										if ($fc/NIVEAU_SPC/text()=xs:string(4)) then <NIV_SPC>{$aut_FC_SPC/aut_FC_SPC/LV_FC_SPC}</NIV_SPC> else 
										if ($fc/NIVEAU_SPC/text()=xs:string(5)) then <NIV_SPC>{$exp_FC_SPC/exp_FC_SPC/LV_FC_SPC}</NIV_SPC> else 
										<NIV_SPC>{$nul_FC_SPC/nul_FC_SPC/LV_FC_SPC}</NIV_SPC>
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
										for $cap in ora:view("V_SPC_CAP_POS")/ROW
										where $cap/ID_FC=$fc/ID_FC
										and $cap/ID_SPC=$no_spc
										return (
											<CAPACITE>
												<DESIGN_CAP>{$cap/DESIGNATION/text()}</DESIGN_CAP>
												{	
													if ($cap/NIVEAU_RIC/text()=xs:string(1)) then <NIV_CAP_RIC>{$brou_RIC/brou_RIC/LV_CAP_RIC}</NIV_CAP_RIC> else
													if ($cap/NIVEAU_RIC/text()=xs:string(2)) then <NIV_CAP_RIC>{$not_RIC/not_RIC/LV_CAP_RIC}</NIV_CAP_RIC> else 
													if ($cap/NIVEAU_RIC/text()=xs:string(3)) then <NIV_CAP_RIC>{$util_RIC/util_RIC/LV_CAP_RIC}</NIV_CAP_RIC> else 
													if ($cap/NIVEAU_RIC/text()=xs:string(4)) then <NIV_CAP_RIC>{$aut_RIC/aut_RIC/LV_CAP_RIC}</NIV_CAP_RIC> else 
													if ($cap/NIVEAU_RIC/text()=xs:string(5)) then <NIV_CAP_RIC>{$exp_RIC/exp_RIC/LV_CAP_RIC}</NIV_CAP_RIC> else 
													<NIV_CAP_RIC>{$nul_RIC/nul_RIC/LV_CAP_RIC}</NIV_CAP_RIC>
												}
												{	
													if ($cap/NIVEAU_SPC/text()=xs:string(1)) then <NIV_CAP_SPC>{$brou_SPC/brou_SPC/LV_CAP_SPC}</NIV_CAP_SPC> else
													if ($cap/NIVEAU_SPC/text()=xs:string(2)) then <NIV_CAP_SPC>{$not_SPC/not_SPC/LV_CAP_SPC}</NIV_CAP_SPC> else 
													if ($cap/NIVEAU_SPC/text()=xs:string(3)) then <NIV_CAP_SPC>{$util_SPC/util_SPC/LV_CAP_SPC}</NIV_CAP_SPC> else 
													if ($cap/NIVEAU_SPC/text()=xs:string(4)) then <NIV_CAP_SPC>{$aut_SPC/aut_SPC/LV_CAP_SPC}</NIV_CAP_SPC> else 
													if ($cap/NIVEAU_SPC/text()=xs:string(5)) then <NIV_CAP_SPC>{$exp_SPC/exp_SPC/LV_CAP_SPC}</NIV_CAP_SPC> else 
													<NIV_CAP_SPC>{$nul_SPC/nul_SPC/LV_CAP_SPC}</NIV_CAP_SPC>
												}
											</CAPACITE>)
									}</CAPS>
								</FC>
							)
						}</FCS>						
					</DOMAINE_COMPETENCE>)}
					</DOMAINE_COMPETENCES>'						
	PASSING BY VALUE xmlElement("no_spc",no_spc) as "no_spc",
		xmlElement("nul_FC_RIC",XMLNul_FC_RIC) as "nul_FC_RIC",
		xmlElement("brou_FC_RIC",XMLBr_FC_RIC) as "brou_FC_RIC",
		xmlElement("not_FC_RIC",XMLNot_FC_RIC) as "not_FC_RIC",
		xmlElement("util_FC_RIC",XMLUtil_FC_RIC) as "util_FC_RIC",
		xmlElement("aut_FC_RIC",XMLAut_FC_RIC) as "aut_FC_RIC",
		xmlElement("exp_FC_RIC",XMLExp_FC_RIC) as "exp_FC_RIC",
		xmlElement("nul_FC_SPC",XMLExp_FC_RIC) as "nul_FC_SPC",
		xmlElement("brou_FC_SPC",XMLBr_FC_SPC) as "brou_FC_SPC",
		xmlElement("not_FC_SPC",XMLNot_FC_SPC) as "not_FC_SPC",
		xmlElement("util_FC_SPC",XMLUtil_FC_SPC) as "util_FC_SPC",
		xmlElement("aut_FC_SPC",XMLAut_FC_SPC) as "aut_FC_SPC",
		xmlElement("exp_FC_SPC",XMLExp_FC_SPC) as "exp_FC_SPC",		
		xmlElement("nul_RIC",XMLNul_RIC) as "nul_RIC",
		xmlElement("brou_RIC",XMLBr_RIC) as "brou_RIC",
		xmlElement("not_RIC",XMLNot_RIC) as "not_RIC",
		xmlElement("util_RIC",XMLUtil_RIC) as "util_RIC",
		xmlElement("aut_RIC",XMLAut_RIC) as "aut_RIC",
		xmlElement("exp_RIC",XMLExp_RIC) as "exp_RIC",
		xmlElement("nul_SPC",XMLExp_RIC) as "nul_SPC",
		xmlElement("brou_SPC",XMLBr_SPC) as "brou_SPC",
		xmlElement("not_SPC",XMLNot_SPC) as "not_SPC",
		xmlElement("util_SPC",XMLUtil_SPC) as "util_SPC",
		xmlElement("aut_SPC",XMLAut_SPC) as "aut_SPC",
		xmlElement("exp_SPC",XMLExp_SPC) as "exp_SPC"
	RETURNING CONTENT) 
	INTO XMLcpt
	FROM DUAL;
	-- Recuperation pour un RIC de l ensemble des competences transversales et des notation pour celles-ci
	SELECT 
		XMLQuery(
			'<COMPETENCE_TRANSVERSALES> {
				for $cptt in ora:view("V_SPC_CPTT_POS")/ROW
				where $cptt/ID_SPC = $no_spc
				return (
					<COMPETENCE_TRANSVERSALE>
						<DESIGNATION_CPTT>{$cptt/DESIGNATION/text()}</DESIGNATION_CPTT>
						<DESCRIPTION_CPTT>{$cptt/DESCRIPTION/text()}</DESCRIPTION_CPTT>
							{	if ($cptt/NIVEAU_RIC/text() = 1) then <NIV_RIC>{$lv1_RIC/lv1/LV_CPTT_RIC}</NIV_RIC> else
								if ($cptt/NIVEAU_RIC/text() = 2) then <NIV_RIC>{$lv2_RIC/lv2/LV_CPTT_RIC}</NIV_RIC> else 
								if ($cptt/NIVEAU_RIC/text() = 3) then <NIV_RIC>{$lv3_RIC/lv3/LV_CPTT_RIC}</NIV_RIC> else 
								if ($cptt/NIVEAU_RIC/text() = 4) then <NIV_RIC>{$lv4_RIC/lv4/LV_CPTT_RIC}</NIV_RIC> else 
								if ($cptt/NIVEAU_RIC/text() = 4) then <NIV_RIC>{$lv5_RIC/lv5/LV_CPTT_RIC}</NIV_RIC> else 
								<NIV_RIC>{$lvNul_RIC/lvNul/LV_CPTT_RIC}</NIV_RIC>
							}
							{	if ($cptt/NIVEAU_SPC/text() = 1) then <NIV_SPC>{$lv1_SPC/lv1/LV_CPTT_SPC}</NIV_SPC> else
								if ($cptt/NIVEAU_SPC/text() = 2) then <NIV_SPC>{$lv2_SPC/lv2/LV_CPTT_SPC}</NIV_SPC> else 
								if ($cptt/NIVEAU_SPC/text() = 3) then <NIV_SPC>{$lv3_SPC/lv3/LV_CPTT_SPC}</NIV_SPC> else 
								if ($cptt/NIVEAU_SPC/text() = 4) then <NIV_SPC>{$lv4_SPC/lv4/LV_CPTT_SPC}</NIV_SPC> else 
								if ($cptt/NIVEAU_SPC/text() = 4) then <NIV_SPC>{$lv5_SPC/lv5/LV_CPTT_SPC}</NIV_SPC> else 
								<NIV_SPC>{$lvNul_SPC/lvNul/LV_CPTT_SPC}</NIV_SPC>
							}
					</COMPETENCE_TRANSVERSALE>)}
					</COMPETENCE_TRANSVERSALES>'
	PASSING BY VALUE xmlElement("no_spc",no_spc) as "no_spc", 
		xmlElement("lv1",XMLlv1_RIC) as "lv1_RIC",
		xmlElement("lv2",XMLlv2_RIC) as "lv2_RIC",
		xmlElement("lv3",XMLlv3_RIC) as "lv3_RIC",
		xmlElement("lv4",XMLlv4_RIC) as "lv4_RIC",
		xmlElement("lv5",XMLlv5_RIC) as "lv5_RIC",
		xmlElement("lvNul",XMLlvNul_SPC) as "lvNul_RIC",
		xmlElement("lv1",XMLlv1_SPC) as "lv1_SPC",
		xmlElement("lv2",XMLlv2_SPC) as "lv2_SPC",
		xmlElement("lv3",XMLlv3_SPC) as "lv3_SPC",
		xmlElement("lv4",XMLlv4_SPC) as "lv4_SPC",
		xmlElement("lv5",XMLlv5_SPC) as "lv5_SPC",
		xmlElement("lvNul",XMLlvNul_SPC) as "lvNul_SPC"
	RETURNING CONTENT) 
	INTO XMLcptt
	FROM DUAL;
	
	
	-- Recuperation de l'ensemble des domaines de competence pour ce RIC et pour chacun de ces domaines des familles de competence (FC)
	-- et pour chacune de ces FC les domaines de connaissances associees ainsi que les capacites avec leur notation
	SELECT 
		XMLQuery(
			'<JOURNAUX> {
				for $dc in ora:view("V_SPC_DC")/ROW
				where $dc/ID_SPC = $no_spc
				return (
					<DOMAINE_COMPETENCE>
						<J_DESIGN_DC>{$dc/DESIGNATION/text()}</J_DESIGN_DC>	
						<J_DCs>{
							for $jdc in ora:view("JOURNAL_SUIVI_PERSONNEL")/ROW
							where $jdc/ID_SPC = $no_spc
							and $jdc/ID_DC = $dc/ID_DC
							return (
								<JDC> 
									<JDC_DATE_CRE>{$jdc/DATE_CREATION/text()}</JDC_DATE_CRE>
									<JDC_LIB>{$jdc/LIBELLE/text()}</JDC_LIB>
									<JDC_DESC>{$jdc/DESCRIPTION/text()}</JDC_DESC>
								</JDC>)
						}</J_DCs>
						<FCS>{
							for $fc in ora:view("V_SPC_FC_POS")/ROW
							where $fc/ID_DC = $dc/ID_DC
							and $fc/ID_SPC = $no_spc
							return (
								<FC> 
									<J_DESIGN_FC>{$fc/DESIGN_FC/text()}</J_DESIGN_FC>
									<JFCs>{
									for $jfc in ora:view("JOURNAL_SUIVI_PERSONNEL")/ROW
									where $jfc/ID_SPC = $no_spc
									and $jfc/ID_FC = $fc/ID_FC
									return (
										<JFC> 
											<JFC_DATE_CRE>{$jfc/DATE_CREATION/text()}</JFC_DATE_CRE>
											<JFC_LIB>{$jfc/LIBELLE/text()}</JFC_LIB>
											<JFC_DESC>{$jfc/DESCRIPTION/text()}</JFC_DESC>
										</JFC>
									)}</JFCs>
									<DCOS>{
										for $dco in ora:view("DOMAINE_CONNAISSANCE")/ROW
										where $dco/ID_FC = $fc/ID_FC
										return (
											<DCO>
												<J_DESIGN_DCO>{$dco/DESIGNATION/text()}</J_DESIGN_DCO>
											</DCO>
										)
									} </DCOS>
									<CAPS>{
										for $cap in ora:view("V_SPC_CAP_POS")/ROW
										where $cap/ID_FC=$fc/ID_FC
										and $cap/ID_SPC=$no_spc
										return (
											<CAPACITE>
												<J_DESIGN_CAP>{$cap/DESIGNATION/text()}</J_DESIGN_CAP>
											</CAPACITE>)
									}</CAPS>
								</FC>
							)
						}</FCS>						
					</DOMAINE_COMPETENCE>)}
					</JOURNAUX>'						
	PASSING BY VALUE xmlElement("no_spc",no_spc) as "no_spc"
	RETURNING CONTENT) 
	INTO XMLJrn
	FROM DUAL;	
	
	

	-- Construction de la structure du RIC avec en premier lieu l identification, puis les notations pour les competences standards, enfin les notations pour les competences transversales
	SELECT XMLType('<SPC>' ||XMLidentif.getClobVal() || XMLcpt.getClobVal()|| XMLcptt.getClobVal() || XMLJrn.getClobVal() ||'</SPC>') INTO XMLdoc FROM DUAL;
	-- Ajout d une entete au fichier
	SELECT XMLType('<?xml version="1.0" encoding="ISO-8859-1"?>'|| XMLdoc.getClobVal()) INTO XMLdoc FROM DUAL;
	-- Destruction du précédent fichier s'il existe
	select count(*) INTO FICHIER_EXISTE from resource_view WHERE any_path LIKE url_spc;
	IF  FICHIER_EXISTE=1 THEN
		DBMS_XDB.deleteResource(url_spc);
	END IF;
IF(DBMS_XDB.CREATERESOURCE(url_spc, XMLdoc)) THEN
DBMS_OUTPUT.PUT_LINE('Resource is created');
ELSE
DBMS_OUTPUT.PUT_LINE('Cannot create resource');
END IF;
COMMIT;
END;
/
