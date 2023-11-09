
--PROMPT Creating API Package Specification for Table 'RESSOURCE'
--------------------------------------------------------------------------------
-- Name:        cg$RESSOURCE
-- Description: RESSOURCE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE cg$RESSOURCE IS

called_from_package BOOLEAN := FALSE;

--  Repository User-Defined Error Messages
RES_PK CONSTANT VARCHAR2(240) := '';
RES_RUB_FK CONSTANT VARCHAR2(240) := '';

--  Column default --PROMPTs. Format PSEQNO_COL
P5ID_RES CONSTANT VARCHAR2(240) := 'Id Res';
P7ID_RUB CONSTANT VARCHAR2(240) := 'Id Rub';
P10TYPE_RES CONSTANT VARCHAR2(240) := 'Res Type';
P12NO_ORDRE CONSTANT VARCHAR2(240) := 'No Ordre';
P13DESIGNATION CONSTANT VARCHAR2(240) := 'Designation';
P14DESCRIPTION CONSTANT VARCHAR2(240) := 'Description';
P15COMMENTAIRE CONSTANT VARCHAR2(240) := 'Commentaire';
P30OUV_TITRE CONSTANT VARCHAR2(240) := 'Titre';
P40OUV_RESUME CONSTANT VARCHAR2(240) := 'Resume';
P50OUV_AUTEUR CONSTANT VARCHAR2(240) := 'Auteur';
P60OUV_EDITEUR CONSTANT VARCHAR2(240) := 'Editeur';
P70OUV_CODE_ISBN CONSTANT VARCHAR2(240) := 'Code Isbn';
P80OUV_DATE_PARUTION CONSTANT VARCHAR2(240) := 'Date Parution';
P90OUV_PROPRIETAIRE CONSTANT VARCHAR2(240) := 'Proprietaire';
P100OUV_LOCALISATION CONSTANT VARCHAR2(240) := 'Localisation';
P110URL_ADRESSE CONSTANT VARCHAR2(240) := 'Adresse';
P120LOG_NOM CONSTANT VARCHAR2(240) := 'Nom';
P130LOG_VERSION CONSTANT VARCHAR2(240) := 'Version';
P140LOG_TYPE_SUPPORT CONSTANT VARCHAR2(240) := 'Type Support';
P150LOG_EDITEUR CONSTANT VARCHAR2(240) := 'Log Editeur';
P160LOG_URL CONSTANT VARCHAR2(240) := 'Url';
P170LOG_OS CONSTANT VARCHAR2(240) := 'Os';
P180CD_FOURNISSEUR CONSTANT VARCHAR2(240) := 'Fournisseur';
P190CD_LOCALISATION CONSTANT VARCHAR2(240) := 'Cd Localisation';
P200DOC_TITRE CONSTANT VARCHAR2(240) := 'Doc Titre';
P210DOC_AUTEUR CONSTANT VARCHAR2(240) := 'Doc Auteur';
P220DOC_DATE_PARUTION CONSTANT VARCHAR2(240) := 'Doc Date Parution';
P230DOC_TYPE__DOC CONSTANT VARCHAR2(240) := 'Type  Doc';
P240DOC_FORMAT_DOC CONSTANT VARCHAR2(240) := 'Format Doc';

cg$row RESSOURCE%ROWTYPE;

--  RESSOURCE row type variable 
TYPE cg$row_type IS RECORD
(ID_RES cg$row.ID_RES%TYPE
,ID_RUB cg$row.ID_RUB%TYPE
,TYPE_RES cg$row.TYPE_RES%TYPE
,NO_ORDRE cg$row.NO_ORDRE%TYPE
,DESIGNATION cg$row.DESIGNATION%TYPE
,DESCRIPTION cg$row.DESCRIPTION%TYPE
,COMMENTAIRE cg$row.COMMENTAIRE%TYPE
,OUV_TITRE cg$row.OUV_TITRE%TYPE
,OUV_RESUME cg$row.OUV_RESUME%TYPE
,OUV_AUTEUR cg$row.OUV_AUTEUR%TYPE
,OUV_EDITEUR cg$row.OUV_EDITEUR%TYPE
,OUV_CODE_ISBN cg$row.OUV_CODE_ISBN%TYPE
,OUV_DATE_PARUTION cg$row.OUV_DATE_PARUTION%TYPE
,OUV_PROPRIETAIRE cg$row.OUV_PROPRIETAIRE%TYPE
,OUV_LOCALISATION cg$row.OUV_LOCALISATION%TYPE
,URL_ADRESSE cg$row.URL_ADRESSE%TYPE
,LOG_NOM cg$row.LOG_NOM%TYPE
,LOG_VERSION cg$row.LOG_VERSION%TYPE
,LOG_TYPE_SUPPORT cg$row.LOG_TYPE_SUPPORT%TYPE
,LOG_EDITEUR cg$row.LOG_EDITEUR%TYPE
,LOG_URL cg$row.LOG_URL%TYPE
,LOG_OS cg$row.LOG_OS%TYPE
,CD_FOURNISSEUR cg$row.CD_FOURNISSEUR%TYPE
,CD_LOCALISATION cg$row.CD_LOCALISATION%TYPE
,DOC_TITRE cg$row.DOC_TITRE%TYPE
,DOC_AUTEUR cg$row.DOC_AUTEUR%TYPE
,DOC_DATE_PARUTION cg$row.DOC_DATE_PARUTION%TYPE
,DOC_TYPE__DOC cg$row.DOC_TYPE__DOC%TYPE
,DOC_FORMAT_DOC cg$row.DOC_FORMAT_DOC%TYPE
,the_rowid ROWID)
;

--  RESSOURCE indicator type variable
TYPE cg$ind_type IS RECORD
(ID_RES BOOLEAN DEFAULT FALSE
,ID_RUB BOOLEAN DEFAULT FALSE
,TYPE_RES BOOLEAN DEFAULT FALSE
,NO_ORDRE BOOLEAN DEFAULT FALSE
,DESIGNATION BOOLEAN DEFAULT FALSE
,DESCRIPTION BOOLEAN DEFAULT FALSE
,COMMENTAIRE BOOLEAN DEFAULT FALSE
,OUV_TITRE BOOLEAN DEFAULT FALSE
,OUV_RESUME BOOLEAN DEFAULT FALSE
,OUV_AUTEUR BOOLEAN DEFAULT FALSE
,OUV_EDITEUR BOOLEAN DEFAULT FALSE
,OUV_CODE_ISBN BOOLEAN DEFAULT FALSE
,OUV_DATE_PARUTION BOOLEAN DEFAULT FALSE
,OUV_PROPRIETAIRE BOOLEAN DEFAULT FALSE
,OUV_LOCALISATION BOOLEAN DEFAULT FALSE
,URL_ADRESSE BOOLEAN DEFAULT FALSE
,LOG_NOM BOOLEAN DEFAULT FALSE
,LOG_VERSION BOOLEAN DEFAULT FALSE
,LOG_TYPE_SUPPORT BOOLEAN DEFAULT FALSE
,LOG_EDITEUR BOOLEAN DEFAULT FALSE
,LOG_URL BOOLEAN DEFAULT FALSE
,LOG_OS BOOLEAN DEFAULT FALSE
,CD_FOURNISSEUR BOOLEAN DEFAULT FALSE
,CD_LOCALISATION BOOLEAN DEFAULT FALSE
,DOC_TITRE BOOLEAN DEFAULT FALSE
,DOC_AUTEUR BOOLEAN DEFAULT FALSE
,DOC_DATE_PARUTION BOOLEAN DEFAULT FALSE
,DOC_TYPE__DOC BOOLEAN DEFAULT FALSE
,DOC_FORMAT_DOC BOOLEAN DEFAULT FALSE);

cg$ind_true cg$ind_type;

--  RESSOURCE primary key type variable
TYPE cg$pk_type IS RECORD
(ID_RES cg$row.ID_RES%TYPE
,the_rowid ROWID)
;

--  PL/SQL Table Type variable for triggers
TYPE cg$table_type IS TABLE OF RESSOURCE%ROWTYPE
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
END cg$RESSOURCE;
/

