
PROMPT Creating API Package Specification for Table 'JOURNAL_SUIVI_PERSONNEL'
--------------------------------------------------------------------------------
-- Name:        cg$JOURNAL_SUIVI_PERSONNEL
-- Description: JOURNAL_SUIVI_PERSONNEL table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$JOURNAL_SUIVI_PERSONNEL IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
JSP_PK CONSTANT VARCHAR2(240) := '';
JSP_SPC_FK CONSTANT VARCHAR2(240) := '';
JSP_FC_FK CONSTANT VARCHAR2(240) := '';
JSP_CPT_FK CONSTANT VARCHAR2(240) := '';
JSP_DC_FK CONSTANT VARCHAR2(240) := '';
JSP_CPTT_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_JSP CONSTANT VARCHAR2(240) := 'Id';
P2ID_SPC CONSTANT VARCHAR2(240) := 'Id';
P3ID_DC CONSTANT VARCHAR2(240) := 'Id';
P4ID_FC CONSTANT VARCHAR2(240) := 'Id';
P5ID_CPT CONSTANT VARCHAR2(240) := 'Id';
P6ID_CPTT CONSTANT VARCHAR2(240) := 'Id';
P7TYPE_ENTREE CONSTANT VARCHAR2(240) := 'Type Entree';
P8DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P9LIBELLE CONSTANT VARCHAR2(240) := 'Libelle';
P10DATE_MAJ CONSTANT VARCHAR2(240) := 'Date Maj';
P11DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';

cg$row JOURNAL_SUIVI_PERSONNEL%ROWTYPE;

--  JOURNAL_SUIVI_PERSONNEL row type variable 
TYPE cg$row_type IS RECORD
(ID_JSP cg$row.ID_JSP%TYPE
,ID_SPC cg$row.ID_SPC%TYPE
,ID_DC cg$row.ID_DC%TYPE
,ID_FC cg$row.ID_FC%TYPE
,ID_CPT cg$row.ID_CPT%TYPE
,ID_CPTT cg$row.ID_CPTT%TYPE
,TYPE_ENTREE cg$row.TYPE_ENTREE%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,LIBELLE cg$row.LIBELLE%TYPE
,DATE_MAJ cg$row.DATE_MAJ%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,the_rowid ROWID)
;

--  JOURNAL_SUIVI_PERSONNEL indicator type variable
TYPE cg$ind_type IS RECORD
(ID_JSP BOOLEAN DEFAULT FALSE
,ID_SPC BOOLEAN DEFAULT FALSE
,ID_DC BOOLEAN DEFAULT FALSE
,ID_FC BOOLEAN DEFAULT FALSE
,ID_CPT BOOLEAN DEFAULT FALSE
,ID_CPTT BOOLEAN DEFAULT FALSE
,TYPE_ENTREE BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,LIBELLE BOOLEAN DEFAULT FALSE
,DATE_MAJ BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  JOURNAL_SUIVI_PERSONNEL primary key type variable
TYPE cg$pk_type IS RECORD
(ID_JSP cg$row.ID_JSP%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF JOURNAL_SUIVI_PERSONNEL%ROWTYPE
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
END cg$JOURNAL_SUIVI_PERSONNEL;
/

