
PROMPT Creating API Package Body for Table 'AUTHENTIFICATION'
--------------------------------------------------------------------------------
-- Name:        cg$AUTHENTIFICATION
-- Description: AUTHENTIFICATION table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$AUTHENTIFICATION IS

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
                   'cg$AUTHENTIFICATION.raise_uk_not_updateable');
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
                   'cg$AUTHENTIFICATION.raise_fk_not_transferable');
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
                    'cg$AUTHENTIFICATION.up_autogen_columns');
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
    IF (cg$val_rec.LOGIN IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10LOGIN),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PASSWORD IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20PASSWORD),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.TYPE_AUTHENTIFICATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P25TYPE_AUTHENTIFICATION),
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
       SELECT    LOGIN
       ,         PASSWORD
       ,         TYPE_AUTHENTIFICATION
       ,         NO_ETUDIANT_NAT
       ,         NO_ENSEIGNANT
       ,         NO_ENTREPRISE
       , rowid
       INTO      cg$sel_rec.LOGIN
       ,         cg$sel_rec.PASSWORD
       ,         cg$sel_rec.TYPE_AUTHENTIFICATION
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.NO_ENTREPRISE
       ,cg$sel_rec.the_rowid
       FROM   AUTHENTIFICATION
       WHERE        LOGIN = cg$sel_rec.LOGIN;
    ELSE
       SELECT    LOGIN
       ,         PASSWORD
       ,         TYPE_AUTHENTIFICATION
       ,         NO_ETUDIANT_NAT
       ,         NO_ENSEIGNANT
       ,         NO_ENTREPRISE
       , rowid
       INTO      cg$sel_rec.LOGIN
       ,         cg$sel_rec.PASSWORD
       ,         cg$sel_rec.TYPE_AUTHENTIFICATION
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.NO_ENTREPRISE
       ,cg$sel_rec.the_rowid
       FROM   AUTHENTIFICATION
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$AUTHENTIFICATION.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to AUTHENTIFICATION 
--
-- Parameters:  cg$rec     Record of AUTHENTIFICATION current values
--              cg$old_rec Record of AUTHENTIFICATION previous values
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
--              of each child table that references this tableAUTHENTIFICATION 
--
-- Parameters:  cg$old_rec     Record of AUTHENTIFICATION current values
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
--              child table that references this table AUTHENTIFICATION 
--
-- Parameters:  cg$new_rec  New values for AUTHENTIFICATION's domain key constraint columns 
--              cg$new_ind  Indicates changed AUTHENTIFICATION's domain key constraint columns
--              cg$old_rec  Current values for AUTHENTIFICATION's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to AUTHENTIFICATION 
--
-- Parameters:  cg$rec     Record of AUTHENTIFICATION current values
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
--              child table that references this tableAUTHENTIFICATION 
--
-- Parameters:  cg$old_rec     Record of AUTHENTIFICATION current values
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
--              of each child table that references this tableAUTHENTIFICATION 
--
-- Parameters:  cg$old_rec     Record of AUTHENTIFICATION current values
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
-- Parameters:  cg$rec     Record of AUTHENTIFICATION current values
--------------------------------------------------------------------------------
PROCEDURE validate_arc(cg$rec IN OUT cg$row_type) IS
i NUMBER;
BEGIN
    i := 0;
    IF (cg$rec.NO_ENSEIGNANT IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF (cg$rec.NO_ENTREPRISE IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF (cg$rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
        i := i + 1;
    END IF;
    IF (i = 0) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_ARC_EMPTY, cg$errors.APIMSG_ARC_MAND_VIOLAT,'2','AUTHENTIFICATION'),
                           'E',
                           'API',
                           cg$errors.API_MAND_ARC_EMPTY,
                          'cg$AUTHENTIFICATION.validate_arc');
        cg$errors.raise_failure;
    END IF;
    IF (i > 1) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ARC_TOO_MANY_VAL, cg$errors.APIMSG_ARC_VIOLAT,'2','AUTHENTIFICATION'),
                           'E',
                           'API',
                           cg$errors.API_ARC_TOO_MANY_VAL,
                          'cg$AUTHENTIFICATION.validate_arc');
        cg$errors.raise_failure;
    END IF;
    NULL;
END validate_arc;


--------------------------------------------------------------------------------
-- Name:        validate_domain
--
-- Description: Checks against reference table for values lying in a domain 
--
-- Parameters:  cg$rec     Record of AUTHENTIFICATION current values
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
    IF (cg$ind.TYPE_AUTHENTIFICATION AND cg$rec.TYPE_AUTHENTIFICATION IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'TYPE_AUTHENTIFICATION' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.TYPE_AUTHENTIFICATION = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.TYPE_AUTHENTIFICATION BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.TYPE_AUTHENTIFICATION,'AUTHENTIFICATION','TYPE_AUTHENTIFICATION'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$AUTHENTIFICATION.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','AUTHENTIFICATION'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$AUTHENTIFICATION.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AUTHENTIFICATION.v_domain.others');
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
    IF (con_name = 'AUT_PK') THEN
        cg$errors.push(nvl(AUT_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'AUT_PK' 
                                     ,'AUTHENTIFICATION')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'CK_AUTHENTIFICATION' AND CK_AUTHENTIFICATION IS NOT NULL) THEN
        cg$errors.push('',
                       'E',
                       'API',
                       cg$errors.API_CK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'ENT_AUT_CREA_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Authentification', 'Entreprise'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'ENT_AUT_MAJ_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Authentification', 'Entreprise'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'AUT_ENS_FK') THEN
        cg$errors.push(nvl(AUT_ENS_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'AUT_ENS_FK' 
                                     ,'AUTHENTIFICATION')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'AUT_ENT_FK') THEN
        cg$errors.push(nvl(AUT_ENT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'AUT_ENT_FK' 
                                     ,'AUTHENTIFICATION')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'AUT_ETU_FK') THEN
        cg$errors.push(nvl(AUT_ETU_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'AUT_ETU_FK' 
                                     ,'AUTHENTIFICATION')),
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

        INSERT INTO AUTHENTIFICATION
            (LOGIN
            ,PASSWORD
            ,TYPE_AUTHENTIFICATION
            ,NO_ETUDIANT_NAT
            ,NO_ENSEIGNANT
            ,NO_ENTREPRISE)
        VALUES
            (cg$rec.LOGIN
            ,cg$rec.PASSWORD
            ,cg$rec.TYPE_AUTHENTIFICATION
            ,cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.NO_ENSEIGNANT
            ,cg$rec.NO_ENTREPRISE
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
        validate_mandatory(cg$rec, 'cg$AUTHENTIFICATION.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$AUTHENTIFICATION.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$AUTHENTIFICATION.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$AUTHENTIFICATION.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AUTHENTIFICATION.ins.others');
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

 
    IF ( cg$pk.LOGIN IS NULL ) THEN          
      cg$upd_rec.LOGIN := cg$rec.LOGIN;
    ELSE
      cg$upd_rec.LOGIN := cg$pk.LOGIN;
    END IF;
    cg$old_rec.LOGIN := cg$upd_rec.LOGIN;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key AUT_PK
        IF (cg$ind.LOGIN AND cg$rec.LOGIN != cg$upd_rec.LOGIN) THEN
            raise_uk_not_updateable('AUT_PK');
        END IF;
        IF NOT (cg$ind.LOGIN) THEN
            cg$rec.LOGIN := cg$upd_rec.LOGIN;
        END IF;
        IF NOT (cg$ind.PASSWORD) THEN
            cg$rec.PASSWORD := cg$upd_rec.PASSWORD;
        END IF;
        IF NOT (cg$ind.TYPE_AUTHENTIFICATION) THEN
            cg$rec.TYPE_AUTHENTIFICATION := cg$upd_rec.TYPE_AUTHENTIFICATION;
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.NO_ENTREPRISE) THEN
            cg$rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key AUT_PK
        IF ( cg$ind.LOGIN ) THEN
          raise_uk_not_updateable('AUT_PK');
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
            UPDATE AUTHENTIFICATION
            SET
              PASSWORD = cg$rec.PASSWORD
              ,TYPE_AUTHENTIFICATION = cg$rec.TYPE_AUTHENTIFICATION
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
            WHERE  LOGIN = cg$rec.LOGIN;
            null;
          ELSE
            UPDATE AUTHENTIFICATION
            SET
              PASSWORD = cg$rec.PASSWORD
              ,TYPE_AUTHENTIFICATION = cg$rec.TYPE_AUTHENTIFICATION
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
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
        cg$table(idx).LOGIN := cg$rec.LOGIN;
        cg$tableind(idx).LOGIN := cg$ind.LOGIN;
        cg$table(idx).PASSWORD := cg$rec.PASSWORD;
        cg$tableind(idx).PASSWORD := cg$ind.PASSWORD;
        cg$table(idx).TYPE_AUTHENTIFICATION := cg$rec.TYPE_AUTHENTIFICATION;
        cg$tableind(idx).TYPE_AUTHENTIFICATION := cg$ind.TYPE_AUTHENTIFICATION;
        cg$table(idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
        cg$tableind(idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
        cg$tableind(idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$AUTHENTIFICATION.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$AUTHENTIFICATION.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$AUTHENTIFICATION.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$AUTHENTIFICATION.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AUTHENTIFICATION.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of AUTHENTIFICATION when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for AUTHENTIFICATION's domain key constraint columns 
--              cg$ind      Indicates changed AUTHENTIFICATION's domain key constraint columns
--              cg$old_rec  Current values for AUTHENTIFICATION's domain key constraint columns
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
           cg$rec.LOGIN := cg$pk.LOGIN;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE AUTHENTIFICATION
              WHERE                    LOGIN = cg$pk.LOGIN;
           ELSE
              DELETE AUTHENTIFICATION
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$AUTHENTIFICATION.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AUTHENTIFICATION.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AUTHENTIFICATION.del.others');
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
               SELECT       LOGIN
               ,            PASSWORD
               ,            TYPE_AUTHENTIFICATION
               ,            NO_ETUDIANT_NAT
               ,            NO_ENSEIGNANT
               ,            NO_ENTREPRISE
               INTO         cg$tmp_rec.LOGIN
               ,            cg$tmp_rec.PASSWORD
               ,            cg$tmp_rec.TYPE_AUTHENTIFICATION
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.NO_ENTREPRISE
               FROM      AUTHENTIFICATION
               WHERE              LOGIN = cg$old_rec.LOGIN
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       LOGIN
               ,            PASSWORD
               ,            TYPE_AUTHENTIFICATION
               ,            NO_ETUDIANT_NAT
               ,            NO_ENSEIGNANT
               ,            NO_ENTREPRISE
               INTO         cg$tmp_rec.LOGIN
               ,            cg$tmp_rec.PASSWORD
               ,            cg$tmp_rec.TYPE_AUTHENTIFICATION
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.NO_ENTREPRISE
               FROM      AUTHENTIFICATION
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       LOGIN
               ,            PASSWORD
               ,            TYPE_AUTHENTIFICATION
               ,            NO_ETUDIANT_NAT
               ,            NO_ENSEIGNANT
               ,            NO_ENTREPRISE
               INTO         cg$tmp_rec.LOGIN
               ,            cg$tmp_rec.PASSWORD
               ,            cg$tmp_rec.TYPE_AUTHENTIFICATION
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.NO_ENTREPRISE
               FROM      AUTHENTIFICATION
               WHERE              LOGIN = cg$old_rec.LOGIN
               FOR UPDATE;
            ELSE
               SELECT       LOGIN
               ,            PASSWORD
               ,            TYPE_AUTHENTIFICATION
               ,            NO_ETUDIANT_NAT
               ,            NO_ENSEIGNANT
               ,            NO_ENTREPRISE
               INTO         cg$tmp_rec.LOGIN
               ,            cg$tmp_rec.PASSWORD
               ,            cg$tmp_rec.TYPE_AUTHENTIFICATION
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.NO_ENTREPRISE
               FROM      AUTHENTIFICATION
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
                           'cg$AUTHENTIFICATION.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$AUTHENTIFICATION.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$AUTHENTIFICATION.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT IS NOT NULL
        AND cg$old_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_ETUDIANT_NAT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ETUDIANT_NAT IS NOT NULL
        OR cg$old_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT IS NOT NULL
        AND cg$old_rec.NO_ENSEIGNANT IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NO_ENSEIGNANT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ENSEIGNANT IS NOT NULL
        OR cg$old_rec.NO_ENSEIGNANT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_ENTREPRISE IS NOT NULL
        AND cg$old_rec.NO_ENTREPRISE IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ENTREPRISE != cg$old_rec.NO_ENTREPRISE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50NO_ENTREPRISE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ENTREPRISE IS NOT NULL
        OR cg$old_rec.NO_ENTREPRISE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50NO_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.LOGIN) THEN
        IF (cg$tmp_rec.LOGIN != cg$old_rec.LOGIN) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10LOGIN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PASSWORD) THEN
        IF (cg$tmp_rec.PASSWORD != cg$old_rec.PASSWORD) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20PASSWORD
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TYPE_AUTHENTIFICATION) THEN
        IF (cg$tmp_rec.TYPE_AUTHENTIFICATION != cg$old_rec.TYPE_AUTHENTIFICATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25TYPE_AUTHENTIFICATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AUTHENTIFICATION.lck');
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
      cg$ind_true.LOGIN := TRUE;
      cg$ind_true.PASSWORD := TRUE;
      cg$ind_true.TYPE_AUTHENTIFICATION := TRUE;
      cg$ind_true.NO_ETUDIANT_NAT := TRUE;
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.NO_ENTREPRISE := TRUE;
   

END cg$AUTHENTIFICATION;
/

