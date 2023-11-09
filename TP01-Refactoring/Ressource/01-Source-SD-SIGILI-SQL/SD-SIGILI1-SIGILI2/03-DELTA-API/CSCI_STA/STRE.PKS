
PROMPT Creating API Package Specification for Table 'STRUCTURE_EVALUATION'
--------------------------------------------------------------------------------
-- Name:        cg$STRUCTURE_EVALUATION
-- Description: STRUCTURE_EVALUATION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$STRUCTURE_EVALUATION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
STRE_PK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1NO_EVALUATION CONSTANT VARCHAR2(240) := 'No Evaluation';
P2DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P3ETAT CONSTANT VARCHAR2(240) := 'Etat';

cg$row STRUCTURE_EVALUATION%ROWTYPE;

--  STRUCTURE_EVALUATION row type variable 
TYPE cg$row_type IS RECORD
(NO_EVALUATION cg$row.NO_EVALUATION%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,ETAT cg$row.ETAT%TYPE
,the_rowid ROWID)
;

--  STRUCTURE_EVALUATION indicator type variable
TYPE cg$ind_type IS RECORD
(NO_EVALUATION BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,ETAT BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  STRUCTURE_EVALUATION primary key type variable
TYPE cg$pk_type IS RECORD
(NO_EVALUATION cg$row.NO_EVALUATION%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF STRUCTURE_EVALUATION%ROWTYPE
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
END cg$STRUCTURE_EVALUATION;
/

