
PROMPT Creating API Package Body for Table 'ENSEIGNANT'
--------------------------------------------------------------------------------
-- Name:        cg$ENSEIGNANT
-- Description: ENSEIGNANT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$ENSEIGNANT IS

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
                   'cg$ENSEIGNANT.raise_uk_not_updateable');
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
                   'cg$ENSEIGNANT.raise_fk_not_transferable');
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
                    'cg$ENSEIGNANT.up_autogen_columns');
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
    IF (cg$val_rec.NO_ENSEIGNANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P5NO_ENSEIGNANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10TYPE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SEXE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30SEXE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50PRENOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.CP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70CP),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P75VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PAYS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P77PAYS),
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
       SELECT    NO_ENSEIGNANT
       ,         TYPE
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         PAYS
       ,         TEL_PORT
       ,         ENC_PERSO_TEL
       ,         ENC_UBO_TEL
       ,         ENC_PERSO_EMAIL
       ,         ENC_UBO_EMAIL
       ,         INT_NO_INSEE
       ,         INT_SOC_NOM
       ,         INT_SOC_ADRESSE
       ,         INT_SOC_CP
       ,         INT_SOC_VILLE
       ,         INT_SOC_PAYS
       ,         INT_FONCTION
       ,         INT_PROF_EMAIL
       ,         INT_PROF_TEL
       , rowid
       INTO      cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.TYPE
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.TEL_PORT
       ,         cg$sel_rec.ENC_PERSO_TEL
       ,         cg$sel_rec.ENC_UBO_TEL
       ,         cg$sel_rec.ENC_PERSO_EMAIL
       ,         cg$sel_rec.ENC_UBO_EMAIL
       ,         cg$sel_rec.INT_NO_INSEE
       ,         cg$sel_rec.INT_SOC_NOM
       ,         cg$sel_rec.INT_SOC_ADRESSE
       ,         cg$sel_rec.INT_SOC_CP
       ,         cg$sel_rec.INT_SOC_VILLE
       ,         cg$sel_rec.INT_SOC_PAYS
       ,         cg$sel_rec.INT_FONCTION
       ,         cg$sel_rec.INT_PROF_EMAIL
       ,         cg$sel_rec.INT_PROF_TEL
       ,cg$sel_rec.the_rowid
       FROM   ENSEIGNANT
       WHERE        NO_ENSEIGNANT = cg$sel_rec.NO_ENSEIGNANT;
    ELSE
       SELECT    NO_ENSEIGNANT
       ,         TYPE
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         PAYS
       ,         TEL_PORT
       ,         ENC_PERSO_TEL
       ,         ENC_UBO_TEL
       ,         ENC_PERSO_EMAIL
       ,         ENC_UBO_EMAIL
       ,         INT_NO_INSEE
       ,         INT_SOC_NOM
       ,         INT_SOC_ADRESSE
       ,         INT_SOC_CP
       ,         INT_SOC_VILLE
       ,         INT_SOC_PAYS
       ,         INT_FONCTION
       ,         INT_PROF_EMAIL
       ,         INT_PROF_TEL
       , rowid
       INTO      cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.TYPE
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.TEL_PORT
       ,         cg$sel_rec.ENC_PERSO_TEL
       ,         cg$sel_rec.ENC_UBO_TEL
       ,         cg$sel_rec.ENC_PERSO_EMAIL
       ,         cg$sel_rec.ENC_UBO_EMAIL
       ,         cg$sel_rec.INT_NO_INSEE
       ,         cg$sel_rec.INT_SOC_NOM
       ,         cg$sel_rec.INT_SOC_ADRESSE
       ,         cg$sel_rec.INT_SOC_CP
       ,         cg$sel_rec.INT_SOC_VILLE
       ,         cg$sel_rec.INT_SOC_PAYS
       ,         cg$sel_rec.INT_FONCTION
       ,         cg$sel_rec.INT_PROF_EMAIL
       ,         cg$sel_rec.INT_PROF_TEL
       ,cg$sel_rec.the_rowid
       FROM   ENSEIGNANT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$ENSEIGNANT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to ENSEIGNANT 
--
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
--              cg$old_rec Record of ENSEIGNANT previous values
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
--              of each child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
--              child table that references this table ENSEIGNANT 
--
-- Parameters:  cg$new_rec  New values for ENSEIGNANT's domain key constraint columns 
--              cg$new_ind  Indicates changed ENSEIGNANT's domain key constraint columns
--              cg$old_rec  Current values for ENSEIGNANT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to ENSEIGNANT 
--
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
--              child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
--              of each child table that references this tableENSEIGNANT 
--
-- Parameters:  cg$old_rec     Record of ENSEIGNANT current values
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
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
-- Parameters:  cg$rec     Record of ENSEIGNANT current values
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
                                            'CG_REF_CODES','ENSEIGNANT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$ENSEIGNANT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.v_domain.others');
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
    IF (con_name = 'ENS_PK') THEN
        cg$errors.push(nvl(ENS_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'ENS_PK' 
                                     ,'ENSEIGNANT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'AUT_ENS_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Enseignant', 'Authentification'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'FA_ENS_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Enseignant', 'Fa'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'COM_ENS_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Enseignant', 'Compagnie'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'INV_ENS_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Enseignant', 'Intervention'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
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

        INSERT INTO ENSEIGNANT
            (NO_ENSEIGNANT
            ,TYPE
            ,SEXE
            ,NOM
            ,PRENOM
            ,ADRESSE
            ,CP
            ,VILLE
            ,PAYS
            ,TEL_PORT
            ,ENC_PERSO_TEL
            ,ENC_UBO_TEL
            ,ENC_PERSO_EMAIL
            ,ENC_UBO_EMAIL
            ,INT_NO_INSEE
            ,INT_SOC_NOM
            ,INT_SOC_ADRESSE
            ,INT_SOC_CP
            ,INT_SOC_VILLE
            ,INT_SOC_PAYS
            ,INT_FONCTION
            ,INT_PROF_EMAIL
            ,INT_PROF_TEL)
        VALUES
            (cg$rec.NO_ENSEIGNANT
            ,cg$rec.TYPE
            ,cg$rec.SEXE
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.ADRESSE
            ,cg$rec.CP
            ,cg$rec.VILLE
            ,cg$rec.PAYS
            ,cg$rec.TEL_PORT
            ,cg$rec.ENC_PERSO_TEL
            ,cg$rec.ENC_UBO_TEL
            ,cg$rec.ENC_PERSO_EMAIL
            ,cg$rec.ENC_UBO_EMAIL
            ,cg$rec.INT_NO_INSEE
            ,cg$rec.INT_SOC_NOM
            ,cg$rec.INT_SOC_ADRESSE
            ,cg$rec.INT_SOC_CP
            ,cg$rec.INT_SOC_VILLE
            ,cg$rec.INT_SOC_PAYS
            ,cg$rec.INT_FONCTION
            ,cg$rec.INT_PROF_EMAIL
            ,cg$rec.INT_PROF_TEL
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
        validate_mandatory(cg$rec, 'cg$ENSEIGNANT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENSEIGNANT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENSEIGNANT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENSEIGNANT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.ins.others');
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

 
    IF ( cg$pk.NO_ENSEIGNANT IS NULL ) THEN          
      cg$upd_rec.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    ELSE
      cg$upd_rec.NO_ENSEIGNANT := cg$pk.NO_ENSEIGNANT;
    END IF;
    cg$old_rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key ENS_PK
        IF (cg$ind.NO_ENSEIGNANT AND cg$rec.NO_ENSEIGNANT != cg$upd_rec.NO_ENSEIGNANT) THEN
            raise_uk_not_updateable('ENS_PK');
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.TYPE) THEN
            cg$rec.TYPE := cg$upd_rec.TYPE;
        END IF;
        IF NOT (cg$ind.SEXE) THEN
            cg$rec.SEXE := cg$upd_rec.SEXE;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.PRENOM) THEN
            cg$rec.PRENOM := cg$upd_rec.PRENOM;
        END IF;
        IF NOT (cg$ind.ADRESSE) THEN
            cg$rec.ADRESSE := cg$upd_rec.ADRESSE;
        END IF;
        IF NOT (cg$ind.CP) THEN
            cg$rec.CP := cg$upd_rec.CP;
        END IF;
        IF NOT (cg$ind.VILLE) THEN
            cg$rec.VILLE := cg$upd_rec.VILLE;
        END IF;
        IF NOT (cg$ind.PAYS) THEN
            cg$rec.PAYS := cg$upd_rec.PAYS;
        END IF;
        IF NOT (cg$ind.TEL_PORT) THEN
            cg$rec.TEL_PORT := cg$upd_rec.TEL_PORT;
        END IF;
        IF NOT (cg$ind.ENC_PERSO_TEL) THEN
            cg$rec.ENC_PERSO_TEL := cg$upd_rec.ENC_PERSO_TEL;
        END IF;
        IF NOT (cg$ind.ENC_UBO_TEL) THEN
            cg$rec.ENC_UBO_TEL := cg$upd_rec.ENC_UBO_TEL;
        END IF;
        IF NOT (cg$ind.ENC_PERSO_EMAIL) THEN
            cg$rec.ENC_PERSO_EMAIL := cg$upd_rec.ENC_PERSO_EMAIL;
        END IF;
        IF NOT (cg$ind.ENC_UBO_EMAIL) THEN
            cg$rec.ENC_UBO_EMAIL := cg$upd_rec.ENC_UBO_EMAIL;
        END IF;
        IF NOT (cg$ind.INT_NO_INSEE) THEN
            cg$rec.INT_NO_INSEE := cg$upd_rec.INT_NO_INSEE;
        END IF;
        IF NOT (cg$ind.INT_SOC_NOM) THEN
            cg$rec.INT_SOC_NOM := cg$upd_rec.INT_SOC_NOM;
        END IF;
        IF NOT (cg$ind.INT_SOC_ADRESSE) THEN
            cg$rec.INT_SOC_ADRESSE := cg$upd_rec.INT_SOC_ADRESSE;
        END IF;
        IF NOT (cg$ind.INT_SOC_CP) THEN
            cg$rec.INT_SOC_CP := cg$upd_rec.INT_SOC_CP;
        END IF;
        IF NOT (cg$ind.INT_SOC_VILLE) THEN
            cg$rec.INT_SOC_VILLE := cg$upd_rec.INT_SOC_VILLE;
        END IF;
        IF NOT (cg$ind.INT_SOC_PAYS) THEN
            cg$rec.INT_SOC_PAYS := cg$upd_rec.INT_SOC_PAYS;
        END IF;
        IF NOT (cg$ind.INT_FONCTION) THEN
            cg$rec.INT_FONCTION := cg$upd_rec.INT_FONCTION;
        END IF;
        IF NOT (cg$ind.INT_PROF_EMAIL) THEN
            cg$rec.INT_PROF_EMAIL := cg$upd_rec.INT_PROF_EMAIL;
        END IF;
        IF NOT (cg$ind.INT_PROF_TEL) THEN
            cg$rec.INT_PROF_TEL := cg$upd_rec.INT_PROF_TEL;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key ENS_PK
        IF ( cg$ind.NO_ENSEIGNANT ) THEN
          raise_uk_not_updateable('ENS_PK');
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
            UPDATE ENSEIGNANT
            SET
              TYPE = cg$rec.TYPE
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,TEL_PORT = cg$rec.TEL_PORT
              ,ENC_PERSO_TEL = cg$rec.ENC_PERSO_TEL
              ,ENC_UBO_TEL = cg$rec.ENC_UBO_TEL
              ,ENC_PERSO_EMAIL = cg$rec.ENC_PERSO_EMAIL
              ,ENC_UBO_EMAIL = cg$rec.ENC_UBO_EMAIL
              ,INT_NO_INSEE = cg$rec.INT_NO_INSEE
              ,INT_SOC_NOM = cg$rec.INT_SOC_NOM
              ,INT_SOC_ADRESSE = cg$rec.INT_SOC_ADRESSE
              ,INT_SOC_CP = cg$rec.INT_SOC_CP
              ,INT_SOC_VILLE = cg$rec.INT_SOC_VILLE
              ,INT_SOC_PAYS = cg$rec.INT_SOC_PAYS
              ,INT_FONCTION = cg$rec.INT_FONCTION
              ,INT_PROF_EMAIL = cg$rec.INT_PROF_EMAIL
              ,INT_PROF_TEL = cg$rec.INT_PROF_TEL
            WHERE  NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT;
            null;
          ELSE
            UPDATE ENSEIGNANT
            SET
              TYPE = cg$rec.TYPE
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,TEL_PORT = cg$rec.TEL_PORT
              ,ENC_PERSO_TEL = cg$rec.ENC_PERSO_TEL
              ,ENC_UBO_TEL = cg$rec.ENC_UBO_TEL
              ,ENC_PERSO_EMAIL = cg$rec.ENC_PERSO_EMAIL
              ,ENC_UBO_EMAIL = cg$rec.ENC_UBO_EMAIL
              ,INT_NO_INSEE = cg$rec.INT_NO_INSEE
              ,INT_SOC_NOM = cg$rec.INT_SOC_NOM
              ,INT_SOC_ADRESSE = cg$rec.INT_SOC_ADRESSE
              ,INT_SOC_CP = cg$rec.INT_SOC_CP
              ,INT_SOC_VILLE = cg$rec.INT_SOC_VILLE
              ,INT_SOC_PAYS = cg$rec.INT_SOC_PAYS
              ,INT_FONCTION = cg$rec.INT_FONCTION
              ,INT_PROF_EMAIL = cg$rec.INT_PROF_EMAIL
              ,INT_PROF_TEL = cg$rec.INT_PROF_TEL
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
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).TYPE := cg$rec.TYPE;
        cg$tableind(idx).TYPE := cg$ind.TYPE;
        cg$table(idx).SEXE := cg$rec.SEXE;
        cg$tableind(idx).SEXE := cg$ind.SEXE;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CP := cg$rec.CP;
        cg$tableind(idx).CP := cg$ind.CP;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).PAYS := cg$rec.PAYS;
        cg$tableind(idx).PAYS := cg$ind.PAYS;
        cg$table(idx).TEL_PORT := cg$rec.TEL_PORT;
        cg$tableind(idx).TEL_PORT := cg$ind.TEL_PORT;
        cg$table(idx).ENC_PERSO_TEL := cg$rec.ENC_PERSO_TEL;
        cg$tableind(idx).ENC_PERSO_TEL := cg$ind.ENC_PERSO_TEL;
        cg$table(idx).ENC_UBO_TEL := cg$rec.ENC_UBO_TEL;
        cg$tableind(idx).ENC_UBO_TEL := cg$ind.ENC_UBO_TEL;
        cg$table(idx).ENC_PERSO_EMAIL := cg$rec.ENC_PERSO_EMAIL;
        cg$tableind(idx).ENC_PERSO_EMAIL := cg$ind.ENC_PERSO_EMAIL;
        cg$table(idx).ENC_UBO_EMAIL := cg$rec.ENC_UBO_EMAIL;
        cg$tableind(idx).ENC_UBO_EMAIL := cg$ind.ENC_UBO_EMAIL;
        cg$table(idx).INT_NO_INSEE := cg$rec.INT_NO_INSEE;
        cg$tableind(idx).INT_NO_INSEE := cg$ind.INT_NO_INSEE;
        cg$table(idx).INT_SOC_NOM := cg$rec.INT_SOC_NOM;
        cg$tableind(idx).INT_SOC_NOM := cg$ind.INT_SOC_NOM;
        cg$table(idx).INT_SOC_ADRESSE := cg$rec.INT_SOC_ADRESSE;
        cg$tableind(idx).INT_SOC_ADRESSE := cg$ind.INT_SOC_ADRESSE;
        cg$table(idx).INT_SOC_CP := cg$rec.INT_SOC_CP;
        cg$tableind(idx).INT_SOC_CP := cg$ind.INT_SOC_CP;
        cg$table(idx).INT_SOC_VILLE := cg$rec.INT_SOC_VILLE;
        cg$tableind(idx).INT_SOC_VILLE := cg$ind.INT_SOC_VILLE;
        cg$table(idx).INT_SOC_PAYS := cg$rec.INT_SOC_PAYS;
        cg$tableind(idx).INT_SOC_PAYS := cg$ind.INT_SOC_PAYS;
        cg$table(idx).INT_FONCTION := cg$rec.INT_FONCTION;
        cg$tableind(idx).INT_FONCTION := cg$ind.INT_FONCTION;
        cg$table(idx).INT_PROF_EMAIL := cg$rec.INT_PROF_EMAIL;
        cg$tableind(idx).INT_PROF_EMAIL := cg$ind.INT_PROF_EMAIL;
        cg$table(idx).INT_PROF_TEL := cg$rec.INT_PROF_TEL;
        cg$tableind(idx).INT_PROF_TEL := cg$ind.INT_PROF_TEL;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$ENSEIGNANT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENSEIGNANT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENSEIGNANT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENSEIGNANT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of ENSEIGNANT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for ENSEIGNANT's domain key constraint columns 
--              cg$ind      Indicates changed ENSEIGNANT's domain key constraint columns
--              cg$old_rec  Current values for ENSEIGNANT's domain key constraint columns
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
           cg$rec.NO_ENSEIGNANT := cg$pk.NO_ENSEIGNANT;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE ENSEIGNANT
              WHERE                    NO_ENSEIGNANT = cg$pk.NO_ENSEIGNANT;
           ELSE
              DELETE ENSEIGNANT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$ENSEIGNANT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENSEIGNANT.del.others');
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
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL_PORT
               ,            ENC_PERSO_TEL
               ,            ENC_UBO_TEL
               ,            ENC_PERSO_EMAIL
               ,            ENC_UBO_EMAIL
               ,            INT_NO_INSEE
               ,            INT_SOC_NOM
               ,            INT_SOC_ADRESSE
               ,            INT_SOC_CP
               ,            INT_SOC_VILLE
               ,            INT_SOC_PAYS
               ,            INT_FONCTION
               ,            INT_PROF_EMAIL
               ,            INT_PROF_TEL
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.ENC_PERSO_TEL
               ,            cg$tmp_rec.ENC_UBO_TEL
               ,            cg$tmp_rec.ENC_PERSO_EMAIL
               ,            cg$tmp_rec.ENC_UBO_EMAIL
               ,            cg$tmp_rec.INT_NO_INSEE
               ,            cg$tmp_rec.INT_SOC_NOM
               ,            cg$tmp_rec.INT_SOC_ADRESSE
               ,            cg$tmp_rec.INT_SOC_CP
               ,            cg$tmp_rec.INT_SOC_VILLE
               ,            cg$tmp_rec.INT_SOC_PAYS
               ,            cg$tmp_rec.INT_FONCTION
               ,            cg$tmp_rec.INT_PROF_EMAIL
               ,            cg$tmp_rec.INT_PROF_TEL
               FROM      ENSEIGNANT
               WHERE              NO_ENSEIGNANT = cg$old_rec.NO_ENSEIGNANT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL_PORT
               ,            ENC_PERSO_TEL
               ,            ENC_UBO_TEL
               ,            ENC_PERSO_EMAIL
               ,            ENC_UBO_EMAIL
               ,            INT_NO_INSEE
               ,            INT_SOC_NOM
               ,            INT_SOC_ADRESSE
               ,            INT_SOC_CP
               ,            INT_SOC_VILLE
               ,            INT_SOC_PAYS
               ,            INT_FONCTION
               ,            INT_PROF_EMAIL
               ,            INT_PROF_TEL
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.ENC_PERSO_TEL
               ,            cg$tmp_rec.ENC_UBO_TEL
               ,            cg$tmp_rec.ENC_PERSO_EMAIL
               ,            cg$tmp_rec.ENC_UBO_EMAIL
               ,            cg$tmp_rec.INT_NO_INSEE
               ,            cg$tmp_rec.INT_SOC_NOM
               ,            cg$tmp_rec.INT_SOC_ADRESSE
               ,            cg$tmp_rec.INT_SOC_CP
               ,            cg$tmp_rec.INT_SOC_VILLE
               ,            cg$tmp_rec.INT_SOC_PAYS
               ,            cg$tmp_rec.INT_FONCTION
               ,            cg$tmp_rec.INT_PROF_EMAIL
               ,            cg$tmp_rec.INT_PROF_TEL
               FROM      ENSEIGNANT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL_PORT
               ,            ENC_PERSO_TEL
               ,            ENC_UBO_TEL
               ,            ENC_PERSO_EMAIL
               ,            ENC_UBO_EMAIL
               ,            INT_NO_INSEE
               ,            INT_SOC_NOM
               ,            INT_SOC_ADRESSE
               ,            INT_SOC_CP
               ,            INT_SOC_VILLE
               ,            INT_SOC_PAYS
               ,            INT_FONCTION
               ,            INT_PROF_EMAIL
               ,            INT_PROF_TEL
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.ENC_PERSO_TEL
               ,            cg$tmp_rec.ENC_UBO_TEL
               ,            cg$tmp_rec.ENC_PERSO_EMAIL
               ,            cg$tmp_rec.ENC_UBO_EMAIL
               ,            cg$tmp_rec.INT_NO_INSEE
               ,            cg$tmp_rec.INT_SOC_NOM
               ,            cg$tmp_rec.INT_SOC_ADRESSE
               ,            cg$tmp_rec.INT_SOC_CP
               ,            cg$tmp_rec.INT_SOC_VILLE
               ,            cg$tmp_rec.INT_SOC_PAYS
               ,            cg$tmp_rec.INT_FONCTION
               ,            cg$tmp_rec.INT_PROF_EMAIL
               ,            cg$tmp_rec.INT_PROF_TEL
               FROM      ENSEIGNANT
               WHERE              NO_ENSEIGNANT = cg$old_rec.NO_ENSEIGNANT
               FOR UPDATE;
            ELSE
               SELECT       NO_ENSEIGNANT
               ,            TYPE
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL_PORT
               ,            ENC_PERSO_TEL
               ,            ENC_UBO_TEL
               ,            ENC_PERSO_EMAIL
               ,            ENC_UBO_EMAIL
               ,            INT_NO_INSEE
               ,            INT_SOC_NOM
               ,            INT_SOC_ADRESSE
               ,            INT_SOC_CP
               ,            INT_SOC_VILLE
               ,            INT_SOC_PAYS
               ,            INT_FONCTION
               ,            INT_PROF_EMAIL
               ,            INT_PROF_TEL
               INTO         cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.TYPE
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.ENC_PERSO_TEL
               ,            cg$tmp_rec.ENC_UBO_TEL
               ,            cg$tmp_rec.ENC_PERSO_EMAIL
               ,            cg$tmp_rec.ENC_UBO_EMAIL
               ,            cg$tmp_rec.INT_NO_INSEE
               ,            cg$tmp_rec.INT_SOC_NOM
               ,            cg$tmp_rec.INT_SOC_ADRESSE
               ,            cg$tmp_rec.INT_SOC_CP
               ,            cg$tmp_rec.INT_SOC_VILLE
               ,            cg$tmp_rec.INT_SOC_PAYS
               ,            cg$tmp_rec.INT_FONCTION
               ,            cg$tmp_rec.INT_PROF_EMAIL
               ,            cg$tmp_rec.INT_PROF_TEL
               FROM      ENSEIGNANT
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
                           'cg$ENSEIGNANT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENSEIGNANT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENSEIGNANT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.TEL_PORT) THEN
        IF (cg$tmp_rec.TEL_PORT IS NOT NULL
        AND cg$old_rec.TEL_PORT IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PORT != cg$old_rec.TEL_PORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80TEL_PORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PORT IS NOT NULL
        OR cg$old_rec.TEL_PORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80TEL_PORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ENC_PERSO_TEL) THEN
        IF (cg$tmp_rec.ENC_PERSO_TEL IS NOT NULL
        AND cg$old_rec.ENC_PERSO_TEL IS NOT NULL) THEN
            IF (cg$tmp_rec.ENC_PERSO_TEL != cg$old_rec.ENC_PERSO_TEL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P86ENC_PERSO_TEL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ENC_PERSO_TEL IS NOT NULL
        OR cg$old_rec.ENC_PERSO_TEL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P86ENC_PERSO_TEL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ENC_UBO_TEL) THEN
        IF (cg$tmp_rec.ENC_UBO_TEL IS NOT NULL
        AND cg$old_rec.ENC_UBO_TEL IS NOT NULL) THEN
            IF (cg$tmp_rec.ENC_UBO_TEL != cg$old_rec.ENC_UBO_TEL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P89ENC_UBO_TEL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ENC_UBO_TEL IS NOT NULL
        OR cg$old_rec.ENC_UBO_TEL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P89ENC_UBO_TEL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ENC_PERSO_EMAIL) THEN
        IF (cg$tmp_rec.ENC_PERSO_EMAIL IS NOT NULL
        AND cg$old_rec.ENC_PERSO_EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.ENC_PERSO_EMAIL != cg$old_rec.ENC_PERSO_EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90ENC_PERSO_EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ENC_PERSO_EMAIL IS NOT NULL
        OR cg$old_rec.ENC_PERSO_EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90ENC_PERSO_EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ENC_UBO_EMAIL) THEN
        IF (cg$tmp_rec.ENC_UBO_EMAIL IS NOT NULL
        AND cg$old_rec.ENC_UBO_EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.ENC_UBO_EMAIL != cg$old_rec.ENC_UBO_EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P92ENC_UBO_EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ENC_UBO_EMAIL IS NOT NULL
        OR cg$old_rec.ENC_UBO_EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P92ENC_UBO_EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_NO_INSEE) THEN
        IF (cg$tmp_rec.INT_NO_INSEE IS NOT NULL
        AND cg$old_rec.INT_NO_INSEE IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_NO_INSEE != cg$old_rec.INT_NO_INSEE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110INT_NO_INSEE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_NO_INSEE IS NOT NULL
        OR cg$old_rec.INT_NO_INSEE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110INT_NO_INSEE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_SOC_NOM) THEN
        IF (cg$tmp_rec.INT_SOC_NOM IS NOT NULL
        AND cg$old_rec.INT_SOC_NOM IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_SOC_NOM != cg$old_rec.INT_SOC_NOM) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120INT_SOC_NOM
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_SOC_NOM IS NOT NULL
        OR cg$old_rec.INT_SOC_NOM IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120INT_SOC_NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_SOC_ADRESSE) THEN
        IF (cg$tmp_rec.INT_SOC_ADRESSE IS NOT NULL
        AND cg$old_rec.INT_SOC_ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_SOC_ADRESSE != cg$old_rec.INT_SOC_ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130INT_SOC_ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_SOC_ADRESSE IS NOT NULL
        OR cg$old_rec.INT_SOC_ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130INT_SOC_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_SOC_CP) THEN
        IF (cg$tmp_rec.INT_SOC_CP IS NOT NULL
        AND cg$old_rec.INT_SOC_CP IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_SOC_CP != cg$old_rec.INT_SOC_CP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140INT_SOC_CP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_SOC_CP IS NOT NULL
        OR cg$old_rec.INT_SOC_CP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140INT_SOC_CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_SOC_VILLE) THEN
        IF (cg$tmp_rec.INT_SOC_VILLE IS NOT NULL
        AND cg$old_rec.INT_SOC_VILLE IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_SOC_VILLE != cg$old_rec.INT_SOC_VILLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150INT_SOC_VILLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_SOC_VILLE IS NOT NULL
        OR cg$old_rec.INT_SOC_VILLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150INT_SOC_VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_SOC_PAYS) THEN
        IF (cg$tmp_rec.INT_SOC_PAYS IS NOT NULL
        AND cg$old_rec.INT_SOC_PAYS IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_SOC_PAYS != cg$old_rec.INT_SOC_PAYS) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160INT_SOC_PAYS
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_SOC_PAYS IS NOT NULL
        OR cg$old_rec.INT_SOC_PAYS IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160INT_SOC_PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_FONCTION) THEN
        IF (cg$tmp_rec.INT_FONCTION IS NOT NULL
        AND cg$old_rec.INT_FONCTION IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_FONCTION != cg$old_rec.INT_FONCTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170INT_FONCTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_FONCTION IS NOT NULL
        OR cg$old_rec.INT_FONCTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170INT_FONCTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_PROF_EMAIL) THEN
        IF (cg$tmp_rec.INT_PROF_EMAIL IS NOT NULL
        AND cg$old_rec.INT_PROF_EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_PROF_EMAIL != cg$old_rec.INT_PROF_EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180INT_PROF_EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_PROF_EMAIL IS NOT NULL
        OR cg$old_rec.INT_PROF_EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180INT_PROF_EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INT_PROF_TEL) THEN
        IF (cg$tmp_rec.INT_PROF_TEL IS NOT NULL
        AND cg$old_rec.INT_PROF_TEL IS NOT NULL) THEN
            IF (cg$tmp_rec.INT_PROF_TEL != cg$old_rec.INT_PROF_TEL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190INT_PROF_TEL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.INT_PROF_TEL IS NOT NULL
        OR cg$old_rec.INT_PROF_TEL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190INT_PROF_TEL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE) THEN
        IF (cg$tmp_rec.TYPE != cg$old_rec.TYPE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10TYPE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SEXE) THEN
        IF (cg$tmp_rec.SEXE != cg$old_rec.SEXE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30SEXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CP) THEN
        IF (cg$tmp_rec.CP != cg$old_rec.CP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P75VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PAYS) THEN
        IF (cg$tmp_rec.PAYS != cg$old_rec.PAYS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P77PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENSEIGNANT.lck');
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
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.TYPE := TRUE;
      cg$ind_true.SEXE := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CP := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.PAYS := TRUE;
      cg$ind_true.TEL_PORT := TRUE;
      cg$ind_true.ENC_PERSO_TEL := TRUE;
      cg$ind_true.ENC_UBO_TEL := TRUE;
      cg$ind_true.ENC_PERSO_EMAIL := TRUE;
      cg$ind_true.ENC_UBO_EMAIL := TRUE;
      cg$ind_true.INT_NO_INSEE := TRUE;
      cg$ind_true.INT_SOC_NOM := TRUE;
      cg$ind_true.INT_SOC_ADRESSE := TRUE;
      cg$ind_true.INT_SOC_CP := TRUE;
      cg$ind_true.INT_SOC_VILLE := TRUE;
      cg$ind_true.INT_SOC_PAYS := TRUE;
      cg$ind_true.INT_FONCTION := TRUE;
      cg$ind_true.INT_PROF_EMAIL := TRUE;
      cg$ind_true.INT_PROF_TEL := TRUE;
   

END cg$ENSEIGNANT;
/

