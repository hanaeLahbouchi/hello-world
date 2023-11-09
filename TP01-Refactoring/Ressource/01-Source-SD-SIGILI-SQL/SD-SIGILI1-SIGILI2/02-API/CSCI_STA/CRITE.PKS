
PROMPT Creating API Package Specification for Table 'CRITERE_ENTREPRISE'
--------------------------------------------------------------------------------
-- Name:        cg$CRITERE_ENTREPRISE
-- Description: CRITERE_ENTREPRISE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$CRITERE_ENTREPRISE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CRITE_PK CONSTANT VARCHAR2(240) := '';
CRITE_STRE_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10CRITE_ID CONSTANT VARCHAR2(240) := 'Crit Ent Id';
P20NO_EVALUATION CONSTANT VARCHAR2(240) := 'No Evaluation';
P30ORDRE CONSTANT VARCHAR2(240) := 'Ordre';
P40DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P50POIDS CONSTANT VARCHAR2(240) := 'Poids';
P60DESCRIPTIF CONSTANT VARCHAR2(240) := 'Descriptif';

cg$row CRITERE_ENTREPRISE%ROWTYPE;

--  CRITERE_ENTREPRISE row type variable 
TYPE cg$row_type IS RECORD
(CRITE_ID cg$row.CRITE_ID%TYPE
,NO_EVALUATION cg$row.NO_EVALUATION%TYPE
,ORDRE cg$row.ORDRE%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,POIDS cg$row.POIDS%TYPE
,DESCRIPTIF cg$row.DESCRIPTIF%TYPE
,the_rowid ROWID)
;

--  CRITERE_ENTREPRISE indicator type variable
TYPE cg$ind_type IS RECORD
(CRITE_ID BOOLEAN DEFAULT FALSE
,NO_EVALUATION BOOLEAN DEFAULT FALSE
,ORDRE BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,POIDS BOOLEAN DEFAULT FALSE
,DESCRIPTIF BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  CRITERE_ENTREPRISE primary key type variable
TYPE cg$pk_type IS RECORD
(CRITE_ID cg$row.CRITE_ID%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF CRITERE_ENTREPRISE%ROWTYPE
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
END cg$CRITERE_ENTREPRISE;
/

