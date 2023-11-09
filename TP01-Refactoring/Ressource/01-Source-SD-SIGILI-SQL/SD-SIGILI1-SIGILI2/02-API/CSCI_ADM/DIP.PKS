
PROMPT Creating API Package Specification for Table 'DIPLOME'
--------------------------------------------------------------------------------
-- Name:        cg$DIPLOME
-- Description: DIPLOME table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$DIPLOME IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
DIP_PK CONSTANT VARCHAR2(240) := '';
DIP_ETU_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20NOM CONSTANT VARCHAR2(240) := 'Nom';
P30PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P40AUTORISATION_ANNUAIRE CONSTANT VARCHAR2(240) := 'Autorisation Annuaire';
P41TYPE_EMPLOI CONSTANT VARCHAR2(240) := 'Type Emploi';
P42MAIL_PRO CONSTANT VARCHAR2(240) := 'Mail Pro';
P43TEL_PRO CONSTANT VARCHAR2(240) := 'Tel Pro';
P50ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P60CP CONSTANT VARCHAR2(240) := 'Cp';
P70VILLE CONSTANT VARCHAR2(240) := 'Ville';
P110EMAIL_PERSO CONSTANT VARCHAR2(240) := 'Email Perso';
P120TEL_PERSO CONSTANT VARCHAR2(240) := 'Tel Perso';
P130PORTABLE CONSTANT VARCHAR2(240) := 'Portable';

cg$row DIPLOME%ROWTYPE;

--  DIPLOME row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,AUTORISATION_ANNUAIRE cg$row.AUTORISATION_ANNUAIRE%TYPE
,TYPE_EMPLOI cg$row.TYPE_EMPLOI%TYPE
,MAIL_PRO cg$row.MAIL_PRO%TYPE
,TEL_PRO cg$row.TEL_PRO%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CP cg$row.CP%TYPE
,VILLE cg$row.VILLE%TYPE
,EMAIL_PERSO cg$row.EMAIL_PERSO%TYPE
,TEL_PERSO cg$row.TEL_PERSO%TYPE
,PORTABLE cg$row.PORTABLE%TYPE
,the_rowid ROWID)
;

--  DIPLOME indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,AUTORISATION_ANNUAIRE BOOLEAN DEFAULT FALSE
,TYPE_EMPLOI BOOLEAN DEFAULT FALSE
,MAIL_PRO BOOLEAN DEFAULT FALSE
,TEL_PRO BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CP BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,EMAIL_PERSO BOOLEAN DEFAULT FALSE
,TEL_PERSO BOOLEAN DEFAULT FALSE
,PORTABLE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  DIPLOME primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF DIPLOME%ROWTYPE
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
END cg$DIPLOME;
/

