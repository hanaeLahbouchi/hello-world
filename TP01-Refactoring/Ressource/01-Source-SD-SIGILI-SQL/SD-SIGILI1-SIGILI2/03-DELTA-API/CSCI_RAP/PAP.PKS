
PROMPT Creating API Package Specification for Table 'PROCESSUS_APPRENTISSAGE'
--------------------------------------------------------------------------------
-- Name:        cg$PROCESSUS_APPRENTISSAGE
-- Description: PROCESSUS_APPRENTISSAGE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$PROCESSUS_APPRENTISSAGE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
PAP_PK CONSTANT VARCHAR2(240) := '';
PAP_CRE_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10CODE_PAILI CONSTANT VARCHAR2(240) := 'Code Paili';
P20CODE_CRE CONSTANT VARCHAR2(240) := 'Code Cre';
P30NO_VERSION CONSTANT VARCHAR2(240) := 'No Version';
P40DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P50ETAT CONSTANT VARCHAR2(240) := 'Etat';
P60DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';
P70COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';
P80DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P90DATE_MODIFICATION CONSTANT VARCHAR2(240) := 'Date Modification';
P100DATE_DISPONIBILITE CONSTANT VARCHAR2(240) := 'Date Disponibilite';
P110DATE_RETRAIT CONSTANT VARCHAR2(240) := 'Date Retrait';

cg$row PROCESSUS_APPRENTISSAGE%ROWTYPE;

--  PROCESSUS_APPRENTISSAGE row type variable 
TYPE cg$row_type IS RECORD
(CODE_PAILI cg$row.CODE_PAILI%TYPE
,CODE_CRE cg$row.CODE_CRE%TYPE
,NO_VERSION cg$row.NO_VERSION%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,ETAT cg$row.ETAT%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,DATE_MODIFICATION cg$row.DATE_MODIFICATION%TYPE
,DATE_DISPONIBILITE cg$row.DATE_DISPONIBILITE%TYPE
,DATE_RETRAIT cg$row.DATE_RETRAIT%TYPE
,the_rowid ROWID)
;

--  PROCESSUS_APPRENTISSAGE indicator type variable
TYPE cg$ind_type IS RECORD
(CODE_PAILI BOOLEAN DEFAULT FALSE
,CODE_CRE BOOLEAN DEFAULT FALSE
,NO_VERSION BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,ETAT BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,DATE_MODIFICATION BOOLEAN DEFAULT FALSE
,DATE_DISPONIBILITE BOOLEAN DEFAULT FALSE
,DATE_RETRAIT BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  PROCESSUS_APPRENTISSAGE primary key type variable
TYPE cg$pk_type IS RECORD
(CODE_PAILI cg$row.CODE_PAILI%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF PROCESSUS_APPRENTISSAGE%ROWTYPE
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
END cg$PROCESSUS_APPRENTISSAGE;
/

