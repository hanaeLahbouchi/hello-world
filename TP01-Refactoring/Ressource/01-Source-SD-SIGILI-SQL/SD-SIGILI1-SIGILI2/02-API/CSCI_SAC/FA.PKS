
PROMPT Creating API Package Specification for Table 'FA'
--------------------------------------------------------------------------------
-- Name:        cg$FA
-- Description: FA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$FA IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
FA_PK CONSTANT VARCHAR2(240) := '';
FA_SEQ_FK CONSTANT VARCHAR2(240) := '';
FA_ENS_FK CONSTANT VARCHAR2(240) := '';
FA_EC_FK CONSTANT VARCHAR2(240) := '';
FA_VFAS_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P5NO_SEQUENCE CONSTANT VARCHAR2(240) := 'No Sequence';
P10ID_FA CONSTANT VARCHAR2(240) := 'Id Fa';
P20CODE_COM CONSTANT VARCHAR2(240) := 'Code Com';
P40NO_ENSEIGNANT CONSTANT VARCHAR2(240) := 'No Enseignant';
P50ID_EC CONSTANT VARCHAR2(240) := 'Id Ec';
P60ID_FAS CONSTANT VARCHAR2(240) := 'Id Fas';
P70NO_VERSION_VFAS CONSTANT VARCHAR2(240) := 'No Version Vfas';
P80NO_FA CONSTANT VARCHAR2(240) := 'No Fa';
P85SIGLE_FA CONSTANT VARCHAR2(240) := 'Sigle Fa';
P90DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P100DESCRIPTION_TEXTUELLE CONSTANT VARCHAR2(240) := 'Description Textuelle';
P110DATE_ELABORATION CONSTANT VARCHAR2(240) := 'Date Elaboration';
P130DATE_DEBUT_ESTIME CONSTANT VARCHAR2(240) := 'Date Debut Estime';
P140DATE_FIN_ESTIME CONSTANT VARCHAR2(240) := 'Date Fin Estime';
P150AUTRES_RES_PEDA CONSTANT VARCHAR2(240) := 'Autres Res Peda';

cg$row FA%ROWTYPE;

--  FA row type variable 
TYPE cg$row_type IS RECORD
(NO_SEQUENCE cg$row.NO_SEQUENCE%TYPE
,ID_FA cg$row.ID_FA%TYPE
,CODE_COM cg$row.CODE_COM%TYPE
,NO_ENSEIGNANT cg$row.NO_ENSEIGNANT%TYPE
,ID_EC cg$row.ID_EC%TYPE
,ID_FAS cg$row.ID_FAS%TYPE
,NO_VERSION_VFAS cg$row.NO_VERSION_VFAS%TYPE
,NO_FA cg$row.NO_FA%TYPE
,SIGLE_FA cg$row.SIGLE_FA%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,DESCRIPTION_TEXTUELLE cg$row.DESCRIPTION_TEXTUELLE%TYPE
,DATE_ELABORATION cg$row.DATE_ELABORATION%TYPE
,DATE_DEBUT_ESTIME cg$row.DATE_DEBUT_ESTIME%TYPE
,DATE_FIN_ESTIME cg$row.DATE_FIN_ESTIME%TYPE
,AUTRES_RES_PEDA cg$row.AUTRES_RES_PEDA%TYPE
,the_rowid ROWID)
;

--  FA indicator type variable
TYPE cg$ind_type IS RECORD
(NO_SEQUENCE BOOLEAN DEFAULT FALSE
,ID_FA BOOLEAN DEFAULT FALSE
,CODE_COM BOOLEAN DEFAULT FALSE
,NO_ENSEIGNANT BOOLEAN DEFAULT FALSE
,ID_EC BOOLEAN DEFAULT FALSE
,ID_FAS BOOLEAN DEFAULT FALSE
,NO_VERSION_VFAS BOOLEAN DEFAULT FALSE
,NO_FA BOOLEAN DEFAULT FALSE
,SIGLE_FA BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,DESCRIPTION_TEXTUELLE BOOLEAN DEFAULT FALSE
,DATE_ELABORATION BOOLEAN DEFAULT FALSE
,DATE_DEBUT_ESTIME BOOLEAN DEFAULT FALSE
,DATE_FIN_ESTIME BOOLEAN DEFAULT FALSE
,AUTRES_RES_PEDA BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  FA primary key type variable
TYPE cg$pk_type IS RECORD
(ID_FA cg$row.ID_FA%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF FA%ROWTYPE
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
END cg$FA;
/

