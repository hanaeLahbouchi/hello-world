
PROMPT Creating API Package Specification for Table 'EC'
--------------------------------------------------------------------------------
-- Name:        cg$EC
-- Description: EC table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$EC IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
EC_PK CONSTANT VARCHAR2(240) := '';
EC_UE_FK CONSTANT VARCHAR2(240) := '';

--  Column default prompts. Format PSEQNO_COL
P10ID_EC CONSTANT VARCHAR2(240) := 'Id Ec';
P20ID_UE CONSTANT VARCHAR2(240) := 'Id Ue';
P30SIGLE_EC CONSTANT VARCHAR2(240) := 'Sigle Ec';
P40NO_EC CONSTANT VARCHAR2(240) := 'No Ec';
P50DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P60ECTS CONSTANT VARCHAR2(240) := 'Ects';

cg$row EC%ROWTYPE;

--  EC row type variable 
TYPE cg$row_type IS RECORD
(ID_EC cg$row.ID_EC%TYPE
,ID_UE cg$row.ID_UE%TYPE
,SIGLE_EC cg$row.SIGLE_EC%TYPE
,NO_EC cg$row.NO_EC%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,ECTS cg$row.ECTS%TYPE
,the_rowid ROWID)
;

--  EC indicator type variable
TYPE cg$ind_type IS RECORD
(ID_EC BOOLEAN DEFAULT FALSE
,ID_UE BOOLEAN DEFAULT FALSE
,SIGLE_EC BOOLEAN DEFAULT FALSE
,NO_EC BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,ECTS BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  EC primary key type variable
TYPE cg$pk_type IS RECORD
(ID_EC cg$row.ID_EC%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF EC%ROWTYPE
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
END cg$EC;
/

