
PROMPT Creating API Package Specification for Table 'OFFRE_STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$OFFRE_STAGE
-- Description: OFFRE_STAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$OFFRE_STAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
OFF_PK CONSTANT VARCHAR2(240) := '';
OFF_ENT_FK CONSTANT VARCHAR2(240) := '';
OFF_PRO_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_OFFRE CONSTANT VARCHAR2(240) := 'No Offre';
P20NO_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Entreprise';
P25NO_OFFRE_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Offre Entreprise';
P27ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P30INTITULE CONSTANT VARCHAR2(240) := 'Intitule';
P40SUJET CONSTANT VARCHAR2(240) := 'Sujet';
P50DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P60DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';
P70DUREE CONSTANT VARCHAR2(240) := 'Duree';
P80ETAT_OFFRE CONSTANT VARCHAR2(240) := 'Etat Offre';
P90LIEU CONSTANT VARCHAR2(240) := 'Lieu';
P100NIVEAU_REQUIS CONSTANT VARCHAR2(240) := 'Niveau Requis';
P110PERIODE CONSTANT VARCHAR2(240) := 'Periode';
P120NOM_RESPONSABLE CONSTANT VARCHAR2(240) := 'Nom Responsable';
P130PRENOM_RESPONSABLE CONSTANT VARCHAR2(240) := 'Prenom Responsable';
P160TEL_RESPONSABLE CONSTANT VARCHAR2(240) := 'Tel Responsable';
P170MAIL_RESPONSABLE CONSTANT VARCHAR2(240) := 'Mail Responsable';
P180REMUNERATION CONSTANT VARCHAR2(240) := 'Remuneration';

cg$row OFFRE_STAGE%ROWTYPE;

--  OFFRE_STAGE row type variable 
TYPE cg$row_type IS RECORD
(NO_OFFRE cg$row.NO_OFFRE%TYPE
,NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,NO_OFFRE_ENTREPRISE cg$row.NO_OFFRE_ENTREPRISE%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,INTITULE cg$row.INTITULE%TYPE
,SUJET cg$row.SUJET%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,DUREE cg$row.DUREE%TYPE
,ETAT_OFFRE cg$row.ETAT_OFFRE%TYPE
,LIEU cg$row.LIEU%TYPE
,NIVEAU_REQUIS cg$row.NIVEAU_REQUIS%TYPE
,PERIODE cg$row.PERIODE%TYPE
,NOM_RESPONSABLE cg$row.NOM_RESPONSABLE%TYPE
,PRENOM_RESPONSABLE cg$row.PRENOM_RESPONSABLE%TYPE
,TEL_RESPONSABLE cg$row.TEL_RESPONSABLE%TYPE
,MAIL_RESPONSABLE cg$row.MAIL_RESPONSABLE%TYPE
,REMUNERATION cg$row.REMUNERATION%TYPE
,the_rowid ROWID)
;

--  OFFRE_STAGE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_OFFRE BOOLEAN DEFAULT FALSE
,NO_ENTREPRISE BOOLEAN DEFAULT FALSE
,NO_OFFRE_ENTREPRISE BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,INTITULE BOOLEAN DEFAULT FALSE
,SUJET BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE
,DUREE BOOLEAN DEFAULT FALSE
,ETAT_OFFRE BOOLEAN DEFAULT FALSE
,LIEU BOOLEAN DEFAULT FALSE
,NIVEAU_REQUIS BOOLEAN DEFAULT FALSE
,PERIODE BOOLEAN DEFAULT FALSE
,NOM_RESPONSABLE BOOLEAN DEFAULT FALSE
,PRENOM_RESPONSABLE BOOLEAN DEFAULT FALSE
,TEL_RESPONSABLE BOOLEAN DEFAULT FALSE
,MAIL_RESPONSABLE BOOLEAN DEFAULT FALSE
,REMUNERATION BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  OFFRE_STAGE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_OFFRE cg$row.NO_OFFRE%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF OFFRE_STAGE%ROWTYPE
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
END cg$OFFRE_STAGE;
/

