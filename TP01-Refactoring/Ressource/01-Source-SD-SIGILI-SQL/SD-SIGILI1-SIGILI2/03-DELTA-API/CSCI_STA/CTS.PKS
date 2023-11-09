
PROMPT Creating API Package Specification for Table 'CONTACT_STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$CONTACT_STAGE
-- Description: CONTACT_STAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$CONTACT_STAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CTS_PK CONSTANT VARCHAR2(240) := '';
CTS_STG_FK CONSTANT VARCHAR2(240) := '';
CTS_EMP_FK CONSTANT VARCHAR2(240) := '';
CTS_ETU_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10DATE_CONTACT CONSTANT VARCHAR2(240) := 'Date Contact';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P25NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P30TYPE_CONTACT CONSTANT VARCHAR2(240) := 'Type Contact';
P35INTERLOCUTEUR CONSTANT VARCHAR2(240) := 'Interlocuteur';
P40OBJET CONSTANT VARCHAR2(240) := 'Objet';
P50DUREE CONSTANT VARCHAR2(240) := 'Duree';
P60RESUME CONSTANT VARCHAR2(240) := 'Resume';
P90NO_CONTACT_ILI CONSTANT VARCHAR2(240) := 'No Contact Ili';
P91HEURE_CONTACT CONSTANT VARCHAR2(240) := 'Heure Contact';

cg$row CONTACT_STAGE%ROWTYPE;

--  CONTACT_STAGE row type variable 
TYPE cg$row_type IS RECORD
(DATE_CONTACT cg$row.DATE_CONTACT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,TYPE_CONTACT cg$row.TYPE_CONTACT%TYPE
,INTERLOCUTEUR cg$row.INTERLOCUTEUR%TYPE
,OBJET cg$row.OBJET%TYPE
,DUREE cg$row.DUREE%TYPE
,RESUME cg$row.RESUME%TYPE
,NO_CONTACT_ILI cg$row.NO_CONTACT_ILI%TYPE
,HEURE_CONTACT cg$row.HEURE_CONTACT%TYPE
,the_rowid ROWID)
;

--  CONTACT_STAGE indicator type variable
TYPE cg$ind_type IS RECORD
(DATE_CONTACT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,TYPE_CONTACT BOOLEAN DEFAULT FALSE
,INTERLOCUTEUR BOOLEAN DEFAULT FALSE
,OBJET BOOLEAN DEFAULT FALSE
,DUREE BOOLEAN DEFAULT FALSE
,RESUME BOOLEAN DEFAULT FALSE
,NO_CONTACT_ILI BOOLEAN DEFAULT FALSE
,HEURE_CONTACT BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  CONTACT_STAGE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,DATE_CONTACT cg$row.DATE_CONTACT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF CONTACT_STAGE%ROWTYPE
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
END cg$CONTACT_STAGE;
/

