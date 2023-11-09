
PROMPT Creating API Package Body for Table 'CADRE_REFERENT'
--------------------------------------------------------------------------------
-- Name:        cg$CADRE_REFERENT
-- Description: CADRE_REFERENT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$CADRE_REFERENT IS

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
                   'cg$CADRE_REFERENT.raise_uk_not_updateable');
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
                   'cg$CADRE_REFERENT.raise_fk_not_transferable');
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
                    'cg$CADRE_REFERENT.up_autogen_columns');
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
    IF (cg$val_rec.CODE_CRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P1CODE_CRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DESIGNATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P2DESIGNATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ETAT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P3ETAT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_CREATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P6DATE_CREATION),
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
       SELECT    CODE_CRE
       ,         DESIGNATION
       ,         ETAT
       ,         DESCRIPTION
       ,         COMMENTAIRE
       ,         DATE_CREATION
       ,         DATE_MODIFICATION
       ,         DATE_DISPONIBILITE
       ,         DATE_RETRAIT
       , rowid
       INTO      cg$sel_rec.CODE_CRE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.ETAT
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.DATE_CREATION
       ,         cg$sel_rec.DATE_MODIFICATION
       ,         cg$sel_rec.DATE_DISPONIBILITE
       ,         cg$sel_rec.DATE_RETRAIT
       ,cg$sel_rec.the_rowid
       FROM   CADRE_REFERENT
       WHERE        CODE_CRE = cg$sel_rec.CODE_CRE;
    ELSE
       SELECT    CODE_CRE
       ,         DESIGNATION
       ,         ETAT
       ,         DESCRIPTION
       ,         COMMENTAIRE
       ,         DATE_CREATION
       ,         DATE_MODIFICATION
       ,         DATE_DISPONIBILITE
       ,         DATE_RETRAIT
       , rowid
       INTO      cg$sel_rec.CODE_CRE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.ETAT
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.COMMENTAIRE
       ,         cg$sel_rec.DATE_CREATION
       ,         cg$sel_rec.DATE_MODIFICATION
       ,         cg$sel_rec.DATE_DISPONIBILITE
       ,         cg$sel_rec.DATE_RETRAIT
       ,cg$sel_rec.the_rowid
       FROM   CADRE_REFERENT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$CADRE_REFERENT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to CADRE_REFERENT 
--
-- Parameters:  cg$rec     Record of CADRE_REFERENT current values
--              cg$old_rec Record of CADRE_REFERENT previous values
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
--              of each child table that references this tableCADRE_REFERENT 
--
-- Parameters:  cg$old_rec     Record of CADRE_REFERENT current values
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
--              child table that references this table CADRE_REFERENT 
--
-- Parameters:  cg$new_rec  New values for CADRE_REFERENT's domain key constraint columns 
--              cg$new_ind  Indicates changed CADRE_REFERENT's domain key constraint columns
--              cg$old_rec  Current values for CADRE_REFERENT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to CADRE_REFERENT 
--
-- Parameters:  cg$rec     Record of CADRE_REFERENT current values
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
--              child table that references this tableCADRE_REFERENT 
--
-- Parameters:  cg$old_rec     Record of CADRE_REFERENT current values
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
--              of each child table that references this tableCADRE_REFERENT 
--
-- Parameters:  cg$old_rec     Record of CADRE_REFERENT current values
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
-- Parameters:  cg$rec     Record of CADRE_REFERENT current values
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
-- Parameters:  cg$rec     Record of CADRE_REFERENT current values
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
                                            'CG_REF_CODES','CADRE_REFERENT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$CADRE_REFERENT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CADRE_REFERENT.v_domain.others');
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
    IF (con_name = 'CRE_PK') THEN
        cg$errors.push(nvl(CRE_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'CRE_PK' 
                                     ,'CADRE_REFERENT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'UE_CRE_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Cadre Referent', 'Ue'),
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

D3_ETAT CONSTANT CADRE_REFERENT.ETAT%TYPE := 'ELA';
D6_DATE_CREATION CONSTANT CADRE_REFERENT.DATE_CREATION%TYPE := SYSDATE;

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ETAT) THEN cg$rec.ETAT := D3_ETAT; END IF;
    IF NOT (cg$ind.DATE_CREATION) THEN cg$rec.DATE_CREATION := D6_DATE_CREATION; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO CADRE_REFERENT
            (CODE_CRE
            ,DESIGNATION
            ,ETAT
            ,DESCRIPTION
            ,COMMENTAIRE
            ,DATE_CREATION
            ,DATE_MODIFICATION
            ,DATE_DISPONIBILITE
            ,DATE_RETRAIT)
        VALUES
            (cg$rec.CODE_CRE
            ,cg$rec.DESIGNATION
            ,cg$rec.ETAT
            ,cg$rec.DESCRIPTION
            ,cg$rec.COMMENTAIRE
            ,cg$rec.DATE_CREATION
            ,cg$rec.DATE_MODIFICATION
            ,cg$rec.DATE_DISPONIBILITE
            ,cg$rec.DATE_RETRAIT
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
        validate_mandatory(cg$rec, 'cg$CADRE_REFERENT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CADRE_REFERENT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CADRE_REFERENT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CADRE_REFERENT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CADRE_REFERENT.ins.others');
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

 
    IF ( cg$pk.CODE_CRE IS NULL ) THEN          
      cg$upd_rec.CODE_CRE := cg$rec.CODE_CRE;
    ELSE
      cg$upd_rec.CODE_CRE := cg$pk.CODE_CRE;
    END IF;
    cg$old_rec.CODE_CRE := cg$upd_rec.CODE_CRE;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key CRE_PK
        IF (cg$ind.CODE_CRE AND cg$rec.CODE_CRE != cg$upd_rec.CODE_CRE) THEN
            raise_uk_not_updateable('CRE_PK');
        END IF;
        IF NOT (cg$ind.CODE_CRE) THEN
            cg$rec.CODE_CRE := cg$upd_rec.CODE_CRE;
        END IF;
        IF NOT (cg$ind.DESIGNATION) THEN
            cg$rec.DESIGNATION := cg$upd_rec.DESIGNATION;
        END IF;
        IF NOT (cg$ind.ETAT) THEN
            cg$rec.ETAT := cg$upd_rec.ETAT;
        END IF;
        IF NOT (cg$ind.DESCRIPTION) THEN
            cg$rec.DESCRIPTION := cg$upd_rec.DESCRIPTION;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE) THEN
            cg$rec.COMMENTAIRE := cg$upd_rec.COMMENTAIRE;
        END IF;
        IF NOT (cg$ind.DATE_CREATION) THEN
            cg$rec.DATE_CREATION := cg$upd_rec.DATE_CREATION;
        END IF;
        IF NOT (cg$ind.DATE_MODIFICATION) THEN
            cg$rec.DATE_MODIFICATION := cg$upd_rec.DATE_MODIFICATION;
        END IF;
        IF NOT (cg$ind.DATE_DISPONIBILITE) THEN
            cg$rec.DATE_DISPONIBILITE := cg$upd_rec.DATE_DISPONIBILITE;
        END IF;
        IF NOT (cg$ind.DATE_RETRAIT) THEN
            cg$rec.DATE_RETRAIT := cg$upd_rec.DATE_RETRAIT;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key CRE_PK
        IF ( cg$ind.CODE_CRE ) THEN
          raise_uk_not_updateable('CRE_PK');
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
            UPDATE CADRE_REFERENT
            SET
              DESIGNATION = cg$rec.DESIGNATION
              ,ETAT = cg$rec.ETAT
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,DATE_CREATION = cg$rec.DATE_CREATION
              ,DATE_MODIFICATION = cg$rec.DATE_MODIFICATION
              ,DATE_DISPONIBILITE = cg$rec.DATE_DISPONIBILITE
              ,DATE_RETRAIT = cg$rec.DATE_RETRAIT
            WHERE  CODE_CRE = cg$rec.CODE_CRE;
            null;
          ELSE
            UPDATE CADRE_REFERENT
            SET
              DESIGNATION = cg$rec.DESIGNATION
              ,ETAT = cg$rec.ETAT
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
              ,DATE_CREATION = cg$rec.DATE_CREATION
              ,DATE_MODIFICATION = cg$rec.DATE_MODIFICATION
              ,DATE_DISPONIBILITE = cg$rec.DATE_DISPONIBILITE
              ,DATE_RETRAIT = cg$rec.DATE_RETRAIT
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
        cg$table(idx).CODE_CRE := cg$rec.CODE_CRE;
        cg$tableind(idx).CODE_CRE := cg$ind.CODE_CRE;
        cg$table(idx).DESIGNATION := cg$rec.DESIGNATION;
        cg$tableind(idx).DESIGNATION := cg$ind.DESIGNATION;
        cg$table(idx).ETAT := cg$rec.ETAT;
        cg$tableind(idx).ETAT := cg$ind.ETAT;
        cg$table(idx).DESCRIPTION := cg$rec.DESCRIPTION;
        cg$tableind(idx).DESCRIPTION := cg$ind.DESCRIPTION;
        cg$table(idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
        cg$tableind(idx).COMMENTAIRE := cg$ind.COMMENTAIRE;
        cg$table(idx).DATE_CREATION := cg$rec.DATE_CREATION;
        cg$tableind(idx).DATE_CREATION := cg$ind.DATE_CREATION;
        cg$table(idx).DATE_MODIFICATION := cg$rec.DATE_MODIFICATION;
        cg$tableind(idx).DATE_MODIFICATION := cg$ind.DATE_MODIFICATION;
        cg$table(idx).DATE_DISPONIBILITE := cg$rec.DATE_DISPONIBILITE;
        cg$tableind(idx).DATE_DISPONIBILITE := cg$ind.DATE_DISPONIBILITE;
        cg$table(idx).DATE_RETRAIT := cg$rec.DATE_RETRAIT;
        cg$tableind(idx).DATE_RETRAIT := cg$ind.DATE_RETRAIT;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$CADRE_REFERENT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CADRE_REFERENT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CADRE_REFERENT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CADRE_REFERENT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CADRE_REFERENT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of CADRE_REFERENT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for CADRE_REFERENT's domain key constraint columns 
--              cg$ind      Indicates changed CADRE_REFERENT's domain key constraint columns
--              cg$old_rec  Current values for CADRE_REFERENT's domain key constraint columns
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
           cg$rec.CODE_CRE := cg$pk.CODE_CRE;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE CADRE_REFERENT
              WHERE                    CODE_CRE = cg$pk.CODE_CRE;
           ELSE
              DELETE CADRE_REFERENT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$CADRE_REFERENT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CADRE_REFERENT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CADRE_REFERENT.del.others');
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
               SELECT       CODE_CRE
               ,            DESIGNATION
               ,            ETAT
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            DATE_CREATION
               ,            DATE_MODIFICATION
               ,            DATE_DISPONIBILITE
               ,            DATE_RETRAIT
               INTO         cg$tmp_rec.CODE_CRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ETAT
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DATE_MODIFICATION
               ,            cg$tmp_rec.DATE_DISPONIBILITE
               ,            cg$tmp_rec.DATE_RETRAIT
               FROM      CADRE_REFERENT
               WHERE              CODE_CRE = cg$old_rec.CODE_CRE
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       CODE_CRE
               ,            DESIGNATION
               ,            ETAT
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            DATE_CREATION
               ,            DATE_MODIFICATION
               ,            DATE_DISPONIBILITE
               ,            DATE_RETRAIT
               INTO         cg$tmp_rec.CODE_CRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ETAT
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DATE_MODIFICATION
               ,            cg$tmp_rec.DATE_DISPONIBILITE
               ,            cg$tmp_rec.DATE_RETRAIT
               FROM      CADRE_REFERENT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       CODE_CRE
               ,            DESIGNATION
               ,            ETAT
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            DATE_CREATION
               ,            DATE_MODIFICATION
               ,            DATE_DISPONIBILITE
               ,            DATE_RETRAIT
               INTO         cg$tmp_rec.CODE_CRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ETAT
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DATE_MODIFICATION
               ,            cg$tmp_rec.DATE_DISPONIBILITE
               ,            cg$tmp_rec.DATE_RETRAIT
               FROM      CADRE_REFERENT
               WHERE              CODE_CRE = cg$old_rec.CODE_CRE
               FOR UPDATE;
            ELSE
               SELECT       CODE_CRE
               ,            DESIGNATION
               ,            ETAT
               ,            DESCRIPTION
               ,            COMMENTAIRE
               ,            DATE_CREATION
               ,            DATE_MODIFICATION
               ,            DATE_DISPONIBILITE
               ,            DATE_RETRAIT
               INTO         cg$tmp_rec.CODE_CRE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.ETAT
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.COMMENTAIRE
               ,            cg$tmp_rec.DATE_CREATION
               ,            cg$tmp_rec.DATE_MODIFICATION
               ,            cg$tmp_rec.DATE_DISPONIBILITE
               ,            cg$tmp_rec.DATE_RETRAIT
               FROM      CADRE_REFERENT
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
                           'cg$CADRE_REFERENT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CADRE_REFERENT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CADRE_REFERENT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DESCRIPTION) THEN
        IF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        AND cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            IF (cg$tmp_rec.DESCRIPTION != cg$old_rec.DESCRIPTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P4DESCRIPTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        OR cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P4DESCRIPTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE) THEN
        IF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        AND cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE != cg$old_rec.COMMENTAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5COMMENTAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        OR cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P5COMMENTAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_MODIFICATION) THEN
        IF (cg$tmp_rec.DATE_MODIFICATION IS NOT NULL
        AND cg$old_rec.DATE_MODIFICATION IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_MODIFICATION != cg$old_rec.DATE_MODIFICATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P7DATE_MODIFICATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_MODIFICATION IS NOT NULL
        OR cg$old_rec.DATE_MODIFICATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P7DATE_MODIFICATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_DISPONIBILITE) THEN
        IF (cg$tmp_rec.DATE_DISPONIBILITE IS NOT NULL
        AND cg$old_rec.DATE_DISPONIBILITE IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_DISPONIBILITE != cg$old_rec.DATE_DISPONIBILITE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P8DATE_DISPONIBILITE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_DISPONIBILITE IS NOT NULL
        OR cg$old_rec.DATE_DISPONIBILITE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P8DATE_DISPONIBILITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_RETRAIT) THEN
        IF (cg$tmp_rec.DATE_RETRAIT IS NOT NULL
        AND cg$old_rec.DATE_RETRAIT IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_RETRAIT != cg$old_rec.DATE_RETRAIT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P9DATE_RETRAIT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_RETRAIT IS NOT NULL
        OR cg$old_rec.DATE_RETRAIT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P9DATE_RETRAIT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.CODE_CRE) THEN
        IF (cg$tmp_rec.CODE_CRE != cg$old_rec.CODE_CRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P1CODE_CRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESIGNATION) THEN
        IF (cg$tmp_rec.DESIGNATION != cg$old_rec.DESIGNATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P2DESIGNATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT) THEN
        IF (cg$tmp_rec.ETAT != cg$old_rec.ETAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P3ETAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_CREATION) THEN
        IF (cg$tmp_rec.DATE_CREATION != cg$old_rec.DATE_CREATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P6DATE_CREATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CADRE_REFERENT.lck');
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
      cg$ind_true.CODE_CRE := TRUE;
      cg$ind_true.DESIGNATION := TRUE;
      cg$ind_true.ETAT := TRUE;
      cg$ind_true.DESCRIPTION := TRUE;
      cg$ind_true.COMMENTAIRE := TRUE;
      cg$ind_true.DATE_CREATION := TRUE;
      cg$ind_true.DATE_MODIFICATION := TRUE;
      cg$ind_true.DATE_DISPONIBILITE := TRUE;
      cg$ind_true.DATE_RETRAIT := TRUE;
   

END cg$CADRE_REFERENT;
/

