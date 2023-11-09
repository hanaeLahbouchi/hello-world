
PROMPT Creating API Package Specification for Table 'POSTE_ENTREPRISE'
--------------------------------------------------------------------------------
-- Name:        cg$POSTE_ENTREPRISE
-- Description: POSTE_ENTREPRISE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$POSTE_ENTREPRISE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
POE_PK CONSTANT VARCHAR2(240) := '';
POE_DIP_FK CONSTANT VARCHAR2(240) := '';
POE_ENT_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20NO_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Entreprise';
P30FONCTION CONSTANT VARCHAR2(240) := 'Fonction';
P40DATE_EMBAUCHE CONSTANT VARCHAR2(240) := 'Date Embauche';
P50MOYEN_OBTENTION CONSTANT VARCHAR2(240) := 'Moyen Obtention';
P60SERVICE CONSTANT VARCHAR2(240) := 'Service';
P70BRUT_ANNUEL CONSTANT VARCHAR2(240) := 'Brut Annuel';

cg$row POSTE_ENTREPRISE%ROWTYPE;

--  POSTE_ENTREPRISE row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,FONCTION cg$row.FONCTION%TYPE
,DATE_EMBAUCHE cg$row.DATE_EMBAUCHE%TYPE
,MOYEN_OBTENTION cg$row.MOYEN_OBTENTION%TYPE
,SERVICE cg$row.SERVICE%TYPE
,BRUT_ANNUEL cg$row.BRUT_ANNUEL%TYPE
,the_rowid ROWID)
;

--  POSTE_ENTREPRISE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,NO_ENTREPRISE BOOLEAN DEFAULT FALSE
,FONCTION BOOLEAN DEFAULT FALSE
,DATE_EMBAUCHE BOOLEAN DEFAULT FALSE
,MOYEN_OBTENTION BOOLEAN DEFAULT FALSE
,SERVICE BOOLEAN DEFAULT FALSE
,BRUT_ANNUEL BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  POSTE_ENTREPRISE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF POSTE_ENTREPRISE%ROWTYPE
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
END cg$POSTE_ENTREPRISE;
/

