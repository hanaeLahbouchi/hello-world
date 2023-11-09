
PROMPT Creating API Package Specification for Table 'COMPETENCE_TRANSVERSALE'
--------------------------------------------------------------------------------
-- Name:        cg$COMPETENCE_TRANSVERSALE
-- Description: COMPETENCE_TRANSVERSALE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$COMPETENCE_TRANSVERSALE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CPTT_PK CONSTANT VARCHAR2(240) := '';
CPTT_MC_FK CONSTANT VARCHAR2(240) := '';
CPTT_SPC_FK CONSTANT VARCHAR2(240) := '';
CPTT_FCT_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_CPTT CONSTANT VARCHAR2(240) := 'Id';
P2CODE_MCP CONSTANT VARCHAR2(240) := 'Code Mcp';
P3ID_FCT CONSTANT VARCHAR2(240) := 'Id';
P4ID_SPC CONSTANT VARCHAR2(240) := 'Id';
P5CODE_COMPETENCE CONSTANT VARCHAR2(240) := 'Code Competence';
P6STD_PERSO CONSTANT VARCHAR2(240) := 'Ct Type';
P7DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P8ORDRE CONSTANT VARCHAR2(240) := 'Ordre';
P9DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';

cg$row COMPETENCE_TRANSVERSALE%ROWTYPE;

--  COMPETENCE_TRANSVERSALE row type variable 
TYPE cg$row_type IS RECORD
(ID_CPTT cg$row.ID_CPTT%TYPE
,CODE_MCP cg$row.CODE_MCP%TYPE
,ID_FCT cg$row.ID_FCT%TYPE
,ID_SPC cg$row.ID_SPC%TYPE
,CODE_COMPETENCE cg$row.CODE_COMPETENCE%TYPE
,STD_PERSO cg$row.STD_PERSO%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,ORDRE cg$row.ORDRE%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,the_rowid ROWID)
;

--  COMPETENCE_TRANSVERSALE indicator type variable
TYPE cg$ind_type IS RECORD
(ID_CPTT BOOLEAN DEFAULT FALSE
,CODE_MCP BOOLEAN DEFAULT FALSE
,ID_FCT BOOLEAN DEFAULT FALSE
,ID_SPC BOOLEAN DEFAULT FALSE
,CODE_COMPETENCE BOOLEAN DEFAULT FALSE
,STD_PERSO BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,ORDRE BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  COMPETENCE_TRANSVERSALE primary key type variable
TYPE cg$pk_type IS RECORD
(ID_CPTT cg$row.ID_CPTT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF COMPETENCE_TRANSVERSALE%ROWTYPE
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
END cg$COMPETENCE_TRANSVERSALE;
/

