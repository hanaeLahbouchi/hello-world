
PROMPT Creating API Package Body for Table 'VERSION'
--------------------------------------------------------------------------------
-- Name:        cg$VERSION
-- Description: VERSION table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$VERSION IS

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
                   'cg$VERSION.raise_uk_not_updateable');
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
                   'cg$VERSION.raise_fk_not_transferable');
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
			IF (cg$ind.NO_VPRO = FALSE
      OR  cg$rec.NO_VPRO is NULL) THEN 
				SELECT VER_SEQ.nextval
				INTO   cg$rec.NO_VPRO
				FROM   DUAL;
				cg$ind.NO_VPRO := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$VERSION.up_autogen.NO_VPRO.OTHERS');
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
                    'cg$VERSION.up_autogen_columns');
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
    IF (cg$val_rec.NO_VPRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_VPRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_CRR IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NO_CRR),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_VERSION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30NO_VERSION),
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
       SELECT    NO_VPRO
       ,         NO_CRR
       ,         NO_VERSION
       ,         DATE_LIVRAISON_SOUHAITEE
       ,         DATE_RECEPTION_PAPIER
       ,         DATE_RECEPTION_NUMERIQUE
       ,         REFERENCE
       ,         ETAT_EVALUATION
       ,         DATE_EVALUATION
       ,         COMMENTAIRE_EVALUATION
       ,         DATE_DEBRIEFING
       ,         NOTE_FORMATIVE
       , rowid
       INTO      cg$sel_rec.NO_VPRO
       ,         cg$sel_rec.NO_CRR
       ,         cg$sel_rec.NO_VERSION
       ,         cg$sel_rec.DATE_LIVRAISON_SOUHAITEE
       ,         cg$sel_rec.DATE_RECEPTION_PAPIER
       ,         cg$sel_rec.DATE_RECEPTION_NUMERIQUE
       ,         cg$sel_rec.REFERENCE
       ,         cg$sel_rec.ETAT_EVALUATION
       ,         cg$sel_rec.DATE_EVALUATION
       ,         cg$sel_rec.COMMENTAIRE_EVALUATION
       ,         cg$sel_rec.DATE_DEBRIEFING
       ,         cg$sel_rec.NOTE_FORMATIVE
       ,cg$sel_rec.the_rowid
       FROM   VERSION
       WHERE        NO_VPRO = cg$sel_rec.NO_VPRO;
    ELSE
       SELECT    NO_VPRO
       ,         NO_CRR
       ,         NO_VERSION
       ,         DATE_LIVRAISON_SOUHAITEE
       ,         DATE_RECEPTION_PAPIER
       ,         DATE_RECEPTION_NUMERIQUE
       ,         REFERENCE
       ,         ETAT_EVALUATION
       ,         DATE_EVALUATION
       ,         COMMENTAIRE_EVALUATION
       ,         DATE_DEBRIEFING
       ,         NOTE_FORMATIVE
       , rowid
       INTO      cg$sel_rec.NO_VPRO
       ,         cg$sel_rec.NO_CRR
       ,         cg$sel_rec.NO_VERSION
       ,         cg$sel_rec.DATE_LIVRAISON_SOUHAITEE
       ,         cg$sel_rec.DATE_RECEPTION_PAPIER
       ,         cg$sel_rec.DATE_RECEPTION_NUMERIQUE
       ,         cg$sel_rec.REFERENCE
       ,         cg$sel_rec.ETAT_EVALUATION
       ,         cg$sel_rec.DATE_EVALUATION
       ,         cg$sel_rec.COMMENTAIRE_EVALUATION
       ,         cg$sel_rec.DATE_DEBRIEFING
       ,         cg$sel_rec.NOTE_FORMATIVE
       ,cg$sel_rec.the_rowid
       FROM   VERSION
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$VERSION.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to VERSION 
--
-- Parameters:  cg$rec     Record of VERSION current values
--              cg$old_rec Record of VERSION previous values
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
--              of each child table that references this tableVERSION 
--
-- Parameters:  cg$old_rec     Record of VERSION current values
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
--              child table that references this table VERSION 
--
-- Parameters:  cg$new_rec  New values for VERSION's domain key constraint columns 
--              cg$new_ind  Indicates changed VERSION's domain key constraint columns
--              cg$old_rec  Current values for VERSION's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to VERSION 
--
-- Parameters:  cg$rec     Record of VERSION current values
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
--              child table that references this tableVERSION 
--
-- Parameters:  cg$old_rec     Record of VERSION current values
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
--              of each child table that references this tableVERSION 
--
-- Parameters:  cg$old_rec     Record of VERSION current values
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
-- Parameters:  cg$rec     Record of VERSION current values
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
-- Parameters:  cg$rec     Record of VERSION current values
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
    IF (cg$ind.ETAT_EVALUATION AND cg$rec.ETAT_EVALUATION IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'ETAT_EVA_CRR' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.ETAT_EVALUATION = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.ETAT_EVALUATION BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.ETAT_EVALUATION,'VERSION','ETAT_EVALUATION'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$VERSION.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','VERSION'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$VERSION.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$VERSION.v_domain.others');
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
    IF (con_name = 'VER_PK') THEN
        cg$errors.push(nvl(VER_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'VER_PK' 
                                     ,'VERSION')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'VER_CRR_FK') THEN
        cg$errors.push(nvl(VER_CRR_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'VER_CRR_FK' 
                                     ,'VERSION')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'VER_CODN_FK') THEN
        cg$errors.push(nvl(VER_CODN_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'VER_CODN_FK' 
                                     ,'VERSION')),
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

D80_ETAT_EVALUATION CONSTANT VERSION.ETAT_EVALUATION%TYPE := 'Non Défini';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ETAT_EVALUATION) THEN cg$rec.ETAT_EVALUATION := D80_ETAT_EVALUATION; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO VERSION
            (NO_VPRO
            ,NO_CRR
            ,NO_VERSION
            ,DATE_LIVRAISON_SOUHAITEE
            ,DATE_RECEPTION_PAPIER
            ,DATE_RECEPTION_NUMERIQUE
            ,REFERENCE
            ,ETAT_EVALUATION
            ,DATE_EVALUATION
            ,COMMENTAIRE_EVALUATION
            ,DATE_DEBRIEFING
            ,NOTE_FORMATIVE)
        VALUES
            (cg$rec.NO_VPRO
            ,cg$rec.NO_CRR
            ,cg$rec.NO_VERSION
            ,cg$rec.DATE_LIVRAISON_SOUHAITEE
            ,cg$rec.DATE_RECEPTION_PAPIER
            ,cg$rec.DATE_RECEPTION_NUMERIQUE
            ,cg$rec.REFERENCE
            ,cg$rec.ETAT_EVALUATION
            ,cg$rec.DATE_EVALUATION
            ,cg$rec.COMMENTAIRE_EVALUATION
            ,cg$rec.DATE_DEBRIEFING
            ,cg$rec.NOTE_FORMATIVE
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
        validate_mandatory(cg$rec, 'cg$VERSION.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$VERSION.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$VERSION.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$VERSION.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$VERSION.ins.others');
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

 
    IF ( cg$pk.NO_VPRO IS NULL ) THEN          
      cg$upd_rec.NO_VPRO := cg$rec.NO_VPRO;
    ELSE
      cg$upd_rec.NO_VPRO := cg$pk.NO_VPRO;
    END IF;
    cg$old_rec.NO_VPRO := cg$upd_rec.NO_VPRO;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key VER_PK
        IF (cg$ind.NO_VPRO AND cg$rec.NO_VPRO != cg$upd_rec.NO_VPRO) THEN
            raise_uk_not_updateable('VER_PK');
        END IF;
        IF NOT (cg$ind.NO_VPRO) THEN
            cg$rec.NO_VPRO := cg$upd_rec.NO_VPRO;
        END IF;
        IF NOT (cg$ind.NO_CRR) THEN
            cg$rec.NO_CRR := cg$upd_rec.NO_CRR;
        END IF;
        IF NOT (cg$ind.NO_VERSION) THEN
            cg$rec.NO_VERSION := cg$upd_rec.NO_VERSION;
        END IF;
        IF NOT (cg$ind.DATE_LIVRAISON_SOUHAITEE) THEN
            cg$rec.DATE_LIVRAISON_SOUHAITEE := cg$upd_rec.DATE_LIVRAISON_SOUHAITEE;
        END IF;
        IF NOT (cg$ind.DATE_RECEPTION_PAPIER) THEN
            cg$rec.DATE_RECEPTION_PAPIER := cg$upd_rec.DATE_RECEPTION_PAPIER;
        END IF;
        IF NOT (cg$ind.DATE_RECEPTION_NUMERIQUE) THEN
            cg$rec.DATE_RECEPTION_NUMERIQUE := cg$upd_rec.DATE_RECEPTION_NUMERIQUE;
        END IF;
        IF NOT (cg$ind.REFERENCE) THEN
            cg$rec.REFERENCE := cg$upd_rec.REFERENCE;
        END IF;
        IF NOT (cg$ind.ETAT_EVALUATION) THEN
            cg$rec.ETAT_EVALUATION := cg$upd_rec.ETAT_EVALUATION;
        END IF;
        IF NOT (cg$ind.DATE_EVALUATION) THEN
            cg$rec.DATE_EVALUATION := cg$upd_rec.DATE_EVALUATION;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE_EVALUATION) THEN
            cg$rec.COMMENTAIRE_EVALUATION := cg$upd_rec.COMMENTAIRE_EVALUATION;
        END IF;
        IF NOT (cg$ind.DATE_DEBRIEFING) THEN
            cg$rec.DATE_DEBRIEFING := cg$upd_rec.DATE_DEBRIEFING;
        END IF;
        IF NOT (cg$ind.NOTE_FORMATIVE) THEN
            cg$rec.NOTE_FORMATIVE := cg$upd_rec.NOTE_FORMATIVE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key VER_PK
        IF ( cg$ind.NO_VPRO ) THEN
          raise_uk_not_updateable('VER_PK');
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
            UPDATE VERSION
            SET
              NO_CRR = cg$rec.NO_CRR
              ,NO_VERSION = cg$rec.NO_VERSION
              ,DATE_LIVRAISON_SOUHAITEE = cg$rec.DATE_LIVRAISON_SOUHAITEE
              ,DATE_RECEPTION_PAPIER = cg$rec.DATE_RECEPTION_PAPIER
              ,DATE_RECEPTION_NUMERIQUE = cg$rec.DATE_RECEPTION_NUMERIQUE
              ,REFERENCE = cg$rec.REFERENCE
              ,ETAT_EVALUATION = cg$rec.ETAT_EVALUATION
              ,DATE_EVALUATION = cg$rec.DATE_EVALUATION
              ,COMMENTAIRE_EVALUATION = cg$rec.COMMENTAIRE_EVALUATION
              ,DATE_DEBRIEFING = cg$rec.DATE_DEBRIEFING
              ,NOTE_FORMATIVE = cg$rec.NOTE_FORMATIVE
            WHERE  NO_VPRO = cg$rec.NO_VPRO;
            null;
          ELSE
            UPDATE VERSION
            SET
              NO_CRR = cg$rec.NO_CRR
              ,NO_VERSION = cg$rec.NO_VERSION
              ,DATE_LIVRAISON_SOUHAITEE = cg$rec.DATE_LIVRAISON_SOUHAITEE
              ,DATE_RECEPTION_PAPIER = cg$rec.DATE_RECEPTION_PAPIER
              ,DATE_RECEPTION_NUMERIQUE = cg$rec.DATE_RECEPTION_NUMERIQUE
              ,REFERENCE = cg$rec.REFERENCE
              ,ETAT_EVALUATION = cg$rec.ETAT_EVALUATION
              ,DATE_EVALUATION = cg$rec.DATE_EVALUATION
              ,COMMENTAIRE_EVALUATION = cg$rec.COMMENTAIRE_EVALUATION
              ,DATE_DEBRIEFING = cg$rec.DATE_DEBRIEFING
              ,NOTE_FORMATIVE = cg$rec.NOTE_FORMATIVE
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
        cg$table(idx).NO_VPRO := cg$rec.NO_VPRO;
        cg$tableind(idx).NO_VPRO := cg$ind.NO_VPRO;
        cg$table(idx).NO_CRR := cg$rec.NO_CRR;
        cg$tableind(idx).NO_CRR := cg$ind.NO_CRR;
        cg$table(idx).NO_VERSION := cg$rec.NO_VERSION;
        cg$tableind(idx).NO_VERSION := cg$ind.NO_VERSION;
        cg$table(idx).DATE_LIVRAISON_SOUHAITEE := cg$rec.DATE_LIVRAISON_SOUHAITEE;
        cg$tableind(idx).DATE_LIVRAISON_SOUHAITEE := cg$ind.DATE_LIVRAISON_SOUHAITEE;
        cg$table(idx).DATE_RECEPTION_PAPIER := cg$rec.DATE_RECEPTION_PAPIER;
        cg$tableind(idx).DATE_RECEPTION_PAPIER := cg$ind.DATE_RECEPTION_PAPIER;
        cg$table(idx).DATE_RECEPTION_NUMERIQUE := cg$rec.DATE_RECEPTION_NUMERIQUE;
        cg$tableind(idx).DATE_RECEPTION_NUMERIQUE := cg$ind.DATE_RECEPTION_NUMERIQUE;
        cg$table(idx).REFERENCE := cg$rec.REFERENCE;
        cg$tableind(idx).REFERENCE := cg$ind.REFERENCE;
        cg$table(idx).ETAT_EVALUATION := cg$rec.ETAT_EVALUATION;
        cg$tableind(idx).ETAT_EVALUATION := cg$ind.ETAT_EVALUATION;
        cg$table(idx).DATE_EVALUATION := cg$rec.DATE_EVALUATION;
        cg$tableind(idx).DATE_EVALUATION := cg$ind.DATE_EVALUATION;
        cg$table(idx).COMMENTAIRE_EVALUATION := cg$rec.COMMENTAIRE_EVALUATION;
        cg$tableind(idx).COMMENTAIRE_EVALUATION := cg$ind.COMMENTAIRE_EVALUATION;
        cg$table(idx).DATE_DEBRIEFING := cg$rec.DATE_DEBRIEFING;
        cg$tableind(idx).DATE_DEBRIEFING := cg$ind.DATE_DEBRIEFING;
        cg$table(idx).NOTE_FORMATIVE := cg$rec.NOTE_FORMATIVE;
        cg$tableind(idx).NOTE_FORMATIVE := cg$ind.NOTE_FORMATIVE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$VERSION.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$VERSION.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$VERSION.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$VERSION.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$VERSION.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of VERSION when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for VERSION's domain key constraint columns 
--              cg$ind      Indicates changed VERSION's domain key constraint columns
--              cg$old_rec  Current values for VERSION's domain key constraint columns
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
           cg$rec.NO_VPRO := cg$pk.NO_VPRO;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE VERSION
              WHERE                    NO_VPRO = cg$pk.NO_VPRO;
           ELSE
              DELETE VERSION
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$VERSION.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$VERSION.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$VERSION.del.others');
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
               SELECT       NO_VPRO
               ,            NO_CRR
               ,            NO_VERSION
               ,            DATE_LIVRAISON_SOUHAITEE
               ,            DATE_RECEPTION_PAPIER
               ,            DATE_RECEPTION_NUMERIQUE
               ,            REFERENCE
               ,            ETAT_EVALUATION
               ,            DATE_EVALUATION
               ,            COMMENTAIRE_EVALUATION
               ,            DATE_DEBRIEFING
               ,            NOTE_FORMATIVE
               INTO         cg$tmp_rec.NO_VPRO
               ,            cg$tmp_rec.NO_CRR
               ,            cg$tmp_rec.NO_VERSION
               ,            cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE
               ,            cg$tmp_rec.DATE_RECEPTION_PAPIER
               ,            cg$tmp_rec.DATE_RECEPTION_NUMERIQUE
               ,            cg$tmp_rec.REFERENCE
               ,            cg$tmp_rec.ETAT_EVALUATION
               ,            cg$tmp_rec.DATE_EVALUATION
               ,            cg$tmp_rec.COMMENTAIRE_EVALUATION
               ,            cg$tmp_rec.DATE_DEBRIEFING
               ,            cg$tmp_rec.NOTE_FORMATIVE
               FROM      VERSION
               WHERE              NO_VPRO = cg$old_rec.NO_VPRO
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_VPRO
               ,            NO_CRR
               ,            NO_VERSION
               ,            DATE_LIVRAISON_SOUHAITEE
               ,            DATE_RECEPTION_PAPIER
               ,            DATE_RECEPTION_NUMERIQUE
               ,            REFERENCE
               ,            ETAT_EVALUATION
               ,            DATE_EVALUATION
               ,            COMMENTAIRE_EVALUATION
               ,            DATE_DEBRIEFING
               ,            NOTE_FORMATIVE
               INTO         cg$tmp_rec.NO_VPRO
               ,            cg$tmp_rec.NO_CRR
               ,            cg$tmp_rec.NO_VERSION
               ,            cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE
               ,            cg$tmp_rec.DATE_RECEPTION_PAPIER
               ,            cg$tmp_rec.DATE_RECEPTION_NUMERIQUE
               ,            cg$tmp_rec.REFERENCE
               ,            cg$tmp_rec.ETAT_EVALUATION
               ,            cg$tmp_rec.DATE_EVALUATION
               ,            cg$tmp_rec.COMMENTAIRE_EVALUATION
               ,            cg$tmp_rec.DATE_DEBRIEFING
               ,            cg$tmp_rec.NOTE_FORMATIVE
               FROM      VERSION
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_VPRO
               ,            NO_CRR
               ,            NO_VERSION
               ,            DATE_LIVRAISON_SOUHAITEE
               ,            DATE_RECEPTION_PAPIER
               ,            DATE_RECEPTION_NUMERIQUE
               ,            REFERENCE
               ,            ETAT_EVALUATION
               ,            DATE_EVALUATION
               ,            COMMENTAIRE_EVALUATION
               ,            DATE_DEBRIEFING
               ,            NOTE_FORMATIVE
               INTO         cg$tmp_rec.NO_VPRO
               ,            cg$tmp_rec.NO_CRR
               ,            cg$tmp_rec.NO_VERSION
               ,            cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE
               ,            cg$tmp_rec.DATE_RECEPTION_PAPIER
               ,            cg$tmp_rec.DATE_RECEPTION_NUMERIQUE
               ,            cg$tmp_rec.REFERENCE
               ,            cg$tmp_rec.ETAT_EVALUATION
               ,            cg$tmp_rec.DATE_EVALUATION
               ,            cg$tmp_rec.COMMENTAIRE_EVALUATION
               ,            cg$tmp_rec.DATE_DEBRIEFING
               ,            cg$tmp_rec.NOTE_FORMATIVE
               FROM      VERSION
               WHERE              NO_VPRO = cg$old_rec.NO_VPRO
               FOR UPDATE;
            ELSE
               SELECT       NO_VPRO
               ,            NO_CRR
               ,            NO_VERSION
               ,            DATE_LIVRAISON_SOUHAITEE
               ,            DATE_RECEPTION_PAPIER
               ,            DATE_RECEPTION_NUMERIQUE
               ,            REFERENCE
               ,            ETAT_EVALUATION
               ,            DATE_EVALUATION
               ,            COMMENTAIRE_EVALUATION
               ,            DATE_DEBRIEFING
               ,            NOTE_FORMATIVE
               INTO         cg$tmp_rec.NO_VPRO
               ,            cg$tmp_rec.NO_CRR
               ,            cg$tmp_rec.NO_VERSION
               ,            cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE
               ,            cg$tmp_rec.DATE_RECEPTION_PAPIER
               ,            cg$tmp_rec.DATE_RECEPTION_NUMERIQUE
               ,            cg$tmp_rec.REFERENCE
               ,            cg$tmp_rec.ETAT_EVALUATION
               ,            cg$tmp_rec.DATE_EVALUATION
               ,            cg$tmp_rec.COMMENTAIRE_EVALUATION
               ,            cg$tmp_rec.DATE_DEBRIEFING
               ,            cg$tmp_rec.NOTE_FORMATIVE
               FROM      VERSION
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
                           'cg$VERSION.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$VERSION.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$VERSION.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DATE_LIVRAISON_SOUHAITEE) THEN
        IF (cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE IS NOT NULL
        AND cg$old_rec.DATE_LIVRAISON_SOUHAITEE IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE != cg$old_rec.DATE_LIVRAISON_SOUHAITEE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DATE_LIVRAISON_SOUHAITEE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_LIVRAISON_SOUHAITEE IS NOT NULL
        OR cg$old_rec.DATE_LIVRAISON_SOUHAITEE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DATE_LIVRAISON_SOUHAITEE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_RECEPTION_PAPIER) THEN
        IF (cg$tmp_rec.DATE_RECEPTION_PAPIER IS NOT NULL
        AND cg$old_rec.DATE_RECEPTION_PAPIER IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_RECEPTION_PAPIER != cg$old_rec.DATE_RECEPTION_PAPIER) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_RECEPTION_PAPIER
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_RECEPTION_PAPIER IS NOT NULL
        OR cg$old_rec.DATE_RECEPTION_PAPIER IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_RECEPTION_PAPIER
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_RECEPTION_NUMERIQUE) THEN
        IF (cg$tmp_rec.DATE_RECEPTION_NUMERIQUE IS NOT NULL
        AND cg$old_rec.DATE_RECEPTION_NUMERIQUE IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_RECEPTION_NUMERIQUE != cg$old_rec.DATE_RECEPTION_NUMERIQUE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DATE_RECEPTION_NUMERIQUE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_RECEPTION_NUMERIQUE IS NOT NULL
        OR cg$old_rec.DATE_RECEPTION_NUMERIQUE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DATE_RECEPTION_NUMERIQUE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.REFERENCE) THEN
        IF (cg$tmp_rec.REFERENCE IS NOT NULL
        AND cg$old_rec.REFERENCE IS NOT NULL) THEN
            IF (cg$tmp_rec.REFERENCE != cg$old_rec.REFERENCE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70REFERENCE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.REFERENCE IS NOT NULL
        OR cg$old_rec.REFERENCE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70REFERENCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_EVALUATION) THEN
        IF (cg$tmp_rec.ETAT_EVALUATION IS NOT NULL
        AND cg$old_rec.ETAT_EVALUATION IS NOT NULL) THEN
            IF (cg$tmp_rec.ETAT_EVALUATION != cg$old_rec.ETAT_EVALUATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80ETAT_EVALUATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ETAT_EVALUATION IS NOT NULL
        OR cg$old_rec.ETAT_EVALUATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80ETAT_EVALUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_EVALUATION) THEN
        IF (cg$tmp_rec.DATE_EVALUATION IS NOT NULL
        AND cg$old_rec.DATE_EVALUATION IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_EVALUATION != cg$old_rec.DATE_EVALUATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DATE_EVALUATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_EVALUATION IS NOT NULL
        OR cg$old_rec.DATE_EVALUATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DATE_EVALUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE_EVALUATION) THEN
        IF (cg$tmp_rec.COMMENTAIRE_EVALUATION IS NOT NULL
        AND cg$old_rec.COMMENTAIRE_EVALUATION IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE_EVALUATION != cg$old_rec.COMMENTAIRE_EVALUATION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100COMMENTAIRE_EVALUATION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE_EVALUATION IS NOT NULL
        OR cg$old_rec.COMMENTAIRE_EVALUATION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100COMMENTAIRE_EVALUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_DEBRIEFING) THEN
        IF (cg$tmp_rec.DATE_DEBRIEFING IS NOT NULL
        AND cg$old_rec.DATE_DEBRIEFING IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_DEBRIEFING != cg$old_rec.DATE_DEBRIEFING) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110DATE_DEBRIEFING
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_DEBRIEFING IS NOT NULL
        OR cg$old_rec.DATE_DEBRIEFING IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110DATE_DEBRIEFING
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOTE_FORMATIVE) THEN
        IF (cg$tmp_rec.NOTE_FORMATIVE IS NOT NULL
        AND cg$old_rec.NOTE_FORMATIVE IS NOT NULL) THEN
            IF (cg$tmp_rec.NOTE_FORMATIVE != cg$old_rec.NOTE_FORMATIVE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120NOTE_FORMATIVE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOTE_FORMATIVE IS NOT NULL
        OR cg$old_rec.NOTE_FORMATIVE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120NOTE_FORMATIVE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_VPRO) THEN
        IF (cg$tmp_rec.NO_VPRO != cg$old_rec.NO_VPRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_VPRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_CRR) THEN
        IF (cg$tmp_rec.NO_CRR != cg$old_rec.NO_CRR) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_CRR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_VERSION) THEN
        IF (cg$tmp_rec.NO_VERSION != cg$old_rec.NO_VERSION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_VERSION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$VERSION.lck');
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
      cg$ind_true.NO_VPRO := TRUE;
      cg$ind_true.NO_CRR := TRUE;
      cg$ind_true.NO_VERSION := TRUE;
      cg$ind_true.DATE_LIVRAISON_SOUHAITEE := TRUE;
      cg$ind_true.DATE_RECEPTION_PAPIER := TRUE;
      cg$ind_true.DATE_RECEPTION_NUMERIQUE := TRUE;
      cg$ind_true.REFERENCE := TRUE;
      cg$ind_true.ETAT_EVALUATION := TRUE;
      cg$ind_true.DATE_EVALUATION := TRUE;
      cg$ind_true.COMMENTAIRE_EVALUATION := TRUE;
      cg$ind_true.DATE_DEBRIEFING := TRUE;
      cg$ind_true.NOTE_FORMATIVE := TRUE;
   

END cg$VERSION;
/

