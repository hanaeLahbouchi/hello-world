
PROMPT Creating API Package Specification for Table 'POSITIONNEMENT'
--------------------------------------------------------------------------------
-- Name:        cg$POSITIONNEMENT
-- Description: POSITIONNEMENT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$POSITIONNEMENT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
POS_PK CONSTANT VARCHAR2(240) := '';
POS_CPT_FK CONSTANT VARCHAR2(240) := '';
POS_FC_FK CONSTANT VARCHAR2(240) := '';
POS_CPTT_FK CONSTANT VARCHAR2(240) := '';
POS_CAP_FK CONSTANT VARCHAR2(240) := '';
POS_SPC_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_POS CONSTANT VARCHAR2(240) := 'Id';
P2ID_SPC CONSTANT VARCHAR2(240) := 'Id';
P3ID_CAP CONSTANT VARCHAR2(240) := 'Id';
P4ID_FC CONSTANT VARCHAR2(240) := 'Id';
P5ID_CPT CONSTANT VARCHAR2(240) := 'Id';
P5ID_FC_CAP CONSTANT VARCHAR2(240) := 'Id Fc Cap';
P6ID_CPTT CONSTANT VARCHAR2(240) := 'Id';
P7TYPE_POSITIONNEMENT CONSTANT VARCHAR2(240) := 'Pos Type';
P8NIVEAU_COMPETENCE CONSTANT VARCHAR2(240) := 'Niveau Competence';
P9NIVEAU_MATURITE CONSTANT VARCHAR2(240) := 'Niveau Maturite';

cg$row POSITIONNEMENT%ROWTYPE;

--  POSITIONNEMENT row type variable 
TYPE cg$row_type IS RECORD
(ID_POS cg$row.ID_POS%TYPE
,ID_SPC cg$row.ID_SPC%TYPE
,ID_CAP cg$row.ID_CAP%TYPE
,ID_FC cg$row.ID_FC%TYPE
,ID_CPT cg$row.ID_CPT%TYPE
,ID_FC_CAP cg$row.ID_FC_CAP%TYPE
,ID_CPTT cg$row.ID_CPTT%TYPE
,TYPE_POSITIONNEMENT cg$row.TYPE_POSITIONNEMENT%TYPE
,NIVEAU_COMPETENCE cg$row.NIVEAU_COMPETENCE%TYPE
,NIVEAU_MATURITE cg$row.NIVEAU_MATURITE%TYPE
,the_rowid ROWID)
;

--  POSITIONNEMENT indicator type variable
TYPE cg$ind_type IS RECORD
(ID_POS BOOLEAN DEFAULT FALSE
,ID_SPC BOOLEAN DEFAULT FALSE
,ID_CAP BOOLEAN DEFAULT FALSE
,ID_FC BOOLEAN DEFAULT FALSE
,ID_CPT BOOLEAN DEFAULT FALSE
,ID_FC_CAP BOOLEAN DEFAULT FALSE
,ID_CPTT BOOLEAN DEFAULT FALSE
,TYPE_POSITIONNEMENT BOOLEAN DEFAULT FALSE
,NIVEAU_COMPETENCE BOOLEAN DEFAULT FALSE
,NIVEAU_MATURITE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  POSITIONNEMENT primary key type variable
TYPE cg$pk_type IS RECORD
(ID_POS cg$row.ID_POS%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF POSITIONNEMENT%ROWTYPE
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
END cg$POSITIONNEMENT;
/

