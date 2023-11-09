
PROMPT Creating API Package Specification for Table 'AUTHENTIFICATION'
--------------------------------------------------------------------------------
-- Name:        cg$AUTHENTIFICATION
-- Description: AUTHENTIFICATION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$AUTHENTIFICATION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
AUT_PK CONSTANT VARCHAR2(240) := '';
CK_AUTHENTIFICATION CONSTANT VARCHAR(240) := '';
AUT_ENS_FK CONSTANT VARCHAR2(240) := '';
AUT_ENT_FK CONSTANT VARCHAR2(240) := '';
AUT_ETU_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10LOGIN CONSTANT VARCHAR2(240) := 'Login';
P20PASSWORD CONSTANT VARCHAR2(240) := 'Password';
P25TYPE_AUTHENTIFICATION CONSTANT VARCHAR2(240) := 'Type Authentification';
P30NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P40NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P50NO_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Entreprise';

cg$row AUTHENTIFICATION%ROWTYPE;

--  AUTHENTIFICATION row type variable 
TYPE cg$row_type IS RECORD
(LOGIN cg$row.LOGIN%TYPE
,PASSWORD cg$row.PASSWORD%TYPE
,TYPE_AUTHENTIFICATION cg$row.TYPE_AUTHENTIFICATION%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,the_rowid ROWID)
;

--  AUTHENTIFICATION indicator type variable
TYPE cg$ind_type IS RECORD
(LOGIN BOOLEAN DEFAULT FALSE
,PASSWORD BOOLEAN DEFAULT FALSE
,TYPE_AUTHENTIFICATION BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,NO_ENTREPRISE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  AUTHENTIFICATION primary key type variable
TYPE cg$pk_type IS RECORD
(LOGIN cg$row.LOGIN%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF AUTHENTIFICATION%ROWTYPE
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
END cg$AUTHENTIFICATION;
/

