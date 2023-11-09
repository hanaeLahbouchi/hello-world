-- Certaines sequences doivent etre incrementees
-- Pour cela, il est necessaire de supprimer la sequence puis de la recreer

PROMPT~~~~~~~~~~~~~~~~~~~~~~~ modification des séquences ~~~~~~~~~~~~~~~~~~~~~
PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences ENT_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE ENT_SEQ;
CREATE SEQUENCE "ENT_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 9 CACHE 20;


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences OFF_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE OFF_SEQ;
CREATE SEQUENCE "OFF_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20;


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences CODN_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE CODN_SEQ;
CREATE SEQUENCE "CODN_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20;


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences CRR_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE CRR_SEQ;
CREATE SEQUENCE "CRR_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20;


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences ACE_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE ACE_SEQ;
CREATE SEQUENCE "ACE_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20;


PROMPT~~~~~~~~~~~~~~~~~~~~~~~~~~~ séquences VER_SEQ ~~~~~~~~~~~~~~~~~~~~~~~~~~

DROP SEQUENCE VER_SEQ;
CREATE SEQUENCE "VER_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 5 CACHE 20;


