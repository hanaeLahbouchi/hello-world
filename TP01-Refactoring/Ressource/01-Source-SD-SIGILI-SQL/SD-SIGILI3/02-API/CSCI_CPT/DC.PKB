
PROMPT Creating API Package Body for Table 'DOMAINE_COMPETENCE'
--------------------------------------------------------------------------------
-- Name:        cg$DOMAINE_COMPETENCE
-- Description: DOMAINE_COMPETENCE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$DOMAINE_COMPETENCE IS

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
                   'cg$DOMAINE_COMPETENCE.raise_uk_not_updateable');
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
                   'cg$DOMAINE_COMPETENCE.raise_fk_not_transferable');
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
			IF (cg$ind.ID_DC = FALSE
      OR  cg$rec.ID_DC is NULL) THEN 
				SELECT SEQ_DC.nextval
				INTO   cg$rec.ID_DC
				FROM   DUAL;
				cg$ind.ID_DC := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$DOMAINE_COMPETENCE.up_autogen.ID_DC.OTHERS');
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
                    'cg$DOMAINE_COMPETENCE.up_autogen_columns');
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
    IF (cg$val_rec.ID_DC IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P1ID_DC),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.CODE_MCP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P2CODE_MCP),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE_COMPETENCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P4TYPE_COMPETENCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DESIGNATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P5DESIGNATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ORDRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P6ORDRE),
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
       SELECT    ID_DC
       ,         CODE_MCP
       ,         ID_UE
       ,         TYPE_COMPETENCE
       ,         DESIGNATION
       ,         ORDRE
       ,         DESCRIPTION
       , rowid
       INTO      cg$sel_rec.ID_DC
       ,         cg$sel_rec.CODE_MCP
       ,         cg$sel_rec.ID_UE
       ,         cg$sel_rec.TYPE_COMPETENCE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.ORDRE
       ,         cg$sel_rec.DESCRIPTION
       ,cg$sel_rec.the_rowid
       FROM   DOMAINE_COMPETENCE
       WHERE        ID_DC = cg$sel_rec.ID_DC;
    ELSE
       SELECT    ID_DC
       ,         CODE_MCP
       ,         ID_UE
       ,         TYPE_COMPETENCE
       ,         DESIGNATION
       ,         ORDRE
       ,         DESCRIPTION
       , rowid
       INTO      cg$sel_rec.ID_DC
       ,         cg$sel_rec.CODE_MCP
       ,         cg$sel_rec.ID_UE
       ,         cg$sel_rec.TYPE_COMPETENCE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.ORDRE
       ,         cg$sel_rec.DESCRIPTION
       ,cg$sel_rec.the_rowid
       FROM   DOMAINE_COMPETENCE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$DOMAINE_COMPETENCE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to DOMAINE_COMPETENCE 
--
-- Parameters:  cg$rec     Record of DOMAINE_COMPETENCE current values
--              cg$old_rec Record of DOMAINE_COMPETENCE previous values
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
--              of each child table that references this tableDOMAINE_COMPETENCE 
--
-- Parameters:  cg$old_rec     Record of DOMAINE_COMPETENCE current values
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
--              child table that references this table DOMAINE_COMPETENCE 
--
-- Parameters:  cg$new_rec  New values for DOMAINE_COMPETENCE's domain key constraint columns 
--              cg$new_ind  Indicates changed DOMAINE_COMPETENCE's domain key constraint columns
--              cg$old_rec  Current values for DOMAINE_COMPETENCE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to DOMAINE_COMPETENCE 
--
-- Parameters:  cg$rec     Record of DOMAINE_COMPETENCE current values
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
--              child table that references this tableDOMAINE_COMPETENCE 
--
-- Parameters:  cg$old_rec     Record of DOMAINE_COMPETENCE current values
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
--              of each child table that references this tableDOMAINE_COMPETENCE 
--
-- Parameters:  cg$old_rec     Record of DOMAINE_COMPETENCE current values
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
-- Parameters:  cg$rec     Record of DOMAINE_COMPETENCE current values
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
-- Parameters:  cg$rec     Record of DOMAINE_COMPETENCE current values
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
    IF (cg$ind.TYPE_COMPETENCE AND cg$rec.TYPE_COMPETENCE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'TYPE_COMPETENCE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.TYPE_COMPETENCE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.TYPE_COMPETENCE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.TYPE_COMPETENCE,'DOMAINE_COMPETENCE','TYPE_COMPETENCE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$DOMAINE_COMPETENCE.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','DOMAINE_COMPETENCE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$DOMAINE_COMPETENCE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DOMAINE_COMPETENCE.v_domain.others');
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
    IF (con_name = 'DC_PK') THEN
        cg$errors.push(nvl(DC_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'DC_PK' 
                                     ,'DOMAINE_COMPETENCE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'FC_DC_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Domaine Competence', 'Famille Competence'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'JSP_DC_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Domaine Competence', 'Jounal Suivi Personnel'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'DC_MC_FK') THEN
        cg$errors.push(nvl(DC_MC_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'DC_MC_FK' 
                                     ,'DOMAINE_COMPETENCE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'DC_UE_FK') THEN
        cg$errors.push(nvl(DC_UE_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'DC_UE_FK' 
                                     ,'DOMAINE_COMPETENCE')),
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
   IF(cg$rec.DESCRIPTION is not null) THEN
      DECLARE
         lobVar CLOB;
         lobSize INTEGER;
      BEGIN
         lobSize := DBMS_LOB.GETLENGTH(cg$rec.DESCRIPTION);
         SELECT DESCRIPTION INTO lobVar
         FROM DOMAINE_COMPETENCE
         WHERE
            ID_DC = cg$rec.ID_DC;
         DBMS_LOB.COPY(lobVar, cg$rec.DESCRIPTION, lobSize);
      END;
   END IF;
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

        INSERT INTO DOMAINE_COMPETENCE
            (ID_DC
            ,CODE_MCP
            ,ID_UE
            ,TYPE_COMPETENCE
            ,DESIGNATION
            ,ORDRE
            ,DESCRIPTION)
        VALUES
            (cg$rec.ID_DC
            ,cg$rec.CODE_MCP
            ,cg$rec.ID_UE
            ,cg$rec.TYPE_COMPETENCE
            ,cg$rec.DESIGNATION
            ,cg$rec.ORDRE
            ,EMPTY_CLOB()
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
        validate_mandatory(cg$rec, 'cg$DOMAINE_COMPETENCE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$DOMAINE_COMPETENCE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$DOMAINE_COMPETENCE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$DOMAINE_COMPETENCE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DOMAINE_COMPETENCE.ins.others');
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

 
    IF ( cg$pk.ID_DC IS NULL ) THEN          
      cg$upd_rec.ID_DC := cg$rec.ID_DC;
    ELSE
      cg$upd_rec.ID_DC := cg$pk.ID_DC;
    END IF;
    cg$old_rec.ID_DC := cg$upd_rec.ID_DC;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key DC_PK
        IF (cg$ind.ID_DC AND cg$rec.ID_DC != cg$upd_rec.ID_DC) THEN
            raise_uk_not_updateable('DC_PK');
        END IF;
        IF NOT (cg$ind.ID_DC) THEN
            cg$rec.ID_DC := cg$upd_rec.ID_DC;
        END IF;
        IF NOT (cg$ind.CODE_MCP) THEN
            cg$rec.CODE_MCP := cg$upd_rec.CODE_MCP;
        END IF;
        IF NOT (cg$ind.ID_UE) THEN
            cg$rec.ID_UE := cg$upd_rec.ID_UE;
        END IF;
        IF NOT (cg$ind.TYPE_COMPETENCE) THEN
            cg$rec.TYPE_COMPETENCE := cg$upd_rec.TYPE_COMPETENCE;
        END IF;
        IF NOT (cg$ind.DESIGNATION) THEN
            cg$rec.DESIGNATION := cg$upd_rec.DESIGNATION;
        END IF;
        IF NOT (cg$ind.ORDRE) THEN
            cg$rec.ORDRE := cg$upd_rec.ORDRE;
        END IF;
        IF NOT (cg$ind.DESCRIPTION) THEN
            cg$rec.DESCRIPTION := cg$upd_rec.DESCRIPTION;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key DC_PK
        IF ( cg$ind.ID_DC ) THEN
          raise_uk_not_updateable('DC_PK');
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
            UPDATE DOMAINE_COMPETENCE
            SET
              CODE_MCP = cg$rec.CODE_MCP
              ,ID_UE = cg$rec.ID_UE
              ,TYPE_COMPETENCE = cg$rec.TYPE_COMPETENCE
              ,DESIGNATION = cg$rec.DESIGNATION
              ,ORDRE = cg$rec.ORDRE
              ,DESCRIPTION = cg$rec.DESCRIPTION
            WHERE  ID_DC = cg$rec.ID_DC;
            null;
          ELSE
            UPDATE DOMAINE_COMPETENCE
            SET
              CODE_MCP = cg$rec.CODE_MCP
              ,ID_UE = cg$rec.ID_UE
              ,TYPE_COMPETENCE = cg$rec.TYPE_COMPETENCE
              ,DESIGNATION = cg$rec.DESIGNATION
              ,ORDRE = cg$rec.ORDRE
              ,DESCRIPTION = cg$rec.DESCRIPTION
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
        cg$table(idx).ID_DC := cg$rec.ID_DC;
        cg$tableind(idx).ID_DC := cg$ind.ID_DC;
        cg$table(idx).CODE_MCP := cg$rec.CODE_MCP;
        cg$tableind(idx).CODE_MCP := cg$ind.CODE_MCP;
        cg$table(idx).ID_UE := cg$rec.ID_UE;
        cg$tableind(idx).ID_UE := cg$ind.ID_UE;
        cg$table(idx).TYPE_COMPETENCE := cg$rec.TYPE_COMPETENCE;
        cg$tableind(idx).TYPE_COMPETENCE := cg$ind.TYPE_COMPETENCE;
        cg$table(idx).DESIGNATION := cg$rec.DESIGNATION;
        cg$tableind(idx).DESIGNATION := cg$ind.DESIGNATION;
        cg$table(idx).ORDRE := cg$rec.ORDRE;
        cg$tableind(idx).ORDRE := cg$ind.ORDRE;
        cg$table(idx).DESCRIPTION := cg$rec.DESCRIPTION;
        cg$tableind(idx).DESCRIPTION := cg$ind.DESCRIPTION;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$DOMAINE_COMPETENCE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$DOMAINE_COMPETENCE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$DOMAINE_COMPETENCE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$DOMAINE_COMPETENCE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DOMAINE_COMPETENCE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of DOMAINE_COMPETENCE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for DOMAINE_COMPETENCE's domain key constraint columns 
--              cg$ind      Indicates changed DOMAINE_COMPETENCE's domain key constraint columns
--              cg$old_rec  Current values for DOMAINE_COMPETENCE's domain key constraint columns
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
           cg$rec.ID_DC := cg$pk.ID_DC;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE DOMAINE_COMPETENCE
              WHERE                    ID_DC = cg$pk.ID_DC;
           ELSE
              DELETE DOMAINE_COMPETENCE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$DOMAINE_COMPETENCE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DOMAINE_COMPETENCE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DOMAINE_COMPETENCE.del.others');
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
               SELECT       ID_DC
               ,            CODE_MCP
               ,            ID_UE
               ,            TYPE_COMPETENCE
               ,            DESIGNATION
               ,            ORDRE
               ,            DESCRIPTION
               INTO         cg$tmp_rec.ID_DC
               ,            cg$tmp_rec.CODE_MCP
               ,            cg$tmp_rec.ID_UE
               ,            cg$tmp_rec.TYPE_COMPETENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ORDRE
               ,            cg$tmp_rec.DESCRIPTION
               FROM      DOMAINE_COMPETENCE
               WHERE              ID_DC = cg$old_rec.ID_DC
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ID_DC
               ,            CODE_MCP
               ,            ID_UE
               ,            TYPE_COMPETENCE
               ,            DESIGNATION
               ,            ORDRE
               ,            DESCRIPTION
               INTO         cg$tmp_rec.ID_DC
               ,            cg$tmp_rec.CODE_MCP
               ,            cg$tmp_rec.ID_UE
               ,            cg$tmp_rec.TYPE_COMPETENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ORDRE
               ,            cg$tmp_rec.DESCRIPTION
               FROM      DOMAINE_COMPETENCE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ID_DC
               ,            CODE_MCP
               ,            ID_UE
               ,            TYPE_COMPETENCE
               ,            DESIGNATION
               ,            ORDRE
               ,            DESCRIPTION
               INTO         cg$tmp_rec.ID_DC
               ,            cg$tmp_rec.CODE_MCP
               ,            cg$tmp_rec.ID_UE
               ,            cg$tmp_rec.TYPE_COMPETENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ORDRE
               ,            cg$tmp_rec.DESCRIPTION
               FROM      DOMAINE_COMPETENCE
               WHERE              ID_DC = cg$old_rec.ID_DC
               FOR UPDATE;
            ELSE
               SELECT       ID_DC
               ,            CODE_MCP
               ,            ID_UE
               ,            TYPE_COMPETENCE
               ,            DESIGNATION
               ,            ORDRE
               ,            DESCRIPTION
               INTO         cg$tmp_rec.ID_DC
               ,            cg$tmp_rec.CODE_MCP
               ,            cg$tmp_rec.ID_UE
               ,            cg$tmp_rec.TYPE_COMPETENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ORDRE
               ,            cg$tmp_rec.DESCRIPTION
               FROM      DOMAINE_COMPETENCE
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
                           'cg$DOMAINE_COMPETENCE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$DOMAINE_COMPETENCE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$DOMAINE_COMPETENCE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.ID_UE) THEN
        IF (cg$tmp_rec.ID_UE IS NOT NULL
        AND cg$old_rec.ID_UE IS NOT NULL) THEN
            IF (cg$tmp_rec.ID_UE != cg$old_rec.ID_UE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P3ID_UE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ID_UE IS NOT NULL
        OR cg$old_rec.ID_UE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P3ID_UE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ID_DC) THEN
        IF (cg$tmp_rec.ID_DC != cg$old_rec.ID_DC) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P1ID_DC
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CODE_MCP) THEN
        IF (cg$tmp_rec.CODE_MCP != cg$old_rec.CODE_MCP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P2CODE_MCP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE_COMPETENCE) THEN
        IF (cg$tmp_rec.TYPE_COMPETENCE != cg$old_rec.TYPE_COMPETENCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P4TYPE_COMPETENCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESIGNATION) THEN
        IF (cg$tmp_rec.DESIGNATION != cg$old_rec.DESIGNATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5DESIGNATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ORDRE) THEN
        IF (cg$tmp_rec.ORDRE != cg$old_rec.ORDRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P6ORDRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DOMAINE_COMPETENCE.lck');
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
      cg$ind_true.ID_DC := TRUE;
      cg$ind_true.CODE_MCP := TRUE;
      cg$ind_true.ID_UE := TRUE;
      cg$ind_true.TYPE_COMPETENCE := TRUE;
      cg$ind_true.DESIGNATION := TRUE;
      cg$ind_true.ORDRE := TRUE;
      cg$ind_true.DESCRIPTION := TRUE;
   

END cg$DOMAINE_COMPETENCE;
/

