
PROMPT Creating API Package Specification for Table 'AFFECTATION_CRR_ETU'
--------------------------------------------------------------------------------
-- Name:        cg$AFFECTATION_CRR_ETU
-- Description: AFFECTATION_CRR_ETU table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$AFFECTATION_CRR_ETU IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
ACE_PK CONSTANT VARCHAR2(240) := '';
ACE_CRR_FK CONSTANT VARCHAR2(240) := '';
ACE_ETU_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P2ID_ACE CONSTANT VARCHAR2(240) := 'Id Ace';
P3NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P4NO_CRR CONSTANT VARCHAR2(240) := 'No Crr';

cg$row AFFECTATION_CRR_ETU%ROWTYPE;

--  AFFECTATION_CRR_ETU row type variable 
TYPE cg$row_type IS RECORD
(ID_ACE cg$row.ID_ACE%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NO_CRR cg$row.NO_CRR%TYPE
,the_rowid ROWID)
;

--  AFFECTATION_CRR_ETU indicator type variable
TYPE cg$ind_type IS RECORD
(ID_ACE BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,NO_CRR BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  AFFECTATION_CRR_ETU primary key type variable
TYPE cg$pk_type IS RECORD
(ID_ACE cg$row.ID_ACE%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF AFFECTATION_CRR_ETU%ROWTYPE
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
END cg$AFFECTATION_CRR_ETU;
/

