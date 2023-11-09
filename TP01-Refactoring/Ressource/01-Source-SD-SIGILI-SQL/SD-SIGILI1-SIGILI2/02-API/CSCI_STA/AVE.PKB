
PROMPT Creating API Package Body for Table 'AVENANT'
--------------------------------------------------------------------------------
-- Name:        cg$AVENANT
-- Description: AVENANT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$AVENANT IS

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
                   'cg$AVENANT.raise_uk_not_updateable');
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
                   'cg$AVENANT.raise_fk_not_transferable');
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
			IF (cg$ind.NO_AVENANT = FALSE
      OR  cg$rec.NO_AVENANT is NULL) THEN 
				SELECT AVE_SEQ.nextval
				INTO   cg$rec.NO_AVENANT
				FROM   DUAL;
				cg$ind.NO_AVENANT := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$AVENANT.up_autogen.NO_AVENANT.OTHERS');
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
                    'cg$AVENANT.up_autogen_columns');
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
    IF (cg$val_rec.NO_AVENANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_AVENANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ANNEE_PRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ETUDIANT_NAT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P25NO_ETUDIANT_NAT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ETAT_AVENANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P27ETAT_AVENANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NUM_ARTICLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30NUM_ARTICLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.MODIF_APPORTEE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50MODIF_APPORTEE),
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
       SELECT    NO_AVENANT
       ,         ANNEE_PRO
       ,         NO_ETUDIANT_NAT
       ,         ETAT_AVENANT
       ,         NUM_ARTICLE
       ,         DATE_SIGNATURE_AVE
       ,         MODIF_APPORTEE
       ,         COMMENTAIRE
       , rowid
       INTO      cg$sel_rec.NO_AVENANT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ETAT_AVENANT
       ,         cg$sel_rec.NUM_ARTICLE
       ,         cg$sel_rec.DATE_SIGNATURE_AVE
       ,         cg$sel_rec.MODIF_APPORTEE
       ,         cg$sel_rec.COMMENTAIRE
       ,cg$sel_rec.the_rowid
       FROM   AVENANT
       WHERE        NO_AVENANT = cg$sel_rec.NO_AVENANT;
    ELSE
       SELECT    NO_AVENANT
       ,         ANNEE_PRO
       ,         NO_ETUDIANT_NAT
       ,         ETAT_AVENANT
       ,         NUM_ARTICLE
       ,         DATE_SIGNATURE_AVE
       ,         MODIF_APPORTEE
       ,         COMMENTAIRE
       , rowid
       INTO      cg$sel_rec.NO_AVENANT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ETAT_AVENANT
       ,         cg$sel_rec.NUM_ARTICLE
       ,         cg$sel_rec.DATE_SIGNATURE_AVE
       ,         cg$sel_rec.MODIF_APPORTEE
       ,         cg$sel_rec.COMMENTAIRE
       ,cg$sel_rec.the_rowid
       FROM   AVENANT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$AVENANT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to AVENANT 
--
-- Parameters:  cg$rec     Record of AVENANT current values
--              cg$old_rec Record of AVENANT previous values
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
--              of each child table that references this tableAVENANT 
--
-- Parameters:  cg$old_rec     Record of AVENANT current values
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
--              child table that references this table AVENANT 
--
-- Parameters:  cg$new_rec  New values for AVENANT's domain key constraint columns 
--              cg$new_ind  Indicates changed AVENANT's domain key constraint columns
--              cg$old_rec  Current values for AVENANT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to AVENANT 
--
-- Parameters:  cg$rec     Record of AVENANT current values
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
--              child table that references this tableAVENANT 
--
-- Parameters:  cg$old_rec     Record of AVENANT current values
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
--              of each child table that references this tableAVENANT 
--
-- Parameters:  cg$old_rec     Record of AVENANT current values
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
-- Parameters:  cg$rec     Record of AVENANT current values
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
-- Parameters:  cg$rec     Record of AVENANT current values
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
    IF (cg$ind.ETAT_AVENANT AND cg$rec.ETAT_AVENANT IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'ETAT_CONVENTION' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.ETAT_AVENANT = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.ETAT_AVENANT BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.ETAT_AVENANT,'AVENANT','ETAT_AVENANT'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$AVENANT.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','AVENANT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$AVENANT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AVENANT.v_domain.others');
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
    IF (con_name = 'AVE_PK') THEN
        cg$errors.push(nvl(AVE_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'AVE_PK' 
                                     ,'AVENANT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'AVE_STG_FK') THEN
        cg$errors.push(nvl(AVE_STG_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'AVE_STG_FK' 
                                     ,'AVENANT')),
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

D27_ETAT_AVENANT CONSTANT AVENANT.ETAT_AVENANT%TYPE := 'ELA';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ETAT_AVENANT) THEN cg$rec.ETAT_AVENANT := D27_ETAT_AVENANT; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO AVENANT
            (NO_AVENANT
            ,ANNEE_PRO
            ,NO_ETUDIANT_NAT
            ,ETAT_AVENANT
            ,NUM_ARTICLE
            ,DATE_SIGNATURE_AVE
            ,MODIF_APPORTEE
            ,COMMENTAIRE)
        VALUES
            (cg$rec.NO_AVENANT
            ,cg$rec.ANNEE_PRO
            ,cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.ETAT_AVENANT
            ,cg$rec.NUM_ARTICLE
            ,cg$rec.DATE_SIGNATURE_AVE
            ,cg$rec.MODIF_APPORTEE
            ,cg$rec.COMMENTAIRE
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
        validate_mandatory(cg$rec, 'cg$AVENANT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$AVENANT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$AVENANT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$AVENANT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AVENANT.ins.others');
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

 
    IF ( cg$pk.NO_AVENANT IS NULL ) THEN          
      cg$upd_rec.NO_AVENANT := cg$rec.NO_AVENANT;
    ELSE
      cg$upd_rec.NO_AVENANT := cg$pk.NO_AVENANT;
    END IF;
    cg$old_rec.NO_AVENANT := cg$upd_rec.NO_AVENANT;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key AVE_PK
        IF (cg$ind.NO_AVENANT AND cg$rec.NO_AVENANT != cg$upd_rec.NO_AVENANT) THEN
            raise_uk_not_updateable('AVE_PK');
        END IF;
        IF NOT (cg$ind.NO_AVENANT) THEN
            cg$rec.NO_AVENANT := cg$upd_rec.NO_AVENANT;
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.ETAT_AVENANT) THEN
            cg$rec.ETAT_AVENANT := cg$upd_rec.ETAT_AVENANT;
        END IF;
        IF NOT (cg$ind.NUM_ARTICLE) THEN
            cg$rec.NUM_ARTICLE := cg$upd_rec.NUM_ARTICLE;
        END IF;
        IF NOT (cg$ind.DATE_SIGNATURE_AVE) THEN
            cg$rec.DATE_SIGNATURE_AVE := cg$upd_rec.DATE_SIGNATURE_AVE;
        END IF;
        IF NOT (cg$ind.MODIF_APPORTEE) THEN
            cg$rec.MODIF_APPORTEE := cg$upd_rec.MODIF_APPORTEE;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE) THEN
            cg$rec.COMMENTAIRE := cg$upd_rec.COMMENTAIRE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key AVE_PK
        IF ( cg$ind.NO_AVENANT ) THEN
          raise_uk_not_updateable('AVE_PK');
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
            UPDATE AVENANT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,ETAT_AVENANT = cg$rec.ETAT_AVENANT
              ,NUM_ARTICLE = cg$rec.NUM_ARTICLE
              ,DATE_SIGNATURE_AVE = cg$rec.DATE_SIGNATURE_AVE
              ,MODIF_APPORTEE = cg$rec.MODIF_APPORTEE
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
            WHERE  NO_AVENANT = cg$rec.NO_AVENANT;
            null;
          ELSE
            UPDATE AVENANT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
              ,ETAT_AVENANT = cg$rec.ETAT_AVENANT
              ,NUM_ARTICLE = cg$rec.NUM_ARTICLE
              ,DATE_SIGNATURE_AVE = cg$rec.DATE_SIGNATURE_AVE
              ,MODIF_APPORTEE = cg$rec.MODIF_APPORTEE
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
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
        cg$table(idx).NO_AVENANT := cg$rec.NO_AVENANT;
        cg$tableind(idx).NO_AVENANT := cg$ind.NO_AVENANT;
        cg$table(idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
        cg$tableind(idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
        cg$table(idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
        cg$tableind(idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;
        cg$table(idx).ETAT_AVENANT := cg$rec.ETAT_AVENANT;
        cg$tableind(idx).ETAT_AVENANT := cg$ind.ETAT_AVENANT;
        cg$table(idx).NUM_ARTICLE := cg$rec.NUM_ARTICLE;
        cg$tableind(idx).NUM_ARTICLE := cg$ind.NUM_ARTICLE;
        cg$table(idx).DATE_SIGNATURE_AVE := cg$rec.DATE_SIGNATURE_AVE;
        cg$tableind(idx).DATE_SIGNATURE_AVE := cg$ind.DATE_SIGNATURE_AVE;
        cg$table(idx).MODIF_APPORTEE := cg$rec.MODIF_APPORTEE;
        cg$tableind(idx).MODIF_APPORTEE := cg$ind.MODIF_APPORTEE;
        cg$table(idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
        cg$tableind(idx).COMMENTAIRE := cg$ind.COMMENTAIRE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$AVENANT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$AVENANT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$AVENANT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$AVENANT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AVENANT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of AVENANT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for AVENANT's domain key constraint columns 
--              cg$ind      Indicates changed AVENANT's domain key constraint columns
--              cg$old_rec  Current values for AVENANT's domain key constraint columns
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
           cg$rec.NO_AVENANT := cg$pk.NO_AVENANT;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE AVENANT
              WHERE                    NO_AVENANT = cg$pk.NO_AVENANT;
           ELSE
              DELETE AVENANT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$AVENANT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AVENANT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$AVENANT.del.others');
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
               SELECT       NO_AVENANT
               ,            ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            ETAT_AVENANT
               ,            NUM_ARTICLE
               ,            DATE_SIGNATURE_AVE
               ,            MODIF_APPORTEE
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.NO_AVENANT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ETAT_AVENANT
               ,            cg$tmp_rec.NUM_ARTICLE
               ,            cg$tmp_rec.DATE_SIGNATURE_AVE
               ,            cg$tmp_rec.MODIF_APPORTEE
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      AVENANT
               WHERE              NO_AVENANT = cg$old_rec.NO_AVENANT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_AVENANT
               ,            ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            ETAT_AVENANT
               ,            NUM_ARTICLE
               ,            DATE_SIGNATURE_AVE
               ,            MODIF_APPORTEE
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.NO_AVENANT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ETAT_AVENANT
               ,            cg$tmp_rec.NUM_ARTICLE
               ,            cg$tmp_rec.DATE_SIGNATURE_AVE
               ,            cg$tmp_rec.MODIF_APPORTEE
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      AVENANT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_AVENANT
               ,            ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            ETAT_AVENANT
               ,            NUM_ARTICLE
               ,            DATE_SIGNATURE_AVE
               ,            MODIF_APPORTEE
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.NO_AVENANT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ETAT_AVENANT
               ,            cg$tmp_rec.NUM_ARTICLE
               ,            cg$tmp_rec.DATE_SIGNATURE_AVE
               ,            cg$tmp_rec.MODIF_APPORTEE
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      AVENANT
               WHERE              NO_AVENANT = cg$old_rec.NO_AVENANT
               FOR UPDATE;
            ELSE
               SELECT       NO_AVENANT
               ,            ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            ETAT_AVENANT
               ,            NUM_ARTICLE
               ,            DATE_SIGNATURE_AVE
               ,            MODIF_APPORTEE
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.NO_AVENANT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ETAT_AVENANT
               ,            cg$tmp_rec.NUM_ARTICLE
               ,            cg$tmp_rec.DATE_SIGNATURE_AVE
               ,            cg$tmp_rec.MODIF_APPORTEE
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      AVENANT
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
                           'cg$AVENANT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$AVENANT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$AVENANT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DATE_SIGNATURE_AVE) THEN
        IF (cg$tmp_rec.DATE_SIGNATURE_AVE IS NOT NULL
        AND cg$old_rec.DATE_SIGNATURE_AVE IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_SIGNATURE_AVE != cg$old_rec.DATE_SIGNATURE_AVE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DATE_SIGNATURE_AVE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_SIGNATURE_AVE IS NOT NULL
        OR cg$old_rec.DATE_SIGNATURE_AVE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DATE_SIGNATURE_AVE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE) THEN
        IF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        AND cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE != cg$old_rec.COMMENTAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70COMMENTAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        OR cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70COMMENTAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_AVENANT) THEN
        IF (cg$tmp_rec.NO_AVENANT != cg$old_rec.NO_AVENANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_AVENANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_AVENANT) THEN
        IF (cg$tmp_rec.ETAT_AVENANT != cg$old_rec.ETAT_AVENANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P27ETAT_AVENANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NUM_ARTICLE) THEN
        IF (cg$tmp_rec.NUM_ARTICLE != cg$old_rec.NUM_ARTICLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NUM_ARTICLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MODIF_APPORTEE) THEN
        IF (cg$tmp_rec.MODIF_APPORTEE != cg$old_rec.MODIF_APPORTEE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50MODIF_APPORTEE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$AVENANT.lck');
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
      cg$ind_true.NO_AVENANT := TRUE;
      cg$ind_true.ANNEE_PRO := TRUE;
      cg$ind_true.NO_ETUDIANT_NAT := TRUE;
      cg$ind_true.ETAT_AVENANT := TRUE;
      cg$ind_true.NUM_ARTICLE := TRUE;
      cg$ind_true.DATE_SIGNATURE_AVE := TRUE;
      cg$ind_true.MODIF_APPORTEE := TRUE;
      cg$ind_true.COMMENTAIRE := TRUE;
   

END cg$AVENANT;
/

