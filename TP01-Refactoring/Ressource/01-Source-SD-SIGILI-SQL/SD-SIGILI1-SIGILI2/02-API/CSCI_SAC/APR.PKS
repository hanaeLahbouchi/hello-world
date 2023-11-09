
PROMPT Creating API Package Specification for Table 'AFFECTATION_PRODUIT'
--------------------------------------------------------------------------------
-- Name:        cg$AFFECTATION_PRODUIT
-- Description: AFFECTATION_PRODUIT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$AFFECTATION_PRODUIT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
APR_PK CONSTANT VARCHAR2(240) := '';
APR_FA_FK CONSTANT VARCHAR2(240) := '';
APR_PDT_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P12ID_FA CONSTANT VARCHAR2(240) := 'Id Fa';
P17ID_PDT CONSTANT VARCHAR2(240) := 'Id Pdt';
P20VERSION CONSTANT VARCHAR2(240) := 'Version';
P30DATE_CLE CONSTANT VARCHAR2(240) := 'Date Cle';

cg$row AFFECTATION_PRODUIT%ROWTYPE;

--  AFFECTATION_PRODUIT row type variable 
TYPE cg$row_type IS RECORD
(ID_FA cg$row.ID_FA%TYPE
,ID_PDT cg$row.ID_PDT%TYPE
,VERSION cg$row.VERSION%TYPE
,DATE_CLE cg$row.DATE_CLE%TYPE
,the_rowid ROWID)
;

--  AFFECTATION_PRODUIT indicator type variable
TYPE cg$ind_type IS RECORD
(ID_FA BOOLEAN DEFAULT FALSE
,ID_PDT BOOLEAN DEFAULT FALSE
,VERSION BOOLEAN DEFAULT FALSE
,DATE_CLE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  AFFECTATION_PRODUIT primary key type variable
TYPE cg$pk_type IS RECORD
(ID_PDT cg$row.ID_PDT%TYPE
,VERSION cg$row.VERSION%TYPE
,ID_FA cg$row.ID_FA%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF AFFECTATION_PRODUIT%ROWTYPE
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
END cg$AFFECTATION_PRODUIT;
/

