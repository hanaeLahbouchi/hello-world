create or replace PROCEDURE Editer_MC (url_mc IN VARCHAR2, code_mcp IN VARCHAR2) IS
	-----------------------------------------------------------------------------
	-- Editer_RIC : permet d extraire des donnees pour generer un fichier XML  --
	-- Arguments :                                                             --
	--     url_ric => adresse physique ou sera stocke le fichier XML           --
	--     no_ric  => numero du ric a extraire                                 --
	--                          ©Reservoir Soft 2007                           --
	--                     Alexis BELLION / Fabienne ROSEC                     --
	--                               13/03/2007                                --
	-----------------------------------------------------------------------------
	XMLidentif XMLType; XMLcpts XMLType;  XMLcptts XMLType;XMLdivers XMLType;-- Differentes parties du fichier XML final
	XMLdoc XMLType;  -- Document XML global et final
	FICHIER_EXISTE NUMBER(1);  -- Fichier physique
BEGIN
-------------------------------------------------------------------------------------------------------------------------------
	SELECT
			XMLQuery('for $mc in ora:view("MODELE_COMPETENCE")/ROW
					where $mc/CODE_MCP = $code_mcp
					return (
						<ENTETE>
							{$mc/DIPLOME}
							{$mc/DISCIPLINE}
							{$mc/DESCRIPTIF}
						</ENTETE>
					)'
		PASSING BY VALUE xmlElement("code_mcp",code_mcp) as "code_mcp"
		RETURNING CONTENT)
		INTO XMLidentif
		FROM DUAL;
-------------------------------------------------------------------------------------------------------------------------------
	SELECT
			XMLQuery('<CPTs> {
					for $dc in ora:view("DOMAINE_COMPETENCE")/ROW
						where $dc/CODE_MCP = $code_mcp
						return (
							<DOM_CPT>
								<DES_DC>{$dc/DESIGNATION/text()}</DES_DC>
								<FCPTs>{
									for $fc in ora:view("FAMILLE_COMPETENCE")/ROW
									where $fc/ID_DC = $dc/ID_DC
									return (
										<FCPT>
											<DES_FC>{$fc/DESIGNATION/text()}</DES_FC>
											<DCOs> {
												for $dco in ora:view("DOMAINE_CONNAISSANCE")/ROW
												where $dco/ID_FC = $fc/ID_FC
												return (<DCO><DES_DCO>{$dco/DESIGNATION/text()}</DES_DCO></DCO>)
											}</DCOs>
											<CAPs>{
												for $cap in ora:view("CAPACITE")/ROW
												where $cap/ID_FC = $fc/ID_FC
												return (<CAP><DES_CAP>{$cap/DESIGNATION/text()}</DES_CAP></CAP>)
											}
											</CAPs>
										</FCPT>
									)
								}
								</FCPTs>
							</DOM_CPT>
						)
					}
				</CPTs>'
		PASSING BY VALUE xmlElement("code_mcp",code_mcp) as "code_mcp"
		RETURNING CONTENT)
		INTO XMLcpts
		FROM DUAL;
-------------------------------------------------------------------------------------------------------------------------------
	SELECT XMLQuery('<CPTTs> {
					for $cptt in ora:view("COMPETENCE_TRANSVERSALE")/ROW
					where $cptt/CODE_MCP = $code_mcp
					return (
						<CPTT>
							<DES_CPTT>{$cptt/DESIGNATION/text()}</DES_CPTT>
							<DESC_CPTT>{$cptt/DESCRIPTION/text()}</DESC_CPTT>
						</CPTT>
					)
					}</CPTTs>'
	PASSING BY VALUE xmlElement("code_mcp",code_mcp) as "code_mcp"
		RETURNING CONTENT)
		INTO XMLcptts
		FROM DUAL;
-------------------------------------------------------------------------------------------------------------------------------
	SELECT
			XMLQuery('for $mc in ora:view("MODELE_COMPETENCE")/ROW
					where $mc/CODE_MCP = $code_mcp
					return (
						<DIVERS>
							{$mc/DEBOUCHES}
							{$mc/REFERENCE_STAGE}
							{$mc/CONTACT}
						</DIVERS>
					)'
		PASSING BY VALUE xmlElement("code_mcp",code_mcp) as "code_mcp"
		RETURNING CONTENT)
		INTO XMLdivers
		FROM DUAL;
	-- Construction de la structure du RIC avec en premier lieu l identification, puis les notations pour les competences standards, enfin les notations pour les competences transversales
	SELECT XMLType('<FICHE>' ||XMLidentif.getClobVal() || XMLcpts.getClobVal() || XMLcptts.getClobVal() || XMLdivers.getClobVal() ||'</FICHE>') INTO XMLdoc FROM DUAL;
	-- Ajout d une entete au fichier
	SELECT XMLType('<?xml version="1.0" encoding="ISO-8859-1"?>'|| XMLdoc.getClobVal()) INTO XMLdoc FROM DUAL;
	-- Destruction du précédent fichier s'il existe
	select count(*) INTO FICHIER_EXISTE from resource_view WHERE any_path LIKE url_mc;
	IF  FICHIER_EXISTE=1 THEN
		DBMS_XDB.deleteResource(url_mc);
	END IF;
IF(DBMS_XDB.CREATERESOURCE(url_mc, XMLdoc)) THEN
DBMS_OUTPUT.PUT_LINE('Resource is created');
ELSE
DBMS_OUTPUT.PUT_LINE('Cannot create resource');
END IF;
COMMIT;
END;
/
