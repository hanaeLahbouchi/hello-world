
PROMPT Creating API Package Specification for Table 'INTERVENTION'
--------------------------------------------------------------------------------
-- Name:        cg$INTERVENTION
-- Description: INTERVENTION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$INTERVENTION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
INV_PK CONSTANT VARCHAR2(240) := '';
INV_ENS_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10ID_INTERVENTION CONSTANT VARCHAR2(240) := 'Id Intervention';
P20NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P30DEBUT CONSTANT VARCHAR2(240) := 'Debut';
P40FIN CONSTANT VARCHAR2(240) := 'Fin';
P50DUREE CONSTANT VARCHAR2(240) := 'Duree';
P60SALLE CONSTANT VARCHAR2(240) := 'Salle';
P70DOM_APP CONSTANT VARCHAR2(240) := 'Dom App';
P80COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';

cg$row INTERVENTION%ROWTYPE;

--  INTERVENTION row type variable 
TYPE cg$row_type IS RECORD
(ID_INTERVENTION cg$row.ID_INTERVENTION%TYPE
,NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,DEBUT cg$row.DEBUT%TYPE
,FIN cg$row.FIN%TYPE
,DUREE cg$row.DUREE%TYPE
,SALLE cg$row.SALLE%TYPE
,DOM_APP cg$row.DOM_APP%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,the_rowid ROWID)
;

--  INTERVENTION indicator type variable
TYPE cg$ind_type IS RECORD
(ID_INTERVENTION BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,DEBUT BOOLEAN DEFAULT FALSE
,FIN BOOLEAN DEFAULT FALSE
,DUREE BOOLEAN DEFAULT FALSE
,SALLE BOOLEAN DEFAULT FALSE
,DOM_APP BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  INTERVENTION primary key type variable
TYPE cg$pk_type IS RECORD
(ID_INTERVENTION cg$row.ID_INTERVENTION%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF INTERVENTION%ROWTYPE
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
END cg$INTERVENTION;
/

