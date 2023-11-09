
PROMPT Creating API Package Specification for Table 'CANDIDAT'
--------------------------------------------------------------------------------
-- Name:        cg$CANDIDAT
-- Description: CANDIDAT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$CANDIDAT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CAN_PK CONSTANT VARCHAR2(240) := '';
CAN_PRO_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P30SEXE CONSTANT VARCHAR2(240) := 'Sexe';
P40NOM CONSTANT VARCHAR2(240) := 'Nom';
P50PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P60DATE_NAISSANCE CONSTANT VARCHAR2(240) := 'Date Naissance';
P70LIEU_NAISSANCE CONSTANT VARCHAR2(240) := 'Lieu Naissance';
P80SITUATION CONSTANT VARCHAR2(240) := 'Situation';
P90NATIONALITE CONSTANT VARCHAR2(240) := 'Nationalite';
P100TEL_FIXE CONSTANT VARCHAR2(240) := 'Tel Fixe';
P110TEL_PORT CONSTANT VARCHAR2(240) := 'Tel Port';
P120EMAIL CONSTANT VARCHAR2(240) := 'Email';
P130ACTU_ADRESSE CONSTANT VARCHAR2(240) := 'Actu Adresse';
P140ACTU_CP CONSTANT VARCHAR2(240) := 'Actu Cp';
P150ACTU_VILLE CONSTANT VARCHAR2(240) := 'Actu Ville';
P160ACTU_PAYS CONSTANT VARCHAR2(240) := 'Actu Pays';
P170PERM_ADRESSE CONSTANT VARCHAR2(240) := 'Perm Adresse';
P180PERM_CP CONSTANT VARCHAR2(240) := 'Perm Cp';
P190PERM_VILLE CONSTANT VARCHAR2(240) := 'Perm Ville';
P200PERM_PAYS CONSTANT VARCHAR2(240) := 'Perm Pays';
P210DERNIER_DIPLOME CONSTANT VARCHAR2(240) := 'Dernier Diplome';
P220UNIVERSITE CONSTANT VARCHAR2(240) := 'Universite';
P230SELECTION_ORIGINE CONSTANT VARCHAR2(240) := 'Selection Origine';
P240SELECTION_COURANTE CONSTANT VARCHAR2(240) := 'Selection Courante';
P250REPONSE_ILI CONSTANT VARCHAR2(240) := 'Reponse Ili';
P260DATE_REPONSE_ILI CONSTANT VARCHAR2(240) := 'Date Reponse Ili';
P270REPONSE_CAN CONSTANT VARCHAR2(240) := 'Reponse Can';
P280DATE_REPONSE_CAN CONSTANT VARCHAR2(240) := 'Date Reponse Can';
P290NO_ORDRE CONSTANT VARCHAR2(240) := 'No Ordre';

cg$row CANDIDAT%ROWTYPE;

--  CANDIDAT row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,SEXE cg$row.SEXE%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,DATE_NAISSANCE cg$row.DATE_NAISSANCE%TYPE
,LIEU_NAISSANCE cg$row.LIEU_NAISSANCE%TYPE
,SITUATION cg$row.SITUATION%TYPE
,NATIONALITE cg$row.NATIONALITE%TYPE
,TEL_FIXE cg$row.TEL_FIXE%TYPE
,TEL_PORT cg$row.TEL_PORT%TYPE
,EMAIL cg$row.EMAIL%TYPE
,ACTU_ADRESSE cg$row.ACTU_ADRESSE%TYPE
,ACTU_CP cg$row.ACTU_CP%TYPE
,ACTU_VILLE cg$row.ACTU_VILLE%TYPE
,ACTU_PAYS cg$row.ACTU_PAYS%TYPE
,PERM_ADRESSE cg$row.PERM_ADRESSE%TYPE
,PERM_CP cg$row.PERM_CP%TYPE
,PERM_VILLE cg$row.PERM_VILLE%TYPE
,PERM_PAYS cg$row.PERM_PAYS%TYPE
,DERNIER_DIPLOME cg$row.DERNIER_DIPLOME%TYPE
,UNIVERSITE cg$row.UNIVERSITE%TYPE
,SELECTION_ORIGINE cg$row.SELECTION_ORIGINE%TYPE
,SELECTION_COURANTE cg$row.SELECTION_COURANTE%TYPE
,REPONSE_ILI cg$row.REPONSE_ILI%TYPE
,DATE_REPONSE_ILI cg$row.DATE_REPONSE_ILI%TYPE
,REPONSE_CAN cg$row.REPONSE_CAN%TYPE
,DATE_REPONSE_CAN cg$row.DATE_REPONSE_CAN%TYPE
,NO_ORDRE cg$row.NO_ORDRE%TYPE
,the_rowid ROWID)
;

--  CANDIDAT indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,SEXE BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,DATE_NAISSANCE BOOLEAN DEFAULT FALSE
,LIEU_NAISSANCE BOOLEAN DEFAULT FALSE
,SITUATION BOOLEAN DEFAULT FALSE
,NATIONALITE BOOLEAN DEFAULT FALSE
,TEL_FIXE BOOLEAN DEFAULT FALSE
,TEL_PORT BOOLEAN DEFAULT FALSE
,EMAIL BOOLEAN DEFAULT FALSE
,ACTU_ADRESSE BOOLEAN DEFAULT FALSE
,ACTU_CP BOOLEAN DEFAULT FALSE
,ACTU_VILLE BOOLEAN DEFAULT FALSE
,ACTU_PAYS BOOLEAN DEFAULT FALSE
,PERM_ADRESSE BOOLEAN DEFAULT FALSE
,PERM_CP BOOLEAN DEFAULT FALSE
,PERM_VILLE BOOLEAN DEFAULT FALSE
,PERM_PAYS BOOLEAN DEFAULT FALSE
,DERNIER_DIPLOME BOOLEAN DEFAULT FALSE
,UNIVERSITE BOOLEAN DEFAULT FALSE
,SELECTION_ORIGINE BOOLEAN DEFAULT FALSE
,SELECTION_COURANTE BOOLEAN DEFAULT FALSE
,REPONSE_ILI BOOLEAN DEFAULT FALSE
,DATE_REPONSE_ILI BOOLEAN DEFAULT FALSE
,REPONSE_CAN BOOLEAN DEFAULT FALSE
,DATE_REPONSE_CAN BOOLEAN DEFAULT FALSE
,NO_ORDRE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  CANDIDAT primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF CANDIDAT%ROWTYPE
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
END cg$CANDIDAT;
/

