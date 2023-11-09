
PROMPT Creating API Package Specification for Table 'VFAS'
--------------------------------------------------------------------------------
-- Name:        cg$VFAS
-- Description: VFAS table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$VFAS IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
VFAS_PK CONSTANT VARCHAR2(240) := '';
VFAS_FAS_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10NO_VERSION_VFAS CONSTANT VARCHAR2(240) := 'No Version Vfas';
P20ID_FAS CONSTANT VARCHAR2(240) := 'Id Fas';
P30NO_REVISION CONSTANT VARCHAR2(240) := 'No Revision';
P40DATE_CREATION CONSTANT VARCHAR2(240) := 'Date Creation';
P50DATE_MODIFICATION CONSTANT VARCHAR2(240) := 'Date Modification';
P60DESCRIPTION_TEXTUELLE CONSTANT VARCHAR2(240) := 'Description Textuelle';
P70AUTRES_RES_PEDA CONSTANT VARCHAR2(240) := 'Autres Res Peda';
P80CHARGE_PREV CONSTANT VARCHAR2(240) := 'Charge Prev';
P90NB_ETU_PREV CONSTANT VARCHAR2(240) := 'Nb Etu Prev';

cg$row VFAS%ROWTYPE;

--  VFAS row type variable 
TYPE cg$row_type IS RECORD
(NO_VERSION_VFAS cg$row.NO_VERSION_VFAS%TYPE
,ID_FAS cg$row.ID_FAS%TYPE
,NO_REVISION cg$row.NO_REVISION%TYPE
,DATE_CREATION cg$row.DATE_CREATION%TYPE
,DATE_MODIFICATION cg$row.DATE_MODIFICATION%TYPE
,DESCRIPTION_TEXTUELLE cg$row.DESCRIPTION_TEXTUELLE%TYPE
,AUTRES_RES_PEDA cg$row.AUTRES_RES_PEDA%TYPE
,CHARGE_PREV cg$row.CHARGE_PREV%TYPE
,NB_ETU_PREV cg$row.NB_ETU_PREV%TYPE
,the_rowid ROWID)
;

--  VFAS indicator type variable
TYPE cg$ind_type IS RECORD
(NO_VERSION_VFAS BOOLEAN DEFAULT FALSE
,ID_FAS BOOLEAN DEFAULT FALSE
,NO_REVISION BOOLEAN DEFAULT FALSE
,DATE_CREATION BOOLEAN DEFAULT FALSE
,DATE_MODIFICATION BOOLEAN DEFAULT FALSE
,DESCRIPTION_TEXTUELLE BOOLEAN DEFAULT FALSE
,AUTRES_RES_PEDA BOOLEAN DEFAULT FALSE
,CHARGE_PREV BOOLEAN DEFAULT FALSE
,NB_ETU_PREV BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  VFAS primary key type variable
TYPE cg$pk_type IS RECORD
(NO_VERSION_VFAS cg$row.NO_VERSION_VFAS%TYPE
,ID_FAS cg$row.ID_FAS%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF VFAS%ROWTYPE
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
END cg$VFAS;
/

