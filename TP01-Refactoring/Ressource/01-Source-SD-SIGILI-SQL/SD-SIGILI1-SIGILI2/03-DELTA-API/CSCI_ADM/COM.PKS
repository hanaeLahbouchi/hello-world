
PROMPT Creating API Package Specification for Table 'COMPAGNIE'
--------------------------------------------------------------------------------
-- Name:        cg$COMPAGNIE
-- Description: COMPAGNIE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$COMPAGNIE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
COM_PK CONSTANT VARCHAR2(240) := '';
COM_PAP_FK CONSTANT VARCHAR2(240) := '';
COM_PRO_FK CONSTANT VARCHAR2(240) := '';
COM_ENS_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10CODE_COM CONSTANT VARCHAR2(240) := 'Code Com';
P20ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P25NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P27CODE_PAILI CONSTANT VARCHAR2(240) := 'Code Paili';
P30SIGLE_COM CONSTANT VARCHAR2(240) := 'Sigle Com';
P40NOM CONSTANT VARCHAR2(240) := 'Nom';
P50ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P60CP CONSTANT VARCHAR2(240) := 'Cp';
P70VILLE CONSTANT VARCHAR2(240) := 'Ville';
P80TEL CONSTANT VARCHAR2(240) := 'Tel';
P90EMAIL CONSTANT VARCHAR2(240) := 'Email';
P100LOGO CONSTANT VARCHAR2(240) := 'Logo';
P110NOM_PROJET CONSTANT VARCHAR2(240) := 'Nom Projet';
P120DESC_PROJET CONSTANT VARCHAR2(240) := 'Desc Projet';

cg$row COMPAGNIE%ROWTYPE;

--  COMPAGNIE row type variable 
TYPE cg$row_type IS RECORD
(CODE_COM cg$row.CODE_COM%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,CODE_PAILI cg$row.CODE_PAILI%TYPE
,SIGLE_COM cg$row.SIGLE_COM%TYPE
,NOM cg$row.NOM%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CP cg$row.CP%TYPE
,VILLE cg$row.VILLE%TYPE
,TEL cg$row.TEL%TYPE
,EMAIL cg$row.EMAIL%TYPE
,LOGO cg$row.LOGO%TYPE
,NOM_PROJET cg$row.NOM_PROJET%TYPE
,DESC_PROJET cg$row.DESC_PROJET%TYPE
,the_rowid ROWID)
;

--  COMPAGNIE indicator type variable
TYPE cg$ind_type IS RECORD
(CODE_COM BOOLEAN DEFAULT FALSE
,ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,CODE_PAILI BOOLEAN DEFAULT FALSE
,SIGLE_COM BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CP BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,TEL BOOLEAN DEFAULT FALSE
,EMAIL BOOLEAN DEFAULT FALSE
,LOGO BOOLEAN DEFAULT FALSE
,NOM_PROJET BOOLEAN DEFAULT FALSE
,DESC_PROJET BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  COMPAGNIE primary key type variable
TYPE cg$pk_type IS RECORD
(CODE_COM cg$row.CODE_COM%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF COMPAGNIE%ROWTYPE
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
END cg$COMPAGNIE;
/

