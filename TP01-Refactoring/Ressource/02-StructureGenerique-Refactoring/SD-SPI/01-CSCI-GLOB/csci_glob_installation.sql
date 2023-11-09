-- 
-- Script d'installation du CSCI-GLOB
-- Ph. Saliou - 04 octobre 2012 - 
--	

-- Cr�ation des �l�ments DDL :  tables, vues, index, ...
@@01-CREATION\01-DDL\csci_glob_tab
@@01-CREATION\01-DDL\csci_glob_ind

-- Cr�ation des API de table
@@01-CREATION\02-API\csci_glob_api

-- Cr�ation des autres �l�ments PLSQL : proc�dures, package, triggers  
@@01-CREATION\03-PLSQL\csci_glob_plsql

-- Cr�ation du jeu d'essai
@@02-JEU-ESSAI\csci_glob_jeu_essai
