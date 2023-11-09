
PROMPT Creating API Package Specification for Table 'STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$STAGE
-- Description: STAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$STAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
STG_PK CONSTANT VARCHAR2(240) := '';
STG_SOUT_FK CONSTANT VARCHAR2(240) := '';
STG_ETU_FK CONSTANT VARCHAR2(240) := '';
STG_ENT_FK CONSTANT VARCHAR2(240) := '';
STG_PRO_FK CONSTANT VARCHAR2(240) := '';
STG_OFF_FK CONSTANT VARCHAR2(240) := '';
STG_ENS_FK CONSTANT VARCHAR2(240) := '';
STG_EMP_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P15NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P17NO_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Entreprise';
P18NO_OFFRE CONSTANT VARCHAR2(240) := 'No Offre';
P19NO_CONTACT_ILI CONSTANT VARCHAR2(240) := 'No Contact Ili';
P20INTITULE CONSTANT VARCHAR2(240) := 'Intitule';
P30SUJET CONSTANT VARCHAR2(240) := 'Sujet';
P40DATE_DEB CONSTANT VARCHAR2(240) := 'Date Deb';
P50DATE_FIN CONSTANT VARCHAR2(240) := 'Date Fin';
P60LIEU CONSTANT VARCHAR2(240) := 'Lieu';
P70ETAT_STAGE CONSTANT VARCHAR2(240) := 'Etat Stage';
P80CLE_EVALUATION CONSTANT VARCHAR2(240) := 'Cle Evaluation';
P90DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';
P100ETAT_CONVENTION CONSTANT VARCHAR2(240) := 'Etat Convention';
P110DATE_SIGNATURE_CONV CONSTANT VARCHAR2(240) := 'Date Signature Conv';
P115NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P117COMMENTAIRE_TUTEUR CONSTANT VARCHAR2(240) := 'Commentaire Tuteur';
P120DATE_RECEPTION_RAPPORT CONSTANT VARCHAR2(240) := 'Date Reception Rapport';
P140NOTE_ENTREPRISE CONSTANT VARCHAR2(240) := '/Note Entreprise';
P150NOTE_RAPPORT CONSTANT VARCHAR2(240) := 'Note Rapport';
P155NO_SESSION CONSTANT VARCHAR2(240) := 'No Session';
P160NOTE_SOUTENANCE CONSTANT VARCHAR2(240) := 'Note Soutenance';

cg$row STAGE%ROWTYPE;

--  STAGE row type variable 
TYPE cg$row_type IS RECORD
(ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,NO_OFFRE cg$row.NO_OFFRE%TYPE
,NO_CONTACT_ILI cg$row.NO_CONTACT_ILI%TYPE
,INTITULE cg$row.INTITULE%TYPE
,SUJET cg$row.SUJET%TYPE
,DATE_DEB cg$row.DATE_DEB%TYPE
,DATE_FIN cg$row.DATE_FIN%TYPE
,LIEU cg$row.LIEU%TYPE
,ETAT_STAGE cg$row.ETAT_STAGE%TYPE
,CLE_EVALUATION cg$row.CLE_EVALUATION%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,ETAT_CONVENTION cg$row.ETAT_CONVENTION%TYPE
,DATE_SIGNATURE_CONV cg$row.DATE_SIGNATURE_CONV%TYPE
,NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,COMMENTAIRE_TUTEUR cg$row.COMMENTAIRE_TUTEUR%TYPE
,DATE_RECEPTION_RAPPORT cg$row.DATE_RECEPTION_RAPPORT%TYPE
,NOTE_ENTREPRISE cg$row.NOTE_ENTREPRISE%TYPE
,NOTE_RAPPORT cg$row.NOTE_RAPPORT%TYPE
,NO_SESSION cg$row.NO_SESSION%TYPE
,NOTE_SOUTENANCE cg$row.NOTE_SOUTENANCE%TYPE
,the_rowid ROWID)
;

--  STAGE indicator type variable
TYPE cg$ind_type IS RECORD
(ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,NO_ENTREPRISE BOOLEAN DEFAULT FALSE
,NO_OFFRE BOOLEAN DEFAULT FALSE
,NO_CONTACT_ILI BOOLEAN DEFAULT FALSE
,INTITULE BOOLEAN DEFAULT FALSE
,SUJET BOOLEAN DEFAULT FALSE
,DATE_DEB BOOLEAN DEFAULT FALSE
,DATE_FIN BOOLEAN DEFAULT FALSE
,LIEU BOOLEAN DEFAULT FALSE
,ETAT_STAGE BOOLEAN DEFAULT FALSE
,CLE_EVALUATION BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE
,ETAT_CONVENTION BOOLEAN DEFAULT FALSE
,DATE_SIGNATURE_CONV BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,COMMENTAIRE_TUTEUR BOOLEAN DEFAULT FALSE
,DATE_RECEPTION_RAPPORT BOOLEAN DEFAULT FALSE
,NOTE_ENTREPRISE BOOLEAN DEFAULT FALSE
,NOTE_RAPPORT BOOLEAN DEFAULT FALSE
,NO_SESSION BOOLEAN DEFAULT FALSE
,NOTE_SOUTENANCE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  STAGE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF STAGE%ROWTYPE
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
END cg$STAGE;
/

