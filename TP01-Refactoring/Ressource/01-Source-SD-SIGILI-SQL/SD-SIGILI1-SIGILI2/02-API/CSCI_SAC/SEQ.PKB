
PROMPT Creating API Package Body for Table 'SEQUENCE'
--------------------------------------------------------------------------------
-- Name:        cg$SEQUENCE
-- Description: SEQUENCE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$SEQUENCE IS

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
                   'cg$SEQUENCE.raise_uk_not_updateable');
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
                   'cg$SEQUENCE.raise_fk_not_transferable');
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
                    'cg$SEQUENCE.up_autogen_columns');
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
    IF (cg$val_rec.CODE_COM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10CODE_COM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_SEQUENCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NO_SEQUENCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DESIGNATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30DESIGNATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DEBUT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40DEBUT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.FIN IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50FIN),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DUREE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60DUREE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.MAD IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80MAD),
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
       SELECT    CODE_COM
       ,         NO_SEQUENCE
       ,         DESIGNATION
       ,         DEBUT
       ,         FIN
       ,         DUREE
       ,         DESCRIPTIF
       ,         MAD
       , rowid
       INTO      cg$sel_rec.CODE_COM
       ,         cg$sel_rec.NO_SEQUENCE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.DEBUT
       ,         cg$sel_rec.FIN
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.DESCRIPTIF
       ,         cg$sel_rec.MAD
       ,cg$sel_rec.the_rowid
       FROM   SEQUENCE
       WHERE        NO_SEQUENCE = cg$sel_rec.NO_SEQUENCE
       AND       CODE_COM = cg$sel_rec.CODE_COM;
    ELSE
       SELECT    CODE_COM
       ,         NO_SEQUENCE
       ,         DESIGNATION
       ,         DEBUT
       ,         FIN
       ,         DUREE
       ,         DESCRIPTIF
       ,         MAD
       , rowid
       INTO      cg$sel_rec.CODE_COM
       ,         cg$sel_rec.NO_SEQUENCE
       ,         cg$sel_rec.DESIGNATION
       ,         cg$sel_rec.DEBUT
       ,         cg$sel_rec.FIN
       ,         cg$sel_rec.DUREE
       ,         cg$sel_rec.DESCRIPTIF
       ,         cg$sel_rec.MAD
       ,cg$sel_rec.the_rowid
       FROM   SEQUENCE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$SEQUENCE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to SEQUENCE 
--
-- Parameters:  cg$rec     Record of SEQUENCE current values
--              cg$old_rec Record of SEQUENCE previous values
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
--              of each child table that references this tableSEQUENCE 
--
-- Parameters:  cg$old_rec     Record of SEQUENCE current values
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
--              child table that references this table SEQUENCE 
--
-- Parameters:  cg$new_rec  New values for SEQUENCE's domain key constraint columns 
--              cg$new_ind  Indicates changed SEQUENCE's domain key constraint columns
--              cg$old_rec  Current values for SEQUENCE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to SEQUENCE 
--
-- Parameters:  cg$rec     Record of SEQUENCE current values
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
--              child table that references this tableSEQUENCE 
--
-- Parameters:  cg$old_rec     Record of SEQUENCE current values
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
--              of each child table that references this tableSEQUENCE 
--
-- Parameters:  cg$old_rec     Record of SEQUENCE current values
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
-- Parameters:  cg$rec     Record of SEQUENCE current values
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
-- Parameters:  cg$rec     Record of SEQUENCE current values
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
                                            'CG_REF_CODES','SEQUENCE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$SEQUENCE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SEQUENCE.v_domain.others');
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
    IF (con_name = 'SEQ_PK') THEN
        cg$errors.push(nvl(SEQ_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'SEQ_PK' 
                                     ,'SEQUENCE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'FA_SEQ_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Sequence', 'Fa'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'SEQ_COM_FK') THEN
        cg$errors.push(nvl(SEQ_COM_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'SEQ_COM_FK' 
                                     ,'SEQUENCE')),
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

D80_MAD CONSTANT SEQUENCE.MAD%TYPE := 'NON';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.MAD) THEN cg$rec.MAD := D80_MAD; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO SEQUENCE
            (CODE_COM
            ,NO_SEQUENCE
            ,DESIGNATION
            ,DEBUT
            ,FIN
            ,DUREE
            ,DESCRIPTIF
            ,MAD)
        VALUES
            (cg$rec.CODE_COM
            ,cg$rec.NO_SEQUENCE
            ,cg$rec.DESIGNATION
            ,cg$rec.DEBUT
            ,cg$rec.FIN
            ,cg$rec.DUREE
            ,cg$rec.DESCRIPTIF
            ,cg$rec.MAD
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
        validate_mandatory(cg$rec, 'cg$SEQUENCE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$SEQUENCE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$SEQUENCE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$SEQUENCE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SEQUENCE.ins.others');
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

 
    IF ( cg$pk.NO_SEQUENCE IS NULL ) THEN          
      cg$upd_rec.NO_SEQUENCE := cg$rec.NO_SEQUENCE;
    ELSE
      cg$upd_rec.NO_SEQUENCE := cg$pk.NO_SEQUENCE;
    END IF;
    cg$old_rec.NO_SEQUENCE := cg$upd_rec.NO_SEQUENCE;
    IF ( cg$pk.CODE_COM IS NULL ) THEN          
      cg$upd_rec.CODE_COM := cg$rec.CODE_COM;
    ELSE
      cg$upd_rec.CODE_COM := cg$pk.CODE_COM;
    END IF;
    cg$old_rec.CODE_COM := cg$upd_rec.CODE_COM;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key SEQ_PK
        IF (cg$ind.NO_SEQUENCE AND cg$rec.NO_SEQUENCE != cg$upd_rec.NO_SEQUENCE) THEN
            raise_uk_not_updateable('SEQ_PK');
        END IF;
        IF (cg$ind.CODE_COM AND cg$rec.CODE_COM != cg$upd_rec.CODE_COM) THEN
            raise_uk_not_updateable('SEQ_PK');
        END IF;
        IF NOT (cg$ind.CODE_COM) THEN
            cg$rec.CODE_COM := cg$upd_rec.CODE_COM;
        END IF;
        IF NOT (cg$ind.NO_SEQUENCE) THEN
            cg$rec.NO_SEQUENCE := cg$upd_rec.NO_SEQUENCE;
        END IF;
        IF NOT (cg$ind.DESIGNATION) THEN
            cg$rec.DESIGNATION := cg$upd_rec.DESIGNATION;
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
        IF NOT (cg$ind.DESCRIPTIF) THEN
            cg$rec.DESCRIPTIF := cg$upd_rec.DESCRIPTIF;
        END IF;
        IF NOT (cg$ind.MAD) THEN
            cg$rec.MAD := cg$upd_rec.MAD;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key SEQ_PK
        IF ( cg$ind.NO_SEQUENCE 
        OR   cg$ind.CODE_COM ) THEN
          raise_uk_not_updateable('SEQ_PK');
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
            UPDATE SEQUENCE
            SET
              DESIGNATION = cg$rec.DESIGNATION
              ,DEBUT = cg$rec.DEBUT
              ,FIN = cg$rec.FIN
              ,DUREE = cg$rec.DUREE
              ,DESCRIPTIF = cg$rec.DESCRIPTIF
              ,MAD = cg$rec.MAD
            WHERE  NO_SEQUENCE = cg$rec.NO_SEQUENCE
            AND    CODE_COM = cg$rec.CODE_COM;
            null;
          ELSE
            UPDATE SEQUENCE
            SET
              DESIGNATION = cg$rec.DESIGNATION
              ,DEBUT = cg$rec.DEBUT
              ,FIN = cg$rec.FIN
              ,DUREE = cg$rec.DUREE
              ,DESCRIPTIF = cg$rec.DESCRIPTIF
              ,MAD = cg$rec.MAD
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
        cg$table(idx).CODE_COM := cg$rec.CODE_COM;
        cg$tableind(idx).CODE_COM := cg$ind.CODE_COM;
        cg$table(idx).NO_SEQUENCE := cg$rec.NO_SEQUENCE;
        cg$tableind(idx).NO_SEQUENCE := cg$ind.NO_SEQUENCE;
        cg$table(idx).DESIGNATION := cg$rec.DESIGNATION;
        cg$tableind(idx).DESIGNATION := cg$ind.DESIGNATION;
        cg$table(idx).DEBUT := cg$rec.DEBUT;
        cg$tableind(idx).DEBUT := cg$ind.DEBUT;
        cg$table(idx).FIN := cg$rec.FIN;
        cg$tableind(idx).FIN := cg$ind.FIN;
        cg$table(idx).DUREE := cg$rec.DUREE;
        cg$tableind(idx).DUREE := cg$ind.DUREE;
        cg$table(idx).DESCRIPTIF := cg$rec.DESCRIPTIF;
        cg$tableind(idx).DESCRIPTIF := cg$ind.DESCRIPTIF;
        cg$table(idx).MAD := cg$rec.MAD;
        cg$tableind(idx).MAD := cg$ind.MAD;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$SEQUENCE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$SEQUENCE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$SEQUENCE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$SEQUENCE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SEQUENCE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of SEQUENCE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for SEQUENCE's domain key constraint columns 
--              cg$ind      Indicates changed SEQUENCE's domain key constraint columns
--              cg$old_rec  Current values for SEQUENCE's domain key constraint columns
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
           cg$rec.NO_SEQUENCE := cg$pk.NO_SEQUENCE;
           cg$rec.CODE_COM := cg$pk.CODE_COM;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE SEQUENCE
              WHERE                    NO_SEQUENCE = cg$pk.NO_SEQUENCE
              AND          CODE_COM = cg$pk.CODE_COM;
           ELSE
              DELETE SEQUENCE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$SEQUENCE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SEQUENCE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$SEQUENCE.del.others');
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
               SELECT       CODE_COM
               ,            NO_SEQUENCE
               ,            DESIGNATION
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            DESCRIPTIF
               ,            MAD
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_SEQUENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.DESCRIPTIF
               ,            cg$tmp_rec.MAD
               FROM      SEQUENCE
               WHERE              NO_SEQUENCE = cg$old_rec.NO_SEQUENCE
               AND          CODE_COM = cg$old_rec.CODE_COM
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       CODE_COM
               ,            NO_SEQUENCE
               ,            DESIGNATION
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            DESCRIPTIF
               ,            MAD
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_SEQUENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.DESCRIPTIF
               ,            cg$tmp_rec.MAD
               FROM      SEQUENCE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       CODE_COM
               ,            NO_SEQUENCE
               ,            DESIGNATION
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            DESCRIPTIF
               ,            MAD
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_SEQUENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.DESCRIPTIF
               ,            cg$tmp_rec.MAD
               FROM      SEQUENCE
               WHERE              NO_SEQUENCE = cg$old_rec.NO_SEQUENCE
               AND          CODE_COM = cg$old_rec.CODE_COM
               FOR UPDATE;
            ELSE
               SELECT       CODE_COM
               ,            NO_SEQUENCE
               ,            DESIGNATION
               ,            DEBUT
               ,            FIN
               ,            DUREE
               ,            DESCRIPTIF
               ,            MAD
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_SEQUENCE
               ,            cg$tmp_rec.DESIGNATION
               ,            cg$tmp_rec.DEBUT
               ,            cg$tmp_rec.FIN
               ,            cg$tmp_rec.DUREE
               ,            cg$tmp_rec.DESCRIPTIF
               ,            cg$tmp_rec.MAD
               FROM      SEQUENCE
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
                           'cg$SEQUENCE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$SEQUENCE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$SEQUENCE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.DESCRIPTIF) THEN
        IF (cg$tmp_rec.DESCRIPTIF IS NOT NULL
        AND cg$old_rec.DESCRIPTIF IS NOT NULL) THEN
            IF (cg$tmp_rec.DESCRIPTIF != cg$old_rec.DESCRIPTIF) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DESCRIPTIF
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESCRIPTIF IS NOT NULL
        OR cg$old_rec.DESCRIPTIF IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DESCRIPTIF
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.CODE_COM) THEN
        IF (cg$tmp_rec.CODE_COM != cg$old_rec.CODE_COM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10CODE_COM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_SEQUENCE) THEN
        IF (cg$tmp_rec.NO_SEQUENCE != cg$old_rec.NO_SEQUENCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NO_SEQUENCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESIGNATION) THEN
        IF (cg$tmp_rec.DESIGNATION != cg$old_rec.DESIGNATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30DESIGNATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DEBUT) THEN
        IF (cg$tmp_rec.DEBUT != cg$old_rec.DEBUT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DEBUT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.FIN) THEN
        IF (cg$tmp_rec.FIN != cg$old_rec.FIN) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50FIN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DUREE) THEN
        IF (cg$tmp_rec.DUREE != cg$old_rec.DUREE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DUREE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MAD) THEN
        IF (cg$tmp_rec.MAD != cg$old_rec.MAD) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80MAD
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$SEQUENCE.lck');
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
      cg$ind_true.CODE_COM := TRUE;
      cg$ind_true.NO_SEQUENCE := TRUE;
      cg$ind_true.DESIGNATION := TRUE;
      cg$ind_true.DEBUT := TRUE;
      cg$ind_true.FIN := TRUE;
      cg$ind_true.DUREE := TRUE;
      cg$ind_true.DESCRIPTIF := TRUE;
      cg$ind_true.MAD := TRUE;
   

END cg$SEQUENCE;
/

