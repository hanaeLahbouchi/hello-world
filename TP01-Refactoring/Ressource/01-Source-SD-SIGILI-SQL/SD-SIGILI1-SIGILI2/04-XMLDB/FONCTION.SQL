--Creation de la fonction de reverse_string qui permet le découpage d'un PATH donné en paramètre
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Création des fonctions et procédures stockées ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
CREATE OR REPLACE FUNCTION reverse_string(string_in VARCHAR2)
RETURN VARCHAR2 AS
 
        v_new_string    VARCHAR2(4000);
        v_length        PLS_INTEGER := NVL(LENGTH(string_in),0);
 
BEGIN
        FOR i IN REVERSE 1..v_length
        LOOP
             v_new_string := v_new_string ||
             			SUBSTR(string_in, i, 1);
        END LOOP;
 
   RETURN v_new_string;
END reverse_string;
/ 

-- Fonction de Synchronisation de la table RESSOURCES de SIGILI2g
-- Avec la view ressources_view de XMLDB
 
create or replace procedure SYNCH_TABLE_RESOURCE AS
	LA_RUB RUBRIQUE.ID_RUB%type;
	N_ORDRE RUBRIQUE.NO_ORDRE%type;
	L_EXT VARCHAR(3);
	L_DESIGNATION RESSOURCE.DESIGNATION%type;
	L_URL RESSOURCE.URL_ADRESSE%type;
	LE_FICHIER RESOURCE_VIEW.ANY_PATH%type;
	LE_PATH_RUB RUBRIQUE.PATH_RUB%type;
	LA_RUBRIQUE RUBRIQUE.DESIGNATION%type;
	NB_RUB NUMBER;

	-- Declaration du curseur pour selectionner les nouvelles ressources
	CURSOR N_PROD IS select ANY_PATH from resource_view MINUS select ANY_PATH from bck_lst_path;

BEGIN
	OPEN N_PROD; -- ouverture du curseur 
  	LOOP
    		FETCH N_PROD INTO LE_FICHIER; 
    		EXIT WHEN N_PROD%NOTFOUND;
		
		LA_RUB := 0;
 		LA_RUBRIQUE := reverse_string(SUBSTR(reverse_string(LE_FICHIER),INSTR(reverse_string(LE_FICHIER), '/') +1,INSTR(reverse_string(LE_FICHIER), '/', 1, 2)-INSTR(reverse_string(LE_FICHIER), '/') -1));
		LE_PATH_RUB := reverse_string(SUBSTR(reverse_string(LE_FICHIER), INSTR(reverse_string(LE_FICHIER), '/') + 1, LENGTH(LE_FICHIER) - INSTR(reverse_string(LE_FICHIER), '/') + 1));
		SELECT COUNT(*) INTO NB_RUB FROM RUBRIQUE WHERE DESIGNATION = LA_RUBRIQUE; 
 		IF( NB_RUB <> 0) THEN
  			-- Selectionner la rubrique correspondante
  			SELECT ID_RUB INTO LA_RUB FROM RUBRIQUE WHERE PATH_RUB = LE_PATH_RUB;
 		END IF;
 		IF (LA_RUB = 0) THEN
  			SELECT MAX(ID_RUB) INTO LA_RUB FROM RUBRIQUE;
  			LA_RUB := LA_RUB + 1;
  			--Comme nouvelle rubrique, il faut l'inserer dans la table rubrique
  			--INSERT INTO RUBRIQUE (ID_RUB, NO_ORDRE, DESIGNATION) VALUES (LA_RUB, 1, LA_RUBRIQUE);
 		END IF;
 		-- Selection du numéro d'ordre dans la rubrique
 		N_ORDRE := 0;
 		SELECT NVL(MAX(NO_ORDRE), 0) INTO N_ORDRE FROM RUBRIQUE WHERE ID_RUB = LA_RUB;

 		IF(N_ORDRE = 0) THEN
  			N_ORDRE := 1;
		ELSE
			N_ORDRE := N_ORDRE + 1;
 		END IF;
 		-- Récupération du nom de fichier
 		L_DESIGNATION := reverse_string(SUBSTR(reverse_string(LE_FICHIER),1,INSTR(reverse_string(LE_FICHIER), '/')-1));

 		insert into bck_lst_path (ANY_PATH) VALUES (LE_FICHIER);

 		-- Insertion dans la base de données
 		INSERT INTO RESSOURCE (ID_RUB, TYPE_RES, NO_ORDRE, DESIGNATION, URL_PATH_FICHIER) VALUES (LA_RUB, 'DIV', N_ORDRE, L_DESIGNATION, LE_FICHIER); 		

  	END LOOP;
  	CLOSE N_PROD;	
	
END;
/


