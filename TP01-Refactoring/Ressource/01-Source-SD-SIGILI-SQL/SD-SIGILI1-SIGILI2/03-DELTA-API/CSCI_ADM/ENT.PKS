create or replace PACKAGE cg$ENTREPRISE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
ENT_PK CONSTANT VARCHAR2(240) := '';
ENT_AUT_CREA_FK CONSTANT VARCHAR2(240) := '';
ENT_AUT_MAJ_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_ENTREPRISE CONSTANT VARCHAR2(240) := 'No Entreprise';
P20REFERENCEE CONSTANT VARCHAR2(240) := 'Ent Type';
P30DATE_REFERENCEMENT CONSTANT VARCHAR2(240) := 'Date Referencement';
P40LOGIN_CREA CONSTANT VARCHAR2(240) := 'Login';
P50DATE_CREA CONSTANT VARCHAR2(240) := 'Date Crea';
P60NOM CONSTANT VARCHAR2(240) := 'Nom';
P70SIEGE_SOCIAL CONSTANT VARCHAR2(240) := 'Siege Social';
P90DOMAINE_ACTIVITE CONSTANT VARCHAR2(240) := 'Domaine Activite';
P100ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P110CP CONSTANT VARCHAR2(240) := 'Cp';
P120VILLE CONSTANT VARCHAR2(240) := 'Ville';
P130PAYS CONSTANT VARCHAR2(240) := 'Pays';
P140TEL CONSTANT VARCHAR2(240) := 'Tel';
P150SITE_INTERNET CONSTANT VARCHAR2(240) := 'Site Internet';
P160NOM_REPRESENTANT CONSTANT VARCHAR2(240) := 'Nom Representant';
P170PRENOM_REPRESENTANT CONSTANT VARCHAR2(240) := 'Prenom Representant';
P175LOGIN_MAJ CONSTANT VARCHAR2(240) := 'Login';
P180DATE_MAJ CONSTANT VARCHAR2(240) := 'Date Maj';
P200OFFRE_STAGE CONSTANT VARCHAR2(240) := 'Offre Stage';

cg$row ENTREPRISE%ROWTYPE;

--  ENTREPRISE row type variable 
TYPE cg$row_type IS RECORD
(NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,REFERENCEE cg$row.REFERENCEE%TYPE
,DATE_REFERENCEMENT cg$row.DATE_REFERENCEMENT%TYPE
,LOGIN_CREA cg$row.LOGIN_CREA%TYPE
,DATE_CREA cg$row.DATE_CREA%TYPE
,NOM cg$row.NOM%TYPE
,SIEGE_SOCIAL cg$row.SIEGE_SOCIAL%TYPE
,DOMAINE_ACTIVITE cg$row.DOMAINE_ACTIVITE%TYPE
,ADRESSE cg$row.ADRESSE%TYPE
,CP cg$row.CP%TYPE
,VILLE cg$row.VILLE%TYPE
,PAYS cg$row.PAYS%TYPE
,TEL cg$row.TEL%TYPE
,SITE_INTERNET cg$row.SITE_INTERNET%TYPE
,NOM_REPRESENTANT cg$row.NOM_REPRESENTANT%TYPE
,PRENOM_REPRESENTANT cg$row.PRENOM_REPRESENTANT%TYPE
,LOGIN_MAJ cg$row.LOGIN_MAJ%TYPE
,DATE_MAJ cg$row.DATE_MAJ%TYPE
,OFFRE_STAGE cg$row.OFFRE_STAGE%TYPE
,the_rowid ROWID
,JN_NOTES VARCHAR2(240))
;

--  ENTREPRISE indicator type variable
TYPE cg$ind_type IS RECORD
(NO_ENTREPRISE BOOLEAN DEFAULT FALSE
,REFERENCEE BOOLEAN DEFAULT FALSE
,DATE_REFERENCEMENT BOOLEAN DEFAULT FALSE
,LOGIN_CREA BOOLEAN DEFAULT FALSE
,DATE_CREA BOOLEAN DEFAULT FALSE
,NOM BOOLEAN DEFAULT FALSE
,SIEGE_SOCIAL BOOLEAN DEFAULT FALSE
,DOMAINE_ACTIVITE BOOLEAN DEFAULT FALSE
,ADRESSE BOOLEAN DEFAULT FALSE
,CP BOOLEAN DEFAULT FALSE
,VILLE BOOLEAN DEFAULT FALSE
,PAYS BOOLEAN DEFAULT FALSE
,TEL BOOLEAN DEFAULT FALSE
,SITE_INTERNET BOOLEAN DEFAULT FALSE
,NOM_REPRESENTANT BOOLEAN DEFAULT FALSE
,PRENOM_REPRESENTANT BOOLEAN DEFAULT FALSE
,LOGIN_MAJ BOOLEAN DEFAULT FALSE
,DATE_MAJ BOOLEAN DEFAULT FALSE
,OFFRE_STAGE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  ENTREPRISE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_ENTREPRISE cg$row.NO_ENTREPRISE%TYPE
,the_rowid ROWID
,JN_NOTES VARCHAR2(240))
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF ENTREPRISE%ROWTYPE
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
PROCEDURE   insert_jn(cg$rec    IN cg$row_type,
                      operation IN VARCHAR2 DEFAULT 'INS'
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
END cg$ENTREPRISE;
/