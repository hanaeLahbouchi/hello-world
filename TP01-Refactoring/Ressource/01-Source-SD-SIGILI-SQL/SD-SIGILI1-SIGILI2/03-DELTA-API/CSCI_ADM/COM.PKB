
PROMPT Creating API Package Body for Table 'COMPAGNIE'
--------------------------------------------------------------------------------
-- Name:        cg$COMPAGNIE
-- Description: COMPAGNIE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$COMPAGNIE IS

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
                   'cg$COMPAGNIE.raise_uk_not_updateable');
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
                   'cg$COMPAGNIE.raise_fk_not_transferable');
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
                    'cg$COMPAGNIE.up_autogen_columns');
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
    IF (cg$val_rec.ANNEE_PRO IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENSEIGNANT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P25NO_ENSEIGNANT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SIGLE_COM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30SIGLE_COM),
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
       ,         ANNEE_PRO
       ,         NO_ENSEIGNANT
       ,         CODE_PAILI
       ,         SIGLE_COM
       ,         NOM
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         TEL
       ,         EMAIL
       ,         LOGO
       ,         NOM_PROJET
       ,         DESC_PROJET
       , rowid
       INTO      cg$sel_rec.CODE_COM
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.CODE_PAILI
       ,         cg$sel_rec.SIGLE_COM
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.TEL
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.LOGO
       ,         cg$sel_rec.NOM_PROJET
       ,         cg$sel_rec.DESC_PROJET
       ,cg$sel_rec.the_rowid
       FROM   COMPAGNIE
       WHERE        CODE_COM = cg$sel_rec.CODE_COM;
    ELSE
       SELECT    CODE_COM
       ,         ANNEE_PRO
       ,         NO_ENSEIGNANT
       ,         CODE_PAILI
       ,         SIGLE_COM
       ,         NOM
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         TEL
       ,         EMAIL
       ,         LOGO
       ,         NOM_PROJET
       ,         DESC_PROJET
       , rowid
       INTO      cg$sel_rec.CODE_COM
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.CODE_PAILI
       ,         cg$sel_rec.SIGLE_COM
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.TEL
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.LOGO
       ,         cg$sel_rec.NOM_PROJET
       ,         cg$sel_rec.DESC_PROJET
       ,cg$sel_rec.the_rowid
       FROM   COMPAGNIE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$COMPAGNIE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to COMPAGNIE 
--
-- Parameters:  cg$rec     Record of COMPAGNIE current values
--              cg$old_rec Record of COMPAGNIE previous values
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
--              of each child table that references this tableCOMPAGNIE 
--
-- Parameters:  cg$old_rec     Record of COMPAGNIE current values
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
--              child table that references this table COMPAGNIE 
--
-- Parameters:  cg$new_rec  New values for COMPAGNIE's domain key constraint columns 
--              cg$new_ind  Indicates changed COMPAGNIE's domain key constraint columns
--              cg$old_rec  Current values for COMPAGNIE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to COMPAGNIE 
--
-- Parameters:  cg$rec     Record of COMPAGNIE current values
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
--              child table that references this tableCOMPAGNIE 
--
-- Parameters:  cg$old_rec     Record of COMPAGNIE current values
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
--              of each child table that references this tableCOMPAGNIE 
--
-- Parameters:  cg$old_rec     Record of COMPAGNIE current values
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
-- Parameters:  cg$rec     Record of COMPAGNIE current values
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
-- Parameters:  cg$rec     Record of COMPAGNIE current values
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
                                            'CG_REF_CODES','COMPAGNIE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$COMPAGNIE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$COMPAGNIE.v_domain.others');
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
    IF (con_name = 'COM_PK') THEN
        cg$errors.push(nvl(COM_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'COM_PK' 
                                     ,'COMPAGNIE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'SEQ_COM_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Compagnie', 'Sequence'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'ETU_COM_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Compagnie', 'Etudiant'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'COM_PAP_FK') THEN
        cg$errors.push(nvl(COM_PAP_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'COM_PAP_FK' 
                                     ,'COMPAGNIE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'COM_PRO_FK') THEN
        cg$errors.push(nvl(COM_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'COM_PRO_FK' 
                                     ,'COMPAGNIE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'COM_ENS_FK') THEN
        cg$errors.push(nvl(COM_ENS_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'COM_ENS_FK' 
                                     ,'COMPAGNIE')),
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

D50_ADRESSE CONSTANT COMPAGNIE.ADRESSE%TYPE := '20, avenue Le Gorgeu';
D60_CP CONSTANT COMPAGNIE.CP%TYPE := '29200';
D70_VILLE CONSTANT COMPAGNIE.VILLE%TYPE := 'Brest';
D80_TEL CONSTANT COMPAGNIE.TEL%TYPE := '02.98.01.69.66';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ADRESSE) THEN cg$rec.ADRESSE := D50_ADRESSE; END IF;
    IF NOT (cg$ind.CP) THEN cg$rec.CP := D60_CP; END IF;
    IF NOT (cg$ind.VILLE) THEN cg$rec.VILLE := D70_VILLE; END IF;
    IF NOT (cg$ind.TEL) THEN cg$rec.TEL := D80_TEL; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO COMPAGNIE
            (CODE_COM
            ,ANNEE_PRO
            ,NO_ENSEIGNANT
            ,CODE_PAILI
            ,SIGLE_COM
            ,NOM
            ,ADRESSE
            ,CP
            ,VILLE
            ,TEL
            ,EMAIL
            ,LOGO
            ,NOM_PROJET
            ,DESC_PROJET)
        VALUES
            (cg$rec.CODE_COM
            ,cg$rec.ANNEE_PRO
            ,cg$rec.NO_ENSEIGNANT
            ,cg$rec.CODE_PAILI
            ,cg$rec.SIGLE_COM
            ,cg$rec.NOM
            ,cg$rec.ADRESSE
            ,cg$rec.CP
            ,cg$rec.VILLE
            ,cg$rec.TEL
            ,cg$rec.EMAIL
            ,cg$rec.LOGO
            ,cg$rec.NOM_PROJET
            ,cg$rec.DESC_PROJET
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
        validate_mandatory(cg$rec, 'cg$COMPAGNIE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$COMPAGNIE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$COMPAGNIE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$COMPAGNIE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$COMPAGNIE.ins.others');
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


        --  Report error if attempt to update non updateable Primary Key COM_PK
        IF (cg$ind.CODE_COM AND cg$rec.CODE_COM != cg$upd_rec.CODE_COM) THEN
            raise_uk_not_updateable('COM_PK');
        END IF;
        IF NOT (cg$ind.CODE_COM) THEN
            cg$rec.CODE_COM := cg$upd_rec.CODE_COM;
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.CODE_PAILI) THEN
            cg$rec.CODE_PAILI := cg$upd_rec.CODE_PAILI;
        END IF;
        IF NOT (cg$ind.SIGLE_COM) THEN
            cg$rec.SIGLE_COM := cg$upd_rec.SIGLE_COM;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.ADRESSE) THEN
            cg$rec.ADRESSE := cg$upd_rec.ADRESSE;
        END IF;
        IF NOT (cg$ind.CP) THEN
            cg$rec.CP := cg$upd_rec.CP;
        END IF;
        IF NOT (cg$ind.VILLE) THEN
            cg$rec.VILLE := cg$upd_rec.VILLE;
        END IF;
        IF NOT (cg$ind.TEL) THEN
            cg$rec.TEL := cg$upd_rec.TEL;
        END IF;
        IF NOT (cg$ind.EMAIL) THEN
            cg$rec.EMAIL := cg$upd_rec.EMAIL;
        END IF;
        IF NOT (cg$ind.LOGO) THEN
            cg$rec.LOGO := cg$upd_rec.LOGO;
        END IF;
        IF NOT (cg$ind.NOM_PROJET) THEN
            cg$rec.NOM_PROJET := cg$upd_rec.NOM_PROJET;
        END IF;
        IF NOT (cg$ind.DESC_PROJET) THEN
            cg$rec.DESC_PROJET := cg$upd_rec.DESC_PROJET;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key COM_PK
        IF ( cg$ind.CODE_COM ) THEN
          raise_uk_not_updateable('COM_PK');
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
            UPDATE COMPAGNIE
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,CODE_PAILI = cg$rec.CODE_PAILI
              ,SIGLE_COM = cg$rec.SIGLE_COM
              ,NOM = cg$rec.NOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,TEL = cg$rec.TEL
              ,EMAIL = cg$rec.EMAIL
              ,LOGO = cg$rec.LOGO
              ,NOM_PROJET = cg$rec.NOM_PROJET
              ,DESC_PROJET = cg$rec.DESC_PROJET
            WHERE  CODE_COM = cg$rec.CODE_COM;
            null;
          ELSE
            UPDATE COMPAGNIE
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,CODE_PAILI = cg$rec.CODE_PAILI
              ,SIGLE_COM = cg$rec.SIGLE_COM
              ,NOM = cg$rec.NOM
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,TEL = cg$rec.TEL
              ,EMAIL = cg$rec.EMAIL
              ,LOGO = cg$rec.LOGO
              ,NOM_PROJET = cg$rec.NOM_PROJET
              ,DESC_PROJET = cg$rec.DESC_PROJET
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
        cg$table(idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
        cg$tableind(idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).CODE_PAILI := cg$rec.CODE_PAILI;
        cg$tableind(idx).CODE_PAILI := cg$ind.CODE_PAILI;
        cg$table(idx).SIGLE_COM := cg$rec.SIGLE_COM;
        cg$tableind(idx).SIGLE_COM := cg$ind.SIGLE_COM;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CP := cg$rec.CP;
        cg$tableind(idx).CP := cg$ind.CP;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).TEL := cg$rec.TEL;
        cg$tableind(idx).TEL := cg$ind.TEL;
        cg$table(idx).EMAIL := cg$rec.EMAIL;
        cg$tableind(idx).EMAIL := cg$ind.EMAIL;
        cg$table(idx).LOGO := cg$rec.LOGO;
        cg$tableind(idx).LOGO := cg$ind.LOGO;
        cg$table(idx).NOM_PROJET := cg$rec.NOM_PROJET;
        cg$tableind(idx).NOM_PROJET := cg$ind.NOM_PROJET;
        cg$table(idx).DESC_PROJET := cg$rec.DESC_PROJET;
        cg$tableind(idx).DESC_PROJET := cg$ind.DESC_PROJET;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$COMPAGNIE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$COMPAGNIE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$COMPAGNIE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$COMPAGNIE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$COMPAGNIE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of COMPAGNIE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for COMPAGNIE's domain key constraint columns 
--              cg$ind      Indicates changed COMPAGNIE's domain key constraint columns
--              cg$old_rec  Current values for COMPAGNIE's domain key constraint columns
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
           cg$rec.CODE_COM := cg$pk.CODE_COM;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE COMPAGNIE
              WHERE                    CODE_COM = cg$pk.CODE_COM;
           ELSE
              DELETE COMPAGNIE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$COMPAGNIE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$COMPAGNIE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$COMPAGNIE.del.others');
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
               ,            ANNEE_PRO
               ,            NO_ENSEIGNANT
               ,            CODE_PAILI
               ,            SIGLE_COM
               ,            NOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            TEL
               ,            EMAIL
               ,            LOGO
               ,            NOM_PROJET
               ,            DESC_PROJET
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.CODE_PAILI
               ,            cg$tmp_rec.SIGLE_COM
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.LOGO
               ,            cg$tmp_rec.NOM_PROJET
               ,            cg$tmp_rec.DESC_PROJET
               FROM      COMPAGNIE
               WHERE              CODE_COM = cg$old_rec.CODE_COM
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       CODE_COM
               ,            ANNEE_PRO
               ,            NO_ENSEIGNANT
               ,            CODE_PAILI
               ,            SIGLE_COM
               ,            NOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            TEL
               ,            EMAIL
               ,            LOGO
               ,            NOM_PROJET
               ,            DESC_PROJET
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.CODE_PAILI
               ,            cg$tmp_rec.SIGLE_COM
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.LOGO
               ,            cg$tmp_rec.NOM_PROJET
               ,            cg$tmp_rec.DESC_PROJET
               FROM      COMPAGNIE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       CODE_COM
               ,            ANNEE_PRO
               ,            NO_ENSEIGNANT
               ,            CODE_PAILI
               ,            SIGLE_COM
               ,            NOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            TEL
               ,            EMAIL
               ,            LOGO
               ,            NOM_PROJET
               ,            DESC_PROJET
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.CODE_PAILI
               ,            cg$tmp_rec.SIGLE_COM
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.LOGO
               ,            cg$tmp_rec.NOM_PROJET
               ,            cg$tmp_rec.DESC_PROJET
               FROM      COMPAGNIE
               WHERE              CODE_COM = cg$old_rec.CODE_COM
               FOR UPDATE;
            ELSE
               SELECT       CODE_COM
               ,            ANNEE_PRO
               ,            NO_ENSEIGNANT
               ,            CODE_PAILI
               ,            SIGLE_COM
               ,            NOM
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            TEL
               ,            EMAIL
               ,            LOGO
               ,            NOM_PROJET
               ,            DESC_PROJET
               INTO         cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.CODE_PAILI
               ,            cg$tmp_rec.SIGLE_COM
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.TEL
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.LOGO
               ,            cg$tmp_rec.NOM_PROJET
               ,            cg$tmp_rec.DESC_PROJET
               FROM      COMPAGNIE
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
                           'cg$COMPAGNIE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$COMPAGNIE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$COMPAGNIE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.CODE_PAILI) THEN
        IF (cg$tmp_rec.CODE_PAILI IS NOT NULL
        AND cg$old_rec.CODE_PAILI IS NOT NULL) THEN
            IF (cg$tmp_rec.CODE_PAILI != cg$old_rec.CODE_PAILI) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P27CODE_PAILI
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CODE_PAILI IS NOT NULL
        OR cg$old_rec.CODE_PAILI IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P27CODE_PAILI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM IS NOT NULL
        AND cg$old_rec.NOM IS NOT NULL) THEN
            IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOM IS NOT NULL
        OR cg$old_rec.NOM IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE IS NOT NULL
        AND cg$old_rec.ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ADRESSE IS NOT NULL
        OR cg$old_rec.ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CP) THEN
        IF (cg$tmp_rec.CP IS NOT NULL
        AND cg$old_rec.CP IS NOT NULL) THEN
            IF (cg$tmp_rec.CP != cg$old_rec.CP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60CP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CP IS NOT NULL
        OR cg$old_rec.CP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE IS NOT NULL
        AND cg$old_rec.VILLE IS NOT NULL) THEN
            IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70VILLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.VILLE IS NOT NULL
        OR cg$old_rec.VILLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL) THEN
        IF (cg$tmp_rec.TEL IS NOT NULL
        AND cg$old_rec.TEL IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL != cg$old_rec.TEL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80TEL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL IS NOT NULL
        OR cg$old_rec.TEL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80TEL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL) THEN
        IF (cg$tmp_rec.EMAIL IS NOT NULL
        AND cg$old_rec.EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.EMAIL != cg$old_rec.EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EMAIL IS NOT NULL
        OR cg$old_rec.EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LOGO) THEN
        IF (cg$tmp_rec.LOGO IS NOT NULL
        AND cg$old_rec.LOGO IS NOT NULL) THEN
            IF (cg$tmp_rec.LOGO != cg$old_rec.LOGO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100LOGO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.LOGO IS NOT NULL
        OR cg$old_rec.LOGO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100LOGO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM_PROJET) THEN
        IF (cg$tmp_rec.NOM_PROJET IS NOT NULL
        AND cg$old_rec.NOM_PROJET IS NOT NULL) THEN
            IF (cg$tmp_rec.NOM_PROJET != cg$old_rec.NOM_PROJET) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110NOM_PROJET
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOM_PROJET IS NOT NULL
        OR cg$old_rec.NOM_PROJET IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110NOM_PROJET
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESC_PROJET) THEN
        IF (cg$tmp_rec.DESC_PROJET IS NOT NULL
        AND cg$old_rec.DESC_PROJET IS NOT NULL) THEN
            IF (cg$tmp_rec.DESC_PROJET != cg$old_rec.DESC_PROJET) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120DESC_PROJET
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESC_PROJET IS NOT NULL
        OR cg$old_rec.DESC_PROJET IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120DESC_PROJET
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.CODE_COM) THEN
        IF (cg$tmp_rec.CODE_COM != cg$old_rec.CODE_COM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10CODE_COM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SIGLE_COM) THEN
        IF (cg$tmp_rec.SIGLE_COM != cg$old_rec.SIGLE_COM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30SIGLE_COM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$COMPAGNIE.lck');
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
      cg$ind_true.ANNEE_PRO := TRUE;
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.CODE_PAILI := TRUE;
      cg$ind_true.SIGLE_COM := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CP := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.TEL := TRUE;
      cg$ind_true.EMAIL := TRUE;
      cg$ind_true.LOGO := TRUE;
      cg$ind_true.NOM_PROJET := TRUE;
      cg$ind_true.DESC_PROJET := TRUE;
   

END cg$COMPAGNIE;
/

