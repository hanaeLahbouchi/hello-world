
PROMPT Creating API Package Specification for Table 'AVENANT'
--------------------------------------------------------------------------------
-- Name:        cg$AVENANT
-- Description: AVENANT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$AVENANT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
AVE_PK CONSTANT VARCHAR2(240) := '';
AVE_STG_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_AVENANT CONSTANT VARCHAR2(240) := 'No Avenant';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P25NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P27ETAT_AVENANT CONSTANT VARCHAR2(240) := 'Etat Avenant';
P30NUM_ARTICLE CONSTANT VARCHAR2(240) := 'Num Article';
P40DATE_SIGNATURE_AVE CONSTANT VARCHAR2(240) := 'Date Signature Ave';
P50MODIF_APPORTEE CONSTANT VARCHAR2(240) := 'Modif Apportee';
P70COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';

cg$row AVENANT%ROWTYPE;

--  AVENANT row type variable 
TYPE cg$row_type IS RECORD
(NO_AVENANT cg$row.NO_AVENANT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ETAT_AVENANT cg$row.ETAT_AVENANT%TYPE
,NUM_ARTICLE cg$row.NUM_ARTICLE%TYPE
,DATE_SIGNATURE_AVE cg$row.DATE_SIGNATURE_AVE%TYPE
,MODIF_APPORTEE cg$row.MODIF_APPORTEE%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,the_rowid ROWID)
;

--  AVENANT indicator type variable
TYPE cg$ind_type IS RECORD
(NO_AVENANT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,ETAT_AVENANT BOOLEAN DEFAULT FALSE
,NUM_ARTICLE BOOLEAN DEFAULT FALSE
,DATE_SIGNATURE_AVE BOOLEAN DEFAULT FALSE
,MODIF_APPORTEE BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  AVENANT primary key type variable
TYPE cg$pk_type IS RECORD
(NO_AVENANT cg$row.NO_AVENANT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF AVENANT%ROWTYPE
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
END cg$AVENANT;
/

