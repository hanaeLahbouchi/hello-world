
PROMPT Creating API Package Specification for Table 'NOTATION_STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$NOTATION_STAGE
-- Description: NOTATION_STAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$NOTATION_STAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
NOTS_PK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1NO_BAREME CONSTANT VARCHAR2(240) := 'No Bareme';
P2COEFF_ENT CONSTANT VARCHAR2(240) := 'Coeff Ent';
P3COEFF_RAPPORT CONSTANT VARCHAR2(240) := 'Coeff Rapport';
P4COEFF_SOUTENANCE CONSTANT VARCHAR2(240) := 'Coeff Soutenance';
P5DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P6ETAT_BAREME CONSTANT VARCHAR2(240) := 'Etat Bareme';

cg$row NOTATION_STAGE%ROWTYPE;

--  NOTATION_STAGE row type variable 
TYPE cg$row_type IS RECORD
(NO_BAREME cg$row.NO_BAREME%TYPE
,COEFF_ENT cg$row.COEFF_ENT%TYPE
,COEFF_RAPPORT cg$row.COEFF_RAPPORT%TYPE
,COEFF_SOUTENANCE cg$row.COEFF_SOUTENANCE%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,ETAT_BAREME cg$row.ETAT_BAREME%TYPE
,the_rowid ROWID)
;

--  NOTATION_STAGE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_BAREME BOOLEAN DEFAULT FALSE
,COEFF_ENT BOOLEAN DEFAULT FALSE
,COEFF_RAPPORT BOOLEAN DEFAULT FALSE
,COEFF_SOUTENANCE BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,ETAT_BAREME BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  NOTATION_STAGE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_BAREME cg$row.NO_BAREME%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF NOTATION_STAGE%ROWTYPE
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
END cg$NOTATION_STAGE;
/

