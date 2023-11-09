
PROMPT Creating API Package Specification for Table 'NOTE_ENTREPRISE'
--------------------------------------------------------------------------------
-- Name:        cg$NOTE_ENTREPRISE
-- Description: NOTE_ENTREPRISE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$NOTE_ENTREPRISE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
NOTE_PK CONSTANT VARCHAR2(240) := '';
NOTE_CRITE_FK CONSTANT VARCHAR2(240) := '';
NOTE_EVAE_FK CONSTANT VARCHAR2(240) := '';
NOTE_CODN_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P30CRITE_ID CONSTANT VARCHAR2(240) := 'Crit Ent Id';
P35CODN_ID CONSTANT VARCHAR2(240) := 'Codnote Id';
P40COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';

cg$row NOTE_ENTREPRISE%ROWTYPE;

--  NOTE_ENTREPRISE row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,CRITE_ID cg$row.CRITE_ID%TYPE
,CODN_ID cg$row.CODN_ID%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,the_rowid ROWID)
;

--  NOTE_ENTREPRISE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,CRITE_ID BOOLEAN DEFAULT FALSE
,CODN_ID BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  NOTE_ENTREPRISE primary key type variable
TYPE cg$pk_type IS RECORD
(CRITE_ID cg$row.CRITE_ID%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF NOTE_ENTREPRISE%ROWTYPE
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
END cg$NOTE_ENTREPRISE;
/

