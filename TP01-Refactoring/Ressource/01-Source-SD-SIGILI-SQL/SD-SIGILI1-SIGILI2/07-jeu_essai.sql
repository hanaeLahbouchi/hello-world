-- les scripts suivants permettent d'insérer les données dans las tables crées précédemment
-- Ces scripts sont ordonnés par CSCI :
--		- CSCI_RAP : Gestion du Referentiel d'Apprentissage ILI
--		- CSCI_ADM : Gestion Administrative de la formation ILI
--		- CSCI_CON : Gestion de contenu
--		- CSCI_SAC : Suivi annuel des compagnies
--		- CSCI_STA : Gestion des stages

SPOOL jeu_essai.lst

PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_RAP ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_RAP\CADRE_REFERENT.sql
@@05-INSERT\CSCI_RAP\UE.sql
@@05-INSERT\CSCI_RAP\PROCESSUS_APPRENTISSAGE.sql
@@05-INSERT\CSCI_RAP\EC.sql

PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_STA_1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_STA\NOTATION_STAGE.sql

PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_ADM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_ADM\ENSEIGNANT.sql
@@05-INSERT\CSCI_ADM\PROMOTION.sql
@@05-INSERT\CSCI_ADM\COMPAGNIE.sql
@@05-INSERT\CSCI_ADM\AUTHENTIFICATION_1.sql
@@05-INSERT\CSCI_ADM\ENTREPRISE.sql
@@05-INSERT\CSCI_ADM\EMPLOYE.sql
@@05-INSERT\CSCI_ADM\ETUDIANT.sql
@@05-INSERT\CSCI_ADM\AUTHENTIFICATION_2.sql
@@05-INSERT\CSCI_ADM\DIPLOME.sql
@@05-INSERT\CSCI_ADM\ROLE_PERMANENT.sql
@@05-INSERT\CSCI_ADM\POSTE_ENTREPRISE.sql
@@05-INSERT\CSCI_ADM\INTERVENTION.sql
@@05-INSERT\CSCI_ADM\INTERVENTION_COMPAGNIE.sql
@@05-INSERT\CSCI_ADM\ROLE.sql
@@05-INSERT\CSCI_ADM\ROLE_ANNUEL.sql
@@05-INSERT\CSCI_ADM\FONCTION.sql
@@05-INSERT\CSCI_ADM\LST_FONCTION.sql
@@05-INSERT\CSCI_ADM\LETTRE.sql
@@05-INSERT\CSCI_ADM\CANDIDAT.sql
@@05-INSERT\CSCI_ADM\ENTREPRISE_JN.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_CON_1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_CON\REGROUPEMENT_RES.sql
@@05-INSERT\CSCI_CON\DOMAINE_RES.sql
@@05-INSERT\CSCI_CON\RUBRIQUE.sql
@@05-INSERT\CSCI_CON\RESSOURCE.sql
@@05-INSERT\CSCI_CON\FAS.sql
@@05-INSERT\CSCI_CON\VFAS.sql
@@05-INSERT\CSCI_CON\AFFECTATION_RES_VFAS.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_SAC_1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_SAC\SEQUENCE.sql
@@05-INSERT\CSCI_SAC\COMPTE_RENDU_REUNION.sql
@@05-INSERT\CSCI_SAC\AFFECTATION_CRR_ETU.sql
@@05-INSERT\CSCI_SAC\PRODUIT.sql
@@05-INSERT\CSCI_SAC\FA.sql
@@05-INSERT\CSCI_SAC\AFFECTATION_ETUDIANT.sql
@@05-INSERT\CSCI_SAC\AFFECTATION_PRODUIT.sql
@@05-INSERT\CSCI_SAC\AFFECTATION_PDT_VFAS.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_CON_2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_CON\AFFECTATION_RES_FA.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_STA_2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_STA\OFFRE_STAGE.sql
@@05-INSERT\CSCI_STA\SOUTENANCE.sql
@@05-INSERT\CSCI_STA\STAGE.sql
@@05-INSERT\CSCI_STA\VISITE_STAGE.sql
@@05-INSERT\CSCI_STA\VFAS_PA.sql
@@05-INSERT\CSCI_STA\AVENANT.sql
@@05-INSERT\CSCI_STA\CONTACT_STAGE.sql
@@05-INSERT\CSCI_STA\STRUCTURE_EVALUATION.sql
@@05-INSERT\CSCI_STA\EVALUATION_ENTREPRISE.sql
@@05-INSERT\CSCI_STA\CRITERE_ENTREPRISE.sql
@@05-INSERT\CSCI_STA\CODE_NOTATION.sql
@@05-INSERT\CSCI_STA\NOTE_ENTREPRISE.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ CSCI_SAC_2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\CSCI_SAC\VERSION.sql


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~ GLOBAL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\GLOBAL\PARAMETRE.sql
@@05-INSERT\GLOBAL\CG_REF_CODES.sql
@@05-INSERT\GLOBAL\DOMAINE.sql

PROMPT~~~~~~~~~~~~~~~~~~~ Modifications des sequences ~~~~~~~~~~~~~~~~~~~~~~

@@05-INSERT\Sequences.sql

SPOOL OFF
COMMIT;




