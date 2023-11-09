
PROMPT Creating API Package Body for Table 'PROMOTION'
--------------------------------------------------------------------------------
-- Name:        cg$PROMOTION
-- Description: PROMOTION table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$PROMOTION IS

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
                   'cg$PROMOTION.raise_uk_not_updateable');
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
                   'cg$PROMOTION.raise_fk_not_transferable');
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
                    'cg$PROMOTION.up_autogen_columns');
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
    IF (cg$val_rec.ANNEE_PRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P2ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SIGLE_PRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20SIGLE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NB_ETU_SOUHAITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30NB_ETU_SOUHAITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ETAT_PRESELECTION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40ETAT_PRESELECTION),
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
       SELECT    ANNEE_PRO
       ,         SIGLE_PRO
       ,         NB_ETU_SOUHAITE
       ,         ETAT_PRESELECTION
       ,         DATE_RENTREE
       ,         LIEU_RENTREE
       ,         DATE_REPONSE_LP
       ,         COMMENTAIRE
       ,         DATE_REPONSE_LALP
       ,         PROCESSUS_STAGE
       ,         NO_BAREME
       ,         NO_EVALUATION
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.SIGLE_PRO
       ,         cg$sel_rec.NB_ETU_SOUHAITE
       ,         cg$sel_rec.ETAT_PRESELECTION
       ,         cg$sel_rec.DATE_RENTREE
       ,         cg$sel_rec.LIEU_RENTREE
       ,         cg$sel_rec.DATE_REPONSE_LP
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.DATE_REPONSE_LALP
       ,         cg$sel_rec.PROCESSUS_STAGE
       ,         cg$sel_rec.NO_BAREME
       ,         cg$sel_rec.NO_EVALUATION
       ,cg$sel_rec.the_rowid
       FROM   PROMOTION
       WHERE        ANNEE_PRO = cg$sel_rec.ANNEE_PRO;
    ELSE
       SELECT    ANNEE_PRO
       ,         SIGLE_PRO
       ,         NB_ETU_SOUHAITE
       ,         ETAT_PRESELECTION
       ,         DATE_RENTREE
       ,         LIEU_RENTREE
       ,         DATE_REPONSE_LP
       ,         COMMENTAIRE
       ,         DATE_REPONSE_LALP
       ,         PROCESSUS_STAGE
       ,         NO_BAREME
       ,         NO_EVALUATION
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.SIGLE_PRO
       ,         cg$sel_rec.NB_ETU_SOUHAITE
       ,         cg$sel_rec.ETAT_PRESELECTION
       ,         cg$sel_rec.DATE_RENTREE
       ,         cg$sel_rec.LIEU_RENTREE
       ,         cg$sel_rec.DATE_REPONSE_LP
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.DATE_REPONSE_LALP
       ,         cg$sel_rec.PROCESSUS_STAGE
       ,         cg$sel_rec.NO_BAREME
       ,         cg$sel_rec.NO_EVALUATION
       ,cg$sel_rec.the_rowid
       FROM   PROMOTION
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$PROMOTION.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to PROMOTION 
--
-- Parameters:  cg$rec     Record of PROMOTION current values
--              cg$old_rec Record of PROMOTION previous values
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
--              of each child table that references this tablePROMOTION 
--
-- Parameters:  cg$old_rec     Record of PROMOTION current values
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
--              child table that references this table PROMOTION 
--
-- Parameters:  cg$new_rec  New values for PROMOTION's domain key constraint columns 
--              cg$new_ind  Indicates changed PROMOTION's domain key constraint columns
--              cg$old_rec  Current values for PROMOTION's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to PROMOTION 
--
-- Parameters:  cg$rec     Record of PROMOTION current values
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
--              child table that references this tablePROMOTION 
--
-- Parameters:  cg$old_rec     Record of PROMOTION current values
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
--              of each child table that references this tablePROMOTION 
--
-- Parameters:  cg$old_rec     Record of PROMOTION current values
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
-- Parameters:  cg$rec     Record of PROMOTION current values
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
-- Parameters:  cg$rec     Record of PROMOTION current values
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
    IF (cg$ind.PROCESSUS_STAGE AND cg$rec.PROCESSUS_STAGE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'PROCESSUS_STAGE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.PROCESSUS_STAGE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.PROCESSUS_STAGE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.PROCESSUS_STAGE,'PROMOTION','PROCESSUS_STAGE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$PROMOTION.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','PROMOTION'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$PROMOTION.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$PROMOTION.v_domain.others');
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
    IF (con_name = 'PRO_PK') THEN
        cg$errors.push(nvl(PRO_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'PRO_PK' 
                                     ,'PROMOTION')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'SOUT_PRO_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Promotion', 'Soutenance'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'OFF_PRO_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Promotion', 'Offre Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'ETU_PRO_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Promotion', 'Etudiant'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'STG_PRO_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Promotion', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'PRO_STRE_FK') THEN
        cg$errors.push(nvl(PRO_STRE_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'PRO_STRE_FK' 
                                     ,'PROMOTION')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'PRO_NOTS_FK') THEN
        cg$errors.push(nvl(PRO_NOTS_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'PRO_NOTS_FK' 
                                     ,'PROMOTION')),
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

D100_PROCESSUS_STAGE CONSTANT PROMOTION.PROCESSUS_STAGE%TYPE := 'RECH';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.PROCESSUS_STAGE) THEN cg$rec.PROCESSUS_STAGE := D100_PROCESSUS_STAGE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO PROMOTION
            (ANNEE_PRO
            ,SIGLE_PRO
            ,NB_ETU_SOUHAITE
            ,ETAT_PRESELECTION
            ,DATE_RENTREE
            ,LIEU_RENTREE
            ,DATE_REPONSE_LP
            ,COMMENTAIRE
            ,DATE_REPONSE_LALP
            ,PROCESSUS_STAGE
            ,NO_BAREME
            ,NO_EVALUATION)
        VALUES
            (cg$rec.ANNEE_PRO
            ,cg$rec.SIGLE_PRO
            ,cg$rec.NB_ETU_SOUHAITE
            ,cg$rec.ETAT_PRESELECTION
            ,cg$rec.DATE_RENTREE
            ,cg$rec.LIEU_RENTREE
            ,cg$rec.DATE_REPONSE_LP
            ,cg$rec.COMMENTAIRE
            ,cg$rec.DATE_REPONSE_LALP
            ,cg$rec.PROCESSUS_STAGE
            ,cg$rec.NO_BAREME
            ,cg$rec.NO_EVALUATION
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
        validate_mandatory(cg$rec, 'cg$PROMOTION.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$PROMOTION.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$PROMOTION.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$PROMOTION.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$PROMOTION.ins.others');
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

 
    IF ( cg$pk.ANNEE_PRO IS NULL ) THEN          
      cg$upd_rec.ANNEE_PRO := cg$rec.ANNEE_PRO;
    ELSE
      cg$upd_rec.ANNEE_PRO := cg$pk.ANNEE_PRO;
    END IF;
    cg$old_rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key PRO_PK
        IF (cg$ind.ANNEE_PRO AND cg$rec.ANNEE_PRO != cg$upd_rec.ANNEE_PRO) THEN
            raise_uk_not_updateable('PRO_PK');
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.SIGLE_PRO) THEN
            cg$rec.SIGLE_PRO := cg$upd_rec.SIGLE_PRO;
        END IF;
        IF NOT (cg$ind.NB_ETU_SOUHAITE) THEN
            cg$rec.NB_ETU_SOUHAITE := cg$upd_rec.NB_ETU_SOUHAITE;
        END IF;
        IF NOT (cg$ind.ETAT_PRESELECTION) THEN
            cg$rec.ETAT_PRESELECTION := cg$upd_rec.ETAT_PRESELECTION;
        END IF;
        IF NOT (cg$ind.DATE_RENTREE) THEN
            cg$rec.DATE_RENTREE := cg$upd_rec.DATE_RENTREE;
        END IF;
        IF NOT (cg$ind.LIEU_RENTREE) THEN
            cg$rec.LIEU_RENTREE := cg$upd_rec.LIEU_RENTREE;
        END IF;
        IF NOT (cg$ind.DATE_REPONSE_LP) THEN
            cg$rec.DATE_REPONSE_LP := cg$upd_rec.DATE_REPONSE_LP;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE) THEN
            cg$rec.COMMENTAIRE := cg$upd_rec.COMMENTAIRE;
        END IF;
        IF NOT (cg$ind.DATE_REPONSE_LALP) THEN
            cg$rec.DATE_REPONSE_LALP := cg$upd_rec.DATE_REPONSE_LALP;
        END IF;
        IF NOT (cg$ind.PROCESSUS_STAGE) THEN
            cg$rec.PROCESSUS_STAGE := cg$upd_rec.PROCESSUS_STAGE;
        END IF;
        IF NOT (cg$ind.NO_BAREME) THEN
            cg$rec.NO_BAREME := cg$upd_rec.NO_BAREME;
        END IF;
        IF NOT (cg$ind.NO_EVALUATION) THEN
            cg$rec.NO_EVALUATION := cg$upd_rec.NO_EVALUATION;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key PRO_PK
        IF ( cg$ind.ANNEE_PRO ) THEN
          raise_uk_not_updateable('PRO_PK');
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
            UPDATE PROMOTION
            SET
              SIGLE_PRO = cg$rec.SIGLE_PRO
              ,NB_ETU_SOUHAITE = cg$rec.NB_ETU_SOUHAITE
              ,ETAT_PRESELECTION = cg$rec.ETAT_PRESELECTION
              ,DATE_RENTREE = cg$rec.DATE_RENTREE
              ,LIEU_RENTREE = cg$rec.LIEU_RENTREE
              ,DATE_REPONSE_LP = cg$rec.DATE_REPONSE_LP
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,DATE_REPONSE_LALP = cg$rec.DATE_REPONSE_LALP
              ,PROCESSUS_STAGE = cg$rec.PROCESSUS_STAGE
              ,NO_BAREME = cg$rec.NO_BAREME
              ,NO_EVALUATION = cg$rec.NO_EVALUATION
            WHERE  ANNEE_PRO = cg$rec.ANNEE_PRO;
            null;
          ELSE
            UPDATE PROMOTION
            SET
              SIGLE_PRO = cg$rec.SIGLE_PRO
              ,NB_ETU_SOUHAITE = cg$rec.NB_ETU_SOUHAITE
              ,ETAT_PRESELECTION = cg$rec.ETAT_PRESELECTION
              ,DATE_RENTREE = cg$rec.DATE_RENTREE
              ,LIEU_RENTREE = cg$rec.LIEU_RENTREE
              ,DATE_REPONSE_LP = cg$rec.DATE_REPONSE_LP
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,DATE_REPONSE_LALP = cg$rec.DATE_REPONSE_LALP
              ,PROCESSUS_STAGE = cg$rec.PROCESSUS_STAGE
              ,NO_BAREME = cg$rec.NO_BAREME
              ,NO_EVALUATION = cg$rec.NO_EVALUATION
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
        cg$table(idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
        cg$tableind(idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
        cg$table(idx).SIGLE_PRO := cg$rec.SIGLE_PRO;
        cg$tableind(idx).SIGLE_PRO := cg$ind.SIGLE_PRO;
        cg$table(idx).NB_ETU_SOUHAITE := cg$rec.NB_ETU_SOUHAITE;
        cg$tableind(idx).NB_ETU_SOUHAITE := cg$ind.NB_ETU_SOUHAITE;
        cg$table(idx).ETAT_PRESELECTION := cg$rec.ETAT_PRESELECTION;
        cg$tableind(idx).ETAT_PRESELECTION := cg$ind.ETAT_PRESELECTION;
        cg$table(idx).DATE_RENTREE := cg$rec.DATE_RENTREE;
        cg$tableind(idx).DATE_RENTREE := cg$ind.DATE_RENTREE;
        cg$table(idx).LIEU_RENTREE := cg$rec.LIEU_RENTREE;
        cg$tableind(idx).LIEU_RENTREE := cg$ind.LIEU_RENTREE;
        cg$table(idx).DATE_REPONSE_LP := cg$rec.DATE_REPONSE_LP;
        cg$tableind(idx).DATE_REPONSE_LP := cg$ind.DATE_REPONSE_LP;
        cg$table(idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
        cg$tableind(idx).COMMENTAIRE := cg$ind.COMMENTAIRE;
        cg$table(idx).DATE_REPONSE_LALP := cg$rec.DATE_REPONSE_LALP;
        cg$tableind(idx).DATE_REPONSE_LALP := cg$ind.DATE_REPONSE_LALP;
        cg$table(idx).PROCESSUS_STAGE := cg$rec.PROCESSUS_STAGE;
        cg$tableind(idx).PROCESSUS_STAGE := cg$ind.PROCESSUS_STAGE;
        cg$table(idx).NO_BAREME := cg$rec.NO_BAREME;
        cg$tableind(idx).NO_BAREME := cg$ind.NO_BAREME;
        cg$table(idx).NO_EVALUATION := cg$rec.NO_EVALUATION;
        cg$tableind(idx).NO_EVALUATION := cg$ind.NO_EVALUATION;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$PROMOTION.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$PROMOTION.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$PROMOTION.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$PROMOTION.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$PROMOTION.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of PROMOTION when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for PROMOTION's domain key constraint columns 
--              cg$ind      Indicates changed PROMOTION's domain key constraint columns
--              cg$old_rec  Current values for PROMOTION's domain key constraint columns
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
           cg$rec.ANNEE_PRO := cg$pk.ANNEE_PRO;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE PROMOTION
              WHERE                    ANNEE_PRO = cg$pk.ANNEE_PRO;
           ELSE
              DELETE PROMOTION
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$PROMOTION.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$PROMOTION.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$PROMOTION.del.others');
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
               SELECT       ANNEE_PRO
               ,            SIGLE_PRO
               ,            NB_ETU_SOUHAITE
               ,            ETAT_PRESELECTION
               ,            DATE_RENTREE
               ,            LIEU_RENTREE
               ,            DATE_REPONSE_LP
               ,            COMMENTAIRE
               ,            DATE_REPONSE_LALP
               ,            PROCESSUS_STAGE
               ,            NO_BAREME
               ,            NO_EVALUATION
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SIGLE_PRO
               ,            cg$tmp_rec.NB_ETU_SOUHAITE
               ,            cg$tmp_rec.ETAT_PRESELECTION
               ,            cg$tmp_rec.DATE_RENTREE
               ,            cg$tmp_rec.LIEU_RENTREE
               ,            cg$tmp_rec.DATE_REPONSE_LP
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_REPONSE_LALP
               ,            cg$tmp_rec.PROCESSUS_STAGE
               ,            cg$tmp_rec.NO_BAREME
               ,            cg$tmp_rec.NO_EVALUATION
               FROM      PROMOTION
               WHERE              ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ANNEE_PRO
               ,            SIGLE_PRO
               ,            NB_ETU_SOUHAITE
               ,            ETAT_PRESELECTION
               ,            DATE_RENTREE
               ,            LIEU_RENTREE
               ,            DATE_REPONSE_LP
               ,            COMMENTAIRE
               ,            DATE_REPONSE_LALP
               ,            PROCESSUS_STAGE
               ,            NO_BAREME
               ,            NO_EVALUATION
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SIGLE_PRO
               ,            cg$tmp_rec.NB_ETU_SOUHAITE
               ,            cg$tmp_rec.ETAT_PRESELECTION
               ,            cg$tmp_rec.DATE_RENTREE
               ,            cg$tmp_rec.LIEU_RENTREE
               ,            cg$tmp_rec.DATE_REPONSE_LP
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_REPONSE_LALP
               ,            cg$tmp_rec.PROCESSUS_STAGE
               ,            cg$tmp_rec.NO_BAREME
               ,            cg$tmp_rec.NO_EVALUATION
               FROM      PROMOTION
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ANNEE_PRO
               ,            SIGLE_PRO
               ,            NB_ETU_SOUHAITE
               ,            ETAT_PRESELECTION
               ,            DATE_RENTREE
               ,            LIEU_RENTREE
               ,            DATE_REPONSE_LP
               ,            COMMENTAIRE
               ,            DATE_REPONSE_LALP
               ,            PROCESSUS_STAGE
               ,            NO_BAREME
               ,            NO_EVALUATION
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SIGLE_PRO
               ,            cg$tmp_rec.NB_ETU_SOUHAITE
               ,            cg$tmp_rec.ETAT_PRESELECTION
               ,            cg$tmp_rec.DATE_RENTREE
               ,            cg$tmp_rec.LIEU_RENTREE
               ,            cg$tmp_rec.DATE_REPONSE_LP
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_REPONSE_LALP
               ,            cg$tmp_rec.PROCESSUS_STAGE
               ,            cg$tmp_rec.NO_BAREME
               ,            cg$tmp_rec.NO_EVALUATION
               FROM      PROMOTION
               WHERE              ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE;
            ELSE
               SELECT       ANNEE_PRO
               ,            SIGLE_PRO
               ,            NB_ETU_SOUHAITE
               ,            ETAT_PRESELECTION
               ,            DATE_RENTREE
               ,            LIEU_RENTREE
               ,            DATE_REPONSE_LP
               ,            COMMENTAIRE
               ,            DATE_REPONSE_LALP
               ,            PROCESSUS_STAGE
               ,            NO_BAREME
               ,            NO_EVALUATION
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SIGLE_PRO
               ,            cg$tmp_rec.NB_ETU_SOUHAITE
               ,            cg$tmp_rec.ETAT_PRESELECTION
               ,            cg$tmp_rec.DATE_RENTREE
               ,            cg$tmp_rec.LIEU_RENTREE
               ,            cg$tmp_rec.DATE_REPONSE_LP
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_REPONSE_LALP
               ,            cg$tmp_rec.PROCESSUS_STAGE
               ,            cg$tmp_rec.NO_BAREME
               ,            cg$tmp_rec.NO_EVALUATION
               FROM      PROMOTION
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
                           'cg$PROMOTION.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$PROMOTION.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$PROMOTION.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DATE_RENTREE) THEN
        IF (cg$tmp_rec.DATE_RENTREE IS NOT NULL
        AND cg$old_rec.DATE_RENTREE IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_RENTREE != cg$old_rec.DATE_RENTREE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_RENTREE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_RENTREE IS NOT NULL
        OR cg$old_rec.DATE_RENTREE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_RENTREE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU_RENTREE) THEN
        IF (cg$tmp_rec.LIEU_RENTREE IS NOT NULL
        AND cg$old_rec.LIEU_RENTREE IS NOT NULL) THEN
            IF (cg$tmp_rec.LIEU_RENTREE != cg$old_rec.LIEU_RENTREE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60LIEU_RENTREE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LIEU_RENTREE IS NOT NULL
        OR cg$old_rec.LIEU_RENTREE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60LIEU_RENTREE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_REPONSE_LP) THEN
        IF (cg$tmp_rec.DATE_REPONSE_LP IS NOT NULL
        AND cg$old_rec.DATE_REPONSE_LP IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REPONSE_LP != cg$old_rec.DATE_REPONSE_LP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DATE_REPONSE_LP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REPONSE_LP IS NOT NULL
        OR cg$old_rec.DATE_REPONSE_LP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DATE_REPONSE_LP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE) THEN
        IF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        AND cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE != cg$old_rec.COMMENTAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80COMMENTAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        OR cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80COMMENTAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_REPONSE_LALP) THEN
        IF (cg$tmp_rec.DATE_REPONSE_LALP IS NOT NULL
        AND cg$old_rec.DATE_REPONSE_LALP IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REPONSE_LALP != cg$old_rec.DATE_REPONSE_LALP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DATE_REPONSE_LALP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REPONSE_LALP IS NOT NULL
        OR cg$old_rec.DATE_REPONSE_LALP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DATE_REPONSE_LALP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PROCESSUS_STAGE) THEN
        IF (cg$tmp_rec.PROCESSUS_STAGE IS NOT NULL
        AND cg$old_rec.PROCESSUS_STAGE IS NOT NULL) THEN
            IF (cg$tmp_rec.PROCESSUS_STAGE != cg$old_rec.PROCESSUS_STAGE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100PROCESSUS_STAGE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.PROCESSUS_STAGE IS NOT NULL
        OR cg$old_rec.PROCESSUS_STAGE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100PROCESSUS_STAGE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_BAREME) THEN
        IF (cg$tmp_rec.NO_BAREME IS NOT NULL
        AND cg$old_rec.NO_BAREME IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_BAREME != cg$old_rec.NO_BAREME) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110NO_BAREME
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_BAREME IS NOT NULL
        OR cg$old_rec.NO_BAREME IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110NO_BAREME
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_EVALUATION) THEN
        IF (cg$tmp_rec.NO_EVALUATION IS NOT NULL
        AND cg$old_rec.NO_EVALUATION IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_EVALUATION != cg$old_rec.NO_EVALUATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120NO_EVALUATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_EVALUATION IS NOT NULL
        OR cg$old_rec.NO_EVALUATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120NO_EVALUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P2ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SIGLE_PRO) THEN
        IF (cg$tmp_rec.SIGLE_PRO != cg$old_rec.SIGLE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20SIGLE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NB_ETU_SOUHAITE) THEN
        IF (cg$tmp_rec.NB_ETU_SOUHAITE != cg$old_rec.NB_ETU_SOUHAITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NB_ETU_SOUHAITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_PRESELECTION) THEN
        IF (cg$tmp_rec.ETAT_PRESELECTION != cg$old_rec.ETAT_PRESELECTION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40ETAT_PRESELECTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$PROMOTION.lck');
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
      cg$ind_true.ANNEE_PRO := TRUE;
      cg$ind_true.SIGLE_PRO := TRUE;
      cg$ind_true.NB_ETU_SOUHAITE := TRUE;
      cg$ind_true.ETAT_PRESELECTION := TRUE;
      cg$ind_true.DATE_RENTREE := TRUE;
      cg$ind_true.LIEU_RENTREE := TRUE;
      cg$ind_true.DATE_REPONSE_LP := TRUE;
      cg$ind_true.COMMENTAIRE := TRUE;
      cg$ind_true.DATE_REPONSE_LALP := TRUE;
      cg$ind_true.PROCESSUS_STAGE := TRUE;
      cg$ind_true.NO_BAREME := TRUE;
      cg$ind_true.NO_EVALUATION := TRUE;
   

END cg$PROMOTION;
/

