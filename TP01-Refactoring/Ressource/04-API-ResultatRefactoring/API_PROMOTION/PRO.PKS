
PROMPT Creating API Package Specification for Table 'PROMOTION'
--------------------------------------------------------------------------------
-- Name:        cg$PROMOTION
-- Description: PROMOTION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$PROMOTION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
PRO_PK CONSTANT VARCHAR2(240) := '';
PRO_STRE_FK CONSTANT VARCHAR2(240) := '';
PRO_NOTS_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P2ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P20SIGLE_PRO CONSTANT VARCHAR2(240) := 'Sigle Pro';
P30NB_ETU_SOUHAITE CONSTANT VARCHAR2(240) := 'Nb Etu Souhaite';
P40ETAT_PRESELECTION CONSTANT VARCHAR2(240) := 'Etat Preselection';
P50DATE_RENTREE CONSTANT VARCHAR2(240) := 'Date Rentree';
P60LIEU_RENTREE CONSTANT VARCHAR2(240) := 'Lieu Rentree';
P70DATE_REPONSE_LP CONSTANT VARCHAR2(240) := 'Date Reponse Lp';
P80COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';
P90DATE_REPONSE_LALP CONSTANT VARCHAR2(240) := 'Date Reponse Lalp';
P100PROCESSUS_STAGE CONSTANT VARCHAR2(240) := 'Processus Stage';
P110NO_BAREME CONSTANT VARCHAR2(240) := 'No Bareme';
P120NO_EVALUATION CONSTANT VARCHAR2(240) := 'No Evaluation';

cg$row PROMOTION%ROWTYPE;

--  PROMOTION row type variable 
TYPE cg$row_type IS RECORD
(ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,SIGLE_PRO cg$row.SIGLE_PRO%TYPE
,NB_ETU_SOUHAITE cg$row.NB_ETU_SOUHAITE%TYPE
,ETAT_PRESELECTION cg$row.ETAT_PRESELECTION%TYPE
,DATE_RENTREE cg$row.DATE_RENTREE%TYPE
,LIEU_RENTREE cg$row.LIEU_RENTREE%TYPE
,DATE_REPONSE_LP cg$row.DATE_REPONSE_LP%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,DATE_REPONSE_LALP cg$row.DATE_REPONSE_LALP%TYPE
,PROCESSUS_STAGE cg$row.PROCESSUS_STAGE%TYPE
,NO_BAREME cg$row.NO_BAREME%TYPE
,NO_EVALUATION cg$row.NO_EVALUATION%TYPE
,the_rowid ROWID)
;

--  PROMOTION indicator type variable
TYPE cg$ind_type IS RECORD
(ANNEE_PRO BOOLEAN DEFAULT FALSE
,SIGLE_PRO BOOLEAN DEFAULT FALSE
,NB_ETU_SOUHAITE BOOLEAN DEFAULT FALSE
,ETAT_PRESELECTION BOOLEAN DEFAULT FALSE
,DATE_RENTREE BOOLEAN DEFAULT FALSE
,LIEU_RENTREE BOOLEAN DEFAULT FALSE
,DATE_REPONSE_LP BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE
,DATE_REPONSE_LALP BOOLEAN DEFAULT FALSE
,PROCESSUS_STAGE BOOLEAN DEFAULT FALSE
,NO_BAREME BOOLEAN DEFAULT FALSE
,NO_EVALUATION BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  PROMOTION primary key type variable
TYPE cg$pk_type IS RECORD
(ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF PROMOTION%ROWTYPE
     INDEX BY BINARY_INTEGER;
cg$table cg$table_type;

TYPE cg$tableind_type IS TABLE OF cg$ind_type
     INDEX BY BINARY_INTEGER;
cg$tableind cg$tableind_type;
idx BINARY_INTEGER := 1;

PROCEDURE   ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   upd(cg$rec             IN OUT cg$row_type,
                cg$ind             IN OUT cg$ind_type,
                do_upd             IN BOOLEAN     DEFAULT TRUE,
                cg$pk              IN cg$row_type DEFAULT NULL      
               );
PROCEDURE   del(cg$pk  IN cg$pk_type,
                do_del IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE
               );
PROCEDURE   slct(cg$sel_rec IN OUT cg$row_type);

PROCEDURE   validate_arc(cg$rec IN OUT cg$row_type);

PROCEDURE   validate_domain(cg$rec IN OUT cg$row_type,
                            cg$ind IN cg$ind_type DEFAULT cg$ind_true);

PROCEDURE   validate_foreign_keys_ins(cg$rec IN cg$row_type);
PROCEDURE   validate_foreign_keys_upd(cg$rec IN cg$row_type, 
                                      cg$old_rec IN cg$row_type, 
                                      cg$ind IN cg$ind_type);
PROCEDURE   validate_foreign_keys_del(cg$rec IN cg$row_type);

PROCEDURE   validate_domain_cascade_delete(cg$old_rec IN cg$row_type);        
PROCEDURE   validate_domain_cascade_update(cg$old_rec IN cg$row_type);        

PROCEDURE   cascade_update(cg$new_rec IN OUT cg$row_type,
                           cg$old_rec IN cg$row_type );
PROCEDURE   domain_cascade_update(cg$new_rec IN OUT cg$row_type,              
                                  cg$new_ind IN OUT cg$ind_type,
                                  cg$old_rec IN     cg$row_type);
PROCEDURE   domain_cascade_upd( cg$rec     IN OUT cg$row_type,                
                                cg$ind     IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type);

PROCEDURE   cascade_delete(cg$old_rec IN OUT cg$row_type);
PROCEDURE   domain_cascade_delete(cg$old_rec IN cg$row_type);

PROCEDURE   upd_denorm2( cg$rec IN cg$row_type,
                         cg$ind IN cg$ind_type );
PROCEDURE   upd_oper_denorm2( cg$rec IN cg$row_type,
                              cg$old_rec IN cg$row_type,
                              cg$ind IN cg$ind_type,
                              operation IN VARCHAR2 DEFAULT 'UPD' );
END cg$PROMOTION;
/

