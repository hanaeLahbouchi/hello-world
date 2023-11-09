
PROMPT Creating API Package Body for Table 'EMPLOYE'
--------------------------------------------------------------------------------
-- Name:        cg$EMPLOYE
-- Description: EMPLOYE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$EMPLOYE IS

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
                   'cg$EMPLOYE.raise_uk_not_updateable');
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
                   'cg$EMPLOYE.raise_fk_not_transferable');
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
			IF (cg$ind.NO_CONTACT_ILI = FALSE
      OR  cg$rec.NO_CONTACT_ILI is NULL) THEN 
				SELECT EMP_SEQ.nextval
				INTO   cg$rec.NO_CONTACT_ILI
				FROM   DUAL;
				cg$ind.NO_CONTACT_ILI := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$EMPLOYE.up_autogen.NO_CONTACT_ILI.OTHERS');
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
                    'cg$EMPLOYE.up_autogen_columns');
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
    IF (cg$val_rec.NO_CONTACT_ILI IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_CONTACT_ILI),
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
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40PRENOM),
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
       SELECT    NO_CONTACT_ILI
       ,         NO_ENTREPRISE
       ,         NO_ETUDIANT_NAT
       ,         NOM
       ,         PRENOM
       ,         MAIL_PRO
       ,         TEL_PRO
       ,         FONCTION
       , rowid
       INTO      cg$sel_rec.NO_CONTACT_ILI
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.MAIL_PRO
       ,         cg$sel_rec.TEL_PRO
       ,         cg$sel_rec.FONCTION
       ,cg$sel_rec.the_rowid
       FROM   EMPLOYE
       WHERE        NO_CONTACT_ILI = cg$sel_rec.NO_CONTACT_ILI;
    ELSE
       SELECT    NO_CONTACT_ILI
       ,         NO_ENTREPRISE
       ,         NO_ETUDIANT_NAT
       ,         NOM
       ,         PRENOM
       ,         MAIL_PRO
       ,         TEL_PRO
       ,         FONCTION
       , rowid
       INTO      cg$sel_rec.NO_CONTACT_ILI
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.MAIL_PRO
       ,         cg$sel_rec.TEL_PRO
       ,         cg$sel_rec.FONCTION
       ,cg$sel_rec.the_rowid
       FROM   EMPLOYE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$EMPLOYE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to EMPLOYE 
--
-- Parameters:  cg$rec     Record of EMPLOYE current values
--              cg$old_rec Record of EMPLOYE previous values
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
--              of each child table that references this tableEMPLOYE 
--
-- Parameters:  cg$old_rec     Record of EMPLOYE current values
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
--              child table that references this table EMPLOYE 
--
-- Parameters:  cg$new_rec  New values for EMPLOYE's domain key constraint columns 
--              cg$new_ind  Indicates changed EMPLOYE's domain key constraint columns
--              cg$old_rec  Current values for EMPLOYE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to EMPLOYE 
--
-- Parameters:  cg$rec     Record of EMPLOYE current values
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
--              child table that references this tableEMPLOYE 
--
-- Parameters:  cg$old_rec     Record of EMPLOYE current values
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
--              of each child table that references this tableEMPLOYE 
--
-- Parameters:  cg$old_rec     Record of EMPLOYE current values
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
-- Parameters:  cg$rec     Record of EMPLOYE current values
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
-- Parameters:  cg$rec     Record of EMPLOYE current values
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
    IF (cg$ind.FONCTION AND cg$rec.FONCTION IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'FONCTION' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.FONCTION = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.FONCTION BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.FONCTION,'EMPLOYE','FONCTION'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$EMPLOYE.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','EMPLOYE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$EMPLOYE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$EMPLOYE.v_domain.others');
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
    IF (con_name = 'EMP_PK') THEN
        cg$errors.push(nvl(EMP_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'EMP_PK' 
                                     ,'EMPLOYE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_EMP_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Employe', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'CTS_EMP_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Employe', 'Contact Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'VST_EMP_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Employe', 'Visite Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'EMP_ENT_FK') THEN
        cg$errors.push(nvl(EMP_ENT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'EMP_ENT_FK' 
                                     ,'EMPLOYE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'EMP_DIP_FK') THEN
        cg$errors.push(nvl(EMP_DIP_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'EMP_DIP_FK' 
                                     ,'EMPLOYE')),
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

        INSERT INTO EMPLOYE
            (NO_CONTACT_ILI
            ,NO_ENTREPRISE
            ,NO_ETUDIANT_NAT
            ,NOM
            ,PRENOM
            ,MAIL_PRO
            ,TEL_PRO
            ,FONCTION)
        VALUES
            (cg$rec.NO_CONTACT_ILI
            ,cg$rec.NO_ENTREPRISE
            ,cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.MAIL_PRO
            ,cg$rec.TEL_PRO
            ,cg$rec.FONCTION
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
        validate_mandatory(cg$rec, 'cg$EMPLOYE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$EMPLOYE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$EMPLOYE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$EMPLOYE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$EMPLOYE.ins.others');
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

 
    IF ( cg$pk.NO_CONTACT_ILI IS NULL ) THEN          
      cg$upd_rec.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    ELSE
      cg$upd_rec.NO_CONTACT_ILI := cg$pk.NO_CONTACT_ILI;
    END IF;
    cg$old_rec.NO_CONTACT_ILI := cg$upd_rec.NO_CONTACT_ILI;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);

           --  Report error if attempt to update non transferable Foreign Key EMP_DIP_FK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_fk_not_transferable('EMP_DIP_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            raise_fk_not_transferable('EMP_DIP_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NOT NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NULL) THEN
            raise_fk_not_transferable('EMP_DIP_FK');
        END IF;

        --  Report error if attempt to update non updateable Primary Key EMP_PK
        IF (cg$ind.NO_CONTACT_ILI AND cg$rec.NO_CONTACT_ILI != cg$upd_rec.NO_CONTACT_ILI) THEN
            raise_uk_not_updateable('EMP_PK');
        END IF;
        IF NOT (cg$ind.NO_CONTACT_ILI) THEN
            cg$rec.NO_CONTACT_ILI := cg$upd_rec.NO_CONTACT_ILI;
        END IF;
        IF NOT (cg$ind.NO_ENTREPRISE) THEN
            cg$rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.PRENOM) THEN
            cg$rec.PRENOM := cg$upd_rec.PRENOM;
        END IF;
        IF NOT (cg$ind.MAIL_PRO) THEN
            cg$rec.MAIL_PRO := cg$upd_rec.MAIL_PRO;
        END IF;
        IF NOT (cg$ind.TEL_PRO) THEN
            cg$rec.TEL_PRO := cg$upd_rec.TEL_PRO;
        END IF;
        IF NOT (cg$ind.FONCTION) THEN
            cg$rec.FONCTION := cg$upd_rec.FONCTION;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
           --  Report error if attempt to update non transferable Foreign Key EMP_DIP_FK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_fk_not_transferable('EMP_DIP_FK');
        END IF;
        --  Report error if attempt to update non updateable Primary Key EMP_PK
        IF ( cg$ind.NO_CONTACT_ILI ) THEN
          raise_uk_not_updateable('EMP_PK');
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
            UPDATE EMPLOYE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,MAIL_PRO = cg$rec.MAIL_PRO
              ,TEL_PRO = cg$rec.TEL_PRO
              ,FONCTION = cg$rec.FONCTION
            WHERE  NO_CONTACT_ILI = cg$rec.NO_CONTACT_ILI;
            null;
          ELSE
            UPDATE EMPLOYE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,MAIL_PRO = cg$rec.MAIL_PRO
              ,TEL_PRO = cg$rec.TEL_PRO
              ,FONCTION = cg$rec.FONCTION
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
        cg$table(idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
        cg$tableind(idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;
        cg$table(idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
        cg$tableind(idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
        cg$table(idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
        cg$tableind(idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).MAIL_PRO := cg$rec.MAIL_PRO;
        cg$tableind(idx).MAIL_PRO := cg$ind.MAIL_PRO;
        cg$table(idx).TEL_PRO := cg$rec.TEL_PRO;
        cg$tableind(idx).TEL_PRO := cg$ind.TEL_PRO;
        cg$table(idx).FONCTION := cg$rec.FONCTION;
        cg$tableind(idx).FONCTION := cg$ind.FONCTION;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$EMPLOYE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$EMPLOYE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$EMPLOYE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$EMPLOYE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$EMPLOYE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of EMPLOYE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for EMPLOYE's domain key constraint columns 
--              cg$ind      Indicates changed EMPLOYE's domain key constraint columns
--              cg$old_rec  Current values for EMPLOYE's domain key constraint columns
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
           cg$rec.NO_CONTACT_ILI := cg$pk.NO_CONTACT_ILI;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE EMPLOYE
              WHERE                    NO_CONTACT_ILI = cg$pk.NO_CONTACT_ILI;
           ELSE
              DELETE EMPLOYE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$EMPLOYE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$EMPLOYE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$EMPLOYE.del.others');
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
               SELECT       NO_CONTACT_ILI
               ,            NO_ENTREPRISE
               ,            NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            FONCTION
               INTO         cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.FONCTION
               FROM      EMPLOYE
               WHERE              NO_CONTACT_ILI = cg$old_rec.NO_CONTACT_ILI
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_CONTACT_ILI
               ,            NO_ENTREPRISE
               ,            NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            FONCTION
               INTO         cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.FONCTION
               FROM      EMPLOYE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_CONTACT_ILI
               ,            NO_ENTREPRISE
               ,            NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            FONCTION
               INTO         cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.FONCTION
               FROM      EMPLOYE
               WHERE              NO_CONTACT_ILI = cg$old_rec.NO_CONTACT_ILI
               FOR UPDATE;
            ELSE
               SELECT       NO_CONTACT_ILI
               ,            NO_ENTREPRISE
               ,            NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            FONCTION
               INTO         cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.FONCTION
               FROM      EMPLOYE
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
                           'cg$EMPLOYE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$EMPLOYE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$EMPLOYE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT IS NOT NULL
        AND cg$old_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_ETUDIANT_NAT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ETUDIANT_NAT IS NOT NULL
        OR cg$old_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MAIL_PRO) THEN
        IF (cg$tmp_rec.MAIL_PRO IS NOT NULL
        AND cg$old_rec.MAIL_PRO IS NOT NULL) THEN
            IF (cg$tmp_rec.MAIL_PRO != cg$old_rec.MAIL_PRO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50MAIL_PRO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.MAIL_PRO IS NOT NULL
        OR cg$old_rec.MAIL_PRO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50MAIL_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_PRO) THEN
        IF (cg$tmp_rec.TEL_PRO IS NOT NULL
        AND cg$old_rec.TEL_PRO IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PRO != cg$old_rec.TEL_PRO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60TEL_PRO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PRO IS NOT NULL
        OR cg$old_rec.TEL_PRO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60TEL_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.FONCTION) THEN
        IF (cg$tmp_rec.FONCTION IS NOT NULL
        AND cg$old_rec.FONCTION IS NOT NULL) THEN
            IF (cg$tmp_rec.FONCTION != cg$old_rec.FONCTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70FONCTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.FONCTION IS NOT NULL
        OR cg$old_rec.FONCTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70FONCTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_CONTACT_ILI) THEN
        IF (cg$tmp_rec.NO_CONTACT_ILI != cg$old_rec.NO_CONTACT_ILI) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_CONTACT_ILI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_ENTREPRISE != cg$old_rec.NO_ENTREPRISE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$EMPLOYE.lck');
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
      cg$ind_true.NO_CONTACT_ILI := TRUE;
      cg$ind_true.NO_ENTREPRISE := TRUE;
      cg$ind_true.NO_ETUDIANT_NAT := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.MAIL_PRO := TRUE;
      cg$ind_true.TEL_PRO := TRUE;
      cg$ind_true.FONCTION := TRUE;
   

END cg$EMPLOYE;
/

