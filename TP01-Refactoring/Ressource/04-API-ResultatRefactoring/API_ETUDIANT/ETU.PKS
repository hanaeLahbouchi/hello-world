
PROMPT Creating API Package Specification for Table 'ETUDIANT'
--------------------------------------------------------------------------------
-- Name:        cg$ETUDIANT
-- Description: ETUDIANT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$ETUDIANT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
ETU_PK CONSTANT VARCHAR2(240) := '';
ETU_PRO_FK CONSTANT VARCHAR2(240) := '';
ETU_COM_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P25CODE_COM CONSTANT VARCHAR2(240) := 'Code Com';
P30NO_ETUDIANT_UBO CONSTANT VARCHAR2(240) := 'No Etudiant Ubo';
P40SEXE CONSTANT VARCHAR2(240) := 'Sexe';
P50NOM CONSTANT VARCHAR2(240) := 'Nom';
P60PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P70DATE_NAISSANCE CONSTANT VARCHAR2(240) := 'Date Naissance';
P80LIEU_NAISSANCE CONSTANT VARCHAR2(240) := 'Lieu Naissance';
P90SITUATION CONSTANT VARCHAR2(240) := 'Situation';
P100NATIONALITE CONSTANT VARCHAR2(240) := 'Nationalite';
P110TEL_PORT CONSTANT VARCHAR2(240) := 'Tel Port';
P120TEL_FIXE CONSTANT VARCHAR2(240) := 'Tel Fixe';
P130EMAIL CONSTANT VARCHAR2(240) := 'Email';
P140ACTU_ADRESSE CONSTANT VARCHAR2(240) := 'Actu Adresse';
P150ACTU_CP CONSTANT VARCHAR2(240) := 'Actu Cp';
P160ACTU_VILLE CONSTANT VARCHAR2(240) := 'Actu Ville';
P170ACTU_PAYS CONSTANT VARCHAR2(240) := 'Actu Pays';
P180PERM_ADRESSE CONSTANT VARCHAR2(240) := 'Perm Adresse';
P190PERM_CP CONSTANT VARCHAR2(240) := 'Perm Cp';
P200PERM_VILLE CONSTANT VARCHAR2(240) := 'Perm Ville';
P210PERM_PAYS CONSTANT VARCHAR2(240) := 'Perm Pays';
P220DERNIER_DIPLOME CONSTANT VARCHAR2(240) := 'Dernier Diplome';
P230UNIVERSITE CONSTANT VARCHAR2(240) := 'Universite';
P240SIGLE_ETU CONSTANT VARCHAR2(240) := 'Sigle Etu';
P250COMPTE_CRI CONSTANT VARCHAR2(240) := 'Compte Cri';
P260UBO_EMAIL CONSTANT VARCHAR2(240) := 'Ubo Email';
P270GRPE_ANGLAIS CONSTANT VARCHAR2(240) := 'Grpe Anglais';
P280ABANDON_MOTIF CONSTANT VARCHAR2(240) := 'Abandon Motif';
P290ABANDON_DATE CONSTANT VARCHAR2(240) := 'Abandon Date';
P291EST_DIPLOME CONSTANT VARCHAR2(240) := 'Est Diplome';

cg$row ETUDIANT%ROWTYPE;

--  ETUDIANT row type variable 
TYPE cg$row_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,CODE_COM cg$row.CODE_COM%TYPE
,NO_ETUDIANT_UBO cg$row.NO_ETUDIANT_UBO%TYPE
,SEXE cg$row.SEXE%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,DATE_NAISSANCE cg$row.DATE_NAISSANCE%TYPE
,LIEU_NAISSANCE cg$row.LIEU_NAISSANCE%TYPE
,SITUATION cg$row.SITUATION%TYPE
,NATIONALITE cg$row.NATIONALITE%TYPE
,TEL_PORT cg$row.TEL_PORT%TYPE
,TEL_FIXE cg$row.TEL_FIXE%TYPE
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
,SIGLE_ETU cg$row.SIGLE_ETU%TYPE
,COMPTE_CRI cg$row.COMPTE_CRI%TYPE
,UBO_EMAIL cg$row.UBO_EMAIL%TYPE
,GRPE_ANGLAIS cg$row.GRPE_ANGLAIS%TYPE
,ABANDON_MOTIF cg$row.ABANDON_MOTIF%TYPE
,ABANDON_DATE cg$row.ABANDON_DATE%TYPE
,EST_DIPLOME cg$row.EST_DIPLOME%TYPE
,the_rowid ROWID)
;

--  ETUDIANT indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,CODE_COM BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_UBO BOOLEAN DEFAULT FALSE
,SEXE BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,DATE_NAISSANCE BOOLEAN DEFAULT FALSE
,LIEU_NAISSANCE BOOLEAN DEFAULT FALSE
,SITUATION BOOLEAN DEFAULT FALSE
,NATIONALITE BOOLEAN DEFAULT FALSE
,TEL_PORT BOOLEAN DEFAULT FALSE
,TEL_FIXE BOOLEAN DEFAULT FALSE
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
,SIGLE_ETU BOOLEAN DEFAULT FALSE
,COMPTE_CRI BOOLEAN DEFAULT FALSE
,UBO_EMAIL BOOLEAN DEFAULT FALSE
,GRPE_ANGLAIS BOOLEAN DEFAULT FALSE
,ABANDON_MOTIF BOOLEAN DEFAULT FALSE
,ABANDON_DATE BOOLEAN DEFAULT FALSE
,EST_DIPLOME BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  ETUDIANT primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF ETUDIANT%ROWTYPE
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
END cg$ETUDIANT;
/

