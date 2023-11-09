
PROMPT Creating API Package Specification for Table 'AFFECTATION_ETUDIANT'
--------------------------------------------------------------------------------
-- Name:        cg$AFFECTATION_ETUDIANT
-- Description: AFFECTATION_ETUDIANT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$AFFECTATION_ETUDIANT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
AET_PK CONSTANT VARCHAR2(240) := '';
AET_ETU_FK CONSTANT VARCHAR2(240) := '';
AET_FA_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10ID_FA CONSTANT VARCHAR2(240) := 'Id Fa';
P15NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20CHARGE CONSTANT VARCHAR2(240) := 'Charge';
P30CONSOLIDATEUR CONSTANT VARCHAR2(240) := 'Consolidateur';

cg$row AFFECTATION_ETUDIANT%ROWTYPE;

--  AFFECTATION_ETUDIANT row type variable 
TYPE cg$row_type IS RECORD
(ID_FA cg$row.ID_FA%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,CHARGE cg$row.CHARGE%TYPE
,CONSOLIDATEUR cg$row.CONSOLIDATEUR%TYPE
,the_rowid ROWID)
;

--  AFFECTATION_ETUDIANT indicator type variable
TYPE cg$ind_type IS RECORD
(ID_FA BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,CHARGE BOOLEAN DEFAULT FALSE
,CONSOLIDATEUR BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  AFFECTATION_ETUDIANT primary key type variable
TYPE cg$pk_type IS RECORD
(ID_FA cg$row.ID_FA%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF AFFECTATION_ETUDIANT%ROWTYPE
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
END cg$AFFECTATION_ETUDIANT;
/

