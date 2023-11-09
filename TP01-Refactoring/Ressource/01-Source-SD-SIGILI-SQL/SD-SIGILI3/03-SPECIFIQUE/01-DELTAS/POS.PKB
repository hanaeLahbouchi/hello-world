
PROMPT Creating API Package Body for Table 'POSITIONNEMENT'
--------------------------------------------------------------------------------
-- Name:        cg$POSITIONNEMENT
-- Description: POSITIONNEMENT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$POSITIONNEMENT IS

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
                   'cg$POSITIONNEMENT.raise_uk_not_updateable');
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
                   'cg$POSITIONNEMENT.raise_fk_not_transferable');
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
			IF (cg$ind.ID_POS = FALSE
      OR  cg$rec.ID_POS is NULL) THEN 
				SELECT SEQ_POS.nextval
				INTO   cg$rec.ID_POS
				FROM   DUAL;
				cg$ind.ID_POS := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$POSITIONNEMENT.up_autogen.ID_POS.OTHERS');
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
                    'cg$POSITIONNEMENT.up_autogen_columns');
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
    IF (cg$val_rec.ID_POS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P1ID_POS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ID_SPC IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P2ID_SPC),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE_POSITIONNEMENT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P7TYPE_POSITIONNEMENT),
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
       SELECT    ID_POS
       ,         ID_SPC
       ,         ID_CAP
       ,         ID_FC
       ,         ID_CPT
       ,         ID_FC_CAP
       ,         ID_CPTT
       ,         TYPE_POSITIONNEMENT
       ,         NIVEAU_COMPETENCE
       ,         NIVEAU_MATURITE
       , rowid
       INTO      cg$sel_rec.ID_POS
       ,         cg$sel_rec.ID_SPC
       ,         cg$sel_rec.ID_CAP
       ,         cg$sel_rec.ID_FC
       ,         cg$sel_rec.ID_CPT
       ,         cg$sel_rec.ID_FC_CAP
       ,         cg$sel_rec.ID_CPTT
       ,         cg$sel_rec.TYPE_POSITIONNEMENT
       ,         cg$sel_rec.NIVEAU_COMPETENCE
       ,         cg$sel_rec.NIVEAU_MATURITE
       ,cg$sel_rec.the_rowid
       FROM   POSITIONNEMENT
       WHERE        ID_POS = cg$sel_rec.ID_POS;
    ELSE
       SELECT    ID_POS
       ,         ID_SPC
       ,         ID_CAP
       ,         ID_FC
       ,         ID_CPT
       ,         ID_FC_CAP
       ,         ID_CPTT
       ,         TYPE_POSITIONNEMENT
       ,         NIVEAU_COMPETENCE
       ,         NIVEAU_MATURITE
       , rowid
       INTO      cg$sel_rec.ID_POS
       ,         cg$sel_rec.ID_SPC
       ,         cg$sel_rec.ID_CAP
       ,         cg$sel_rec.ID_FC
       ,         cg$sel_rec.ID_CPT
       ,         cg$sel_rec.ID_FC_CAP
       ,         cg$sel_rec.ID_CPTT
       ,         cg$sel_rec.TYPE_POSITIONNEMENT
       ,         cg$sel_rec.NIVEAU_COMPETENCE
       ,         cg$sel_rec.NIVEAU_MATURITE
       ,cg$sel_rec.the_rowid
       FROM   POSITIONNEMENT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$POSITIONNEMENT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to POSITIONNEMENT 
--
-- Parameters:  cg$rec     Record of POSITIONNEMENT current values
--              cg$old_rec Record of POSITIONNEMENT previous values
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
--              of each child table that references this tablePOSITIONNEMENT 
--
-- Parameters:  cg$old_rec     Record of POSITIONNEMENT current values
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
--              child table that references this table POSITIONNEMENT 
--
-- Parameters:  cg$new_rec  New values for POSITIONNEMENT's domain key constraint columns 
--              cg$new_ind  Indicates changed POSITIONNEMENT's domain key constraint columns
--              cg$old_rec  Current values for POSITIONNEMENT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to POSITIONNEMENT 
--
-- Parameters:  cg$rec     Record of POSITIONNEMENT current values
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
--              child table that references this tablePOSITIONNEMENT 
--
-- Parameters:  cg$old_rec     Record of POSITIONNEMENT current values
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
--              of each child table that references this tablePOSITIONNEMENT 
--
-- Parameters:  cg$old_rec     Record of POSITIONNEMENT current values
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
-- Parameters:  cg$rec     Record of POSITIONNEMENT current values
--------------------------------------------------------------------------------
PROCEDURE validate_arc(cg$rec IN OUT cg$row_type) IS
i NUMBER;
BEGIN
    i := 0;
    IF (cg$rec.ID_CPT IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF (cg$rec.ID_CPTT IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF ((i = 0) AND (cg$rec.ID_CAP IS NULL) AND (cg$rec.ID_FC IS NULL)) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_ARC_EMPTY, cg$errors.APIMSG_ARC_MAND_VIOLAT,'1','POSITIONNEMENT'),
                           'E',
                           'API',
                           cg$errors.API_MAND_ARC_EMPTY,
                          'cg$POSITIONNEMENT.validate_arc');
        cg$errors.raise_failure;
    END IF;
    IF ((i > 1) AND (cg$rec.ID_CAP IS NULL) AND (cg$rec.ID_FC IS NULL))  THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ARC_TOO_MANY_VAL, cg$errors.APIMSG_ARC_VIOLAT,'1','POSITIONNEMENT'),
                           'E',
                           'API',
                           cg$errors.API_ARC_TOO_MANY_VAL,
                          'cg$POSITIONNEMENT.validate_arc');
        cg$errors.raise_failure;
    END IF;
    i := 0;
    IF (cg$rec.ID_FC IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF (cg$rec.ID_CAP IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF ((i = 0) AND (cg$rec.ID_CPT IS NULL) AND (cg$rec.ID_CPTT IS NULL))  THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_ARC_EMPTY, cg$errors.APIMSG_ARC_MAND_VIOLAT,'2','POSITIONNEMENT'),
                           'E',
                           'API',
                           cg$errors.API_MAND_ARC_EMPTY,
                          'cg$POSITIONNEMENT.validate_arc');
        cg$errors.raise_failure;
    END IF;
    IF ((i > 1) AND (cg$rec.ID_CPT IS NULL) AND (cg$rec.ID_CPTT IS NULL)) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ARC_TOO_MANY_VAL, cg$errors.APIMSG_ARC_VIOLAT,'2','POSITIONNEMENT'),
                           'E',
                           'API',
                           cg$errors.API_ARC_TOO_MANY_VAL,
                          'cg$POSITIONNEMENT.validate_arc');
        cg$errors.raise_failure;
    END IF;
    NULL;
END validate_arc;


--------------------------------------------------------------------------------
-- Name:        validate_domain
--
-- Description: Checks against reference table for values lying in a domain 
--
-- Parameters:  cg$rec     Record of POSITIONNEMENT current values
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
    IF (cg$ind.NIVEAU_COMPETENCE AND cg$rec.NIVEAU_COMPETENCE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'NIVEAU_COMPETENCE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.NIVEAU_COMPETENCE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.NIVEAU_COMPETENCE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.NIVEAU_COMPETENCE,'POSITIONNEMENT','NIVEAU_COMPETENCE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$POSITIONNEMENT.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;

    found := false;
    IF (cg$ind.NIVEAU_MATURITE AND cg$rec.NIVEAU_MATURITE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'NIVEAU_MATURITE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.NIVEAU_MATURITE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.NIVEAU_MATURITE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.NIVEAU_MATURITE,'POSITIONNEMENT','NIVEAU_MATURITE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$POSITIONNEMENT.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','POSITIONNEMENT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$POSITIONNEMENT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$POSITIONNEMENT.v_domain.others');
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
    IF (con_name = 'POS_PK') THEN
        cg$errors.push(nvl(POS_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'POS_PK' 
                                     ,'POSITIONNEMENT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'POS_CPT_FK') THEN
        cg$errors.push(nvl(POS_CPT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'POS_CPT_FK' 
                                     ,'POSITIONNEMENT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'POS_FC_FK') THEN
        cg$errors.push(nvl(POS_FC_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'POS_FC_FK' 
                                     ,'POSITIONNEMENT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'POS_CPTT_FK') THEN
        cg$errors.push(nvl(POS_CPTT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'POS_CPTT_FK' 
                                     ,'POSITIONNEMENT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'POS_CAP_FK') THEN
        cg$errors.push(nvl(POS_CAP_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'POS_CAP_FK' 
                                     ,'POSITIONNEMENT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'POS_SPC_FK') THEN
        cg$errors.push(nvl(POS_SPC_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'POS_SPC_FK' 
                                     ,'POSITIONNEMENT')),
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

        INSERT INTO POSITIONNEMENT
            (ID_POS
            ,ID_SPC
            ,ID_CAP
            ,ID_FC
            ,ID_CPT
            ,ID_FC_CAP
            ,ID_CPTT
            ,TYPE_POSITIONNEMENT
            ,NIVEAU_COMPETENCE
            ,NIVEAU_MATURITE)
        VALUES
            (cg$rec.ID_POS
            ,cg$rec.ID_SPC
            ,cg$rec.ID_CAP
            ,cg$rec.ID_FC
            ,cg$rec.ID_CPT
            ,cg$rec.ID_FC_CAP
            ,cg$rec.ID_CPTT
            ,cg$rec.TYPE_POSITIONNEMENT
            ,cg$rec.NIVEAU_COMPETENCE
            ,cg$rec.NIVEAU_MATURITE
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
        validate_mandatory(cg$rec, 'cg$POSITIONNEMENT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$POSITIONNEMENT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$POSITIONNEMENT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$POSITIONNEMENT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$POSITIONNEMENT.ins.others');
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

 
    IF ( cg$pk.ID_POS IS NULL ) THEN          
      cg$upd_rec.ID_POS := cg$rec.ID_POS;
    ELSE
      cg$upd_rec.ID_POS := cg$pk.ID_POS;
    END IF;
    cg$old_rec.ID_POS := cg$upd_rec.ID_POS;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key POS_PK
        IF (cg$ind.ID_POS AND cg$rec.ID_POS != cg$upd_rec.ID_POS) THEN
            raise_uk_not_updateable('POS_PK');
        END IF;
        IF NOT (cg$ind.ID_POS) THEN
            cg$rec.ID_POS := cg$upd_rec.ID_POS;
        END IF;
        IF NOT (cg$ind.ID_SPC) THEN
            cg$rec.ID_SPC := cg$upd_rec.ID_SPC;
        END IF;
        IF NOT (cg$ind.ID_CAP) THEN
            cg$rec.ID_CAP := cg$upd_rec.ID_CAP;
        END IF;
        IF NOT (cg$ind.ID_FC) THEN
            cg$rec.ID_FC := cg$upd_rec.ID_FC;
        END IF;
        IF NOT (cg$ind.ID_CPT) THEN
            cg$rec.ID_CPT := cg$upd_rec.ID_CPT;
        END IF;
        IF NOT (cg$ind.ID_FC_CAP) THEN
            cg$rec.ID_FC_CAP := cg$upd_rec.ID_FC_CAP;
        END IF;
        IF NOT (cg$ind.ID_CPTT) THEN
            cg$rec.ID_CPTT := cg$upd_rec.ID_CPTT;
        END IF;
        IF NOT (cg$ind.TYPE_POSITIONNEMENT) THEN
            cg$rec.TYPE_POSITIONNEMENT := cg$upd_rec.TYPE_POSITIONNEMENT;
        END IF;
        IF NOT (cg$ind.NIVEAU_COMPETENCE) THEN
            cg$rec.NIVEAU_COMPETENCE := cg$upd_rec.NIVEAU_COMPETENCE;
        END IF;
        IF NOT (cg$ind.NIVEAU_MATURITE) THEN
            cg$rec.NIVEAU_MATURITE := cg$upd_rec.NIVEAU_MATURITE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key POS_PK
        IF ( cg$ind.ID_POS ) THEN
          raise_uk_not_updateable('POS_PK');
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
            UPDATE POSITIONNEMENT
            SET
              ID_SPC = cg$rec.ID_SPC
              ,ID_CAP = cg$rec.ID_CAP
              ,ID_FC = cg$rec.ID_FC
              ,ID_CPT = cg$rec.ID_CPT
              ,ID_FC_CAP = cg$rec.ID_FC_CAP
              ,ID_CPTT = cg$rec.ID_CPTT
              ,TYPE_POSITIONNEMENT = cg$rec.TYPE_POSITIONNEMENT
              ,NIVEAU_COMPETENCE = cg$rec.NIVEAU_COMPETENCE
              ,NIVEAU_MATURITE = cg$rec.NIVEAU_MATURITE
            WHERE  ID_POS = cg$rec.ID_POS;
            null;
          ELSE
            UPDATE POSITIONNEMENT
            SET
              ID_SPC = cg$rec.ID_SPC
              ,ID_CAP = cg$rec.ID_CAP
              ,ID_FC = cg$rec.ID_FC
              ,ID_CPT = cg$rec.ID_CPT
              ,ID_FC_CAP = cg$rec.ID_FC_CAP
              ,ID_CPTT = cg$rec.ID_CPTT
              ,TYPE_POSITIONNEMENT = cg$rec.TYPE_POSITIONNEMENT
              ,NIVEAU_COMPETENCE = cg$rec.NIVEAU_COMPETENCE
              ,NIVEAU_MATURITE = cg$rec.NIVEAU_MATURITE
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
        cg$table(idx).ID_POS := cg$rec.ID_POS;
        cg$tableind(idx).ID_POS := cg$ind.ID_POS;
        cg$table(idx).ID_SPC := cg$rec.ID_SPC;
        cg$tableind(idx).ID_SPC := cg$ind.ID_SPC;
        cg$table(idx).ID_CAP := cg$rec.ID_CAP;
        cg$tableind(idx).ID_CAP := cg$ind.ID_CAP;
        cg$table(idx).ID_FC := cg$rec.ID_FC;
        cg$tableind(idx).ID_FC := cg$ind.ID_FC;
        cg$table(idx).ID_CPT := cg$rec.ID_CPT;
        cg$tableind(idx).ID_CPT := cg$ind.ID_CPT;
        cg$table(idx).ID_FC_CAP := cg$rec.ID_FC_CAP;
        cg$tableind(idx).ID_FC_CAP := cg$ind.ID_FC_CAP;
        cg$table(idx).ID_CPTT := cg$rec.ID_CPTT;
        cg$tableind(idx).ID_CPTT := cg$ind.ID_CPTT;
        cg$table(idx).TYPE_POSITIONNEMENT := cg$rec.TYPE_POSITIONNEMENT;
        cg$tableind(idx).TYPE_POSITIONNEMENT := cg$ind.TYPE_POSITIONNEMENT;
        cg$table(idx).NIVEAU_COMPETENCE := cg$rec.NIVEAU_COMPETENCE;
        cg$tableind(idx).NIVEAU_COMPETENCE := cg$ind.NIVEAU_COMPETENCE;
        cg$table(idx).NIVEAU_MATURITE := cg$rec.NIVEAU_MATURITE;
        cg$tableind(idx).NIVEAU_MATURITE := cg$ind.NIVEAU_MATURITE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$POSITIONNEMENT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$POSITIONNEMENT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$POSITIONNEMENT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$POSITIONNEMENT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$POSITIONNEMENT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of POSITIONNEMENT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for POSITIONNEMENT's domain key constraint columns 
--              cg$ind      Indicates changed POSITIONNEMENT's domain key constraint columns
--              cg$old_rec  Current values for POSITIONNEMENT's domain key constraint columns
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
           cg$rec.ID_POS := cg$pk.ID_POS;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE POSITIONNEMENT
              WHERE                    ID_POS = cg$pk.ID_POS;
           ELSE
              DELETE POSITIONNEMENT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$POSITIONNEMENT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$POSITIONNEMENT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$POSITIONNEMENT.del.others');
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
               SELECT       ID_POS
               ,            ID_SPC
               ,            ID_CAP
               ,            ID_FC
               ,            ID_CPT
               ,            ID_FC_CAP
               ,            ID_CPTT
               ,            TYPE_POSITIONNEMENT
               ,            NIVEAU_COMPETENCE
               ,            NIVEAU_MATURITE
               INTO         cg$tmp_rec.ID_POS
               ,            cg$tmp_rec.ID_SPC
               ,            cg$tmp_rec.ID_CAP
               ,            cg$tmp_rec.ID_FC
               ,            cg$tmp_rec.ID_CPT
               ,            cg$tmp_rec.ID_FC_CAP
               ,            cg$tmp_rec.ID_CPTT
               ,            cg$tmp_rec.TYPE_POSITIONNEMENT
               ,            cg$tmp_rec.NIVEAU_COMPETENCE
               ,            cg$tmp_rec.NIVEAU_MATURITE
               FROM      POSITIONNEMENT
               WHERE              ID_POS = cg$old_rec.ID_POS
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ID_POS
               ,            ID_SPC
               ,            ID_CAP
               ,            ID_FC
               ,            ID_CPT
               ,            ID_FC_CAP
               ,            ID_CPTT
               ,            TYPE_POSITIONNEMENT
               ,            NIVEAU_COMPETENCE
               ,            NIVEAU_MATURITE
               INTO         cg$tmp_rec.ID_POS
               ,            cg$tmp_rec.ID_SPC
               ,            cg$tmp_rec.ID_CAP
               ,            cg$tmp_rec.ID_FC
               ,            cg$tmp_rec.ID_CPT
               ,            cg$tmp_rec.ID_FC_CAP
               ,            cg$tmp_rec.ID_CPTT
               ,            cg$tmp_rec.TYPE_POSITIONNEMENT
               ,            cg$tmp_rec.NIVEAU_COMPETENCE
               ,            cg$tmp_rec.NIVEAU_MATURITE
               FROM      POSITIONNEMENT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ID_POS
               ,            ID_SPC
               ,            ID_CAP
               ,            ID_FC
               ,            ID_CPT
               ,            ID_FC_CAP
               ,            ID_CPTT
               ,            TYPE_POSITIONNEMENT
               ,            NIVEAU_COMPETENCE
               ,            NIVEAU_MATURITE
               INTO         cg$tmp_rec.ID_POS
               ,            cg$tmp_rec.ID_SPC
               ,            cg$tmp_rec.ID_CAP
               ,            cg$tmp_rec.ID_FC
               ,            cg$tmp_rec.ID_CPT
               ,            cg$tmp_rec.ID_FC_CAP
               ,            cg$tmp_rec.ID_CPTT
               ,            cg$tmp_rec.TYPE_POSITIONNEMENT
               ,            cg$tmp_rec.NIVEAU_COMPETENCE
               ,            cg$tmp_rec.NIVEAU_MATURITE
               FROM      POSITIONNEMENT
               WHERE              ID_POS = cg$old_rec.ID_POS
               FOR UPDATE;
            ELSE
               SELECT       ID_POS
               ,            ID_SPC
               ,            ID_CAP
               ,            ID_FC
               ,            ID_CPT
               ,            ID_FC_CAP
               ,            ID_CPTT
               ,            TYPE_POSITIONNEMENT
               ,            NIVEAU_COMPETENCE
               ,            NIVEAU_MATURITE
               INTO         cg$tmp_rec.ID_POS
               ,            cg$tmp_rec.ID_SPC
               ,            cg$tmp_rec.ID_CAP
               ,            cg$tmp_rec.ID_FC
               ,            cg$tmp_rec.ID_CPT
               ,            cg$tmp_rec.ID_FC_CAP
               ,            cg$tmp_rec.ID_CPTT
               ,            cg$tmp_rec.TYPE_POSITIONNEMENT
               ,            cg$tmp_rec.NIVEAU_COMPETENCE
               ,            cg$tmp_rec.NIVEAU_MATURITE
               FROM      POSITIONNEMENT
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
                           'cg$POSITIONNEMENT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$POSITIONNEMENT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$POSITIONNEMENT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.ID_CAP) THEN
        IF (cg$tmp_rec.ID_CAP IS NOT NULL
        AND cg$old_rec.ID_CAP IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_CAP != cg$old_rec.ID_CAP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P3ID_CAP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_CAP IS NOT NULL
        OR cg$old_rec.ID_CAP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P3ID_CAP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_FC) THEN
        IF (cg$tmp_rec.ID_FC IS NOT NULL
        AND cg$old_rec.ID_FC IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_FC != cg$old_rec.ID_FC) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P4ID_FC
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_FC IS NOT NULL
        OR cg$old_rec.ID_FC IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P4ID_FC
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_CPT) THEN
        IF (cg$tmp_rec.ID_CPT IS NOT NULL
        AND cg$old_rec.ID_CPT IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_CPT != cg$old_rec.ID_CPT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5ID_CPT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_CPT IS NOT NULL
        OR cg$old_rec.ID_CPT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5ID_CPT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_FC_CAP) THEN
        IF (cg$tmp_rec.ID_FC_CAP IS NOT NULL
        AND cg$old_rec.ID_FC_CAP IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_FC_CAP != cg$old_rec.ID_FC_CAP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5ID_FC_CAP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_FC_CAP IS NOT NULL
        OR cg$old_rec.ID_FC_CAP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5ID_FC_CAP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_CPTT) THEN
        IF (cg$tmp_rec.ID_CPTT IS NOT NULL
        AND cg$old_rec.ID_CPTT IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_CPTT != cg$old_rec.ID_CPTT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P6ID_CPTT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_CPTT IS NOT NULL
        OR cg$old_rec.ID_CPTT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P6ID_CPTT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NIVEAU_COMPETENCE) THEN
        IF (cg$tmp_rec.NIVEAU_COMPETENCE IS NOT NULL
        AND cg$old_rec.NIVEAU_COMPETENCE IS NOT NULL) THEN
            IF (cg$tmp_rec.NIVEAU_COMPETENCE != cg$old_rec.NIVEAU_COMPETENCE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P8NIVEAU_COMPETENCE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NIVEAU_COMPETENCE IS NOT NULL
        OR cg$old_rec.NIVEAU_COMPETENCE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P8NIVEAU_COMPETENCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NIVEAU_MATURITE) THEN
        IF (cg$tmp_rec.NIVEAU_MATURITE IS NOT NULL
        AND cg$old_rec.NIVEAU_MATURITE IS NOT NULL) THEN
            IF (cg$tmp_rec.NIVEAU_MATURITE != cg$old_rec.NIVEAU_MATURITE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P9NIVEAU_MATURITE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NIVEAU_MATURITE IS NOT NULL
        OR cg$old_rec.NIVEAU_MATURITE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P9NIVEAU_MATURITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ID_POS) THEN
        IF (cg$tmp_rec.ID_POS != cg$old_rec.ID_POS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P1ID_POS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ID_SPC) THEN
        IF (cg$tmp_rec.ID_SPC != cg$old_rec.ID_SPC) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P2ID_SPC
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE_POSITIONNEMENT) THEN
        IF (cg$tmp_rec.TYPE_POSITIONNEMENT != cg$old_rec.TYPE_POSITIONNEMENT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P7TYPE_POSITIONNEMENT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$POSITIONNEMENT.lck');
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
      cg$ind_true.ID_POS := TRUE;
      cg$ind_true.ID_SPC := TRUE;
      cg$ind_true.ID_CAP := TRUE;
      cg$ind_true.ID_FC := TRUE;
      cg$ind_true.ID_CPT := TRUE;
      cg$ind_true.ID_FC_CAP := TRUE;
      cg$ind_true.ID_CPTT := TRUE;
      cg$ind_true.TYPE_POSITIONNEMENT := TRUE;
      cg$ind_true.NIVEAU_COMPETENCE := TRUE;
      cg$ind_true.NIVEAU_MATURITE := TRUE;
   

END cg$POSITIONNEMENT;
/

