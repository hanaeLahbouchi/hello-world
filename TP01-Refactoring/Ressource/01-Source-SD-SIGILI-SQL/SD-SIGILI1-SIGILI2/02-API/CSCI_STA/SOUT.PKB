
PROMPT Creating API Package Body for Table 'SOUTENANCE'
--------------------------------------------------------------------------------
-- Name:        cg$SOUTENANCE
-- Description: SOUTENANCE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$SOUTENANCE IS

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
                   'cg$SOUTENANCE.raise_uk_not_updateable');
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
                   'cg$SOUTENANCE.raise_fk_not_transferable');
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
			IF (cg$ind.NO_SESSION = FALSE
      OR  cg$rec.NO_SESSION is NULL) THEN 
				SELECT SOUT_SEQ.nextval
				INTO   cg$rec.NO_SESSION
				FROM   DUAL;
				cg$ind.NO_SESSION := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$SOUTENANCE.up_autogen.NO_SESSION.OTHERS');
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
                    'cg$SOUTENANCE.up_autogen_columns');
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
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P8ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_SESSION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_SESSION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENSEIGNANT_RESPONSABLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NO_ENSEIGNANT_RESPONSABLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENSEIGNANT_ASSESSEUR IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P25NO_ENSEIGNANT_ASSESSEUR),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_SOUTENANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30DATE_SOUTENANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PLAGE_HORAIRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40PLAGE_HORAIRE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SALLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50SALLE),
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
       ,         NO_SESSION
       ,         NO_ENSEIGNANT_RESPONSABLE
       ,         NO_ENSEIGNANT_ASSESSEUR
       ,         DATE_SOUTENANCE
       ,         PLAGE_HORAIRE
       ,         SALLE
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_SESSION
       ,         cg$sel_rec.NO_ENSEIGNANT_RESPONSABLE
       ,         cg$sel_rec.NO_ENSEIGNANT_ASSESSEUR
       ,         cg$sel_rec.DATE_SOUTENANCE
       ,         cg$sel_rec.PLAGE_HORAIRE
       ,         cg$sel_rec.SALLE
       ,cg$sel_rec.the_rowid
       FROM   SOUTENANCE
       WHERE        NO_SESSION = cg$sel_rec.NO_SESSION
       AND       ANNEE_PRO = cg$sel_rec.ANNEE_PRO;
    ELSE
       SELECT    ANNEE_PRO
       ,         NO_SESSION
       ,         NO_ENSEIGNANT_RESPONSABLE
       ,         NO_ENSEIGNANT_ASSESSEUR
       ,         DATE_SOUTENANCE
       ,         PLAGE_HORAIRE
       ,         SALLE
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_SESSION
       ,         cg$sel_rec.NO_ENSEIGNANT_RESPONSABLE
       ,         cg$sel_rec.NO_ENSEIGNANT_ASSESSEUR
       ,         cg$sel_rec.DATE_SOUTENANCE
       ,         cg$sel_rec.PLAGE_HORAIRE
       ,         cg$sel_rec.SALLE
       ,cg$sel_rec.the_rowid
       FROM   SOUTENANCE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$SOUTENANCE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to SOUTENANCE 
--
-- Parameters:  cg$rec     Record of SOUTENANCE current values
--              cg$old_rec Record of SOUTENANCE previous values
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
--              of each child table that references this tableSOUTENANCE 
--
-- Parameters:  cg$old_rec     Record of SOUTENANCE current values
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
--              child table that references this table SOUTENANCE 
--
-- Parameters:  cg$new_rec  New values for SOUTENANCE's domain key constraint columns 
--              cg$new_ind  Indicates changed SOUTENANCE's domain key constraint columns
--              cg$old_rec  Current values for SOUTENANCE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to SOUTENANCE 
--
-- Parameters:  cg$rec     Record of SOUTENANCE current values
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
--              child table that references this tableSOUTENANCE 
--
-- Parameters:  cg$old_rec     Record of SOUTENANCE current values
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
--              of each child table that references this tableSOUTENANCE 
--
-- Parameters:  cg$old_rec     Record of SOUTENANCE current values
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
-- Parameters:  cg$rec     Record of SOUTENANCE current values
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
-- Parameters:  cg$rec     Record of SOUTENANCE current values
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
    IF (cg$ind.SALLE AND cg$rec.SALLE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'SALLE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.SALLE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.SALLE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.SALLE,'SOUTENANCE','SALLE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$SOUTENANCE.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','SOUTENANCE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$SOUTENANCE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SOUTENANCE.v_domain.others');
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
    IF (con_name = 'SOUT_PK') THEN
        cg$errors.push(nvl(SOUT_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'SOUT_PK' 
                                     ,'SOUTENANCE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_SOUT_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Soutenance', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'SOUT_PRO_FK') THEN
        cg$errors.push(nvl(SOUT_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'SOUT_PRO_FK' 
                                     ,'SOUTENANCE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'SOUT_ENS_RESPONSABLE_FK') THEN
        cg$errors.push(nvl(SOUT_ENS_RESPONSABLE_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'SOUT_ENS_RESPONSABLE_FK' 
                                     ,'SOUTENANCE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'SOUT_ENS_ASSESSEUR_FK') THEN
        cg$errors.push(nvl(SOUT_ENS_ASSESSEUR_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'SOUT_ENS_ASSESSEUR_FK' 
                                     ,'SOUTENANCE')),
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

D50_SALLE CONSTANT SOUTENANCE.SALLE%TYPE := 'C 117 A';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.SALLE) THEN cg$rec.SALLE := D50_SALLE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO SOUTENANCE
            (ANNEE_PRO
            ,NO_SESSION
            ,NO_ENSEIGNANT_RESPONSABLE
            ,NO_ENSEIGNANT_ASSESSEUR
            ,DATE_SOUTENANCE
            ,PLAGE_HORAIRE
            ,SALLE)
        VALUES
            (cg$rec.ANNEE_PRO
            ,cg$rec.NO_SESSION
            ,cg$rec.NO_ENSEIGNANT_RESPONSABLE
            ,cg$rec.NO_ENSEIGNANT_ASSESSEUR
            ,cg$rec.DATE_SOUTENANCE
            ,cg$rec.PLAGE_HORAIRE
            ,cg$rec.SALLE
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
        validate_mandatory(cg$rec, 'cg$SOUTENANCE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$SOUTENANCE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$SOUTENANCE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$SOUTENANCE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SOUTENANCE.ins.others');
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

 
    IF ( cg$pk.NO_SESSION IS NULL ) THEN          
      cg$upd_rec.NO_SESSION := cg$rec.NO_SESSION;
    ELSE
      cg$upd_rec.NO_SESSION := cg$pk.NO_SESSION;
    END IF;
    cg$old_rec.NO_SESSION := cg$upd_rec.NO_SESSION;
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


        --  Report error if attempt to update non updateable Primary Key SOUT_PK
        IF (cg$ind.NO_SESSION AND cg$rec.NO_SESSION != cg$upd_rec.NO_SESSION) THEN
            raise_uk_not_updateable('SOUT_PK');
        END IF;
        IF (cg$ind.ANNEE_PRO AND cg$rec.ANNEE_PRO != cg$upd_rec.ANNEE_PRO) THEN
            raise_uk_not_updateable('SOUT_PK');
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.NO_SESSION) THEN
            cg$rec.NO_SESSION := cg$upd_rec.NO_SESSION;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT_RESPONSABLE) THEN
            cg$rec.NO_ENSEIGNANT_RESPONSABLE := cg$upd_rec.NO_ENSEIGNANT_RESPONSABLE;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT_ASSESSEUR) THEN
            cg$rec.NO_ENSEIGNANT_ASSESSEUR := cg$upd_rec.NO_ENSEIGNANT_ASSESSEUR;
        END IF;
        IF NOT (cg$ind.DATE_SOUTENANCE) THEN
            cg$rec.DATE_SOUTENANCE := cg$upd_rec.DATE_SOUTENANCE;
        END IF;
        IF NOT (cg$ind.PLAGE_HORAIRE) THEN
            cg$rec.PLAGE_HORAIRE := cg$upd_rec.PLAGE_HORAIRE;
        END IF;
        IF NOT (cg$ind.SALLE) THEN
            cg$rec.SALLE := cg$upd_rec.SALLE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key SOUT_PK
        IF ( cg$ind.NO_SESSION 
        OR   cg$ind.ANNEE_PRO ) THEN
          raise_uk_not_updateable('SOUT_PK');
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
            UPDATE SOUTENANCE
            SET
              NO_ENSEIGNANT_RESPONSABLE = cg$rec.NO_ENSEIGNANT_RESPONSABLE
              ,NO_ENSEIGNANT_ASSESSEUR = cg$rec.NO_ENSEIGNANT_ASSESSEUR
              ,DATE_SOUTENANCE = cg$rec.DATE_SOUTENANCE
              ,PLAGE_HORAIRE = cg$rec.PLAGE_HORAIRE
              ,SALLE = cg$rec.SALLE
            WHERE  NO_SESSION = cg$rec.NO_SESSION
            AND    ANNEE_PRO = cg$rec.ANNEE_PRO;
            null;
          ELSE
            UPDATE SOUTENANCE
            SET
              NO_ENSEIGNANT_RESPONSABLE = cg$rec.NO_ENSEIGNANT_RESPONSABLE
              ,NO_ENSEIGNANT_ASSESSEUR = cg$rec.NO_ENSEIGNANT_ASSESSEUR
              ,DATE_SOUTENANCE = cg$rec.DATE_SOUTENANCE
              ,PLAGE_HORAIRE = cg$rec.PLAGE_HORAIRE
              ,SALLE = cg$rec.SALLE
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
        cg$table(idx).NO_SESSION := cg$rec.NO_SESSION;
        cg$tableind(idx).NO_SESSION := cg$ind.NO_SESSION;
        cg$table(idx).NO_ENSEIGNANT_RESPONSABLE := cg$rec.NO_ENSEIGNANT_RESPONSABLE;
        cg$tableind(idx).NO_ENSEIGNANT_RESPONSABLE := cg$ind.NO_ENSEIGNANT_RESPONSABLE;
        cg$table(idx).NO_ENSEIGNANT_ASSESSEUR := cg$rec.NO_ENSEIGNANT_ASSESSEUR;
        cg$tableind(idx).NO_ENSEIGNANT_ASSESSEUR := cg$ind.NO_ENSEIGNANT_ASSESSEUR;
        cg$table(idx).DATE_SOUTENANCE := cg$rec.DATE_SOUTENANCE;
        cg$tableind(idx).DATE_SOUTENANCE := cg$ind.DATE_SOUTENANCE;
        cg$table(idx).PLAGE_HORAIRE := cg$rec.PLAGE_HORAIRE;
        cg$tableind(idx).PLAGE_HORAIRE := cg$ind.PLAGE_HORAIRE;
        cg$table(idx).SALLE := cg$rec.SALLE;
        cg$tableind(idx).SALLE := cg$ind.SALLE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$SOUTENANCE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$SOUTENANCE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$SOUTENANCE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$SOUTENANCE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SOUTENANCE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of SOUTENANCE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for SOUTENANCE's domain key constraint columns 
--              cg$ind      Indicates changed SOUTENANCE's domain key constraint columns
--              cg$old_rec  Current values for SOUTENANCE's domain key constraint columns
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
           cg$rec.NO_SESSION := cg$pk.NO_SESSION;
           cg$rec.ANNEE_PRO := cg$pk.ANNEE_PRO;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE SOUTENANCE
              WHERE                    NO_SESSION = cg$pk.NO_SESSION
              AND          ANNEE_PRO = cg$pk.ANNEE_PRO;
           ELSE
              DELETE SOUTENANCE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$SOUTENANCE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SOUTENANCE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SOUTENANCE.del.others');
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
               ,            NO_SESSION
               ,            NO_ENSEIGNANT_RESPONSABLE
               ,            NO_ENSEIGNANT_ASSESSEUR
               ,            DATE_SOUTENANCE
               ,            PLAGE_HORAIRE
               ,            SALLE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NO_ENSEIGNANT_RESPONSABLE
               ,            cg$tmp_rec.NO_ENSEIGNANT_ASSESSEUR
               ,            cg$tmp_rec.DATE_SOUTENANCE
               ,            cg$tmp_rec.PLAGE_HORAIRE
               ,            cg$tmp_rec.SALLE
               FROM      SOUTENANCE
               WHERE              NO_SESSION = cg$old_rec.NO_SESSION
               AND          ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ANNEE_PRO
               ,            NO_SESSION
               ,            NO_ENSEIGNANT_RESPONSABLE
               ,            NO_ENSEIGNANT_ASSESSEUR
               ,            DATE_SOUTENANCE
               ,            PLAGE_HORAIRE
               ,            SALLE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NO_ENSEIGNANT_RESPONSABLE
               ,            cg$tmp_rec.NO_ENSEIGNANT_ASSESSEUR
               ,            cg$tmp_rec.DATE_SOUTENANCE
               ,            cg$tmp_rec.PLAGE_HORAIRE
               ,            cg$tmp_rec.SALLE
               FROM      SOUTENANCE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ANNEE_PRO
               ,            NO_SESSION
               ,            NO_ENSEIGNANT_RESPONSABLE
               ,            NO_ENSEIGNANT_ASSESSEUR
               ,            DATE_SOUTENANCE
               ,            PLAGE_HORAIRE
               ,            SALLE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NO_ENSEIGNANT_RESPONSABLE
               ,            cg$tmp_rec.NO_ENSEIGNANT_ASSESSEUR
               ,            cg$tmp_rec.DATE_SOUTENANCE
               ,            cg$tmp_rec.PLAGE_HORAIRE
               ,            cg$tmp_rec.SALLE
               FROM      SOUTENANCE
               WHERE              NO_SESSION = cg$old_rec.NO_SESSION
               AND          ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE;
            ELSE
               SELECT       ANNEE_PRO
               ,            NO_SESSION
               ,            NO_ENSEIGNANT_RESPONSABLE
               ,            NO_ENSEIGNANT_ASSESSEUR
               ,            DATE_SOUTENANCE
               ,            PLAGE_HORAIRE
               ,            SALLE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NO_ENSEIGNANT_RESPONSABLE
               ,            cg$tmp_rec.NO_ENSEIGNANT_ASSESSEUR
               ,            cg$tmp_rec.DATE_SOUTENANCE
               ,            cg$tmp_rec.PLAGE_HORAIRE
               ,            cg$tmp_rec.SALLE
               FROM      SOUTENANCE
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
                           'cg$SOUTENANCE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$SOUTENANCE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$SOUTENANCE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns


-- Mandatory Columns

    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P8ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_SESSION) THEN
        IF (cg$tmp_rec.NO_SESSION != cg$old_rec.NO_SESSION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_SESSION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT_RESPONSABLE) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT_RESPONSABLE != cg$old_rec.NO_ENSEIGNANT_RESPONSABLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_ENSEIGNANT_RESPONSABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT_ASSESSEUR) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT_ASSESSEUR != cg$old_rec.NO_ENSEIGNANT_ASSESSEUR) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_ENSEIGNANT_ASSESSEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_SOUTENANCE) THEN
        IF (cg$tmp_rec.DATE_SOUTENANCE != cg$old_rec.DATE_SOUTENANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30DATE_SOUTENANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PLAGE_HORAIRE) THEN
        IF (cg$tmp_rec.PLAGE_HORAIRE != cg$old_rec.PLAGE_HORAIRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40PLAGE_HORAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SALLE) THEN
        IF (cg$tmp_rec.SALLE != cg$old_rec.SALLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50SALLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SOUTENANCE.lck');
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
      cg$ind_true.NO_SESSION := TRUE;
      cg$ind_true.NO_ENSEIGNANT_RESPONSABLE := TRUE;
      cg$ind_true.NO_ENSEIGNANT_ASSESSEUR := TRUE;
      cg$ind_true.DATE_SOUTENANCE := TRUE;
      cg$ind_true.PLAGE_HORAIRE := TRUE;
      cg$ind_true.SALLE := TRUE;
   

END cg$SOUTENANCE;
/

