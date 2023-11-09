
PROMPT Creating API Package Specification for Table 'SOUTENANCE'
--------------------------------------------------------------------------------
-- Name:        cg$SOUTENANCE
-- Description: SOUTENANCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$SOUTENANCE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
SOUT_PK CONSTANT VARCHAR2(240) := '';
SOUT_PRO_FK CONSTANT VARCHAR2(240) := '';
SOUT_ENS_RESPONSABLE_FK CONSTANT VARCHAR2(240) := '';
SOUT_ENS_ASSESSEUR_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P8ANNEE_PRO CONSTANT VARCHAR2(240) := 'Annee Pro';
P10NO_SESSION CONSTANT VARCHAR2(240) := 'No Session';
P20NO_ENSEIGNANT_RESPONSABLE CONSTANT VARCHAR2(240) := 'No Enseignant';
P25NO_ENSEIGNANT_ASSESSEUR CONSTANT VARCHAR2(240) := 'No Enseignant';
P30DATE_SOUTENANCE CONSTANT VARCHAR2(240) := 'Sout Date';
P40PLAGE_HORAIRE CONSTANT VARCHAR2(240) := 'Plage Horaire';
P50SALLE CONSTANT VARCHAR2(240) := 'Salle';

cg$row SOUTENANCE%ROWTYPE;

--  SOUTENANCE row type variable 
TYPE cg$row_type IS RECORD
(ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,NO_SESSION cg$row.NO_SESSION%TYPE
,NO_ENSEIGNANT_RESPONSABLE cg$row.NO_ENSEIGNANT_RESPONSABLE%TYPE
,NO_ENSEIGNANT_ASSESSEUR cg$row.NO_ENSEIGNANT_ASSESSEUR%TYPE
,DATE_SOUTENANCE cg$row.DATE_SOUTENANCE%TYPE
,PLAGE_HORAIRE cg$row.PLAGE_HORAIRE%TYPE
,SALLE cg$row.SALLE%TYPE
,the_rowid ROWID)
;

--  SOUTENANCE indicator type variable
TYPE cg$ind_type IS RECORD
(ANNEE_PRO BOOLEAN DEFAULT FALSE
,NO_SESSION BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT_RESPONSABLE BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT_ASSESSEUR BOOLEAN DEFAULT FALSE
,DATE_SOUTENANCE BOOLEAN DEFAULT FALSE
,PLAGE_HORAIRE BOOLEAN DEFAULT FALSE
,SALLE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  SOUTENANCE primary key type variable
TYPE cg$pk_type IS RECORD
(NO_SESSION cg$row.NO_SESSION%TYPE
,ANNEE_PRO cg$row.ANNEE_PRO%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF SOUTENANCE%ROWTYPE
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
END cg$SOUTENANCE;
/

