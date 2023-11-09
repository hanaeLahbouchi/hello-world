
PROMPT Creating API Package Specification for Table 'RECUEIL_INDIVIDUEL_COMPETENCE'
--------------------------------------------------------------------------------
-- Name:        cg$RECUEIL_INDIVIDUEL_COMPETEN
-- Description: RECUEIL_INDIVIDUEL_COMPETENCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$RECUEIL_INDIVIDUEL_COMPETEN IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
RIC_PK CONSTANT VARCHAR2(240) := '';
RIC_DRIC_FK CONSTANT VARCHAR2(240) := '';
RIC_SPC_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_RIC CONSTANT VARCHAR2(240) := 'Id';
P2ID_SPC CONSTANT VARCHAR2(240) := 'Id';
P3NO_DEMANDE_RIC CONSTANT VARCHAR2(240) := 'No Demande Ric';
P4NUMERO_RIC CONSTANT VARCHAR2(240) := 'Numero Ric';
P5DATE_PHOTOGRAPHIE CONSTANT VARCHAR2(240) := 'Date Photographie';
P6TYPE_RIC CONSTANT VARCHAR2(240) := 'Type Ric';
P7LIBELLE_RIC CONSTANT VARCHAR2(240) := 'Libelle Ric';
P8AUTRE_COMPETENCE CONSTANT VARCHAR2(240) := 'Autre Competence';

cg$row RECUEIL_INDIVIDUEL_COMPETENCE%ROWTYPE;

--  RECUEIL_INDIVIDUEL_COMPETENCE row type variable 
TYPE cg$row_type IS RECORD
(ID_RIC cg$row.ID_RIC%TYPE
,ID_SPC cg$row.ID_SPC%TYPE
,NO_DEMANDE_RIC cg$row.NO_DEMANDE_RIC%TYPE
,NUMERO_RIC cg$row.NUMERO_RIC%TYPE
,DATE_PHOTOGRAPHIE cg$row.DATE_PHOTOGRAPHIE%TYPE
,TYPE_RIC cg$row.TYPE_RIC%TYPE
,LIBELLE_RIC cg$row.LIBELLE_RIC%TYPE
,AUTRE_COMPETENCE cg$row.AUTRE_COMPETENCE%TYPE
,the_rowid ROWID)
;

--  RECUEIL_INDIVIDUEL_COMPETENCE indicator type variable
TYPE cg$ind_type IS RECORD
(ID_RIC BOOLEAN DEFAULT FALSE
,ID_SPC BOOLEAN DEFAULT FALSE
,NO_DEMANDE_RIC BOOLEAN DEFAULT FALSE
,NUMERO_RIC BOOLEAN DEFAULT FALSE
,DATE_PHOTOGRAPHIE BOOLEAN DEFAULT FALSE
,TYPE_RIC BOOLEAN DEFAULT FALSE
,LIBELLE_RIC BOOLEAN DEFAULT FALSE
,AUTRE_COMPETENCE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  RECUEIL_INDIVIDUEL_COMPETENCE primary key type variable
TYPE cg$pk_type IS RECORD
(ID_RIC cg$row.ID_RIC%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF RECUEIL_INDIVIDUEL_COMPETENCE%ROWTYPE
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
END cg$RECUEIL_INDIVIDUEL_COMPETEN;
/

