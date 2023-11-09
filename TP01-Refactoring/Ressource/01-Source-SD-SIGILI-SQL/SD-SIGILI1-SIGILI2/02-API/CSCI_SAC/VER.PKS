
PROMPT Creating API Package Specification for Table 'VERSION'
--------------------------------------------------------------------------------
-- Name:        cg$VERSION
-- Description: VERSION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$VERSION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
VER_PK CONSTANT VARCHAR2(240) := '';
VER_CRR_FK CONSTANT VARCHAR2(240) := '';
VER_CODN_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_VPRO CONSTANT VARCHAR2(240) := 'Identifiant de la version';
P20NO_CRR CONSTANT VARCHAR2(240) := 'No Compte rendu';
P30NO_VERSION CONSTANT VARCHAR2(240) := 'No Version';
P40DATE_LIVRAISON_SOUHAITEE CONSTANT VARCHAR2(240) := 'Date Livraison Souhaitée';
P50DATE_RECEPTION_PAPIER CONSTANT VARCHAR2(240) := 'Date Réception Papier';
P60DATE_RECEPTION_NUMERIQUE CONSTANT VARCHAR2(240) := 'Date Réception Numérique';
P70REFERENCE CONSTANT VARCHAR2(240) := 'Référence';
P80ETAT_EVALUATION CONSTANT VARCHAR2(240) := 'Etat Evaluation';
P90DATE_EVALUATION CONSTANT VARCHAR2(240) := 'Date Evaluation';
P100COMMENTAIRE_EVALUATION CONSTANT VARCHAR2(240) := 'Commentaire Evaluation';
P110DATE_DEBRIEFING CONSTANT VARCHAR2(240) := 'Date Débriefing';
P120NOTE_FORMATIVE CONSTANT VARCHAR2(240) := 'Note formative';

cg$row VERSION%ROWTYPE;

--  VERSION row type variable 
TYPE cg$row_type IS RECORD
(NO_VPRO cg$row.NO_VPRO%TYPE
,NO_CRR cg$row.NO_CRR%TYPE
,NO_VERSION cg$row.NO_VERSION%TYPE
,DATE_LIVRAISON_SOUHAITEE cg$row.DATE_LIVRAISON_SOUHAITEE%TYPE
,DATE_RECEPTION_PAPIER cg$row.DATE_RECEPTION_PAPIER%TYPE
,DATE_RECEPTION_NUMERIQUE cg$row.DATE_RECEPTION_NUMERIQUE%TYPE
,REFERENCE cg$row.REFERENCE%TYPE
,ETAT_EVALUATION cg$row.ETAT_EVALUATION%TYPE
,DATE_EVALUATION cg$row.DATE_EVALUATION%TYPE
,COMMENTAIRE_EVALUATION cg$row.COMMENTAIRE_EVALUATION%TYPE
,DATE_DEBRIEFING cg$row.DATE_DEBRIEFING%TYPE
,NOTE_FORMATIVE cg$row.NOTE_FORMATIVE%TYPE
,the_rowid ROWID)
;

--  VERSION indicator type variable
TYPE cg$ind_type IS RECORD
(NO_VPRO BOOLEAN DEFAULT FALSE
,NO_CRR BOOLEAN DEFAULT FALSE
,NO_VERSION BOOLEAN DEFAULT FALSE
,DATE_LIVRAISON_SOUHAITEE BOOLEAN DEFAULT FALSE
,DATE_RECEPTION_PAPIER BOOLEAN DEFAULT FALSE
,DATE_RECEPTION_NUMERIQUE BOOLEAN DEFAULT FALSE
,REFERENCE BOOLEAN DEFAULT FALSE
,ETAT_EVALUATION BOOLEAN DEFAULT FALSE
,DATE_EVALUATION BOOLEAN DEFAULT FALSE
,COMMENTAIRE_EVALUATION BOOLEAN DEFAULT FALSE
,DATE_DEBRIEFING BOOLEAN DEFAULT FALSE
,NOTE_FORMATIVE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  VERSION primary key type variable
TYPE cg$pk_type IS RECORD
(NO_VPRO cg$row.NO_VPRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF VERSION%ROWTYPE
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
END cg$VERSION;
/

