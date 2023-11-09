
PROMPT Creating API Package Specification for Table 'SUIVI_PERSONNEL_COMPETENCE'
--------------------------------------------------------------------------------
-- Name:        cg$SUIVI_PERSONNEL_COMPETENCE
-- Description: SUIVI_PERSONNEL_COMPETENCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$SUIVI_PERSONNEL_COMPETENCE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
SC_PK CONSTANT VARCHAR2(240) := '';
SPC_ETU_FK CONSTANT VARCHAR2(240) := '';
SPC_MC_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P1ID_SPC CONSTANT VARCHAR2(240) := 'Id';
P2CODE_MCP CONSTANT VARCHAR2(240) := 'Code Mcp';
P3NO_ETUDIANT_NAT CONSTANT VARCHAR2(240) := 'No Etudiant Nat';
P5DATE_DEBUT CONSTANT VARCHAR2(240) := 'Date Debut';
P6COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';
P7DATE_FIN CONSTANT VARCHAR2(240) := 'Date Fin';

cg$row SUIVI_PERSONNEL_COMPETENCE%ROWTYPE;

--  SUIVI_PERSONNEL_COMPETENCE row type variable 
TYPE cg$row_type IS RECORD
(ID_SPC cg$row.ID_SPC%TYPE
,CODE_MCP cg$row.CODE_MCP%TYPE
,NO_ETUDIANT_NAT cg$row.NO_ETUDIANT_NAT%TYPE
,DATE_DEBUT cg$row.DATE_DEBUT%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,DATE_FIN cg$row.DATE_FIN%TYPE
,the_rowid ROWID)
;

--  SUIVI_PERSONNEL_COMPETENCE indicator type variable
TYPE cg$ind_type IS RECORD
(ID_SPC BOOLEAN DEFAULT FALSE
,CODE_MCP BOOLEAN DEFAULT FALSE
,NO_ETUDIANT_NAT BOOLEAN DEFAULT FALSE
,DATE_DEBUT BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE
,DATE_FIN BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  SUIVI_PERSONNEL_COMPETENCE primary key type variable
TYPE cg$pk_type IS RECORD
(ID_SPC cg$row.ID_SPC%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF SUIVI_PERSONNEL_COMPETENCE%ROWTYPE
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
END cg$SUIVI_PERSONNEL_COMPETENCE;
/

