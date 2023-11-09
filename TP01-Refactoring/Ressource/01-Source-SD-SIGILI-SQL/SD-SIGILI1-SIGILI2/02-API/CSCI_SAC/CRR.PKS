
PROMPT Creating API Package Specification for Table 'COMPTE_RENDU_REUNION'
--------------------------------------------------------------------------------
-- Name:        cg$COMPTE_RENDU_REUNION
-- Description: COMPTE_RENDU_REUNION table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$COMPTE_RENDU_REUNION IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
CRR_PK CONSTANT VARCHAR2(240) := '';
CRR_COM_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_CRR CONSTANT VARCHAR2(240) := 'Numéro de compte rendu';
P20CODE_COM CONSTANT VARCHAR2(240) := 'Compagnie';
P30REUNION_NO CONSTANT VARCHAR2(240) := 'Numéro de réunion';
P35DATE_REUNION CONSTANT VARCHAR2(240) := 'Date Réunion';
P40OFFICIEL CONSTANT VARCHAR2(240) := 'Officiel ?';
P60LIBELLE CONSTANT VARCHAR2(240) := 'Libellé';
P70ETAT_AVANCEMENT CONSTANT VARCHAR2(240) := 'Etat Avancement';
P80COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';

cg$row COMPTE_RENDU_REUNION%ROWTYPE;

--  COMPTE_RENDU_REUNION row type variable 
TYPE cg$row_type IS RECORD
(NO_CRR cg$row.NO_CRR%TYPE
,CODE_COM cg$row.CODE_COM%TYPE
,REUNION_NO cg$row.REUNION_NO%TYPE
,DATE_REUNION cg$row.DATE_REUNION%TYPE
,OFFICIEL cg$row.OFFICIEL%TYPE
,LIBELLE cg$row.LIBELLE%TYPE
,ETAT_AVANCEMENT cg$row.ETAT_AVANCEMENT%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,the_rowid ROWID)
;

--  COMPTE_RENDU_REUNION indicator type variable
TYPE cg$ind_type IS RECORD
(NO_CRR BOOLEAN DEFAULT FALSE
,CODE_COM BOOLEAN DEFAULT FALSE
,REUNION_NO BOOLEAN DEFAULT FALSE
,DATE_REUNION BOOLEAN DEFAULT FALSE
,OFFICIEL BOOLEAN DEFAULT FALSE
,LIBELLE BOOLEAN DEFAULT FALSE
,ETAT_AVANCEMENT BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  COMPTE_RENDU_REUNION primary key type variable
TYPE cg$pk_type IS RECORD
(NO_CRR cg$row.NO_CRR%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF COMPTE_RENDU_REUNION%ROWTYPE
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
END cg$COMPTE_RENDU_REUNION;
/

