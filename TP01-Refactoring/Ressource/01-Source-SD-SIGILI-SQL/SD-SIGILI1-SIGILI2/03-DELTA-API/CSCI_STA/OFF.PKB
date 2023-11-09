
PROMPT Creating API Package Body for Table 'OFFRE_STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$OFFRE_STAGE
-- Description: OFFRE_STAGE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$OFFRE_STAGE IS

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
                   'cg$OFFRE_STAGE.raise_uk_not_updateable');
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
                   'cg$OFFRE_STAGE.raise_fk_not_transferable');
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
			IF (cg$ind.NO_OFFRE = FALSE
      OR  cg$rec.NO_OFFRE is NULL) THEN 
				SELECT OFF_SEQ.nextval
				INTO   cg$rec.NO_OFFRE
				FROM   DUAL;
				cg$ind.NO_OFFRE := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$OFFRE_STAGE.up_autogen.NO_OFFRE.OTHERS');
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
                    'cg$OFFRE_STAGE.up_autogen_columns');
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
    IF (cg$val_rec.NO_OFFRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_OFFRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENTREPRISE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NO_ENTREPRISE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ANNEE_PRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P27ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.INTITULE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30INTITULE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SUJET IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40SUJET),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_CREATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50DATE_CREATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DUREE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70DUREE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ETAT_OFFRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80ETAT_OFFRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LIEU IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90LIEU),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NIVEAU_REQUIS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P100NIVEAU_REQUIS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERIODE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P110PERIODE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM_RESPONSABLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P120NOM_RESPONSABLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM_RESPONSABLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P130PRENOM_RESPONSABLE),
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
       SELECT    NO_OFFRE
       ,         NO_ENTREPRISE
       ,         NO_OFFRE_ENTREPRISE
       ,         ANNEE_PRO
       ,         INTITULE
       ,         SUJET
       ,         DATE_CREATION
       ,         DESCRIPTION
       ,         DUREE
       ,         ETAT_OFFRE
       ,         LIEU
       ,         NIVEAU_REQUIS
       ,         PERIODE
       ,         NOM_RESPONSABLE
       ,         PRENOM_RESPONSABLE
       ,         TEL_RESPONSABLE
       ,         MAIL_RESPONSABLE
       ,         REMUNERATION
       , rowid
       INTO      cg$sel_rec.NO_OFFRE
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_OFFRE_ENTREPRISE
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.INTITULE
       ,         cg$sel_rec.SUJET
       ,         cg$sel_rec.DATE_CREATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.ETAT_OFFRE
       ,         cg$sel_rec.LIEU
       ,         cg$sel_rec.NIVEAU_REQUIS
       ,         cg$sel_rec.PERIODE
       ,         cg$sel_rec.NOM_RESPONSABLE
       ,         cg$sel_rec.PRENOM_RESPONSABLE
       ,         cg$sel_rec.TEL_RESPONSABLE
       ,         cg$sel_rec.MAIL_RESPONSABLE
       ,         cg$sel_rec.REMUNERATION
       ,cg$sel_rec.the_rowid
       FROM   OFFRE_STAGE
       WHERE        NO_OFFRE = cg$sel_rec.NO_OFFRE;
    ELSE
       SELECT    NO_OFFRE
       ,         NO_ENTREPRISE
       ,         NO_OFFRE_ENTREPRISE
       ,         ANNEE_PRO
       ,         INTITULE
       ,         SUJET
       ,         DATE_CREATION
       ,         DESCRIPTION
       ,         DUREE
       ,         ETAT_OFFRE
       ,         LIEU
       ,         NIVEAU_REQUIS
       ,         PERIODE
       ,         NOM_RESPONSABLE
       ,         PRENOM_RESPONSABLE
       ,         TEL_RESPONSABLE
       ,         MAIL_RESPONSABLE
       ,         REMUNERATION
       , rowid
       INTO      cg$sel_rec.NO_OFFRE
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_OFFRE_ENTREPRISE
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.INTITULE
       ,         cg$sel_rec.SUJET
       ,         cg$sel_rec.DATE_CREATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.ETAT_OFFRE
       ,         cg$sel_rec.LIEU
       ,         cg$sel_rec.NIVEAU_REQUIS
       ,         cg$sel_rec.PERIODE
       ,         cg$sel_rec.NOM_RESPONSABLE
       ,         cg$sel_rec.PRENOM_RESPONSABLE
       ,         cg$sel_rec.TEL_RESPONSABLE
       ,         cg$sel_rec.MAIL_RESPONSABLE
       ,         cg$sel_rec.REMUNERATION
       ,cg$sel_rec.the_rowid
       FROM   OFFRE_STAGE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$OFFRE_STAGE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to OFFRE_STAGE 
--
-- Parameters:  cg$rec     Record of OFFRE_STAGE current values
--              cg$old_rec Record of OFFRE_STAGE previous values
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
--              of each child table that references this tableOFFRE_STAGE 
--
-- Parameters:  cg$old_rec     Record of OFFRE_STAGE current values
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
--              child table that references this table OFFRE_STAGE 
--
-- Parameters:  cg$new_rec  New values for OFFRE_STAGE's domain key constraint columns 
--              cg$new_ind  Indicates changed OFFRE_STAGE's domain key constraint columns
--              cg$old_rec  Current values for OFFRE_STAGE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to OFFRE_STAGE 
--
-- Parameters:  cg$rec     Record of OFFRE_STAGE current values
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
--              child table that references this tableOFFRE_STAGE 
--
-- Parameters:  cg$old_rec     Record of OFFRE_STAGE current values
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
--              of each child table that references this tableOFFRE_STAGE 
--
-- Parameters:  cg$old_rec     Record of OFFRE_STAGE current values
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
-- Parameters:  cg$rec     Record of OFFRE_STAGE current values
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
-- Parameters:  cg$rec     Record of OFFRE_STAGE current values
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
    IF (cg$ind.ETAT_OFFRE AND cg$rec.ETAT_OFFRE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'ETAT_OFFRE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.ETAT_OFFRE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.ETAT_OFFRE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.ETAT_OFFRE,'OFFRE_STAGE','ETAT_OFFRE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$OFFRE_STAGE.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;


    found := false;
    IF (cg$ind.NIVEAU_REQUIS AND cg$rec.NIVEAU_REQUIS IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'NIVEAU_REQUIS' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.NIVEAU_REQUIS = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.NIVEAU_REQUIS BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.NIVEAU_REQUIS,'OFFRE_STAGE','NIVEAU_REQUIS'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$OFFRE_STAGE.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','OFFRE_STAGE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$OFFRE_STAGE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$OFFRE_STAGE.v_domain.others');
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
    IF (con_name = 'OFF_PK') THEN
        cg$errors.push(nvl(OFF_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'OFF_PK' 
                                     ,'OFFRE_STAGE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_OFF_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Offre Stage', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'OFF_ENT_FK') THEN
        cg$errors.push(nvl(OFF_ENT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'OFF_ENT_FK' 
                                     ,'OFFRE_STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'OFF_PRO_FK') THEN
        cg$errors.push(nvl(OFF_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'OFF_PRO_FK' 
                                     ,'OFFRE_STAGE')),
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

D80_ETAT_OFFRE CONSTANT OFFRE_STAGE.ETAT_OFFRE%TYPE := 'ELA';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ETAT_OFFRE) THEN cg$rec.ETAT_OFFRE := D80_ETAT_OFFRE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO OFFRE_STAGE
            (NO_OFFRE
            ,NO_ENTREPRISE
            ,NO_OFFRE_ENTREPRISE
            ,ANNEE_PRO
            ,INTITULE
            ,SUJET
            ,DATE_CREATION
            ,DESCRIPTION
            ,DUREE
            ,ETAT_OFFRE
            ,LIEU
            ,NIVEAU_REQUIS
            ,PERIODE
            ,NOM_RESPONSABLE
            ,PRENOM_RESPONSABLE
            ,TEL_RESPONSABLE
            ,MAIL_RESPONSABLE
            ,REMUNERATION)
        VALUES
            (cg$rec.NO_OFFRE
            ,cg$rec.NO_ENTREPRISE
            ,cg$rec.NO_OFFRE_ENTREPRISE
            ,cg$rec.ANNEE_PRO
            ,cg$rec.INTITULE
            ,cg$rec.SUJET
            ,cg$rec.DATE_CREATION
            ,cg$rec.DESCRIPTION
            ,cg$rec.DUREE
            ,cg$rec.ETAT_OFFRE
            ,cg$rec.LIEU
            ,cg$rec.NIVEAU_REQUIS
            ,cg$rec.PERIODE
            ,cg$rec.NOM_RESPONSABLE
            ,cg$rec.PRENOM_RESPONSABLE
            ,cg$rec.TEL_RESPONSABLE
            ,cg$rec.MAIL_RESPONSABLE
            ,cg$rec.REMUNERATION
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
        validate_mandatory(cg$rec, 'cg$OFFRE_STAGE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$OFFRE_STAGE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$OFFRE_STAGE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$OFFRE_STAGE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$OFFRE_STAGE.ins.others');
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

 
    IF ( cg$pk.NO_OFFRE IS NULL ) THEN          
      cg$upd_rec.NO_OFFRE := cg$rec.NO_OFFRE;
    ELSE
      cg$upd_rec.NO_OFFRE := cg$pk.NO_OFFRE;
    END IF;
    cg$old_rec.NO_OFFRE := cg$upd_rec.NO_OFFRE;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);

           --  Report error if attempt to update non transferable Foreign Key OFF_ENT_FK
        IF (cg$ind.NO_ENTREPRISE AND cg$rec.NO_ENTREPRISE != cg$upd_rec.NO_ENTREPRISE) THEN
            raise_fk_not_transferable('OFF_ENT_FK');
        END IF;
        IF (cg$ind.NO_ENTREPRISE AND cg$rec.NO_ENTREPRISE IS NULL AND cg$upd_rec.NO_ENTREPRISE IS NOT NULL) THEN
            raise_fk_not_transferable('OFF_ENT_FK');
        END IF;
        IF (cg$ind.NO_ENTREPRISE AND cg$rec.NO_ENTREPRISE IS NOT NULL AND cg$upd_rec.NO_ENTREPRISE IS NULL) THEN
            raise_fk_not_transferable('OFF_ENT_FK');
        END IF;

        --  Report error if attempt to update non updateable Primary Key OFF_PK
        IF (cg$ind.NO_OFFRE AND cg$rec.NO_OFFRE != cg$upd_rec.NO_OFFRE) THEN
            raise_uk_not_updateable('OFF_PK');
        END IF;
        IF NOT (cg$ind.NO_OFFRE) THEN
            cg$rec.NO_OFFRE := cg$upd_rec.NO_OFFRE;
        END IF;
        IF NOT (cg$ind.NO_ENTREPRISE) THEN
            cg$rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.NO_OFFRE_ENTREPRISE) THEN
            cg$rec.NO_OFFRE_ENTREPRISE := cg$upd_rec.NO_OFFRE_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.INTITULE) THEN
            cg$rec.INTITULE := cg$upd_rec.INTITULE;
        END IF;
        IF NOT (cg$ind.SUJET) THEN
            cg$rec.SUJET := cg$upd_rec.SUJET;
        END IF;
        IF NOT (cg$ind.DATE_CREATION) THEN
            cg$rec.DATE_CREATION := cg$upd_rec.DATE_CREATION;
        END IF;
        IF NOT (cg$ind.DESCRIPTION) THEN
            cg$rec.DESCRIPTION := cg$upd_rec.DESCRIPTION;
        END IF;
        IF NOT (cg$ind.DUREE) THEN
            cg$rec.DUREE := cg$upd_rec.DUREE;
        END IF;
        IF NOT (cg$ind.ETAT_OFFRE) THEN
            cg$rec.ETAT_OFFRE := cg$upd_rec.ETAT_OFFRE;
        END IF;
        IF NOT (cg$ind.LIEU) THEN
            cg$rec.LIEU := cg$upd_rec.LIEU;
        END IF;
        IF NOT (cg$ind.NIVEAU_REQUIS) THEN
            cg$rec.NIVEAU_REQUIS := cg$upd_rec.NIVEAU_REQUIS;
        END IF;
        IF NOT (cg$ind.PERIODE) THEN
            cg$rec.PERIODE := cg$upd_rec.PERIODE;
        END IF;
        IF NOT (cg$ind.NOM_RESPONSABLE) THEN
            cg$rec.NOM_RESPONSABLE := cg$upd_rec.NOM_RESPONSABLE;
        END IF;
        IF NOT (cg$ind.PRENOM_RESPONSABLE) THEN
            cg$rec.PRENOM_RESPONSABLE := cg$upd_rec.PRENOM_RESPONSABLE;
        END IF;
        IF NOT (cg$ind.TEL_RESPONSABLE) THEN
            cg$rec.TEL_RESPONSABLE := cg$upd_rec.TEL_RESPONSABLE;
        END IF;
        IF NOT (cg$ind.MAIL_RESPONSABLE) THEN
            cg$rec.MAIL_RESPONSABLE := cg$upd_rec.MAIL_RESPONSABLE;
        END IF;
        IF NOT (cg$ind.REMUNERATION) THEN
            cg$rec.REMUNERATION := cg$upd_rec.REMUNERATION;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
           --  Report error if attempt to update non transferable Foreign Key OFF_ENT_FK
        IF ( cg$ind.NO_ENTREPRISE ) THEN
          raise_fk_not_transferable('OFF_ENT_FK');
        END IF;
        --  Report error if attempt to update non updateable Primary Key OFF_PK
        IF ( cg$ind.NO_OFFRE ) THEN
          raise_uk_not_updateable('OFF_PK');
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
            UPDATE OFFRE_STAGE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_OFFRE_ENTREPRISE = cg$rec.NO_OFFRE_ENTREPRISE
              ,ANNEE_PRO = cg$rec.ANNEE_PRO
              ,INTITULE = cg$rec.INTITULE
              ,SUJET = cg$rec.SUJET
              ,DATE_CREATION = cg$rec.DATE_CREATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,DUREE = cg$rec.DUREE
              ,ETAT_OFFRE = cg$rec.ETAT_OFFRE
              ,LIEU = cg$rec.LIEU
              ,NIVEAU_REQUIS = cg$rec.NIVEAU_REQUIS
              ,PERIODE = cg$rec.PERIODE
              ,NOM_RESPONSABLE = cg$rec.NOM_RESPONSABLE
              ,PRENOM_RESPONSABLE = cg$rec.PRENOM_RESPONSABLE
              ,TEL_RESPONSABLE = cg$rec.TEL_RESPONSABLE
              ,MAIL_RESPONSABLE = cg$rec.MAIL_RESPONSABLE
              ,REMUNERATION = cg$rec.REMUNERATION
            WHERE  NO_OFFRE = cg$rec.NO_OFFRE;
            null;
          ELSE
            UPDATE OFFRE_STAGE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_OFFRE_ENTREPRISE = cg$rec.NO_OFFRE_ENTREPRISE
              ,ANNEE_PRO = cg$rec.ANNEE_PRO
              ,INTITULE = cg$rec.INTITULE
              ,SUJET = cg$rec.SUJET
              ,DATE_CREATION = cg$rec.DATE_CREATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,DUREE = cg$rec.DUREE
              ,ETAT_OFFRE = cg$rec.ETAT_OFFRE
              ,LIEU = cg$rec.LIEU
              ,NIVEAU_REQUIS = cg$rec.NIVEAU_REQUIS
              ,PERIODE = cg$rec.PERIODE
              ,NOM_RESPONSABLE = cg$rec.NOM_RESPONSABLE
              ,PRENOM_RESPONSABLE = cg$rec.PRENOM_RESPONSABLE
              ,TEL_RESPONSABLE = cg$rec.TEL_RESPONSABLE
              ,MAIL_RESPONSABLE = cg$rec.MAIL_RESPONSABLE
              ,REMUNERATION = cg$rec.REMUNERATION
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
        cg$table(idx).NO_OFFRE := cg$rec.NO_OFFRE;
        cg$tableind(idx).NO_OFFRE := cg$ind.NO_OFFRE;
        cg$table(idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
        cg$tableind(idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
        cg$table(idx).NO_OFFRE_ENTREPRISE := cg$rec.NO_OFFRE_ENTREPRISE;
        cg$tableind(idx).NO_OFFRE_ENTREPRISE := cg$ind.NO_OFFRE_ENTREPRISE;
        cg$table(idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
        cg$tableind(idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
        cg$table(idx).INTITULE := cg$rec.INTITULE;
        cg$tableind(idx).INTITULE := cg$ind.INTITULE;
        cg$table(idx).SUJET := cg$rec.SUJET;
        cg$tableind(idx).SUJET := cg$ind.SUJET;
        cg$table(idx).DATE_CREATION := cg$rec.DATE_CREATION;
        cg$tableind(idx).DATE_CREATION := cg$ind.DATE_CREATION;
        cg$table(idx).DESCRIPTION := cg$rec.DESCRIPTION;
        cg$tableind(idx).DESCRIPTION := cg$ind.DESCRIPTION;
        cg$table(idx).DUREE := cg$rec.DUREE;
        cg$tableind(idx).DUREE := cg$ind.DUREE;
        cg$table(idx).ETAT_OFFRE := cg$rec.ETAT_OFFRE;
        cg$tableind(idx).ETAT_OFFRE := cg$ind.ETAT_OFFRE;
        cg$table(idx).LIEU := cg$rec.LIEU;
        cg$tableind(idx).LIEU := cg$ind.LIEU;
        cg$table(idx).NIVEAU_REQUIS := cg$rec.NIVEAU_REQUIS;
        cg$tableind(idx).NIVEAU_REQUIS := cg$ind.NIVEAU_REQUIS;
        cg$table(idx).PERIODE := cg$rec.PERIODE;
        cg$tableind(idx).PERIODE := cg$ind.PERIODE;
        cg$table(idx).NOM_RESPONSABLE := cg$rec.NOM_RESPONSABLE;
        cg$tableind(idx).NOM_RESPONSABLE := cg$ind.NOM_RESPONSABLE;
        cg$table(idx).PRENOM_RESPONSABLE := cg$rec.PRENOM_RESPONSABLE;
        cg$tableind(idx).PRENOM_RESPONSABLE := cg$ind.PRENOM_RESPONSABLE;
        cg$table(idx).TEL_RESPONSABLE := cg$rec.TEL_RESPONSABLE;
        cg$tableind(idx).TEL_RESPONSABLE := cg$ind.TEL_RESPONSABLE;
        cg$table(idx).MAIL_RESPONSABLE := cg$rec.MAIL_RESPONSABLE;
        cg$tableind(idx).MAIL_RESPONSABLE := cg$ind.MAIL_RESPONSABLE;
        cg$table(idx).REMUNERATION := cg$rec.REMUNERATION;
        cg$tableind(idx).REMUNERATION := cg$ind.REMUNERATION;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$OFFRE_STAGE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$OFFRE_STAGE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$OFFRE_STAGE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$OFFRE_STAGE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$OFFRE_STAGE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of OFFRE_STAGE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for OFFRE_STAGE's domain key constraint columns 
--              cg$ind      Indicates changed OFFRE_STAGE's domain key constraint columns
--              cg$old_rec  Current values for OFFRE_STAGE's domain key constraint columns
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
           cg$rec.NO_OFFRE := cg$pk.NO_OFFRE;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE OFFRE_STAGE
              WHERE                    NO_OFFRE = cg$pk.NO_OFFRE;
           ELSE
              DELETE OFFRE_STAGE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$OFFRE_STAGE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$OFFRE_STAGE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$OFFRE_STAGE.del.others');
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
               SELECT       NO_OFFRE
               ,            NO_ENTREPRISE
               ,            NO_OFFRE_ENTREPRISE
               ,            ANNEE_PRO
               ,            INTITULE
               ,            SUJET
               ,            DATE_CREATION
               ,            DESCRIPTION
               ,            DUREE
               ,            ETAT_OFFRE
               ,            LIEU
               ,            NIVEAU_REQUIS
               ,            PERIODE
               ,            NOM_RESPONSABLE
               ,            PRENOM_RESPONSABLE
               ,            TEL_RESPONSABLE
               ,            MAIL_RESPONSABLE
               ,            REMUNERATION
               INTO         cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE_ENTREPRISE
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.ETAT_OFFRE
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.NIVEAU_REQUIS
               ,            cg$tmp_rec.PERIODE
               ,            cg$tmp_rec.NOM_RESPONSABLE
               ,            cg$tmp_rec.PRENOM_RESPONSABLE
               ,            cg$tmp_rec.TEL_RESPONSABLE
               ,            cg$tmp_rec.MAIL_RESPONSABLE
               ,            cg$tmp_rec.REMUNERATION
               FROM      OFFRE_STAGE
               WHERE              NO_OFFRE = cg$old_rec.NO_OFFRE
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_OFFRE
               ,            NO_ENTREPRISE
               ,            NO_OFFRE_ENTREPRISE
               ,            ANNEE_PRO
               ,            INTITULE
               ,            SUJET
               ,            DATE_CREATION
               ,            DESCRIPTION
               ,            DUREE
               ,            ETAT_OFFRE
               ,            LIEU
               ,            NIVEAU_REQUIS
               ,            PERIODE
               ,            NOM_RESPONSABLE
               ,            PRENOM_RESPONSABLE
               ,            TEL_RESPONSABLE
               ,            MAIL_RESPONSABLE
               ,            REMUNERATION
               INTO         cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE_ENTREPRISE
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.ETAT_OFFRE
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.NIVEAU_REQUIS
               ,            cg$tmp_rec.PERIODE
               ,            cg$tmp_rec.NOM_RESPONSABLE
               ,            cg$tmp_rec.PRENOM_RESPONSABLE
               ,            cg$tmp_rec.TEL_RESPONSABLE
               ,            cg$tmp_rec.MAIL_RESPONSABLE
               ,            cg$tmp_rec.REMUNERATION
               FROM      OFFRE_STAGE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_OFFRE
               ,            NO_ENTREPRISE
               ,            NO_OFFRE_ENTREPRISE
               ,            ANNEE_PRO
               ,            INTITULE
               ,            SUJET
               ,            DATE_CREATION
               ,            DESCRIPTION
               ,            DUREE
               ,            ETAT_OFFRE
               ,            LIEU
               ,            NIVEAU_REQUIS
               ,            PERIODE
               ,            NOM_RESPONSABLE
               ,            PRENOM_RESPONSABLE
               ,            TEL_RESPONSABLE
               ,            MAIL_RESPONSABLE
               ,            REMUNERATION
               INTO         cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE_ENTREPRISE
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.ETAT_OFFRE
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.NIVEAU_REQUIS
               ,            cg$tmp_rec.PERIODE
               ,            cg$tmp_rec.NOM_RESPONSABLE
               ,            cg$tmp_rec.PRENOM_RESPONSABLE
               ,            cg$tmp_rec.TEL_RESPONSABLE
               ,            cg$tmp_rec.MAIL_RESPONSABLE
               ,            cg$tmp_rec.REMUNERATION
               FROM      OFFRE_STAGE
               WHERE              NO_OFFRE = cg$old_rec.NO_OFFRE
               FOR UPDATE;
            ELSE
               SELECT       NO_OFFRE
               ,            NO_ENTREPRISE
               ,            NO_OFFRE_ENTREPRISE
               ,            ANNEE_PRO
               ,            INTITULE
               ,            SUJET
               ,            DATE_CREATION
               ,            DESCRIPTION
               ,            DUREE
               ,            ETAT_OFFRE
               ,            LIEU
               ,            NIVEAU_REQUIS
               ,            PERIODE
               ,            NOM_RESPONSABLE
               ,            PRENOM_RESPONSABLE
               ,            TEL_RESPONSABLE
               ,            MAIL_RESPONSABLE
               ,            REMUNERATION
               INTO         cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE_ENTREPRISE
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.ETAT_OFFRE
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.NIVEAU_REQUIS
               ,            cg$tmp_rec.PERIODE
               ,            cg$tmp_rec.NOM_RESPONSABLE
               ,            cg$tmp_rec.PRENOM_RESPONSABLE
               ,            cg$tmp_rec.TEL_RESPONSABLE
               ,            cg$tmp_rec.MAIL_RESPONSABLE
               ,            cg$tmp_rec.REMUNERATION
               FROM      OFFRE_STAGE
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
                           'cg$OFFRE_STAGE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$OFFRE_STAGE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$OFFRE_STAGE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.NO_OFFRE_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_OFFRE_ENTREPRISE IS NOT NULL
        AND cg$old_rec.NO_OFFRE_ENTREPRISE IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_OFFRE_ENTREPRISE != cg$old_rec.NO_OFFRE_ENTREPRISE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_OFFRE_ENTREPRISE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_OFFRE_ENTREPRISE IS NOT NULL
        OR cg$old_rec.NO_OFFRE_ENTREPRISE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_OFFRE_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESCRIPTION) THEN
        IF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        AND cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            IF (cg$tmp_rec.DESCRIPTION != cg$old_rec.DESCRIPTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DESCRIPTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        OR cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DESCRIPTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_RESPONSABLE) THEN
        IF (cg$tmp_rec.TEL_RESPONSABLE IS NOT NULL
        AND cg$old_rec.TEL_RESPONSABLE IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_RESPONSABLE != cg$old_rec.TEL_RESPONSABLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160TEL_RESPONSABLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_RESPONSABLE IS NOT NULL
        OR cg$old_rec.TEL_RESPONSABLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160TEL_RESPONSABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MAIL_RESPONSABLE) THEN
        IF (cg$tmp_rec.MAIL_RESPONSABLE IS NOT NULL
        AND cg$old_rec.MAIL_RESPONSABLE IS NOT NULL) THEN
            IF (cg$tmp_rec.MAIL_RESPONSABLE != cg$old_rec.MAIL_RESPONSABLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170MAIL_RESPONSABLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.MAIL_RESPONSABLE IS NOT NULL
        OR cg$old_rec.MAIL_RESPONSABLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170MAIL_RESPONSABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.REMUNERATION) THEN
        IF (cg$tmp_rec.REMUNERATION IS NOT NULL
        AND cg$old_rec.REMUNERATION IS NOT NULL) THEN
            IF (cg$tmp_rec.REMUNERATION != cg$old_rec.REMUNERATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180REMUNERATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.REMUNERATION IS NOT NULL
        OR cg$old_rec.REMUNERATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180REMUNERATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_OFFRE) THEN
        IF (cg$tmp_rec.NO_OFFRE != cg$old_rec.NO_OFFRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_OFFRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_ENTREPRISE != cg$old_rec.NO_ENTREPRISE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P27ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INTITULE) THEN
        IF (cg$tmp_rec.INTITULE != cg$old_rec.INTITULE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30INTITULE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SUJET) THEN
        IF (cg$tmp_rec.SUJET != cg$old_rec.SUJET) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40SUJET
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_CREATION) THEN
        IF (cg$tmp_rec.DATE_CREATION != cg$old_rec.DATE_CREATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_CREATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DUREE) THEN
        IF (cg$tmp_rec.DUREE != cg$old_rec.DUREE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DUREE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_OFFRE) THEN
        IF (cg$tmp_rec.ETAT_OFFRE != cg$old_rec.ETAT_OFFRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80ETAT_OFFRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU) THEN
        IF (cg$tmp_rec.LIEU != cg$old_rec.LIEU) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90LIEU
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NIVEAU_REQUIS) THEN
        IF (cg$tmp_rec.NIVEAU_REQUIS != cg$old_rec.NIVEAU_REQUIS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100NIVEAU_REQUIS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERIODE) THEN
        IF (cg$tmp_rec.PERIODE != cg$old_rec.PERIODE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110PERIODE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM_RESPONSABLE) THEN
        IF (cg$tmp_rec.NOM_RESPONSABLE != cg$old_rec.NOM_RESPONSABLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120NOM_RESPONSABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM_RESPONSABLE) THEN
        IF (cg$tmp_rec.PRENOM_RESPONSABLE != cg$old_rec.PRENOM_RESPONSABLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130PRENOM_RESPONSABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$OFFRE_STAGE.lck');
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
      cg$ind_true.NO_OFFRE := TRUE;
      cg$ind_true.NO_ENTREPRISE := TRUE;
      cg$ind_true.NO_OFFRE_ENTREPRISE := TRUE;
      cg$ind_true.ANNEE_PRO := TRUE;
      cg$ind_true.INTITULE := TRUE;
      cg$ind_true.SUJET := TRUE;
      cg$ind_true.DATE_CREATION := TRUE;
      cg$ind_true.DESCRIPTION := TRUE;
      cg$ind_true.DUREE := TRUE;
      cg$ind_true.ETAT_OFFRE := TRUE;
      cg$ind_true.LIEU := TRUE;
      cg$ind_true.NIVEAU_REQUIS := TRUE;
      cg$ind_true.PERIODE := TRUE;
      cg$ind_true.NOM_RESPONSABLE := TRUE;
      cg$ind_true.PRENOM_RESPONSABLE := TRUE;
      cg$ind_true.TEL_RESPONSABLE := TRUE;
      cg$ind_true.MAIL_RESPONSABLE := TRUE;
      cg$ind_true.REMUNERATION := TRUE;
   

END cg$OFFRE_STAGE;
/

