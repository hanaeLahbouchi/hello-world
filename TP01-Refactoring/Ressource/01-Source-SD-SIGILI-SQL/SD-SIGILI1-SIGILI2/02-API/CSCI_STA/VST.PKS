
PROMPT Creating API Package Specification for Table 'VISITE_STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$VISITE_STAGE
-- Description: VISITE_STAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$VISITE_STAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
VST_PK CONSTANT VARCHAR2(240) := '';
VST_EMP_FK CONSTANT VARCHAR2(240) := '';
VST_STG_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P25NO_CONTACT_ILI CONSTANT VARCHAR2(240) := 'No Contact Ili';
P30TYPE_CONTACT CONSTANT VARCHAR2(240) := 'Type Contact';
P40DATE_PREVISIONNELLE CONSTANT VARCHAR2(240) := 'Date Previsionnelle';
P45HEURE_PREVISIONNELLE CONSTANT VARCHAR2(240) := 'Heure Previsionnelle';
P50DATE_EFFECTIVE CONSTANT VARCHAR2(240) := 'Date Effective';
P55HEURE_EFFECTIVE CONSTANT VARCHAR2(240) := 'Heure Effective';
P60DUREE CONSTANT VARCHAR2(240) := 'Duree';
P70COMMENTAIRE_TUTEUR_UBO CONSTANT VARCHAR2(240) := 'Commentaire Tuteur Ubo';

cg$row VISITE_STAGE%ROWTYPE;

--  VISITE_STAGE row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_CONTACT_ILI cg$row.NO_CONTACT_ILI%TYPE
,TYPE_CONTACT cg$row.TYPE_CONTACT%TYPE
,DATE_PREVISIONNELLE cg$row.DATE_PREVISIONNELLE%TYPE
,HEURE_PREVISIONNELLE cg$row.HEURE_PREVISIONNELLE%TYPE
,DATE_EFFECTIVE cg$row.DATE_EFFECTIVE%TYPE
,HEURE_EFFECTIVE cg$row.HEURE_EFFECTIVE%TYPE
,DUREE cg$row.DUREE%TYPE
,COMMENTAIRE_TUTEUR_UBO cg$row.COMMENTAIRE_TUTEUR_UBO%TYPE
,the_rowid ROWID)
;

--  VISITE_STAGE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_CONTACT_ILI BOOLEAN DEFAULT FALSE
,TYPE_CONTACT BOOLEAN DEFAULT FALSE
,DATE_PREVISIONNELLE BOOLEAN DEFAULT FALSE
,HEURE_PREVISIONNELLE BOOLEAN DEFAULT FALSE
,DATE_EFFECTIVE BOOLEAN DEFAULT FALSE
,HEURE_EFFECTIVE BOOLEAN DEFAULT FALSE
,DUREE BOOLEAN DEFAULT FALSE
,COMMENTAIRE_TUTEUR_UBO BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  VISITE_STAGE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF VISITE_STAGE%ROWTYPE
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
END cg$VISITE_STAGE;
/

