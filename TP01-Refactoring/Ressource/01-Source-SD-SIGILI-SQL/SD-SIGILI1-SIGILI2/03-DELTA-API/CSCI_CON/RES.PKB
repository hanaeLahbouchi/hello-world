
--PROMPT Creating API Package Body for Table 'RESSOURCE'
--------------------------------------------------------------------------------
-- Name:        cg$RESSOURCE
-- Description: RESSOURCE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$RESSOURCE IS

PROCEDURE   validate_mandatory(cg$val_rec IN cg$row_type,
                               loc        IN VARCHAR2 DEFAULT '');
PROCEDURE   up_autogen_columns(cg$rec    IN OUT cg$row_type,
                               cg$ind    IN OUT cg$ind_type,
                               operation IN VARCHAR2 DEFAULT 'INS',
                               do_denorm IN BOOLEAN DEFAULT TRUE);
PROCEDURE   err_msg(msg  IN VARCHAR2,
                    type IN INTEGER,
                    loc  IN VARCHAR2 DEFAULT '');

--------------------------------------------------------------------------------
-- Name:        raise_uk_not_updateable
--
-- Description: Raise appropriate error when unique key updated
--
-- Parameters:  none
--------------------------------------------------------------------------------
PROCEDURE raise_uk_not_updateable(uk IN VARCHAR2) IS   
BEGIN
    cg$errors.push(cg$errors.MsgGetText(cg$errors.API_UNIQUE_KEY_UPDATE, cg$errors.ERR_UK_UPDATE, uk),
                   'E',
                   'API',
                   cg$errors.API_UNIQUE_KEY_UPDATE,
                   'cg$RESSOURCE.raise_uk_not_updateable');
                   cg$errors.raise_failure;
END raise_uk_not_updateable;


--------------------------------------------------------------------------------
-- Name:        raise_fk_not_transferable
--
-- Description: Raise appropriate error when foreign key updated
--
-- Parameters:  none
--------------------------------------------------------------------------------
PROCEDURE raise_fk_not_transferable(fk IN VARCHAR2) IS 
BEGIN
    cg$errors.push(cg$errors.MsgGetText(cg$errors.API_FOREIGN_KEY_TRANS, cg$errors.ERR_FK_TRANS, fk),
                   'E',
                   'API',
                   cg$errors.API_FOREIGN_KEY_TRANS,
                   'cg$RESSOURCE.raise_fk_not_transferable');
    cg$errors.raise_failure;
END raise_fk_not_transferable;


--------------------------------------------------------------------------------
-- Name:        up_autogen_columns
--
-- Description: Specific autogeneration of column values and conversion to 
--              uppercase
--
-- Parameters:  cg$rec    Record of row to be manipulated
--              cg$ind    Indicators for row
--              operation Procedure where this procedure was called
--------------------------------------------------------------------------------
PROCEDURE up_autogen_columns(cg$rec IN OUT cg$row_type,
                             cg$ind IN OUT cg$ind_type,
                             operation IN VARCHAR2 DEFAULT 'INS',
                             do_denorm IN BOOLEAN DEFAULT TRUE) IS
BEGIN
  IF (operation = 'INS') THEN
    BEGIN
			IF (cg$ind.ID_RES = FALSE
      OR  cg$rec.ID_RES is NULL) THEN 
				SELECT SEQ_RES.nextval
				INTO   cg$rec.ID_RES
				FROM   DUAL;
				cg$ind.ID_RES := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$RESSOURCE.up_autogen.ID_RES.OTHERS');
      cg$errors.raise_failure;
    END;
    NULL;
  ELSE      -- (operation = 'UPD')
    NULL;
  END IF;   -- (operation = 'INS') ELSE (operation = 'UPD')

  -- Statements executed for both 'INS' and 'UPD'


EXCEPTION
  WHEN no_data_found THEN
    NULL;
  WHEN others THEN
    cg$errors.push( SQLERRM, 'E', 'ORA', SQLCODE, 
                    'cg$RESSOURCE.up_autogen_columns');
    cg$errors.raise_failure;
END up_autogen_columns;


--------------------------------------------------------------------------------
-- Name:        validate_mandatory
--
-- Description: Checks all mandatory columns are not null and raises appropriate
--              error if not satisfied
--
-- Parameters:  cg$val_rec Record of row to be checked
--              loc        Place where this procedure was called for error 
--                         trapping
--------------------------------------------------------------------------------
PROCEDURE validate_mandatory(cg$val_rec IN cg$row_type,
                             loc        IN VARCHAR2 DEFAULT '') IS
BEGIN
    IF (cg$val_rec.ID_RES IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P5ID_RES),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ID_RUB IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P7ID_RUB),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE_RES IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10TYPE_RES),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ORDRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P12NO_ORDRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DESIGNATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P13DESIGNATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    NULL;
END validate_mandatory;


--------------------------------------------------------------------------------
-- Name:        validate_foreign_keys
--
-- Description: Checks all mandatory columns are not null and raises appropriate
--              error if not satisfied
--
-- Parameters:  cg$rec Record of row to be checked
--------------------------------------------------------------------------------
PROCEDURE validate_foreign_keys_ins(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;

PROCEDURE validate_foreign_keys_upd( cg$rec IN cg$row_type, 
                                     cg$old_rec IN cg$row_type, 
                                     cg$ind IN cg$ind_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;

PROCEDURE validate_foreign_keys_del(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
BEGIN
NULL;
END;


--------------------------------------------------------------------------------
-- Name:        slct
--
-- Description: Selects into the given parameter all the attributes for the row
--              given by the primary key
--
-- Parameters:  cg$sel_rec  Record of row to be selected into using its PK
--------------------------------------------------------------------------------
PROCEDURE slct(cg$sel_rec IN OUT cg$row_type) IS

BEGIN

    IF cg$sel_rec.the_rowid is null THEN
       SELECT    ID_RES
       ,         ID_RUB
       ,         TYPE_RES
       ,         NO_ORDRE
       ,         DESIGNATION
       ,         DESCRIPTION
       ,         COMMENTAIRE
       ,         OUV_TITRE
       ,         OUV_RESUME
       ,         OUV_AUTEUR
       ,         OUV_EDITEUR
       ,         OUV_CODE_ISBN
       ,         OUV_DATE_PARUTION
       ,         OUV_PROPRIETAIRE
       ,         OUV_LOCALISATION
       ,         URL_ADRESSE
       ,         LOG_NOM
       ,         LOG_VERSION
       ,         LOG_TYPE_SUPPORT
       ,         LOG_EDITEUR
       ,         LOG_URL
       ,         LOG_OS
       ,         CD_FOURNISSEUR
       ,         CD_LOCALISATION
       ,         DOC_TITRE
       ,         DOC_AUTEUR
       ,         DOC_DATE_PARUTION
       ,         DOC_TYPE__DOC
       ,         DOC_FORMAT_DOC
       , rowid
       INTO      cg$sel_rec.ID_RES
       ,         cg$sel_rec.ID_RUB
       ,         cg$sel_rec.TYPE_RES
       ,         cg$sel_rec.NO_ORDRE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.OUV_TITRE
       ,         cg$sel_rec.OUV_RESUME
       ,         cg$sel_rec.OUV_AUTEUR
       ,         cg$sel_rec.OUV_EDITEUR
       ,         cg$sel_rec.OUV_CODE_ISBN
       ,         cg$sel_rec.OUV_DATE_PARUTION
       ,         cg$sel_rec.OUV_PROPRIETAIRE
       ,         cg$sel_rec.OUV_LOCALISATION
       ,         cg$sel_rec.URL_ADRESSE
       ,         cg$sel_rec.LOG_NOM
       ,         cg$sel_rec.LOG_VERSION
       ,         cg$sel_rec.LOG_TYPE_SUPPORT
       ,         cg$sel_rec.LOG_EDITEUR
       ,         cg$sel_rec.LOG_URL
       ,         cg$sel_rec.LOG_OS
       ,         cg$sel_rec.CD_FOURNISSEUR
       ,         cg$sel_rec.CD_LOCALISATION
       ,         cg$sel_rec.DOC_TITRE
       ,         cg$sel_rec.DOC_AUTEUR
       ,         cg$sel_rec.DOC_DATE_PARUTION
       ,         cg$sel_rec.DOC_TYPE__DOC
       ,         cg$sel_rec.DOC_FORMAT_DOC
       ,cg$sel_rec.the_rowid
       FROM   RESSOURCE
       WHERE        ID_RES = cg$sel_rec.ID_RES;
    ELSE
       SELECT    ID_RES
       ,         ID_RUB
       ,         TYPE_RES
       ,         NO_ORDRE
       ,         DESIGNATION
       ,         DESCRIPTION
       ,         COMMENTAIRE
       ,         OUV_TITRE
       ,         OUV_RESUME
       ,         OUV_AUTEUR
       ,         OUV_EDITEUR
       ,         OUV_CODE_ISBN
       ,         OUV_DATE_PARUTION
       ,         OUV_PROPRIETAIRE
       ,         OUV_LOCALISATION
       ,         URL_ADRESSE
       ,         LOG_NOM
       ,         LOG_VERSION
       ,         LOG_TYPE_SUPPORT
       ,         LOG_EDITEUR
       ,         LOG_URL
       ,         LOG_OS
       ,         CD_FOURNISSEUR
       ,         CD_LOCALISATION
       ,         DOC_TITRE
       ,         DOC_AUTEUR
       ,         DOC_DATE_PARUTION
       ,         DOC_TYPE__DOC
       ,         DOC_FORMAT_DOC
       , rowid
       INTO      cg$sel_rec.ID_RES
       ,         cg$sel_rec.ID_RUB
       ,         cg$sel_rec.TYPE_RES
       ,         cg$sel_rec.NO_ORDRE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.OUV_TITRE
       ,         cg$sel_rec.OUV_RESUME
       ,         cg$sel_rec.OUV_AUTEUR
       ,         cg$sel_rec.OUV_EDITEUR
       ,         cg$sel_rec.OUV_CODE_ISBN
       ,         cg$sel_rec.OUV_DATE_PARUTION
       ,         cg$sel_rec.OUV_PROPRIETAIRE
       ,         cg$sel_rec.OUV_LOCALISATION
       ,         cg$sel_rec.URL_ADRESSE
       ,         cg$sel_rec.LOG_NOM
       ,         cg$sel_rec.LOG_VERSION
       ,         cg$sel_rec.LOG_TYPE_SUPPORT
       ,         cg$sel_rec.LOG_EDITEUR
       ,         cg$sel_rec.LOG_URL
       ,         cg$sel_rec.LOG_OS
       ,         cg$sel_rec.CD_FOURNISSEUR
       ,         cg$sel_rec.CD_LOCALISATION
       ,         cg$sel_rec.DOC_TITRE
       ,         cg$sel_rec.DOC_AUTEUR
       ,         cg$sel_rec.DOC_DATE_PARUTION
       ,         cg$sel_rec.DOC_TYPE__DOC
       ,         cg$sel_rec.DOC_FORMAT_DOC
       ,cg$sel_rec.the_rowid
       FROM   RESSOURCE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$RESSOURCE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to RESSOURCE 
--
-- Parameters:  cg$rec     Record of RESSOURCE current values
--              cg$old_rec Record of RESSOURCE previous values
--------------------------------------------------------------------------------
PROCEDURE cascade_update(cg$new_rec IN OUT cg$row_type,
                         cg$old_rec IN     cg$row_type) IS
BEGIN
  NULL;
END cascade_update;


--------------------------------------------------------------------------------
-- Name:        validate_domain_cascade_update
--
-- Description: Implement the Domain Key Constraint Cascade Updates Resticts rule
--              of each child table that references this tableRESSOURCE 
--
-- Parameters:  cg$old_rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain_cascade_update( cg$old_rec IN cg$row_type ) IS
  dk_check INTEGER;
BEGIN
  NULL;
END validate_domain_cascade_update;


-----------------------------------------------------------------------------------------
-- Name:        domain_cascade_update
--
-- Description: Implement the Domain Key Constraint Cascade Updates rules of each
--              child table that references this table RESSOURCE 
--
-- Parameters:  cg$new_rec  New values for RESSOURCE's domain key constraint columns 
--              cg$new_ind  Indicates changed RESSOURCE's domain key constraint columns
--              cg$old_rec  Current values for RESSOURCE's domain key constraint columns
-----------------------------------------------------------------------------------------
PROCEDURE domain_cascade_update(cg$new_rec IN OUT cg$row_type,
                                cg$new_ind IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type) IS
BEGIN
  NULL;
END domain_cascade_update;


--------------------------------------------------------------------------------
-- Name:        cascade_delete
--
-- Description: Delete all child tables affected by a delete to RESSOURCE 
--
-- Parameters:  cg$rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE cascade_delete(cg$old_rec IN OUT cg$row_type)
IS
BEGIN
  NULL;
END cascade_delete;

--------------------------------------------------------------------------------
-- Name:        domain_cascade_delete
--
-- Description: Implement the Domain Key Constraint Cascade Delete rules of each
--              child table that references this tableRESSOURCE 
--
-- Parameters:  cg$old_rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE domain_cascade_delete( cg$old_rec IN cg$row_type )
IS
BEGIN
  NULL;
END domain_cascade_delete;


--------------------------------------------------------------------------------
-- Name:        validate_domain_cascade_delete
--
-- Description: Implement the Domain Key Constraint Cascade Delete Restricts rule
--              of each child table that references this tableRESSOURCE 
--
-- Parameters:  cg$old_rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain_cascade_delete(cg$old_rec IN cg$row_type)
IS
    dk_check INTEGER;
BEGIN
  NULL;
END validate_domain_cascade_delete;



--------------------------------------------------------------------------------
-- Name:        validate_arc
--
-- Description: Checks for adherence to arc relationship 
--
-- Parameters:  cg$rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE validate_arc(cg$rec IN OUT cg$row_type) IS
i NUMBER;
BEGIN
    NULL;
END validate_arc;


--------------------------------------------------------------------------------
-- Name:        validate_domain
--
-- Description: Checks against reference table for values lying in a domain 
--
-- Parameters:  cg$rec     Record of RESSOURCE current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                          cg$ind IN cg$ind_type DEFAULT cg$ind_true)
IS
  dummy NUMBER;
  found BOOLEAN;
  no_tabview EXCEPTION;
  PRAGMA EXCEPTION_INIT(no_tabview, -942); 
BEGIN































    NULL;

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        cg$errors.raise_failure;
    WHEN no_tabview THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_RV_TAB_NOT_FOUND,
                                            cg$errors.APIMSG_RV_TAB_NOT_FOUND,
                                            'CG_REF_CODES','RESSOURCE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$RESSOURCE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$RESSOURCE.v_domain.others');
        cg$errors.raise_failure;
END validate_domain;


--------------------------------------------------------------------------------
-- Name:        err_msg
--
-- Description: Pushes onto stack appropriate user defined error message
--              depending on the rule violated
--
-- Parameters:  msg     Oracle error message
--              type    Type of violation e.g. check_constraint: ERR_CHECK_CON
--              loc     Place where this procedure was called for error 
--                      trapping
--------------------------------------------------------------------------------
PROCEDURE err_msg(msg   IN VARCHAR2,
                  type  IN INTEGER,
                  loc   IN VARCHAR2 DEFAULT '') IS
con_name VARCHAR2(240);
BEGIN
    con_name := cg$errors.parse_constraint(msg, type);
    IF (con_name = 'RES_PK') THEN
        cg$errors.push(nvl(RES_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'RES_PK' 
                                     ,'RESSOURCE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'RES_RUB_FK') THEN
        cg$errors.push(nvl(RES_RUB_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'RES_RUB_FK' 
                                     ,'RESSOURCE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSE
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       loc);
    END IF;
END err_msg;




--------------------------------------------------------------------------------
-- Name:        doLobs
--
-- Description: This function is updating lob columns
--
-- Parameters:  cg$rec  Record of row to be inserted
--              cg$ind  Record of columns specifically set
--------------------------------------------------------------------------------
PROCEDURE doLobs(cg$rec IN OUT cg$row_type,
                 cg$ind IN OUT cg$ind_type) IS
BEGIN
   NULL;
END doLobs;


--------------------------------------------------------------------------------
-- Name:        ins
--
-- Description: API insert procedure
--
-- Parameters:  cg$rec  Record of row to be inserted
--              cg$ind  Record of columns specifically set
--              do_ins  Whether we want the actual INSERT to occur
--------------------------------------------------------------------------------
PROCEDURE ins(cg$rec IN OUT cg$row_type,
              cg$ind IN OUT cg$ind_type,
              do_ins IN BOOLEAN DEFAULT TRUE) IS
cg$tmp_rec cg$row_type;

--  Constant default values


BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO RESSOURCE
            (ID_RES
            ,ID_RUB
            ,TYPE_RES
            ,NO_ORDRE
            ,DESIGNATION
            ,DESCRIPTION
            ,COMMENTAIRE
            ,OUV_TITRE
            ,OUV_RESUME
            ,OUV_AUTEUR
            ,OUV_EDITEUR
            ,OUV_CODE_ISBN
            ,OUV_DATE_PARUTION
            ,OUV_PROPRIETAIRE
            ,OUV_LOCALISATION
            ,URL_ADRESSE
            ,LOG_NOM
            ,LOG_VERSION
            ,LOG_TYPE_SUPPORT
            ,LOG_EDITEUR
            ,LOG_URL
            ,LOG_OS
            ,CD_FOURNISSEUR
            ,CD_LOCALISATION
            ,DOC_TITRE
            ,DOC_AUTEUR
            ,DOC_DATE_PARUTION
            ,DOC_TYPE__DOC
            ,DOC_FORMAT_DOC)
        VALUES
            (cg$rec.ID_RES
            ,cg$rec.ID_RUB
            ,cg$rec.TYPE_RES
            ,cg$rec.NO_ORDRE
            ,cg$rec.DESIGNATION
            ,cg$rec.DESCRIPTION
            ,cg$rec.COMMENTAIRE
            ,cg$rec.OUV_TITRE
            ,cg$rec.OUV_RESUME
            ,cg$rec.OUV_AUTEUR
            ,cg$rec.OUV_EDITEUR
            ,cg$rec.OUV_CODE_ISBN
            ,cg$rec.OUV_DATE_PARUTION
            ,cg$rec.OUV_PROPRIETAIRE
            ,cg$rec.OUV_LOCALISATION
            ,cg$rec.URL_ADRESSE
            ,cg$rec.LOG_NOM
            ,cg$rec.LOG_VERSION
            ,cg$rec.LOG_TYPE_SUPPORT
            ,cg$rec.LOG_EDITEUR
            ,cg$rec.LOG_URL
            ,cg$rec.LOG_OS
            ,cg$rec.CD_FOURNISSEUR
            ,cg$rec.CD_LOCALISATION
            ,cg$rec.DOC_TITRE
            ,cg$rec.DOC_AUTEUR
            ,cg$rec.DOC_DATE_PARUTION
            ,cg$rec.DOC_TYPE__DOC
            ,cg$rec.DOC_FORMAT_DOC
);
        doLobs(cg$rec, cg$ind);
        slct(cg$rec);

        upd_oper_denorm2(cg$rec, cg$tmp_rec, cg$ind, 'INS');
    END IF;

    called_from_package := FALSE;



--  Application logic Post-Insert <<Start>>
--  Application logic Post-Insert << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.mandatory_missing THEN
        validate_mandatory(cg$rec, 'cg$RESSOURCE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$RESSOURCE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$RESSOURCE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$RESSOURCE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$RESSOURCE.ins.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END ins;


--------------------------------------------------------------------------------
-- Name:        upd
--
-- Description: API update procedure
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd(cg$rec             IN OUT cg$row_type,
              cg$ind             IN OUT cg$ind_type,
              do_upd             IN BOOLEAN DEFAULT TRUE,
              cg$pk              IN cg$row_type DEFAULT NULL )    
IS
  cg$upd_rec    cg$row_type;
  cg$old_rec    cg$row_type;
  RECORD_LOGGED BOOLEAN := FALSE;
BEGIN
--  Application_logic Pre-Update <<Start>>
--  Application_logic Pre-Update << End >>

 
    IF ( cg$pk.ID_RES IS NULL ) THEN          
      cg$upd_rec.ID_RES := cg$rec.ID_RES;
    ELSE
      cg$upd_rec.ID_RES := cg$pk.ID_RES;
    END IF;
    cg$old_rec.ID_RES := cg$upd_rec.ID_RES;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key RES_PK
        IF (cg$ind.ID_RES AND cg$rec.ID_RES != cg$upd_rec.ID_RES) THEN
            raise_uk_not_updateable('RES_PK');
        END IF;
        IF NOT (cg$ind.ID_RES) THEN
            cg$rec.ID_RES := cg$upd_rec.ID_RES;
        END IF;
        IF NOT (cg$ind.ID_RUB) THEN
            cg$rec.ID_RUB := cg$upd_rec.ID_RUB;
        END IF;
        IF NOT (cg$ind.TYPE_RES) THEN
            cg$rec.TYPE_RES := cg$upd_rec.TYPE_RES;
        END IF;
        IF NOT (cg$ind.NO_ORDRE) THEN
            cg$rec.NO_ORDRE := cg$upd_rec.NO_ORDRE;
        END IF;
        IF NOT (cg$ind.DESIGNATION) THEN
            cg$rec.DESIGNATION := cg$upd_rec.DESIGNATION;
        END IF;
        IF NOT (cg$ind.DESCRIPTION) THEN
            cg$rec.DESCRIPTION := cg$upd_rec.DESCRIPTION;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE) THEN
            cg$rec.COMMENTAIRE := cg$upd_rec.COMMENTAIRE;
        END IF;
        IF NOT (cg$ind.OUV_TITRE) THEN
            cg$rec.OUV_TITRE := cg$upd_rec.OUV_TITRE;
        END IF;
        IF NOT (cg$ind.OUV_RESUME) THEN
            cg$rec.OUV_RESUME := cg$upd_rec.OUV_RESUME;
        END IF;
        IF NOT (cg$ind.OUV_AUTEUR) THEN
            cg$rec.OUV_AUTEUR := cg$upd_rec.OUV_AUTEUR;
        END IF;
        IF NOT (cg$ind.OUV_EDITEUR) THEN
            cg$rec.OUV_EDITEUR := cg$upd_rec.OUV_EDITEUR;
        END IF;
        IF NOT (cg$ind.OUV_CODE_ISBN) THEN
            cg$rec.OUV_CODE_ISBN := cg$upd_rec.OUV_CODE_ISBN;
        END IF;
        IF NOT (cg$ind.OUV_DATE_PARUTION) THEN
            cg$rec.OUV_DATE_PARUTION := cg$upd_rec.OUV_DATE_PARUTION;
        END IF;
        IF NOT (cg$ind.OUV_PROPRIETAIRE) THEN
            cg$rec.OUV_PROPRIETAIRE := cg$upd_rec.OUV_PROPRIETAIRE;
        END IF;
        IF NOT (cg$ind.OUV_LOCALISATION) THEN
            cg$rec.OUV_LOCALISATION := cg$upd_rec.OUV_LOCALISATION;
        END IF;
        IF NOT (cg$ind.URL_ADRESSE) THEN
            cg$rec.URL_ADRESSE := cg$upd_rec.URL_ADRESSE;
        END IF;
        IF NOT (cg$ind.LOG_NOM) THEN
            cg$rec.LOG_NOM := cg$upd_rec.LOG_NOM;
        END IF;
        IF NOT (cg$ind.LOG_VERSION) THEN
            cg$rec.LOG_VERSION := cg$upd_rec.LOG_VERSION;
        END IF;
        IF NOT (cg$ind.LOG_TYPE_SUPPORT) THEN
            cg$rec.LOG_TYPE_SUPPORT := cg$upd_rec.LOG_TYPE_SUPPORT;
        END IF;
        IF NOT (cg$ind.LOG_EDITEUR) THEN
            cg$rec.LOG_EDITEUR := cg$upd_rec.LOG_EDITEUR;
        END IF;
        IF NOT (cg$ind.LOG_URL) THEN
            cg$rec.LOG_URL := cg$upd_rec.LOG_URL;
        END IF;
        IF NOT (cg$ind.LOG_OS) THEN
            cg$rec.LOG_OS := cg$upd_rec.LOG_OS;
        END IF;
        IF NOT (cg$ind.CD_FOURNISSEUR) THEN
            cg$rec.CD_FOURNISSEUR := cg$upd_rec.CD_FOURNISSEUR;
        END IF;
        IF NOT (cg$ind.CD_LOCALISATION) THEN
            cg$rec.CD_LOCALISATION := cg$upd_rec.CD_LOCALISATION;
        END IF;
        IF NOT (cg$ind.DOC_TITRE) THEN
            cg$rec.DOC_TITRE := cg$upd_rec.DOC_TITRE;
        END IF;
        IF NOT (cg$ind.DOC_AUTEUR) THEN
            cg$rec.DOC_AUTEUR := cg$upd_rec.DOC_AUTEUR;
        END IF;
        IF NOT (cg$ind.DOC_DATE_PARUTION) THEN
            cg$rec.DOC_DATE_PARUTION := cg$upd_rec.DOC_DATE_PARUTION;
        END IF;
        IF NOT (cg$ind.DOC_TYPE__DOC) THEN
            cg$rec.DOC_TYPE__DOC := cg$upd_rec.DOC_TYPE__DOC;
        END IF;
        IF NOT (cg$ind.DOC_FORMAT_DOC) THEN
            cg$rec.DOC_FORMAT_DOC := cg$upd_rec.DOC_FORMAT_DOC;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key RES_PK
        IF ( cg$ind.ID_RES ) THEN
          raise_uk_not_updateable('RES_PK');
        END IF;
    END IF;

    up_autogen_columns(cg$rec, cg$ind, 'UPD', do_upd);  --  Auto-generated and uppercased columns

--  Now do update if updateable columns exist
    IF (do_upd) THEN
        DECLARE
            called_from BOOLEAN := called_from_package;
        BEGIN
          called_from_package := TRUE;

          slct(cg$old_rec);                          
          validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);
          validate_arc(cg$rec);
          validate_domain(cg$rec, cg$ind);
          validate_domain_cascade_update(cg$old_rec);

          IF cg$rec.the_rowid is null THEN
            UPDATE RESSOURCE
            SET
              ID_RUB = cg$rec.ID_RUB
              ,TYPE_RES = cg$rec.TYPE_RES
              ,NO_ORDRE = cg$rec.NO_ORDRE
              ,DESIGNATION = cg$rec.DESIGNATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,OUV_TITRE = cg$rec.OUV_TITRE
              ,OUV_RESUME = cg$rec.OUV_RESUME
              ,OUV_AUTEUR = cg$rec.OUV_AUTEUR
              ,OUV_EDITEUR = cg$rec.OUV_EDITEUR
              ,OUV_CODE_ISBN = cg$rec.OUV_CODE_ISBN
              ,OUV_DATE_PARUTION = cg$rec.OUV_DATE_PARUTION
              ,OUV_PROPRIETAIRE = cg$rec.OUV_PROPRIETAIRE
              ,OUV_LOCALISATION = cg$rec.OUV_LOCALISATION
              ,URL_ADRESSE = cg$rec.URL_ADRESSE
              ,LOG_NOM = cg$rec.LOG_NOM
              ,LOG_VERSION = cg$rec.LOG_VERSION
              ,LOG_TYPE_SUPPORT = cg$rec.LOG_TYPE_SUPPORT
              ,LOG_EDITEUR = cg$rec.LOG_EDITEUR
              ,LOG_URL = cg$rec.LOG_URL
              ,LOG_OS = cg$rec.LOG_OS
              ,CD_FOURNISSEUR = cg$rec.CD_FOURNISSEUR
              ,CD_LOCALISATION = cg$rec.CD_LOCALISATION
              ,DOC_TITRE = cg$rec.DOC_TITRE
              ,DOC_AUTEUR = cg$rec.DOC_AUTEUR
              ,DOC_DATE_PARUTION = cg$rec.DOC_DATE_PARUTION
              ,DOC_TYPE__DOC = cg$rec.DOC_TYPE__DOC
              ,DOC_FORMAT_DOC = cg$rec.DOC_FORMAT_DOC
            WHERE  ID_RES = cg$rec.ID_RES;
            null;
          ELSE
            UPDATE RESSOURCE
            SET
              ID_RUB = cg$rec.ID_RUB
              ,TYPE_RES = cg$rec.TYPE_RES
              ,NO_ORDRE = cg$rec.NO_ORDRE
              ,DESIGNATION = cg$rec.DESIGNATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,OUV_TITRE = cg$rec.OUV_TITRE
              ,OUV_RESUME = cg$rec.OUV_RESUME
              ,OUV_AUTEUR = cg$rec.OUV_AUTEUR
              ,OUV_EDITEUR = cg$rec.OUV_EDITEUR
              ,OUV_CODE_ISBN = cg$rec.OUV_CODE_ISBN
              ,OUV_DATE_PARUTION = cg$rec.OUV_DATE_PARUTION
              ,OUV_PROPRIETAIRE = cg$rec.OUV_PROPRIETAIRE
              ,OUV_LOCALISATION = cg$rec.OUV_LOCALISATION
              ,URL_ADRESSE = cg$rec.URL_ADRESSE
              ,LOG_NOM = cg$rec.LOG_NOM
              ,LOG_VERSION = cg$rec.LOG_VERSION
              ,LOG_TYPE_SUPPORT = cg$rec.LOG_TYPE_SUPPORT
              ,LOG_EDITEUR = cg$rec.LOG_EDITEUR
              ,LOG_URL = cg$rec.LOG_URL
              ,LOG_OS = cg$rec.LOG_OS
              ,CD_FOURNISSEUR = cg$rec.CD_FOURNISSEUR
              ,CD_LOCALISATION = cg$rec.CD_LOCALISATION
              ,DOC_TITRE = cg$rec.DOC_TITRE
              ,DOC_AUTEUR = cg$rec.DOC_AUTEUR
              ,DOC_DATE_PARUTION = cg$rec.DOC_DATE_PARUTION
              ,DOC_TYPE__DOC = cg$rec.DOC_TYPE__DOC
              ,DOC_FORMAT_DOC = cg$rec.DOC_FORMAT_DOC
            WHERE rowid = cg$rec.the_rowid;

            null;
          END IF;

          slct(cg$rec);

          upd_denorm2(cg$rec, cg$ind);
          upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'UPD');
          cascade_update(cg$rec, cg$old_rec);
          domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             
          called_from_package := called_from;
        END;
    END IF;



    IF NOT (do_upd) THEN
        cg$table(idx).ID_RES := cg$rec.ID_RES;
        cg$tableind(idx).ID_RES := cg$ind.ID_RES;
        cg$table(idx).ID_RUB := cg$rec.ID_RUB;
        cg$tableind(idx).ID_RUB := cg$ind.ID_RUB;
        cg$table(idx).TYPE_RES := cg$rec.TYPE_RES;
        cg$tableind(idx).TYPE_RES := cg$ind.TYPE_RES;
        cg$table(idx).NO_ORDRE := cg$rec.NO_ORDRE;
        cg$tableind(idx).NO_ORDRE := cg$ind.NO_ORDRE;
        cg$table(idx).DESIGNATION := cg$rec.DESIGNATION;
        cg$tableind(idx).DESIGNATION := cg$ind.DESIGNATION;
        cg$table(idx).DESCRIPTION := cg$rec.DESCRIPTION;
        cg$tableind(idx).DESCRIPTION := cg$ind.DESCRIPTION;
        cg$table(idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
        cg$tableind(idx).COMMENTAIRE := cg$ind.COMMENTAIRE;
        cg$table(idx).OUV_TITRE := cg$rec.OUV_TITRE;
        cg$tableind(idx).OUV_TITRE := cg$ind.OUV_TITRE;
        cg$table(idx).OUV_RESUME := cg$rec.OUV_RESUME;
        cg$tableind(idx).OUV_RESUME := cg$ind.OUV_RESUME;
        cg$table(idx).OUV_AUTEUR := cg$rec.OUV_AUTEUR;
        cg$tableind(idx).OUV_AUTEUR := cg$ind.OUV_AUTEUR;
        cg$table(idx).OUV_EDITEUR := cg$rec.OUV_EDITEUR;
        cg$tableind(idx).OUV_EDITEUR := cg$ind.OUV_EDITEUR;
        cg$table(idx).OUV_CODE_ISBN := cg$rec.OUV_CODE_ISBN;
        cg$tableind(idx).OUV_CODE_ISBN := cg$ind.OUV_CODE_ISBN;
        cg$table(idx).OUV_DATE_PARUTION := cg$rec.OUV_DATE_PARUTION;
        cg$tableind(idx).OUV_DATE_PARUTION := cg$ind.OUV_DATE_PARUTION;
        cg$table(idx).OUV_PROPRIETAIRE := cg$rec.OUV_PROPRIETAIRE;
        cg$tableind(idx).OUV_PROPRIETAIRE := cg$ind.OUV_PROPRIETAIRE;
        cg$table(idx).OUV_LOCALISATION := cg$rec.OUV_LOCALISATION;
        cg$tableind(idx).OUV_LOCALISATION := cg$ind.OUV_LOCALISATION;
        cg$table(idx).URL_ADRESSE := cg$rec.URL_ADRESSE;
        cg$tableind(idx).URL_ADRESSE := cg$ind.URL_ADRESSE;
        cg$table(idx).LOG_NOM := cg$rec.LOG_NOM;
        cg$tableind(idx).LOG_NOM := cg$ind.LOG_NOM;
        cg$table(idx).LOG_VERSION := cg$rec.LOG_VERSION;
        cg$tableind(idx).LOG_VERSION := cg$ind.LOG_VERSION;
        cg$table(idx).LOG_TYPE_SUPPORT := cg$rec.LOG_TYPE_SUPPORT;
        cg$tableind(idx).LOG_TYPE_SUPPORT := cg$ind.LOG_TYPE_SUPPORT;
        cg$table(idx).LOG_EDITEUR := cg$rec.LOG_EDITEUR;
        cg$tableind(idx).LOG_EDITEUR := cg$ind.LOG_EDITEUR;
        cg$table(idx).LOG_URL := cg$rec.LOG_URL;
        cg$tableind(idx).LOG_URL := cg$ind.LOG_URL;
        cg$table(idx).LOG_OS := cg$rec.LOG_OS;
        cg$tableind(idx).LOG_OS := cg$ind.LOG_OS;
        cg$table(idx).CD_FOURNISSEUR := cg$rec.CD_FOURNISSEUR;
        cg$tableind(idx).CD_FOURNISSEUR := cg$ind.CD_FOURNISSEUR;
        cg$table(idx).CD_LOCALISATION := cg$rec.CD_LOCALISATION;
        cg$tableind(idx).CD_LOCALISATION := cg$ind.CD_LOCALISATION;
        cg$table(idx).DOC_TITRE := cg$rec.DOC_TITRE;
        cg$tableind(idx).DOC_TITRE := cg$ind.DOC_TITRE;
        cg$table(idx).DOC_AUTEUR := cg$rec.DOC_AUTEUR;
        cg$tableind(idx).DOC_AUTEUR := cg$ind.DOC_AUTEUR;
        cg$table(idx).DOC_DATE_PARUTION := cg$rec.DOC_DATE_PARUTION;
        cg$tableind(idx).DOC_DATE_PARUTION := cg$ind.DOC_DATE_PARUTION;
        cg$table(idx).DOC_TYPE__DOC := cg$rec.DOC_TYPE__DOC;
        cg$tableind(idx).DOC_TYPE__DOC := cg$ind.DOC_TYPE__DOC;
        cg$table(idx).DOC_FORMAT_DOC := cg$rec.DOC_FORMAT_DOC;
        cg$tableind(idx).DOC_FORMAT_DOC := cg$ind.DOC_FORMAT_DOC;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$RESSOURCE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$RESSOURCE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$RESSOURCE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$RESSOURCE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$RESSOURCE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of RESSOURCE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for RESSOURCE's domain key constraint columns 
--              cg$ind      Indicates changed RESSOURCE's domain key constraint columns
--              cg$old_rec  Current values for RESSOURCE's domain key constraint columns
----------------------------------------------------------------------------------------
PROCEDURE   domain_cascade_upd( cg$rec     IN OUT cg$row_type,
                                cg$ind     IN OUT cg$ind_type,
                                cg$old_rec IN     cg$row_type )
IS
  called_from BOOLEAN := called_from_package;
BEGIN

  null;
END domain_cascade_upd;


--------------------------------------------------------------------------------
-- Name:        upd_denorm
--
-- Description: API procedure for simple denormalization
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd_denorm2( cg$rec IN cg$row_type,
                       cg$ind IN cg$ind_type ) IS
BEGIN
  NULL;
END upd_denorm2;


--------------------------------------------------------------------------------
-- Name:        upd_oper_denorm
--
-- Description: API procedure for operation denormalization
--
-- Parameters:  cg$rec  Record of row to be updated
--              cg$ind  Record of columns specifically set
--              do_upd  Whether we want the actual UPDATE to occur
--------------------------------------------------------------------------------
PROCEDURE upd_oper_denorm2( cg$rec IN cg$row_type,
                            cg$old_rec IN cg$row_type,
                            cg$ind IN cg$ind_type,
                            operation IN VARCHAR2 DEFAULT 'UPD'
					           )
IS
BEGIN





























NULL;
END upd_oper_denorm2;

--------------------------------------------------------------------------------
-- Name:        del
--
-- Description: API delete procedure
--
-- Parameters:  cg$pk  Primary key record of row to be deleted
--------------------------------------------------------------------------------
PROCEDURE del(cg$pk IN cg$pk_type,
              do_del IN BOOLEAN DEFAULT TRUE) IS
BEGIN
--  Application_logic Pre-Delete <<Start>>
--  Application_logic Pre-Delete << End >>

--  Delete the record

    called_from_package := TRUE;

    IF (do_del) THEN
        DECLARE
           cg$rec cg$row_type;
           cg$old_rec cg$row_type;
           cg$ind cg$ind_type;
        BEGIN
           cg$rec.ID_RES := cg$pk.ID_RES;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE RESSOURCE
              WHERE                    ID_RES = cg$pk.ID_RES;
           ELSE
              DELETE RESSOURCE
              WHERE  rowid = cg$pk.the_rowid;
           END IF;

           upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'DEL');
           cascade_delete(cg$rec);
           domain_cascade_delete(cg$rec);             
        END;
    END IF;

    called_from_package := FALSE;


--  Application_logic Post-Delete <<Start>>
--  Application_logic Post-Delete << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.delete_restrict THEN
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$RESSOURCE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$RESSOURCE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$RESSOURCE.del.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END del;


--------------------------------------------------------------------------------
-- Name:        lck
--
-- Description: API lock procedure
--
-- Parameters:  cg$old_rec  Calling apps view of record of row to be locked
--              cg$old_ind  Record of columns to raise error if modified
--              nowait_flag TRUE lock with NOWAIT, FALSE don't fail if busy
--------------------------------------------------------------------------------
PROCEDURE lck(cg$old_rec IN cg$row_type,
              cg$old_ind IN cg$ind_type,
              nowait_flag IN BOOLEAN DEFAULT TRUE) IS
cg$tmp_rec cg$row_type;
any_modified BOOLEAN := FALSE;

BEGIN
--  Application_logic Pre-Lock <<Start>>
--  Application_logic Pre-Lock << End >>

--  Do the row lock

    BEGIN
        IF (nowait_flag) THEN
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ID_RES
               ,            ID_RUB
               ,            TYPE_RES
               ,            NO_ORDRE
               ,            DESIGNATION
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            OUV_TITRE
               ,            OUV_RESUME
               ,            OUV_AUTEUR
               ,            OUV_EDITEUR
               ,            OUV_CODE_ISBN
               ,            OUV_DATE_PARUTION
               ,            OUV_PROPRIETAIRE
               ,            OUV_LOCALISATION
               ,            URL_ADRESSE
               ,            LOG_NOM
               ,            LOG_VERSION
               ,            LOG_TYPE_SUPPORT
               ,            LOG_EDITEUR
               ,            LOG_URL
               ,            LOG_OS
               ,            CD_FOURNISSEUR
               ,            CD_LOCALISATION
               ,            DOC_TITRE
               ,            DOC_AUTEUR
               ,            DOC_DATE_PARUTION
               ,            DOC_TYPE__DOC
               ,            DOC_FORMAT_DOC
               INTO         cg$tmp_rec.ID_RES
               ,            cg$tmp_rec.ID_RUB
               ,            cg$tmp_rec.TYPE_RES
               ,            cg$tmp_rec.NO_ORDRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.OUV_TITRE
               ,            cg$tmp_rec.OUV_RESUME
               ,            cg$tmp_rec.OUV_AUTEUR
               ,            cg$tmp_rec.OUV_EDITEUR
               ,            cg$tmp_rec.OUV_CODE_ISBN
               ,            cg$tmp_rec.OUV_DATE_PARUTION
               ,            cg$tmp_rec.OUV_PROPRIETAIRE
               ,            cg$tmp_rec.OUV_LOCALISATION
               ,            cg$tmp_rec.URL_ADRESSE
               ,            cg$tmp_rec.LOG_NOM
               ,            cg$tmp_rec.LOG_VERSION
               ,            cg$tmp_rec.LOG_TYPE_SUPPORT
               ,            cg$tmp_rec.LOG_EDITEUR
               ,            cg$tmp_rec.LOG_URL
               ,            cg$tmp_rec.LOG_OS
               ,            cg$tmp_rec.CD_FOURNISSEUR
               ,            cg$tmp_rec.CD_LOCALISATION
               ,            cg$tmp_rec.DOC_TITRE
               ,            cg$tmp_rec.DOC_AUTEUR
               ,            cg$tmp_rec.DOC_DATE_PARUTION
               ,            cg$tmp_rec.DOC_TYPE__DOC
               ,            cg$tmp_rec.DOC_FORMAT_DOC
               FROM      RESSOURCE
               WHERE              ID_RES = cg$old_rec.ID_RES
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ID_RES
               ,            ID_RUB
               ,            TYPE_RES
               ,            NO_ORDRE
               ,            DESIGNATION
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            OUV_TITRE
               ,            OUV_RESUME
               ,            OUV_AUTEUR
               ,            OUV_EDITEUR
               ,            OUV_CODE_ISBN
               ,            OUV_DATE_PARUTION
               ,            OUV_PROPRIETAIRE
               ,            OUV_LOCALISATION
               ,            URL_ADRESSE
               ,            LOG_NOM
               ,            LOG_VERSION
               ,            LOG_TYPE_SUPPORT
               ,            LOG_EDITEUR
               ,            LOG_URL
               ,            LOG_OS
               ,            CD_FOURNISSEUR
               ,            CD_LOCALISATION
               ,            DOC_TITRE
               ,            DOC_AUTEUR
               ,            DOC_DATE_PARUTION
               ,            DOC_TYPE__DOC
               ,            DOC_FORMAT_DOC
               INTO         cg$tmp_rec.ID_RES
               ,            cg$tmp_rec.ID_RUB
               ,            cg$tmp_rec.TYPE_RES
               ,            cg$tmp_rec.NO_ORDRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.OUV_TITRE
               ,            cg$tmp_rec.OUV_RESUME
               ,            cg$tmp_rec.OUV_AUTEUR
               ,            cg$tmp_rec.OUV_EDITEUR
               ,            cg$tmp_rec.OUV_CODE_ISBN
               ,            cg$tmp_rec.OUV_DATE_PARUTION
               ,            cg$tmp_rec.OUV_PROPRIETAIRE
               ,            cg$tmp_rec.OUV_LOCALISATION
               ,            cg$tmp_rec.URL_ADRESSE
               ,            cg$tmp_rec.LOG_NOM
               ,            cg$tmp_rec.LOG_VERSION
               ,            cg$tmp_rec.LOG_TYPE_SUPPORT
               ,            cg$tmp_rec.LOG_EDITEUR
               ,            cg$tmp_rec.LOG_URL
               ,            cg$tmp_rec.LOG_OS
               ,            cg$tmp_rec.CD_FOURNISSEUR
               ,            cg$tmp_rec.CD_LOCALISATION
               ,            cg$tmp_rec.DOC_TITRE
               ,            cg$tmp_rec.DOC_AUTEUR
               ,            cg$tmp_rec.DOC_DATE_PARUTION
               ,            cg$tmp_rec.DOC_TYPE__DOC
               ,            cg$tmp_rec.DOC_FORMAT_DOC
               FROM      RESSOURCE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ID_RES
               ,            ID_RUB
               ,            TYPE_RES
               ,            NO_ORDRE
               ,            DESIGNATION
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            OUV_TITRE
               ,            OUV_RESUME
               ,            OUV_AUTEUR
               ,            OUV_EDITEUR
               ,            OUV_CODE_ISBN
               ,            OUV_DATE_PARUTION
               ,            OUV_PROPRIETAIRE
               ,            OUV_LOCALISATION
               ,            URL_ADRESSE
               ,            LOG_NOM
               ,            LOG_VERSION
               ,            LOG_TYPE_SUPPORT
               ,            LOG_EDITEUR
               ,            LOG_URL
               ,            LOG_OS
               ,            CD_FOURNISSEUR
               ,            CD_LOCALISATION
               ,            DOC_TITRE
               ,            DOC_AUTEUR
               ,            DOC_DATE_PARUTION
               ,            DOC_TYPE__DOC
               ,            DOC_FORMAT_DOC
               INTO         cg$tmp_rec.ID_RES
               ,            cg$tmp_rec.ID_RUB
               ,            cg$tmp_rec.TYPE_RES
               ,            cg$tmp_rec.NO_ORDRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.OUV_TITRE
               ,            cg$tmp_rec.OUV_RESUME
               ,            cg$tmp_rec.OUV_AUTEUR
               ,            cg$tmp_rec.OUV_EDITEUR
               ,            cg$tmp_rec.OUV_CODE_ISBN
               ,            cg$tmp_rec.OUV_DATE_PARUTION
               ,            cg$tmp_rec.OUV_PROPRIETAIRE
               ,            cg$tmp_rec.OUV_LOCALISATION
               ,            cg$tmp_rec.URL_ADRESSE
               ,            cg$tmp_rec.LOG_NOM
               ,            cg$tmp_rec.LOG_VERSION
               ,            cg$tmp_rec.LOG_TYPE_SUPPORT
               ,            cg$tmp_rec.LOG_EDITEUR
               ,            cg$tmp_rec.LOG_URL
               ,            cg$tmp_rec.LOG_OS
               ,            cg$tmp_rec.CD_FOURNISSEUR
               ,            cg$tmp_rec.CD_LOCALISATION
               ,            cg$tmp_rec.DOC_TITRE
               ,            cg$tmp_rec.DOC_AUTEUR
               ,            cg$tmp_rec.DOC_DATE_PARUTION
               ,            cg$tmp_rec.DOC_TYPE__DOC
               ,            cg$tmp_rec.DOC_FORMAT_DOC
               FROM      RESSOURCE
               WHERE              ID_RES = cg$old_rec.ID_RES
               FOR UPDATE;
            ELSE
               SELECT       ID_RES
               ,            ID_RUB
               ,            TYPE_RES
               ,            NO_ORDRE
               ,            DESIGNATION
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            OUV_TITRE
               ,            OUV_RESUME
               ,            OUV_AUTEUR
               ,            OUV_EDITEUR
               ,            OUV_CODE_ISBN
               ,            OUV_DATE_PARUTION
               ,            OUV_PROPRIETAIRE
               ,            OUV_LOCALISATION
               ,            URL_ADRESSE
               ,            LOG_NOM
               ,            LOG_VERSION
               ,            LOG_TYPE_SUPPORT
               ,            LOG_EDITEUR
               ,            LOG_URL
               ,            LOG_OS
               ,            CD_FOURNISSEUR
               ,            CD_LOCALISATION
               ,            DOC_TITRE
               ,            DOC_AUTEUR
               ,            DOC_DATE_PARUTION
               ,            DOC_TYPE__DOC
               ,            DOC_FORMAT_DOC
               INTO         cg$tmp_rec.ID_RES
               ,            cg$tmp_rec.ID_RUB
               ,            cg$tmp_rec.TYPE_RES
               ,            cg$tmp_rec.NO_ORDRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.OUV_TITRE
               ,            cg$tmp_rec.OUV_RESUME
               ,            cg$tmp_rec.OUV_AUTEUR
               ,            cg$tmp_rec.OUV_EDITEUR
               ,            cg$tmp_rec.OUV_CODE_ISBN
               ,            cg$tmp_rec.OUV_DATE_PARUTION
               ,            cg$tmp_rec.OUV_PROPRIETAIRE
               ,            cg$tmp_rec.OUV_LOCALISATION
               ,            cg$tmp_rec.URL_ADRESSE
               ,            cg$tmp_rec.LOG_NOM
               ,            cg$tmp_rec.LOG_VERSION
               ,            cg$tmp_rec.LOG_TYPE_SUPPORT
               ,            cg$tmp_rec.LOG_EDITEUR
               ,            cg$tmp_rec.LOG_URL
               ,            cg$tmp_rec.LOG_OS
               ,            cg$tmp_rec.CD_FOURNISSEUR
               ,            cg$tmp_rec.CD_LOCALISATION
               ,            cg$tmp_rec.DOC_TITRE
               ,            cg$tmp_rec.DOC_AUTEUR
               ,            cg$tmp_rec.DOC_DATE_PARUTION
               ,            cg$tmp_rec.DOC_TYPE__DOC
               ,            cg$tmp_rec.DOC_FORMAT_DOC
               FROM      RESSOURCE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE;
            END IF;
        END IF;

    EXCEPTION 
        WHEN cg$errors.cg$error THEN 
            cg$errors.raise_failure;
        WHEN cg$errors.resource_busy THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_LCK, cg$errors.ROW_LCK),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$RESSOURCE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$RESSOURCE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$RESSOURCE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DESCRIPTION) THEN
        IF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        AND cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            IF (cg$tmp_rec.DESCRIPTION != cg$old_rec.DESCRIPTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P14DESCRIPTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        OR cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P14DESCRIPTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE) THEN
        IF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        AND cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE != cg$old_rec.COMMENTAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P15COMMENTAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        OR cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P15COMMENTAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_TITRE) THEN
        IF (cg$tmp_rec.OUV_TITRE IS NOT NULL
        AND cg$old_rec.OUV_TITRE IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_TITRE != cg$old_rec.OUV_TITRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30OUV_TITRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_TITRE IS NOT NULL
        OR cg$old_rec.OUV_TITRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30OUV_TITRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_RESUME) THEN
        IF (cg$tmp_rec.OUV_RESUME IS NOT NULL
        AND cg$old_rec.OUV_RESUME IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_RESUME != cg$old_rec.OUV_RESUME) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40OUV_RESUME
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_RESUME IS NOT NULL
        OR cg$old_rec.OUV_RESUME IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40OUV_RESUME
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_AUTEUR) THEN
        IF (cg$tmp_rec.OUV_AUTEUR IS NOT NULL
        AND cg$old_rec.OUV_AUTEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_AUTEUR != cg$old_rec.OUV_AUTEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50OUV_AUTEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_AUTEUR IS NOT NULL
        OR cg$old_rec.OUV_AUTEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50OUV_AUTEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_EDITEUR) THEN
        IF (cg$tmp_rec.OUV_EDITEUR IS NOT NULL
        AND cg$old_rec.OUV_EDITEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_EDITEUR != cg$old_rec.OUV_EDITEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60OUV_EDITEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_EDITEUR IS NOT NULL
        OR cg$old_rec.OUV_EDITEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60OUV_EDITEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_CODE_ISBN) THEN
        IF (cg$tmp_rec.OUV_CODE_ISBN IS NOT NULL
        AND cg$old_rec.OUV_CODE_ISBN IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_CODE_ISBN != cg$old_rec.OUV_CODE_ISBN) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70OUV_CODE_ISBN
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_CODE_ISBN IS NOT NULL
        OR cg$old_rec.OUV_CODE_ISBN IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70OUV_CODE_ISBN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_DATE_PARUTION) THEN
        IF (cg$tmp_rec.OUV_DATE_PARUTION IS NOT NULL
        AND cg$old_rec.OUV_DATE_PARUTION IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_DATE_PARUTION != cg$old_rec.OUV_DATE_PARUTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80OUV_DATE_PARUTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_DATE_PARUTION IS NOT NULL
        OR cg$old_rec.OUV_DATE_PARUTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80OUV_DATE_PARUTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_PROPRIETAIRE) THEN
        IF (cg$tmp_rec.OUV_PROPRIETAIRE IS NOT NULL
        AND cg$old_rec.OUV_PROPRIETAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_PROPRIETAIRE != cg$old_rec.OUV_PROPRIETAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90OUV_PROPRIETAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_PROPRIETAIRE IS NOT NULL
        OR cg$old_rec.OUV_PROPRIETAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90OUV_PROPRIETAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OUV_LOCALISATION) THEN
        IF (cg$tmp_rec.OUV_LOCALISATION IS NOT NULL
        AND cg$old_rec.OUV_LOCALISATION IS NOT NULL) THEN
            IF (cg$tmp_rec.OUV_LOCALISATION != cg$old_rec.OUV_LOCALISATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100OUV_LOCALISATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OUV_LOCALISATION IS NOT NULL
        OR cg$old_rec.OUV_LOCALISATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100OUV_LOCALISATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.URL_ADRESSE) THEN
        IF (cg$tmp_rec.URL_ADRESSE IS NOT NULL
        AND cg$old_rec.URL_ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.URL_ADRESSE != cg$old_rec.URL_ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110URL_ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.URL_ADRESSE IS NOT NULL
        OR cg$old_rec.URL_ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110URL_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_NOM) THEN
        IF (cg$tmp_rec.LOG_NOM IS NOT NULL
        AND cg$old_rec.LOG_NOM IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_NOM != cg$old_rec.LOG_NOM) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120LOG_NOM
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_NOM IS NOT NULL
        OR cg$old_rec.LOG_NOM IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120LOG_NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_VERSION) THEN
        IF (cg$tmp_rec.LOG_VERSION IS NOT NULL
        AND cg$old_rec.LOG_VERSION IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_VERSION != cg$old_rec.LOG_VERSION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130LOG_VERSION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_VERSION IS NOT NULL
        OR cg$old_rec.LOG_VERSION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130LOG_VERSION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_TYPE_SUPPORT) THEN
        IF (cg$tmp_rec.LOG_TYPE_SUPPORT IS NOT NULL
        AND cg$old_rec.LOG_TYPE_SUPPORT IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_TYPE_SUPPORT != cg$old_rec.LOG_TYPE_SUPPORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140LOG_TYPE_SUPPORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_TYPE_SUPPORT IS NOT NULL
        OR cg$old_rec.LOG_TYPE_SUPPORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140LOG_TYPE_SUPPORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_EDITEUR) THEN
        IF (cg$tmp_rec.LOG_EDITEUR IS NOT NULL
        AND cg$old_rec.LOG_EDITEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_EDITEUR != cg$old_rec.LOG_EDITEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150LOG_EDITEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_EDITEUR IS NOT NULL
        OR cg$old_rec.LOG_EDITEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150LOG_EDITEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_URL) THEN
        IF (cg$tmp_rec.LOG_URL IS NOT NULL
        AND cg$old_rec.LOG_URL IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_URL != cg$old_rec.LOG_URL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160LOG_URL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_URL IS NOT NULL
        OR cg$old_rec.LOG_URL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160LOG_URL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOG_OS) THEN
        IF (cg$tmp_rec.LOG_OS IS NOT NULL
        AND cg$old_rec.LOG_OS IS NOT NULL) THEN
            IF (cg$tmp_rec.LOG_OS != cg$old_rec.LOG_OS) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170LOG_OS
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOG_OS IS NOT NULL
        OR cg$old_rec.LOG_OS IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170LOG_OS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CD_FOURNISSEUR) THEN
        IF (cg$tmp_rec.CD_FOURNISSEUR IS NOT NULL
        AND cg$old_rec.CD_FOURNISSEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.CD_FOURNISSEUR != cg$old_rec.CD_FOURNISSEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180CD_FOURNISSEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CD_FOURNISSEUR IS NOT NULL
        OR cg$old_rec.CD_FOURNISSEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180CD_FOURNISSEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CD_LOCALISATION) THEN
        IF (cg$tmp_rec.CD_LOCALISATION IS NOT NULL
        AND cg$old_rec.CD_LOCALISATION IS NOT NULL) THEN
            IF (cg$tmp_rec.CD_LOCALISATION != cg$old_rec.CD_LOCALISATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190CD_LOCALISATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CD_LOCALISATION IS NOT NULL
        OR cg$old_rec.CD_LOCALISATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190CD_LOCALISATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOC_TITRE) THEN
        IF (cg$tmp_rec.DOC_TITRE IS NOT NULL
        AND cg$old_rec.DOC_TITRE IS NOT NULL) THEN
            IF (cg$tmp_rec.DOC_TITRE != cg$old_rec.DOC_TITRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200DOC_TITRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DOC_TITRE IS NOT NULL
        OR cg$old_rec.DOC_TITRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200DOC_TITRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOC_AUTEUR) THEN
        IF (cg$tmp_rec.DOC_AUTEUR IS NOT NULL
        AND cg$old_rec.DOC_AUTEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.DOC_AUTEUR != cg$old_rec.DOC_AUTEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P210DOC_AUTEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DOC_AUTEUR IS NOT NULL
        OR cg$old_rec.DOC_AUTEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P210DOC_AUTEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOC_DATE_PARUTION) THEN
        IF (cg$tmp_rec.DOC_DATE_PARUTION IS NOT NULL
        AND cg$old_rec.DOC_DATE_PARUTION IS NOT NULL) THEN
            IF (cg$tmp_rec.DOC_DATE_PARUTION != cg$old_rec.DOC_DATE_PARUTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P220DOC_DATE_PARUTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DOC_DATE_PARUTION IS NOT NULL
        OR cg$old_rec.DOC_DATE_PARUTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P220DOC_DATE_PARUTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOC_TYPE__DOC) THEN
        IF (cg$tmp_rec.DOC_TYPE__DOC IS NOT NULL
        AND cg$old_rec.DOC_TYPE__DOC IS NOT NULL) THEN
            IF (cg$tmp_rec.DOC_TYPE__DOC != cg$old_rec.DOC_TYPE__DOC) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230DOC_TYPE__DOC
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DOC_TYPE__DOC IS NOT NULL
        OR cg$old_rec.DOC_TYPE__DOC IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230DOC_TYPE__DOC
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOC_FORMAT_DOC) THEN
        IF (cg$tmp_rec.DOC_FORMAT_DOC IS NOT NULL
        AND cg$old_rec.DOC_FORMAT_DOC IS NOT NULL) THEN
            IF (cg$tmp_rec.DOC_FORMAT_DOC != cg$old_rec.DOC_FORMAT_DOC) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P240DOC_FORMAT_DOC
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DOC_FORMAT_DOC IS NOT NULL
        OR cg$old_rec.DOC_FORMAT_DOC IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P240DOC_FORMAT_DOC
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ID_RES) THEN
        IF (cg$tmp_rec.ID_RES != cg$old_rec.ID_RES) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5ID_RES
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_RUB) THEN
        IF (cg$tmp_rec.ID_RUB != cg$old_rec.ID_RUB) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P7ID_RUB
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE_RES) THEN
        IF (cg$tmp_rec.TYPE_RES != cg$old_rec.TYPE_RES) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10TYPE_RES
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ORDRE) THEN
        IF (cg$tmp_rec.NO_ORDRE != cg$old_rec.NO_ORDRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P12NO_ORDRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESIGNATION) THEN
        IF (cg$tmp_rec.DESIGNATION != cg$old_rec.DESIGNATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P13DESIGNATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$RESSOURCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

    IF (any_modified) THEN
        cg$errors.raise_failure;
    END IF;

--  Application_logic Post-Lock <<Start>>
--  Application_logic Post-Lock << End >>

END lck;


BEGIN
      cg$ind_true.ID_RES := TRUE;
      cg$ind_true.ID_RUB := TRUE;
      cg$ind_true.TYPE_RES := TRUE;
      cg$ind_true.NO_ORDRE := TRUE;
      cg$ind_true.DESIGNATION := TRUE;
      cg$ind_true.DESCRIPTION := TRUE;
      cg$ind_true.COMMENTAIRE := TRUE;
      cg$ind_true.OUV_TITRE := TRUE;
      cg$ind_true.OUV_RESUME := TRUE;
      cg$ind_true.OUV_AUTEUR := TRUE;
      cg$ind_true.OUV_EDITEUR := TRUE;
      cg$ind_true.OUV_CODE_ISBN := TRUE;
      cg$ind_true.OUV_DATE_PARUTION := TRUE;
      cg$ind_true.OUV_PROPRIETAIRE := TRUE;
      cg$ind_true.OUV_LOCALISATION := TRUE;
      cg$ind_true.URL_ADRESSE := TRUE;
      cg$ind_true.LOG_NOM := TRUE;
      cg$ind_true.LOG_VERSION := TRUE;
      cg$ind_true.LOG_TYPE_SUPPORT := TRUE;
      cg$ind_true.LOG_EDITEUR := TRUE;
      cg$ind_true.LOG_URL := TRUE;
      cg$ind_true.LOG_OS := TRUE;
      cg$ind_true.CD_FOURNISSEUR := TRUE;
      cg$ind_true.CD_LOCALISATION := TRUE;
      cg$ind_true.DOC_TITRE := TRUE;
      cg$ind_true.DOC_AUTEUR := TRUE;
      cg$ind_true.DOC_DATE_PARUTION := TRUE;
      cg$ind_true.DOC_TYPE__DOC := TRUE;
      cg$ind_true.DOC_FORMAT_DOC := TRUE;
   

END cg$RESSOURCE;
/

