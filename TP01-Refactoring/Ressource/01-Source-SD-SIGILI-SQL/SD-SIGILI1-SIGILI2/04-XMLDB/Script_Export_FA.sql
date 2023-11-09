
--**********************************************
--*              ETAPE 1                       *
--**********************************************

--Creation de la vue basé sur le document XML (LST_FA)
CREATE OR REPLACE VIEW V_FA AS
SELECT F.ID_FA AS ID_FA, Ue.SIGLE_UE AS SIGLE_UE, Ue.ID_UE AS ID_UE, Ec.SIGLE_EC AS SIGLE_EC, Ec.ID_EC AS ID_EC, Se.DESIGNATION AS SEQUENCE, F.SIGLE_FA AS SIGLE_FA, F.DESIGNATION AS DESIGNATION, F.DESCRIPTION_TEXTUELLE AS DESCRIPTION_TEXTUELLE, F.DATE_ELABORATION AS DATE_ELABORATION, F.DATE_DEBUT_ESTIME AS DATE_DEBUT_ESTIME, F.DATE_FIN_ESTIME AS DATE_FIN_ESTIME, Co.NOM AS COMPAGNIE, En.PRENOM ||' '|| En.NOM AS EENSEIGNANT, Ec.DESIGNATION AS EC, Ue.DESIGNATION AS UE, Et.PRENOM || ' ' || Et.NOM AS LETUDIANT, Ae.CHARGE AS CHARGE, Co.NOM_PROJET AS AFFAIRE, F.AUTRES_RES_PEDA AS AUTRES_RES_PEDA
FROM FA F, COMPAGNIE Co, ETUDIANT Et, ENSEIGNANT En, EC Ec, SEQUENCE Se, UE Ue, AFFECTATION_ETUDIANT Ae
WHERE F.CODE_COM = Co.CODE_COM
AND F.NO_ENSEIGNANT = En.NO_ENSEIGNANT
AND F.ID_EC = Ec.ID_EC
AND F.NO_SEQUENCE = Se.NO_SEQUENCE
AND F.CODE_COM = Se.CODE_COM
AND Ue.NO_UE = Ec.ID_UE
AND F.ID_FA = Ae.ID_FA
AND Ae.NO_ETUDIANT_NAT = Et.NO_ETUDIANT_NAT;

--Creation du repertoire FAS
declare
  result boolean;
begin
  result := dbms_xdb.createFolder('/FAS');
  result := dbms_xdb.createFolder('/FAS/xsd');
  result := dbms_xdb.createFolder('/FAS/xsl');
  
  dbms_xdb.setAcl('/FAS','/sys/acls/DroitFA.xml');
  dbms_xdb.setAcl('/FAS/xsd','/sys/acls/DroitFA.xml');
  dbms_xdb.setAcl('/FAS/xsl','/sys/acls/DroitFA.xml');
end;
/

commit;
-- ************ FIN de l'étape 1 **************



--************************************************
--*              ETAPE 2                         * 
--* Seulement si les fichiers schemaFA.xsd       *
--* et EmptyFA.xsl on été copiés dans XMLDB      *
--*                                              *
--* Ne pas oublier de modifier le nom du serveur *
--************************************************

--Register du schema
begin
dbms_xmlschema.registerSchema
(
----- MODIFIER LE NOM DU SERVEUR -----------
'http://cili1serv1.ili2006.univ-brest.fr:8080/FAS/xsd/schemaFA.xsd',
xdbURIType('/FAS/xsd/schemaFA.xsd').getClob(),
true,true,false,true
);
End;
/


create table bck_lst_path as select ANY_PATH from resource_view;


--Procedure pour importer les données XML vers la BDD
create or replace procedure SYNCH_FA AS
      
        -- Champ contenu dans le fichier XML
	L_ID_FA FA.ID_FA%type;
	L_DESIGNATION FA.DESIGNATION%type;
	L_DESC FA.DESCRIPTION_TEXTUELLE%type;
	L_PEDA FA.AUTRES_RES_PEDA%type;
        L_NO_VERSION_VFAS FA.NO_VERSION_VFAS%type;
        L_NO_FA FA.NO_FA%type;
        L_SIGLE_FA FA.SIGLE_FA%type;
        L_DATE_ELABORATION FA.DATE_ELABORATION%type;
        L_DATE_DEBUT_ESTIME FA.DATE_DEBUT_ESTIME%type;
        L_DATE_FIN_ESTIME FA.DATE_FIN_ESTIME%type;
        L_SIGLE_EC EC.SIGLE_EC%type; 
        L_SIGLE_UE UE.SIGLE_UE%type; 
        
        -- Pour récupérer les identifiants des EC et UE a mettre dans la FA
        ID_EC_ INTEGER;
        ID_UE_ INTEGER;
        
        --Variable temporaire
        resultat INTEGER;
      
        -- Variable pour la gestion des exceptions
        FA_invalide EXCEPTION;
        UE_invalide EXCEPTION;
        EC_invalide EXCEPTION;
        UE_UC_incompatible EXCEPTION;
        
	-- Declaration du curseur pour selectionner les nouvelles ressources
	CURSOR FA_DATA IS 
        select 
          extractValue(OBJECT_VALUE, '/LST_FA/ID_FA'), 
          extractValue(OBJECT_VALUE, '/LST_FA/DESIGNATION'),
          extractValue(OBJECT_VALUE, '/LST_FA/DESCRIPTION_TEXTUELLE'), 
          extractValue(OBJECT_VALUE, '/LST_FA/AUTRES_RES_PEDA'),
          extractValue(OBJECT_VALUE, '/LST_FA/NO_VERSION_VFAS'),
          extractValue(OBJECT_VALUE, '/LST_FA/NO_FA'),
          extractValue(OBJECT_VALUE, '/LST_FA/SIGLE_FA'),
          extractValue(OBJECT_VALUE, '/LST_FA/DATE_ELABORATION'),
          extractValue(OBJECT_VALUE, '/LST_FA/DATE_DEBUT_ESTIME'),
          extractValue(OBJECT_VALUE, '/LST_FA/DATE_FIN_ESTIME'),
          extractValue(OBJECT_VALUE, '/LST_FA/SIGLE_EC'),
          extractValue(OBJECT_VALUE, '/LST_FA/SIGLE_UE')
        FROM LST_FA;       
	
BEGIN
	-- On prend les FA qui ne sont pas 
	OPEN FA_DATA; -- ouverture du curseur 
  	LOOP
    		FETCH FA_DATA INTO L_ID_FA, L_DESIGNATION, L_DESC, L_PEDA,L_NO_VERSION_VFAS,L_NO_FA,L_SIGLE_FA,L_DATE_ELABORATION,L_DATE_DEBUT_ESTIME,L_DATE_FIN_ESTIME,L_SIGLE_EC,L_SIGLE_UE; 
    		EXIT WHEN FA_DATA%NOTFOUND;
                
               -- On vérifie que la FA existe
                SELECT count(ID_FA) into resultat FROM FA WHERE ID_FA = L_ID_FA;
                IF(resultat = 0) THEN 
                  RAISE FA_invalide;
                END IF;
                
                -- On vérifie que l'EC Existe
                SELECT ID_EC,count(ID_EC) into ID_EC_,resultat FROM EC WHERE SIGLE_EC LIKE '%' || L_SIGLE_EC || '%';
                IF(resultat = 0) THEN 
                  RAISE EC_invalide;
                END IF;
                
                -- On vérifie que l'UE Existe
                SELECT ID_UE,count(ID_UE) into ID_UE_,resultat FROM UE WHERE SIGLE_UE LIKE '%' || L_SIGLE_UE || '%';  
                IF(resultat = 0) THEN 
                  RAISE UE_invalide;
                END IF;
                
                -- On vérifie que l'UE et l'EC saisie sont compatibles
                SELECT ID_UE into resultat FROM EC WHERE ID_EC = ID_EC_;
                IF (resultat <> ID_UE_) THEN
                  RAISE UE_UC_incompatible;
                END IF;
                   
                -- On modifie le contenu de la table FA
                UPDATE FA SET 
                 NO_VERSION_VFAS = L_NO_VERSION_VFAS,
                 NO_FA = L_NO_FA,
                 SIGLE_FA = L_SIGLE_FA,
                 DESIGNATION = L_DESIGNATION,
                 DESCRIPTION_TEXTUELLE = L_DESC,
                 DATE_ELABORATION = L_DATE_ELABORATION,
                 DATE_DEBUT_ESTIME = L_DATE_DEBUT_ESTIME,
                 DATE_FIN_ESTIME = L_DATE_FIN_ESTIME,
                 AUTRES_RES_PEDA = L_PEDA,
                 ID_EC = ID_EC_
                WHERE ID_FA = L_ID_FA;  
                
  	END LOOP;
  	CLOSE FA_DATA;
        
        DELETE FROM LST_FA;
        
        --On va suprimmer dans bck_lst les ressources inutiles
        DELETE FROM bck_lst_path;
        INSERT INTO bck_lst_path (ANY_PATH) SELECT ANY_PATH FROM resource_view;
        
END;
/
commit;
-- ************ FIN de l'étape 2 **************


