
PROMPT Creating API Package Specification for Table 'SEQUENCE'
--------------------------------------------------------------------------------
-- Name:        cg$SEQUENCE
-- Description: SEQUENCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$SEQUENCE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
SEQ_PK CONSTANT VARCHAR2(240) := '';
SEQ_COM_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10CODE_COM CONSTANT VARCHAR2(240) := 'Code Com';
P20NO_SEQUENCE CONSTANT VARCHAR2(240) := 'No Sequence';
P30DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P40DEBUT CONSTANT VARCHAR2(240) := 'Debut';
P50FIN CONSTANT VARCHAR2(240) := 'Fin';
P60DUREE CONSTANT VARCHAR2(240) := 'Duree';
P70DESCRIPTIF CONSTANT VARCHAR2(240) := 'Descriptif';
P80MAD CONSTANT VARCHAR2(240) := 'Mad';

cg$row SEQUENCE%ROWTYPE;

--  SEQUENCE row type variable 
TYPE cg$row_type IS RECORD
(CODE_COM cg$row.CODE_COM%TYPE
,NO_SEQUENCE cg$row.NO_SEQUENCE%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,DEBUT cg$row.DEBUT%TYPE
,FIN cg$row.FIN%TYPE
,DUREE cg$row.DUREE%TYPE
,DESCRIPTIF cg$row.DESCRIPTIF%TYPE
,MAD cg$row.MAD%TYPE
,the_rowid ROWID)
;

--  SEQUENCE indicator type variable
TYPE cg$ind_type IS RECORD
(CODE_COM BOOLEAN DEFAULT FALSE
,NO_SEQUENCE BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,DEBUT BOOLEAN DEFAULT FALSE
,FIN BOOLEAN DEFAULT FALSE
,DUREE BOOLEAN DEFAULT FALSE
,DESCRIPTIF BOOLEAN DEFAULT FALSE
,MAD BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  SEQUENCE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_SEQUENCE cg$row.NO_SEQUENCE%TYPE
,CODE_COM cg$row.CODE_COM%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF SEQUENCE%ROWTYPE
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
END cg$SEQUENCE;
/

