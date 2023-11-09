-- !!! LIRE IMPERATIVEMENT "READ_ME" AVANT TOUTE INSTALLATION !!!

--@'K:\Espace Reference\Logiciel SIGILI\03-SIGILI3\ProcedureInstallation14-11-06\02-Script_création_utilisateur_FA09.sql'
--@'K:\Espace Reference\Logiciel SIGILI\03-SIGILI3\ProcedureInstallation14-11-06\03-Install.sql'

SPOOL creation-bdd.lst

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Procedure 1  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
@@04-PROC1_DESIGNER.sql

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Procedure 2  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
@@05-PROC2_DELTAS.sql

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Procedure 3  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
@@06-PROC3_XMLDB.sql

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Lancement du jeu d'essai  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
@@09-jeu_essai_partiel.sql

SPOOL OFF
COMMIT;