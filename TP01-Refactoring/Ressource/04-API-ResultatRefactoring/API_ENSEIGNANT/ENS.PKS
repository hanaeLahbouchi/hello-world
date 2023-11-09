
PROMPT Creating API Package Specification for Table 'ENSEIGNANT'
--------------------------------------------------------------------------------
-- Name:        cg$ENSEIGNANT
-- Description: ENSEIGNANT table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$ENSEIGNANT IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
ENS_PK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P5NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P10TYPE CONSTANT VARCHAR2(240) := 'Ens Type';
P30SEXE CONSTANT VARCHAR2(240) := 'Sexe';
P40NOM CONSTANT VARCHAR2(240) := 'Nom';
P50PRENOM CONSTANT VARCHAR2(240) := 'Prenom';
P60ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P70CP CONSTANT VARCHAR2(240) := 'Cp';
P75VILLE CONSTANT VARCHAR2(240) := 'Ville';
P77PAYS CONSTANT VARCHAR2(240) := 'Pays';
P80TEL_PORT CONSTANT VARCHAR2(240) := 'Tel Port';
P86ENC_PERSO_TEL CONSTANT VARCHAR2(240) := 'Perso Tel';
P89ENC_UBO_TEL CONSTANT VARCHAR2(240) := 'Ubo Tel';
P90ENC_PERSO_EMAIL CONSTANT VARCHAR2(240) := 'Perso Email';
P92ENC_UBO_EMAIL CONSTANT VARCHAR2(240) := 'Ubo Email';
P110INT_NO_INSEE CONSTANT VARCHAR2(240) := 'No Insee';
P120INT_SOC_NOM CONSTANT VARCHAR2(240) := 'Soc Nom';
P130INT_SOC_ADRESSE CONSTANT VARCHAR2(240) := 'Soc Adresse';
P140INT_SOC_CP CONSTANT VARCHAR2(240) := 'Soc Cp';
P150INT_SOC_VILLE CONSTANT VARCHAR2(240) := 'Soc Ville';
P160INT_SOC_PAYS CONSTANT VARCHAR2(240) := 'Soc Pays';
P170INT_FONCTION CONSTANT VARCHAR2(240) := 'Fonction';
P180INT_PROF_EMAIL CONSTANT VARCHAR2(240) := 'Prof Email';
P190INT_PROF_TEL CONSTANT VARCHAR2(240) := 'Prof Tel';

cg$row ENSEIGNANT%ROWTYPE;

--  ENSEIGNANT row type variable 
TYPE cg$row_type IS RECORD
(NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,TYPE cg$row.TYPE%TYPE
,SEXE cg$row.SEXE%TYPE
,NOM cg$row.NOM%TYPE
,PRENOM cg$row.PRENOM%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CP cg$row.CP%TYPE
,VILLE cg$row.VILLE%TYPE
,PAYS cg$row.PAYS%TYPE
,TEL_PORT cg$row.TEL_PORT%TYPE
,ENC_PERSO_TEL cg$row.ENC_PERSO_TEL%TYPE
,ENC_UBO_TEL cg$row.ENC_UBO_TEL%TYPE
,ENC_PERSO_EMAIL cg$row.ENC_PERSO_EMAIL%TYPE
,ENC_UBO_EMAIL cg$row.ENC_UBO_EMAIL%TYPE
,INT_NO_INSEE cg$row.INT_NO_INSEE%TYPE
,INT_SOC_NOM cg$row.INT_SOC_NOM%TYPE
,INT_SOC_ADRESSE cg$row.INT_SOC_ADRESSE%TYPE
,INT_SOC_CP cg$row.INT_SOC_CP%TYPE
,INT_SOC_VILLE cg$row.INT_SOC_VILLE%TYPE
,INT_SOC_PAYS cg$row.INT_SOC_PAYS%TYPE
,INT_FONCTION cg$row.INT_FONCTION%TYPE
,INT_PROF_EMAIL cg$row.INT_PROF_EMAIL%TYPE
,INT_PROF_TEL cg$row.INT_PROF_TEL%TYPE
,the_rowid ROWID)
;

--  ENSEIGNANT indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,TYPE BOOLEAN DEFAULT FALSE
,SEXE BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,PRENOM BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CP BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,PAYS BOOLEAN DEFAULT FALSE
,TEL_PORT BOOLEAN DEFAULT FALSE
,ENC_PERSO_TEL BOOLEAN DEFAULT FALSE
,ENC_UBO_TEL BOOLEAN DEFAULT FALSE
,ENC_PERSO_EMAIL BOOLEAN DEFAULT FALSE
,ENC_UBO_EMAIL BOOLEAN DEFAULT FALSE
,INT_NO_INSEE BOOLEAN DEFAULT FALSE
,INT_SOC_NOM BOOLEAN DEFAULT FALSE
,INT_SOC_ADRESSE BOOLEAN DEFAULT FALSE
,INT_SOC_CP BOOLEAN DEFAULT FALSE
,INT_SOC_VILLE BOOLEAN DEFAULT FALSE
,INT_SOC_PAYS BOOLEAN DEFAULT FALSE
,INT_FONCTION BOOLEAN DEFAULT FALSE
,INT_PROF_EMAIL BOOLEAN DEFAULT FALSE
,INT_PROF_TEL BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  ENSEIGNANT primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF ENSEIGNANT%ROWTYPE
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
END cg$ENSEIGNANT;
/

