
PROMPT Creating API Package Specification for Table 'DOMAINE_CONNAISSANCE'
--------------------------------------------------------------------------------
-- Name:        cg$DOMAINE_CONNAISSANCE
-- Description: DOMAINE_CONNAISSANCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$DOMAINE_CONNAISSANCE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
DCO_PK CONSTANT VARCHAR2(240) := '';
DCO_FC_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_DCO CONSTANT VARCHAR2(240) := 'Id';
P2ID_FC CONSTANT VARCHAR2(240) := 'Id';
P3DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P4ORDRE CONSTANT VARCHAR2(240) := 'Ordre';
P6DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';

cg$row DOMAINE_CONNAISSANCE%ROWTYPE;

--  DOMAINE_CONNAISSANCE row type variable 
TYPE cg$row_type IS RECORD
(ID_DCO cg$row.ID_DCO%TYPE
,ID_FC cg$row.ID_FC%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,ORDRE cg$row.ORDRE%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,the_rowid ROWID)
;

--  DOMAINE_CONNAISSANCE indicator type variable
TYPE cg$ind_type IS RECORD
(ID_DCO BOOLEAN DEFAULT FALSE
,ID_FC BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,ORDRE BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  DOMAINE_CONNAISSANCE primary key type variable
TYPE cg$pk_type IS RECORD
(ID_DCO cg$row.ID_DCO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF DOMAINE_CONNAISSANCE%ROWTYPE
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
END cg$DOMAINE_CONNAISSANCE;
/

