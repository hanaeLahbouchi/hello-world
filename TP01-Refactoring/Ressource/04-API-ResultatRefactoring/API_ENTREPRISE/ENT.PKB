create or replace PACKAGE BODY cg$ENTREPRISE IS

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
                   'cg$ENTREPRISE.raise_uk_not_updateable');
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
                   'cg$ENTREPRISE.raise_fk_not_transferable');
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
			IF (cg$ind.NO_ENTREPRISE = FALSE
      OR  cg$rec.NO_ENTREPRISE is NULL) THEN 
				SELECT ENT_SEQ.nextval
				INTO   cg$rec.NO_ENTREPRISE
				FROM   DUAL;
				cg$ind.NO_ENTREPRISE := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$ENTREPRISE.up_autogen.NO_ENTREPRISE.OTHERS');
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
                    'cg$ENTREPRISE.up_autogen_columns');
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
    IF (cg$val_rec.NO_ENTREPRISE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_ENTREPRISE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.REFERENCEE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20REFERENCEE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LOGIN_CREA IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40LOGIN_CREA),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_CREA IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50DATE_CREA),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SIEGE_SOCIAL IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70SIEGE_SOCIAL),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DOMAINE_ACTIVITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90DOMAINE_ACTIVITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P100ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.CP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P110CP),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P120VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PAYS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P130PAYS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TEL IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P140TEL),
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
       SELECT    NO_ENTREPRISE
       ,         REFERENCEE
       ,         DATE_REFERENCEMENT
       ,         LOGIN_CREA
       ,         DATE_CREA
       ,         NOM
       ,         SIEGE_SOCIAL
       ,         DOMAINE_ACTIVITE
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         PAYS
       ,         TEL
       ,         SITE_INTERNET
       ,         NOM_REPRESENTANT
       ,         PRENOM_REPRESENTANT
       ,         LOGIN_MAJ
       ,         DATE_MAJ
       ,         OFFRE_STAGE
       , rowid
       INTO      cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.REFERENCEE
       ,         cg$sel_rec.DATE_REFERENCEMENT
       ,         cg$sel_rec.LOGIN_CREA
       ,         cg$sel_rec.DATE_CREA
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.SIEGE_SOCIAL
       ,         cg$sel_rec.DOMAINE_ACTIVITE
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.TEL
       ,         cg$sel_rec.SITE_INTERNET
       ,         cg$sel_rec.NOM_REPRESENTANT
       ,         cg$sel_rec.PRENOM_REPRESENTANT
       ,         cg$sel_rec.LOGIN_MAJ
       ,         cg$sel_rec.DATE_MAJ
       ,         cg$sel_rec.OFFRE_STAGE
       ,cg$sel_rec.the_rowid
       FROM   ENTREPRISE
       WHERE        NO_ENTREPRISE = cg$sel_rec.NO_ENTREPRISE;
    ELSE
       SELECT    NO_ENTREPRISE
       ,         REFERENCEE
       ,         DATE_REFERENCEMENT
       ,         LOGIN_CREA
       ,         DATE_CREA
       ,         NOM
       ,         SIEGE_SOCIAL
       ,         DOMAINE_ACTIVITE
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         PAYS
       ,         TEL
       ,         SITE_INTERNET
       ,         NOM_REPRESENTANT
       ,         PRENOM_REPRESENTANT
       ,         LOGIN_MAJ
       ,         DATE_MAJ
       ,         OFFRE_STAGE
       , rowid
       INTO      cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.REFERENCEE
       ,         cg$sel_rec.DATE_REFERENCEMENT
       ,         cg$sel_rec.LOGIN_CREA
       ,         cg$sel_rec.DATE_CREA
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.SIEGE_SOCIAL
       ,         cg$sel_rec.DOMAINE_ACTIVITE
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.PAYS
       ,         cg$sel_rec.TEL
       ,         cg$sel_rec.SITE_INTERNET
       ,         cg$sel_rec.NOM_REPRESENTANT
       ,         cg$sel_rec.PRENOM_REPRESENTANT
       ,         cg$sel_rec.LOGIN_MAJ
       ,         cg$sel_rec.DATE_MAJ
       ,         cg$sel_rec.OFFRE_STAGE
       ,cg$sel_rec.the_rowid
       FROM   ENTREPRISE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$ENTREPRISE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to ENTREPRISE 
--
-- Parameters:  cg$rec     Record of ENTREPRISE current values
--              cg$old_rec Record of ENTREPRISE previous values
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
--              of each child table that references this tableENTREPRISE 
--
-- Parameters:  cg$old_rec     Record of ENTREPRISE current values
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
--              child table that references this table ENTREPRISE 
--
-- Parameters:  cg$new_rec  New values for ENTREPRISE's domain key constraint columns 
--              cg$new_ind  Indicates changed ENTREPRISE's domain key constraint columns
--              cg$old_rec  Current values for ENTREPRISE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to ENTREPRISE 
--
-- Parameters:  cg$rec     Record of ENTREPRISE current values
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
--              child table that references this tableENTREPRISE 
--
-- Parameters:  cg$old_rec     Record of ENTREPRISE current values
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
--              of each child table that references this tableENTREPRISE 
--
-- Parameters:  cg$old_rec     Record of ENTREPRISE current values
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
-- Parameters:  cg$rec     Record of ENTREPRISE current values
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
-- Parameters:  cg$rec     Record of ENTREPRISE current values
--------------------------------------------------------------------------------
PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                          cg$ind IN cg$ind_type DEFAULT cg$ind_true)
IS
  dummy NUMBER;
  found BOOLEAN;
  no_tabview EXCEPTION;
  PRAGMA EXCEPTION_INIT(no_tabview, -942); 
BEGIN








    found := false;
    IF (cg$ind.DOMAINE_ACTIVITE AND cg$rec.DOMAINE_ACTIVITE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'DOMAINE_ACTIVITE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.DOMAINE_ACTIVITE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.DOMAINE_ACTIVITE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.DOMAINE_ACTIVITE,'ENTREPRISE','DOMAINE_ACTIVITE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$ENTREPRISE.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;













    NULL;

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        cg$errors.raise_failure;
    WHEN no_tabview THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_RV_TAB_NOT_FOUND,
                                            cg$errors.APIMSG_RV_TAB_NOT_FOUND,
                                            'CG_REF_CODES','ENTREPRISE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$ENTREPRISE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENTREPRISE.v_domain.others');
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
    IF (con_name = 'ENT_PK') THEN
        cg$errors.push(nvl(ENT_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'ENT_PK' 
                                     ,'ENTREPRISE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_ENT_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Entreprise', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'OFF_ENT_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Entreprise', 'Offre Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'POE_ENT_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Entreprise', 'Poste Entreprise'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'EMP_ENT_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Entreprise', 'Employe'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'ENT_AUT_CREA_FK') THEN
        cg$errors.push(nvl(ENT_AUT_CREA_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'ENT_AUT_CREA_FK' 
                                     ,'ENTREPRISE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'ENT_AUT_MAJ_FK') THEN
        cg$errors.push(nvl(ENT_AUT_MAJ_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'ENT_AUT_MAJ_FK' 
                                     ,'ENTREPRISE')),
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
-- Name:        insert_jn
--
-- Description: Insert a record into the journal table for auditing purposes
--
-- Parameters:  cg$rec    Record of row to be journalled
--              operation Type of action to be journalled for this record
--------------------------------------------------------------------------------
PROCEDURE insert_jn(cg$rec    IN cg$row_type,
                    operation IN VARCHAR2 DEFAULT 'INS') IS
BEGIN
    INSERT INTO ENTREPRISE_JN
        (JN_OPERATION
        ,JN_ORACLE_USER
        ,JN_DATETIME
        ,JN_NOTES
        ,JN_APPLN
        ,JN_SESSION
        ,NO_ENTREPRISE
        ,REFERENCEE
        ,DATE_REFERENCEMENT
        ,LOGIN_CREA
        ,DATE_CREA
        ,NOM
        ,SIEGE_SOCIAL
        ,DOMAINE_ACTIVITE
        ,ADRESSE
        ,CP
        ,VILLE
        ,PAYS
        ,TEL
        ,SITE_INTERNET
        ,NOM_REPRESENTANT
        ,PRENOM_REPRESENTANT
        ,LOGIN_MAJ
        ,DATE_MAJ
        ,OFFRE_STAGE)
    VALUES
        (operation
        ,USER
        ,SYSDATE
        ,cg$rec.jn_notes
        ,'CG$ENTREPRISE.'||operation
        ,userenv('sessionid')
        ,cg$rec.NO_ENTREPRISE
        ,cg$rec.REFERENCEE
        ,cg$rec.DATE_REFERENCEMENT
        ,cg$rec.LOGIN_CREA
        ,cg$rec.DATE_CREA
        ,cg$rec.NOM
        ,cg$rec.SIEGE_SOCIAL
        ,cg$rec.DOMAINE_ACTIVITE
        ,cg$rec.ADRESSE
        ,cg$rec.CP
        ,cg$rec.VILLE
        ,cg$rec.PAYS
        ,cg$rec.TEL
        ,cg$rec.SITE_INTERNET
        ,cg$rec.NOM_REPRESENTANT
        ,cg$rec.PRENOM_REPRESENTANT
        ,cg$rec.LOGIN_MAJ
        ,cg$rec.DATE_MAJ
        ,cg$rec.OFFRE_STAGE);
EXCEPTION
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                      'E',
                      'ORA',
                      SQLCODE,
                      'cg$ENTREPRISE.insert_jn_'||operation||'.others');
        cg$errors.raise_failure;
END insert_jn;


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

D130_PAYS CONSTANT ENTREPRISE.PAYS%TYPE := 'FRANCE';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.PAYS) THEN cg$rec.PAYS := D130_PAYS; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO ENTREPRISE
            (NO_ENTREPRISE
            ,REFERENCEE
            ,DATE_REFERENCEMENT
            ,LOGIN_CREA
            ,DATE_CREA
            ,NOM
            ,SIEGE_SOCIAL
            ,DOMAINE_ACTIVITE
            ,ADRESSE
            ,CP
            ,VILLE
            ,PAYS
            ,TEL
            ,SITE_INTERNET
            ,NOM_REPRESENTANT
            ,PRENOM_REPRESENTANT
            ,LOGIN_MAJ
            ,DATE_MAJ
            ,OFFRE_STAGE)
        VALUES
            (cg$rec.NO_ENTREPRISE
            ,cg$rec.REFERENCEE
            ,cg$rec.DATE_REFERENCEMENT
            ,cg$rec.LOGIN_CREA
            ,cg$rec.DATE_CREA
            ,cg$rec.NOM
            ,cg$rec.SIEGE_SOCIAL
            ,cg$rec.DOMAINE_ACTIVITE
            ,cg$rec.ADRESSE
            ,cg$rec.CP
            ,cg$rec.VILLE
            ,cg$rec.PAYS
            ,cg$rec.TEL
            ,cg$rec.SITE_INTERNET
            ,cg$rec.NOM_REPRESENTANT
            ,cg$rec.PRENOM_REPRESENTANT
            ,cg$rec.LOGIN_MAJ
            ,cg$rec.DATE_MAJ
            ,cg$rec.OFFRE_STAGE
);
        doLobs(cg$rec, cg$ind);
        slct(cg$rec);

        upd_oper_denorm2(cg$rec, cg$tmp_rec, cg$ind, 'INS');
    END IF;

    called_from_package := FALSE;


    insert_jn(cg$rec, 'INS');


--  Application logic Post-Insert <<Start>>
--  Application logic Post-Insert << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.mandatory_missing THEN
        validate_mandatory(cg$rec, 'cg$ENTREPRISE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENTREPRISE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENTREPRISE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENTREPRISE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENTREPRISE.ins.others');
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

 
    IF ( cg$pk.NO_ENTREPRISE IS NULL ) THEN          
      cg$upd_rec.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    ELSE
      cg$upd_rec.NO_ENTREPRISE := cg$pk.NO_ENTREPRISE;
    END IF;
    cg$old_rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key ENT_PK
        IF (cg$ind.NO_ENTREPRISE AND cg$rec.NO_ENTREPRISE != cg$upd_rec.NO_ENTREPRISE) THEN
            raise_uk_not_updateable('ENT_PK');
        END IF;
        IF NOT (cg$ind.NO_ENTREPRISE) THEN
            cg$rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.REFERENCEE) THEN
            cg$rec.REFERENCEE := cg$upd_rec.REFERENCEE;
        END IF;
        IF NOT (cg$ind.DATE_REFERENCEMENT) THEN
            cg$rec.DATE_REFERENCEMENT := cg$upd_rec.DATE_REFERENCEMENT;
        END IF;
        IF NOT (cg$ind.LOGIN_CREA) THEN
            cg$rec.LOGIN_CREA := cg$upd_rec.LOGIN_CREA;
        END IF;
        IF NOT (cg$ind.DATE_CREA) THEN
            cg$rec.DATE_CREA := cg$upd_rec.DATE_CREA;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.SIEGE_SOCIAL) THEN
            cg$rec.SIEGE_SOCIAL := cg$upd_rec.SIEGE_SOCIAL;
        END IF;
        IF NOT (cg$ind.DOMAINE_ACTIVITE) THEN
            cg$rec.DOMAINE_ACTIVITE := cg$upd_rec.DOMAINE_ACTIVITE;
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
        IF NOT (cg$ind.TEL) THEN
            cg$rec.TEL := cg$upd_rec.TEL;
        END IF;
        IF NOT (cg$ind.SITE_INTERNET) THEN
            cg$rec.SITE_INTERNET := cg$upd_rec.SITE_INTERNET;
        END IF;
        IF NOT (cg$ind.NOM_REPRESENTANT) THEN
            cg$rec.NOM_REPRESENTANT := cg$upd_rec.NOM_REPRESENTANT;
        END IF;
        IF NOT (cg$ind.PRENOM_REPRESENTANT) THEN
            cg$rec.PRENOM_REPRESENTANT := cg$upd_rec.PRENOM_REPRESENTANT;
        END IF;
        IF NOT (cg$ind.LOGIN_MAJ) THEN
            cg$rec.LOGIN_MAJ := cg$upd_rec.LOGIN_MAJ;
        END IF;
        IF NOT (cg$ind.DATE_MAJ) THEN
            cg$rec.DATE_MAJ := cg$upd_rec.DATE_MAJ;
        END IF;
        IF NOT (cg$ind.OFFRE_STAGE) THEN
            cg$rec.OFFRE_STAGE := cg$upd_rec.OFFRE_STAGE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key ENT_PK
        IF ( cg$ind.NO_ENTREPRISE ) THEN
          raise_uk_not_updateable('ENT_PK');
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
            UPDATE ENTREPRISE
            SET
              REFERENCEE = cg$rec.REFERENCEE
              ,DATE_REFERENCEMENT = cg$rec.DATE_REFERENCEMENT
              ,LOGIN_CREA = cg$rec.LOGIN_CREA
              ,DATE_CREA = cg$rec.DATE_CREA
              ,NOM = cg$rec.NOM
              ,SIEGE_SOCIAL = cg$rec.SIEGE_SOCIAL
              ,DOMAINE_ACTIVITE = cg$rec.DOMAINE_ACTIVITE
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,TEL = cg$rec.TEL
              ,SITE_INTERNET = cg$rec.SITE_INTERNET
              ,NOM_REPRESENTANT = cg$rec.NOM_REPRESENTANT
              ,PRENOM_REPRESENTANT = cg$rec.PRENOM_REPRESENTANT
              ,LOGIN_MAJ = cg$rec.LOGIN_MAJ
              ,DATE_MAJ = cg$rec.DATE_MAJ
              ,OFFRE_STAGE = cg$rec.OFFRE_STAGE
            WHERE  NO_ENTREPRISE = cg$rec.NO_ENTREPRISE;
            null;
          ELSE
            UPDATE ENTREPRISE
            SET
              REFERENCEE = cg$rec.REFERENCEE
              ,DATE_REFERENCEMENT = cg$rec.DATE_REFERENCEMENT
              ,LOGIN_CREA = cg$rec.LOGIN_CREA
              ,DATE_CREA = cg$rec.DATE_CREA
              ,NOM = cg$rec.NOM
              ,SIEGE_SOCIAL = cg$rec.SIEGE_SOCIAL
              ,DOMAINE_ACTIVITE = cg$rec.DOMAINE_ACTIVITE
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,PAYS = cg$rec.PAYS
              ,TEL = cg$rec.TEL
              ,SITE_INTERNET = cg$rec.SITE_INTERNET
              ,NOM_REPRESENTANT = cg$rec.NOM_REPRESENTANT
              ,PRENOM_REPRESENTANT = cg$rec.PRENOM_REPRESENTANT
              ,LOGIN_MAJ = cg$rec.LOGIN_MAJ
              ,DATE_MAJ = cg$rec.DATE_MAJ
              ,OFFRE_STAGE = cg$rec.OFFRE_STAGE
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


    insert_jn(cg$rec, 'UPD');

    IF NOT (do_upd) THEN
        cg$table(idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
        cg$tableind(idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
        cg$table(idx).REFERENCEE := cg$rec.REFERENCEE;
        cg$tableind(idx).REFERENCEE := cg$ind.REFERENCEE;
        cg$table(idx).DATE_REFERENCEMENT := cg$rec.DATE_REFERENCEMENT;
        cg$tableind(idx).DATE_REFERENCEMENT := cg$ind.DATE_REFERENCEMENT;
        cg$table(idx).LOGIN_CREA := cg$rec.LOGIN_CREA;
        cg$tableind(idx).LOGIN_CREA := cg$ind.LOGIN_CREA;
        cg$table(idx).DATE_CREA := cg$rec.DATE_CREA;
        cg$tableind(idx).DATE_CREA := cg$ind.DATE_CREA;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).SIEGE_SOCIAL := cg$rec.SIEGE_SOCIAL;
        cg$tableind(idx).SIEGE_SOCIAL := cg$ind.SIEGE_SOCIAL;
        cg$table(idx).DOMAINE_ACTIVITE := cg$rec.DOMAINE_ACTIVITE;
        cg$tableind(idx).DOMAINE_ACTIVITE := cg$ind.DOMAINE_ACTIVITE;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CP := cg$rec.CP;
        cg$tableind(idx).CP := cg$ind.CP;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).PAYS := cg$rec.PAYS;
        cg$tableind(idx).PAYS := cg$ind.PAYS;
        cg$table(idx).TEL := cg$rec.TEL;
        cg$tableind(idx).TEL := cg$ind.TEL;
        cg$table(idx).SITE_INTERNET := cg$rec.SITE_INTERNET;
        cg$tableind(idx).SITE_INTERNET := cg$ind.SITE_INTERNET;
        cg$table(idx).NOM_REPRESENTANT := cg$rec.NOM_REPRESENTANT;
        cg$tableind(idx).NOM_REPRESENTANT := cg$ind.NOM_REPRESENTANT;
        cg$table(idx).PRENOM_REPRESENTANT := cg$rec.PRENOM_REPRESENTANT;
        cg$tableind(idx).PRENOM_REPRESENTANT := cg$ind.PRENOM_REPRESENTANT;
        cg$table(idx).LOGIN_MAJ := cg$rec.LOGIN_MAJ;
        cg$tableind(idx).LOGIN_MAJ := cg$ind.LOGIN_MAJ;
        cg$table(idx).DATE_MAJ := cg$rec.DATE_MAJ;
        cg$tableind(idx).DATE_MAJ := cg$ind.DATE_MAJ;
        cg$table(idx).OFFRE_STAGE := cg$rec.OFFRE_STAGE;
        cg$tableind(idx).OFFRE_STAGE := cg$ind.OFFRE_STAGE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$ENTREPRISE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ENTREPRISE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ENTREPRISE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ENTREPRISE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENTREPRISE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of ENTREPRISE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for ENTREPRISE's domain key constraint columns 
--              cg$ind      Indicates changed ENTREPRISE's domain key constraint columns
--              cg$old_rec  Current values for ENTREPRISE's domain key constraint columns
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
cg$tmp_rec cg$row_type;
BEGIN
--  Application_logic Pre-Delete <<Start>>
--  Application_logic Pre-Delete << End >>
    cg$tmp_rec.NO_ENTREPRISE := cg$pk.NO_ENTREPRISE;
    cg$tmp_rec.jn_notes := cg$pk.jn_notes;

--  Delete the record

    called_from_package := TRUE;

    IF (do_del) THEN
        DECLARE
           cg$rec cg$row_type;
           cg$old_rec cg$row_type;
           cg$ind cg$ind_type;
        BEGIN
           cg$rec.NO_ENTREPRISE := cg$pk.NO_ENTREPRISE;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE ENTREPRISE
              WHERE                    NO_ENTREPRISE = cg$pk.NO_ENTREPRISE;
           ELSE
              DELETE ENTREPRISE
              WHERE  rowid = cg$pk.the_rowid;
           END IF;

           upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'DEL');
           cascade_delete(cg$rec);
           domain_cascade_delete(cg$rec);             
        END;
    END IF;

    called_from_package := FALSE;

    insert_jn(cg$tmp_rec, 'DEL');

--  Application_logic Post-Delete <<Start>>
--  Application_logic Post-Delete << End >>

EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.delete_restrict THEN
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$ENTREPRISE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENTREPRISE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ENTREPRISE.del.others');
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
               SELECT       NO_ENTREPRISE
               ,            REFERENCEE
               ,            DATE_REFERENCEMENT
               ,            LOGIN_CREA
               ,            DATE_CREA
               ,            NOM
               ,            SIEGE_SOCIAL
               ,            DOMAINE_ACTIVITE
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL
               ,            SITE_INTERNET
               ,            NOM_REPRESENTANT
               ,            PRENOM_REPRESENTANT
               ,            LOGIN_MAJ
               ,            DATE_MAJ
               ,            OFFRE_STAGE
               INTO         cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.REFERENCEE
               ,            cg$tmp_rec.DATE_REFERENCEMENT
               ,            cg$tmp_rec.LOGIN_CREA
               ,            cg$tmp_rec.DATE_CREA
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.SIEGE_SOCIAL
               ,            cg$tmp_rec.DOMAINE_ACTIVITE
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.SITE_INTERNET
               ,            cg$tmp_rec.NOM_REPRESENTANT
               ,            cg$tmp_rec.PRENOM_REPRESENTANT
               ,            cg$tmp_rec.LOGIN_MAJ
               ,            cg$tmp_rec.DATE_MAJ
               ,            cg$tmp_rec.OFFRE_STAGE
               FROM      ENTREPRISE
               WHERE              NO_ENTREPRISE = cg$old_rec.NO_ENTREPRISE
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ENTREPRISE
               ,            REFERENCEE
               ,            DATE_REFERENCEMENT
               ,            LOGIN_CREA
               ,            DATE_CREA
               ,            NOM
               ,            SIEGE_SOCIAL
               ,            DOMAINE_ACTIVITE
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL
               ,            SITE_INTERNET
               ,            NOM_REPRESENTANT
               ,            PRENOM_REPRESENTANT
               ,            LOGIN_MAJ
               ,            DATE_MAJ
               ,            OFFRE_STAGE
               INTO         cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.REFERENCEE
               ,            cg$tmp_rec.DATE_REFERENCEMENT
               ,            cg$tmp_rec.LOGIN_CREA
               ,            cg$tmp_rec.DATE_CREA
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.SIEGE_SOCIAL
               ,            cg$tmp_rec.DOMAINE_ACTIVITE
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.SITE_INTERNET
               ,            cg$tmp_rec.NOM_REPRESENTANT
               ,            cg$tmp_rec.PRENOM_REPRESENTANT
               ,            cg$tmp_rec.LOGIN_MAJ
               ,            cg$tmp_rec.DATE_MAJ
               ,            cg$tmp_rec.OFFRE_STAGE
               FROM      ENTREPRISE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ENTREPRISE
               ,            REFERENCEE
               ,            DATE_REFERENCEMENT
               ,            LOGIN_CREA
               ,            DATE_CREA
               ,            NOM
               ,            SIEGE_SOCIAL
               ,            DOMAINE_ACTIVITE
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL
               ,            SITE_INTERNET
               ,            NOM_REPRESENTANT
               ,            PRENOM_REPRESENTANT
               ,            LOGIN_MAJ
               ,            DATE_MAJ
               ,            OFFRE_STAGE
               INTO         cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.REFERENCEE
               ,            cg$tmp_rec.DATE_REFERENCEMENT
               ,            cg$tmp_rec.LOGIN_CREA
               ,            cg$tmp_rec.DATE_CREA
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.SIEGE_SOCIAL
               ,            cg$tmp_rec.DOMAINE_ACTIVITE
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.SITE_INTERNET
               ,            cg$tmp_rec.NOM_REPRESENTANT
               ,            cg$tmp_rec.PRENOM_REPRESENTANT
               ,            cg$tmp_rec.LOGIN_MAJ
               ,            cg$tmp_rec.DATE_MAJ
               ,            cg$tmp_rec.OFFRE_STAGE
               FROM      ENTREPRISE
               WHERE              NO_ENTREPRISE = cg$old_rec.NO_ENTREPRISE
               FOR UPDATE;
            ELSE
               SELECT       NO_ENTREPRISE
               ,            REFERENCEE
               ,            DATE_REFERENCEMENT
               ,            LOGIN_CREA
               ,            DATE_CREA
               ,            NOM
               ,            SIEGE_SOCIAL
               ,            DOMAINE_ACTIVITE
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            PAYS
               ,            TEL
               ,            SITE_INTERNET
               ,            NOM_REPRESENTANT
               ,            PRENOM_REPRESENTANT
               ,            LOGIN_MAJ
               ,            DATE_MAJ
               ,            OFFRE_STAGE
               INTO         cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.REFERENCEE
               ,            cg$tmp_rec.DATE_REFERENCEMENT
               ,            cg$tmp_rec.LOGIN_CREA
               ,            cg$tmp_rec.DATE_CREA
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.SIEGE_SOCIAL
               ,            cg$tmp_rec.DOMAINE_ACTIVITE
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.PAYS
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.SITE_INTERNET
               ,            cg$tmp_rec.NOM_REPRESENTANT
               ,            cg$tmp_rec.PRENOM_REPRESENTANT
               ,            cg$tmp_rec.LOGIN_MAJ
               ,            cg$tmp_rec.DATE_MAJ
               ,            cg$tmp_rec.OFFRE_STAGE
               FROM      ENTREPRISE
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
                           'cg$ENTREPRISE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENTREPRISE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ENTREPRISE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DATE_REFERENCEMENT) THEN
        IF (cg$tmp_rec.DATE_REFERENCEMENT IS NOT NULL
        AND cg$old_rec.DATE_REFERENCEMENT IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REFERENCEMENT != cg$old_rec.DATE_REFERENCEMENT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30DATE_REFERENCEMENT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REFERENCEMENT IS NOT NULL
        OR cg$old_rec.DATE_REFERENCEMENT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30DATE_REFERENCEMENT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SITE_INTERNET) THEN
        IF (cg$tmp_rec.SITE_INTERNET IS NOT NULL
        AND cg$old_rec.SITE_INTERNET IS NOT NULL) THEN
            IF (cg$tmp_rec.SITE_INTERNET != cg$old_rec.SITE_INTERNET) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150SITE_INTERNET
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.SITE_INTERNET IS NOT NULL
        OR cg$old_rec.SITE_INTERNET IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150SITE_INTERNET
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM_REPRESENTANT) THEN
        IF (cg$tmp_rec.NOM_REPRESENTANT IS NOT NULL
        AND cg$old_rec.NOM_REPRESENTANT IS NOT NULL) THEN
            IF (cg$tmp_rec.NOM_REPRESENTANT != cg$old_rec.NOM_REPRESENTANT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160NOM_REPRESENTANT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOM_REPRESENTANT IS NOT NULL
        OR cg$old_rec.NOM_REPRESENTANT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160NOM_REPRESENTANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM_REPRESENTANT) THEN
        IF (cg$tmp_rec.PRENOM_REPRESENTANT IS NOT NULL
        AND cg$old_rec.PRENOM_REPRESENTANT IS NOT NULL) THEN
            IF (cg$tmp_rec.PRENOM_REPRESENTANT != cg$old_rec.PRENOM_REPRESENTANT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170PRENOM_REPRESENTANT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.PRENOM_REPRESENTANT IS NOT NULL
        OR cg$old_rec.PRENOM_REPRESENTANT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170PRENOM_REPRESENTANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOGIN_MAJ) THEN
        IF (cg$tmp_rec.LOGIN_MAJ IS NOT NULL
        AND cg$old_rec.LOGIN_MAJ IS NOT NULL) THEN
            IF (cg$tmp_rec.LOGIN_MAJ != cg$old_rec.LOGIN_MAJ) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P175LOGIN_MAJ
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOGIN_MAJ IS NOT NULL
        OR cg$old_rec.LOGIN_MAJ IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P175LOGIN_MAJ
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_MAJ) THEN
        IF (cg$tmp_rec.DATE_MAJ IS NOT NULL
        AND cg$old_rec.DATE_MAJ IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_MAJ != cg$old_rec.DATE_MAJ) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180DATE_MAJ
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_MAJ IS NOT NULL
        OR cg$old_rec.DATE_MAJ IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180DATE_MAJ
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.OFFRE_STAGE) THEN
        IF (cg$tmp_rec.OFFRE_STAGE IS NOT NULL
        AND cg$old_rec.OFFRE_STAGE IS NOT NULL) THEN
            IF (cg$tmp_rec.OFFRE_STAGE != cg$old_rec.OFFRE_STAGE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200OFFRE_STAGE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.OFFRE_STAGE IS NOT NULL
        OR cg$old_rec.OFFRE_STAGE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200OFFRE_STAGE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_ENTREPRISE != cg$old_rec.NO_ENTREPRISE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.REFERENCEE) THEN
        IF (cg$tmp_rec.REFERENCEE != cg$old_rec.REFERENCEE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20REFERENCEE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOGIN_CREA) THEN
        IF (cg$tmp_rec.LOGIN_CREA != cg$old_rec.LOGIN_CREA) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40LOGIN_CREA
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_CREA) THEN
        IF (cg$tmp_rec.DATE_CREA != cg$old_rec.DATE_CREA) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_CREA
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SIEGE_SOCIAL) THEN
        IF (cg$tmp_rec.SIEGE_SOCIAL != cg$old_rec.SIEGE_SOCIAL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70SIEGE_SOCIAL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOMAINE_ACTIVITE) THEN
        IF (cg$tmp_rec.DOMAINE_ACTIVITE != cg$old_rec.DOMAINE_ACTIVITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DOMAINE_ACTIVITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CP) THEN
        IF (cg$tmp_rec.CP != cg$old_rec.CP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PAYS) THEN
        IF (cg$tmp_rec.PAYS != cg$old_rec.PAYS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL) THEN
        IF (cg$tmp_rec.TEL != cg$old_rec.TEL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140TEL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ENTREPRISE.lck');
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
      cg$ind_true.NO_ENTREPRISE := TRUE;
      cg$ind_true.REFERENCEE := TRUE;
      cg$ind_true.DATE_REFERENCEMENT := TRUE;
      cg$ind_true.LOGIN_CREA := TRUE;
      cg$ind_true.DATE_CREA := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.SIEGE_SOCIAL := TRUE;
      cg$ind_true.DOMAINE_ACTIVITE := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CP := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.PAYS := TRUE;
      cg$ind_true.TEL := TRUE;
      cg$ind_true.SITE_INTERNET := TRUE;
      cg$ind_true.NOM_REPRESENTANT := TRUE;
      cg$ind_true.PRENOM_REPRESENTANT := TRUE;
      cg$ind_true.LOGIN_MAJ := TRUE;
      cg$ind_true.DATE_MAJ := TRUE;
      cg$ind_true.OFFRE_STAGE := TRUE;
   

END cg$ENTREPRISE;
/