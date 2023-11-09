
PROMPT Creating API Package Body for Table 'INTERVENTION'
--------------------------------------------------------------------------------
-- Name:        cg$INTERVENTION
-- Description: INTERVENTION table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$INTERVENTION IS

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
                   'cg$INTERVENTION.raise_uk_not_updateable');
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
                   'cg$INTERVENTION.raise_fk_not_transferable');
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
			IF (cg$ind.ID_INTERVENTION = FALSE
      OR  cg$rec.ID_INTERVENTION is NULL) THEN 
				SELECT SEQ_INV.nextval
				INTO   cg$rec.ID_INTERVENTION
				FROM   DUAL;
				cg$ind.ID_INTERVENTION := TRUE;
			END IF;
    EXCEPTION WHEN others THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE,
                     'cg$INTERVENTION.up_autogen.ID_INTERVENTION.OTHERS');
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
                    'cg$INTERVENTION.up_autogen_columns');
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
    IF (cg$val_rec.ID_INTERVENTION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10ID_INTERVENTION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENSEIGNANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NO_ENSEIGNANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DEBUT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30DEBUT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SALLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60SALLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DOM_APP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70DOM_APP),
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
       SELECT    ID_INTERVENTION
       ,         NO_ENSEIGNANT
       ,         DEBUT
       ,         FIN
       ,         DUREE
       ,         SALLE
       ,         DOM_APP
       ,         COMMENTAIRE
       , rowid
       INTO      cg$sel_rec.ID_INTERVENTION
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.DEBUT
       ,         cg$sel_rec.FIN
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.SALLE
       ,         cg$sel_rec.DOM_APP
       ,         cg$sel_rec.COMMENTAIRE
       ,cg$sel_rec.the_rowid
       FROM   INTERVENTION
       WHERE        ID_INTERVENTION = cg$sel_rec.ID_INTERVENTION;
    ELSE
       SELECT    ID_INTERVENTION
       ,         NO_ENSEIGNANT
       ,         DEBUT
       ,         FIN
       ,         DUREE
       ,         SALLE
       ,         DOM_APP
       ,         COMMENTAIRE
       , rowid
       INTO      cg$sel_rec.ID_INTERVENTION
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.DEBUT
       ,         cg$sel_rec.FIN
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.SALLE
       ,         cg$sel_rec.DOM_APP
       ,         cg$sel_rec.COMMENTAIRE
       ,cg$sel_rec.the_rowid
       FROM   INTERVENTION
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$INTERVENTION.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to INTERVENTION 
--
-- Parameters:  cg$rec     Record of INTERVENTION current values
--              cg$old_rec Record of INTERVENTION previous values
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
--              of each child table that references this tableINTERVENTION 
--
-- Parameters:  cg$old_rec     Record of INTERVENTION current values
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
--              child table that references this table INTERVENTION 
--
-- Parameters:  cg$new_rec  New values for INTERVENTION's domain key constraint columns 
--              cg$new_ind  Indicates changed INTERVENTION's domain key constraint columns
--              cg$old_rec  Current values for INTERVENTION's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to INTERVENTION 
--
-- Parameters:  cg$rec     Record of INTERVENTION current values
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
--              child table that references this tableINTERVENTION 
--
-- Parameters:  cg$old_rec     Record of INTERVENTION current values
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
--              of each child table that references this tableINTERVENTION 
--
-- Parameters:  cg$old_rec     Record of INTERVENTION current values
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
-- Parameters:  cg$rec     Record of INTERVENTION current values
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
-- Parameters:  cg$rec     Record of INTERVENTION current values
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
                                            'CG_REF_CODES','INTERVENTION'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$INTERVENTION.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$INTERVENTION.v_domain.others');
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
    IF (con_name = 'INV_PK') THEN
        cg$errors.push(nvl(INV_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'INV_PK' 
                                     ,'INTERVENTION')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'INV_ENS_FK') THEN
        cg$errors.push(nvl(INV_ENS_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'INV_ENS_FK' 
                                     ,'INTERVENTION')),
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

D60_SALLE CONSTANT INTERVENTION.SALLE%TYPE := 'LC117B';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.SALLE) THEN cg$rec.SALLE := D60_SALLE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO INTERVENTION
            (ID_INTERVENTION
            ,NO_ENSEIGNANT
            ,DEBUT
            ,FIN
            ,DUREE
            ,SALLE
            ,DOM_APP
            ,COMMENTAIRE)
        VALUES
            (cg$rec.ID_INTERVENTION
            ,cg$rec.NO_ENSEIGNANT
            ,cg$rec.DEBUT
            ,cg$rec.FIN
            ,cg$rec.DUREE
            ,cg$rec.SALLE
            ,cg$rec.DOM_APP
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
        validate_mandatory(cg$rec, 'cg$INTERVENTION.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$INTERVENTION.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$INTERVENTION.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$INTERVENTION.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$INTERVENTION.ins.others');
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

 
    IF ( cg$pk.ID_INTERVENTION IS NULL ) THEN          
      cg$upd_rec.ID_INTERVENTION := cg$rec.ID_INTERVENTION;
    ELSE
      cg$upd_rec.ID_INTERVENTION := cg$pk.ID_INTERVENTION;
    END IF;
    cg$old_rec.ID_INTERVENTION := cg$upd_rec.ID_INTERVENTION;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key INV_PK
        IF (cg$ind.ID_INTERVENTION AND cg$rec.ID_INTERVENTION != cg$upd_rec.ID_INTERVENTION) THEN
            raise_uk_not_updateable('INV_PK');
        END IF;
        IF NOT (cg$ind.ID_INTERVENTION) THEN
            cg$rec.ID_INTERVENTION := cg$upd_rec.ID_INTERVENTION;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.DEBUT) THEN
            cg$rec.DEBUT := cg$upd_rec.DEBUT;
        END IF;
        IF NOT (cg$ind.FIN) THEN
            cg$rec.FIN := cg$upd_rec.FIN;
        END IF;
        IF NOT (cg$ind.DUREE) THEN
            cg$rec.DUREE := cg$upd_rec.DUREE;
        END IF;
        IF NOT (cg$ind.SALLE) THEN
            cg$rec.SALLE := cg$upd_rec.SALLE;
        END IF;
        IF NOT (cg$ind.DOM_APP) THEN
            cg$rec.DOM_APP := cg$upd_rec.DOM_APP;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE) THEN
            cg$rec.COMMENTAIRE := cg$upd_rec.COMMENTAIRE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key INV_PK
        IF ( cg$ind.ID_INTERVENTION ) THEN
          raise_uk_not_updateable('INV_PK');
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
            UPDATE INTERVENTION
            SET
              NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,DEBUT = cg$rec.DEBUT
              ,FIN = cg$rec.FIN
              ,DUREE = cg$rec.DUREE
              ,SALLE = cg$rec.SALLE
              ,DOM_APP = cg$rec.DOM_APP
              ,COMMENTAIRE = cg$rec.COMMENTAIRE
            WHERE  ID_INTERVENTION = cg$rec.ID_INTERVENTION;
            null;
          ELSE
            UPDATE INTERVENTION
            SET
              NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,DEBUT = cg$rec.DEBUT
              ,FIN = cg$rec.FIN
              ,DUREE = cg$rec.DUREE
              ,SALLE = cg$rec.SALLE
              ,DOM_APP = cg$rec.DOM_APP
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
        cg$table(idx).ID_INTERVENTION := cg$rec.ID_INTERVENTION;
        cg$tableind(idx).ID_INTERVENTION := cg$ind.ID_INTERVENTION;
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).DEBUT := cg$rec.DEBUT;
        cg$tableind(idx).DEBUT := cg$ind.DEBUT;
        cg$table(idx).FIN := cg$rec.FIN;
        cg$tableind(idx).FIN := cg$ind.FIN;
        cg$table(idx).DUREE := cg$rec.DUREE;
        cg$tableind(idx).DUREE := cg$ind.DUREE;
        cg$table(idx).SALLE := cg$rec.SALLE;
        cg$tableind(idx).SALLE := cg$ind.SALLE;
        cg$table(idx).DOM_APP := cg$rec.DOM_APP;
        cg$tableind(idx).DOM_APP := cg$ind.DOM_APP;
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
        validate_mandatory(cg$rec, 'cg$INTERVENTION.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$INTERVENTION.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$INTERVENTION.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$INTERVENTION.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$INTERVENTION.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of INTERVENTION when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for INTERVENTION's domain key constraint columns 
--              cg$ind      Indicates changed INTERVENTION's domain key constraint columns
--              cg$old_rec  Current values for INTERVENTION's domain key constraint columns
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
           cg$rec.ID_INTERVENTION := cg$pk.ID_INTERVENTION;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE INTERVENTION
              WHERE                    ID_INTERVENTION = cg$pk.ID_INTERVENTION;
           ELSE
              DELETE INTERVENTION
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$INTERVENTION.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$INTERVENTION.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$INTERVENTION.del.others');
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
               SELECT       ID_INTERVENTION
               ,            NO_ENSEIGNANT
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            SALLE
               ,            DOM_APP
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.ID_INTERVENTION
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.SALLE
               ,            cg$tmp_rec.DOM_APP
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      INTERVENTION
               WHERE              ID_INTERVENTION = cg$old_rec.ID_INTERVENTION
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ID_INTERVENTION
               ,            NO_ENSEIGNANT
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            SALLE
               ,            DOM_APP
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.ID_INTERVENTION
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.SALLE
               ,            cg$tmp_rec.DOM_APP
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      INTERVENTION
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ID_INTERVENTION
               ,            NO_ENSEIGNANT
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            SALLE
               ,            DOM_APP
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.ID_INTERVENTION
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.SALLE
               ,            cg$tmp_rec.DOM_APP
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      INTERVENTION
               WHERE              ID_INTERVENTION = cg$old_rec.ID_INTERVENTION
               FOR UPDATE;
            ELSE
               SELECT       ID_INTERVENTION
               ,            NO_ENSEIGNANT
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            SALLE
               ,            DOM_APP
               ,            COMMENTAIRE
               INTO         cg$tmp_rec.ID_INTERVENTION
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.SALLE
               ,            cg$tmp_rec.DOM_APP
               ,            cg$tmp_rec.COMMENTAIRE
               FROM      INTERVENTION
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
                           'cg$INTERVENTION.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$INTERVENTION.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$INTERVENTION.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.FIN) THEN
        IF (cg$tmp_rec.FIN IS NOT NULL
        AND cg$old_rec.FIN IS NOT NULL) THEN
            IF (cg$tmp_rec.FIN != cg$old_rec.FIN) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40FIN
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.FIN IS NOT NULL
        OR cg$old_rec.FIN IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40FIN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DUREE) THEN
        IF (cg$tmp_rec.DUREE IS NOT NULL
        AND cg$old_rec.DUREE IS NOT NULL) THEN
            IF (cg$tmp_rec.DUREE != cg$old_rec.DUREE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DUREE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DUREE IS NOT NULL
        OR cg$old_rec.DUREE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DUREE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE) THEN
        IF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        AND cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE != cg$old_rec.COMMENTAIRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80COMMENTAIRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE IS NOT NULL
        OR cg$old_rec.COMMENTAIRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80COMMENTAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ID_INTERVENTION) THEN
        IF (cg$tmp_rec.ID_INTERVENTION != cg$old_rec.ID_INTERVENTION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10ID_INTERVENTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DEBUT) THEN
        IF (cg$tmp_rec.DEBUT != cg$old_rec.DEBUT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30DEBUT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SALLE) THEN
        IF (cg$tmp_rec.SALLE != cg$old_rec.SALLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60SALLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DOM_APP) THEN
        IF (cg$tmp_rec.DOM_APP != cg$old_rec.DOM_APP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DOM_APP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$INTERVENTION.lck');
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
      cg$ind_true.ID_INTERVENTION := TRUE;
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.DEBUT := TRUE;
      cg$ind_true.FIN := TRUE;
      cg$ind_true.DUREE := TRUE;
      cg$ind_true.SALLE := TRUE;
      cg$ind_true.DOM_APP := TRUE;
      cg$ind_true.COMMENTAIRE := TRUE;
   

END cg$INTERVENTION;
/

