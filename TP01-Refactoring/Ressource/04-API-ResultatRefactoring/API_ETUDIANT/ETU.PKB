
PROMPT Creating API Package Body for Table 'ETUDIANT'
--------------------------------------------------------------------------------
-- Name:        cg$ETUDIANT
-- Description: ETUDIANT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$ETUDIANT IS

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
                   'cg$ETUDIANT.raise_uk_not_updateable');
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
                   'cg$ETUDIANT.raise_fk_not_transferable');
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
                    'cg$ETUDIANT.up_autogen_columns');
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
    IF (cg$val_rec.NO_ETUDIANT_NAT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10NO_ETUDIANT_NAT),
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
    IF (cg$val_rec.SEXE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40SEXE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60PRENOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70DATE_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LIEU_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80LIEU_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SITUATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90SITUATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NATIONALITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P100NATIONALITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P180PERM_ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_CP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P190PERM_CP),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P200PERM_VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_PAYS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P210PERM_PAYS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DERNIER_DIPLOME IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P220DERNIER_DIPLOME),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.UNIVERSITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P230UNIVERSITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SIGLE_ETU IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P240SIGLE_ETU),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.COMPTE_CRI IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P250COMPTE_CRI),
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
       SELECT    NO_ETUDIANT_NAT
       ,         ANNEE_PRO
       ,         CODE_COM
       ,         NO_ETUDIANT_UBO
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         SITUATION
       ,         NATIONALITE
       ,         TEL_PORT
       ,         TEL_FIXE
       ,         EMAIL
       ,         ACTU_ADRESSE
       ,         ACTU_CP
       ,         ACTU_VILLE
       ,         ACTU_PAYS
       ,         PERM_ADRESSE
       ,         PERM_CP
       ,         PERM_VILLE
       ,         PERM_PAYS
       ,         DERNIER_DIPLOME
       ,         UNIVERSITE
       ,         SIGLE_ETU
       ,         COMPTE_CRI
       ,         UBO_EMAIL
       ,         GRPE_ANGLAIS
       ,         ABANDON_MOTIF
       ,         ABANDON_DATE
       ,         EST_DIPLOME
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.CODE_COM
       ,         cg$sel_rec.NO_ETUDIANT_UBO
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.SITUATION
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TEL_PORT
       ,         cg$sel_rec.TEL_FIXE
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.ACTU_ADRESSE
       ,         cg$sel_rec.ACTU_CP
       ,         cg$sel_rec.ACTU_VILLE
       ,         cg$sel_rec.ACTU_PAYS
       ,         cg$sel_rec.PERM_ADRESSE
       ,         cg$sel_rec.PERM_CP
       ,         cg$sel_rec.PERM_VILLE
       ,         cg$sel_rec.PERM_PAYS
       ,         cg$sel_rec.DERNIER_DIPLOME
       ,         cg$sel_rec.UNIVERSITE
       ,         cg$sel_rec.SIGLE_ETU
       ,         cg$sel_rec.COMPTE_CRI
       ,         cg$sel_rec.UBO_EMAIL
       ,         cg$sel_rec.GRPE_ANGLAIS
       ,         cg$sel_rec.ABANDON_MOTIF
       ,         cg$sel_rec.ABANDON_DATE
       ,         cg$sel_rec.EST_DIPLOME
       ,cg$sel_rec.the_rowid
       FROM   ETUDIANT
       WHERE        NO_ETUDIANT_NAT = cg$sel_rec.NO_ETUDIANT_NAT;
    ELSE
       SELECT    NO_ETUDIANT_NAT
       ,         ANNEE_PRO
       ,         CODE_COM
       ,         NO_ETUDIANT_UBO
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         SITUATION
       ,         NATIONALITE
       ,         TEL_PORT
       ,         TEL_FIXE
       ,         EMAIL
       ,         ACTU_ADRESSE
       ,         ACTU_CP
       ,         ACTU_VILLE
       ,         ACTU_PAYS
       ,         PERM_ADRESSE
       ,         PERM_CP
       ,         PERM_VILLE
       ,         PERM_PAYS
       ,         DERNIER_DIPLOME
       ,         UNIVERSITE
       ,         SIGLE_ETU
       ,         COMPTE_CRI
       ,         UBO_EMAIL
       ,         GRPE_ANGLAIS
       ,         ABANDON_MOTIF
       ,         ABANDON_DATE
       ,         EST_DIPLOME
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.CODE_COM
       ,         cg$sel_rec.NO_ETUDIANT_UBO
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.SITUATION
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TEL_PORT
       ,         cg$sel_rec.TEL_FIXE
       ,         cg$sel_rec.EMAIL
       ,         cg$sel_rec.ACTU_ADRESSE
       ,         cg$sel_rec.ACTU_CP
       ,         cg$sel_rec.ACTU_VILLE
       ,         cg$sel_rec.ACTU_PAYS
       ,         cg$sel_rec.PERM_ADRESSE
       ,         cg$sel_rec.PERM_CP
       ,         cg$sel_rec.PERM_VILLE
       ,         cg$sel_rec.PERM_PAYS
       ,         cg$sel_rec.DERNIER_DIPLOME
       ,         cg$sel_rec.UNIVERSITE
       ,         cg$sel_rec.SIGLE_ETU
       ,         cg$sel_rec.COMPTE_CRI
       ,         cg$sel_rec.UBO_EMAIL
       ,         cg$sel_rec.GRPE_ANGLAIS
       ,         cg$sel_rec.ABANDON_MOTIF
       ,         cg$sel_rec.ABANDON_DATE
       ,         cg$sel_rec.EST_DIPLOME
       ,cg$sel_rec.the_rowid
       FROM   ETUDIANT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$ETUDIANT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to ETUDIANT 
--
-- Parameters:  cg$rec     Record of ETUDIANT current values
--              cg$old_rec Record of ETUDIANT previous values
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
--              of each child table that references this tableETUDIANT 
--
-- Parameters:  cg$old_rec     Record of ETUDIANT current values
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
--              child table that references this table ETUDIANT 
--
-- Parameters:  cg$new_rec  New values for ETUDIANT's domain key constraint columns 
--              cg$new_ind  Indicates changed ETUDIANT's domain key constraint columns
--              cg$old_rec  Current values for ETUDIANT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to ETUDIANT 
--
-- Parameters:  cg$rec     Record of ETUDIANT current values
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
--              child table that references this tableETUDIANT 
--
-- Parameters:  cg$old_rec     Record of ETUDIANT current values
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
--              of each child table that references this tableETUDIANT 
--
-- Parameters:  cg$old_rec     Record of ETUDIANT current values
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
-- Parameters:  cg$rec     Record of ETUDIANT current values
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
-- Parameters:  cg$rec     Record of ETUDIANT current values
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
                                            'CG_REF_CODES','ETUDIANT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$ETUDIANT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ETUDIANT.v_domain.others');
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
    IF (con_name = 'ETU_PK') THEN
        cg$errors.push(nvl(ETU_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'ETU_PK' 
                                     ,'ETUDIANT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_ETU_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Etudiant', 'Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'DIP_ETU_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Etudiant', 'Diplome'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'AUT_ETU_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Etudiant', 'Authentification'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'CTS_ETU_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Etudiant', 'Contact Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'ETU_PRO_FK') THEN
        cg$errors.push(nvl(ETU_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'ETU_PRO_FK' 
                                     ,'ETUDIANT')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'ETU_COM_FK') THEN
        cg$errors.push(nvl(ETU_COM_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'ETU_COM_FK' 
                                     ,'ETUDIANT')),
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

D100_NATIONALITE CONSTANT ETUDIANT.NATIONALITE%TYPE := 'Française';
D291_EST_DIPLOME CONSTANT ETUDIANT.EST_DIPLOME%TYPE := 'N';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.NATIONALITE) THEN cg$rec.NATIONALITE := D100_NATIONALITE; END IF;
    IF NOT (cg$ind.EST_DIPLOME) THEN cg$rec.EST_DIPLOME := D291_EST_DIPLOME; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO ETUDIANT
            (NO_ETUDIANT_NAT
            ,ANNEE_PRO
            ,CODE_COM
            ,NO_ETUDIANT_UBO
            ,SEXE
            ,NOM
            ,PRENOM
            ,DATE_NAISSANCE
            ,LIEU_NAISSANCE
            ,SITUATION
            ,NATIONALITE
            ,TEL_PORT
            ,TEL_FIXE
            ,EMAIL
            ,ACTU_ADRESSE
            ,ACTU_CP
            ,ACTU_VILLE
            ,ACTU_PAYS
            ,PERM_ADRESSE
            ,PERM_CP
            ,PERM_VILLE
            ,PERM_PAYS
            ,DERNIER_DIPLOME
            ,UNIVERSITE
            ,SIGLE_ETU
            ,COMPTE_CRI
            ,UBO_EMAIL
            ,GRPE_ANGLAIS
            ,ABANDON_MOTIF
            ,ABANDON_DATE
            ,EST_DIPLOME)
        VALUES
            (cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.ANNEE_PRO
            ,cg$rec.CODE_COM
            ,cg$rec.NO_ETUDIANT_UBO
            ,cg$rec.SEXE
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.DATE_NAISSANCE
            ,cg$rec.LIEU_NAISSANCE
            ,cg$rec.SITUATION
            ,cg$rec.NATIONALITE
            ,cg$rec.TEL_PORT
            ,cg$rec.TEL_FIXE
            ,cg$rec.EMAIL
            ,cg$rec.ACTU_ADRESSE
            ,cg$rec.ACTU_CP
            ,cg$rec.ACTU_VILLE
            ,cg$rec.ACTU_PAYS
            ,cg$rec.PERM_ADRESSE
            ,cg$rec.PERM_CP
            ,cg$rec.PERM_VILLE
            ,cg$rec.PERM_PAYS
            ,cg$rec.DERNIER_DIPLOME
            ,cg$rec.UNIVERSITE
            ,cg$rec.SIGLE_ETU
            ,cg$rec.COMPTE_CRI
            ,cg$rec.UBO_EMAIL
            ,cg$rec.GRPE_ANGLAIS
            ,cg$rec.ABANDON_MOTIF
            ,cg$rec.ABANDON_DATE
            ,cg$rec.EST_DIPLOME
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
        validate_mandatory(cg$rec, 'cg$ETUDIANT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ETUDIANT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ETUDIANT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ETUDIANT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ETUDIANT.ins.others');
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

 
    IF ( cg$pk.NO_ETUDIANT_NAT IS NULL ) THEN          
      cg$upd_rec.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    ELSE
      cg$upd_rec.NO_ETUDIANT_NAT := cg$pk.NO_ETUDIANT_NAT;
    END IF;
    cg$old_rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;

    IF ( cg$pk.the_rowid IS NULL ) THEN             
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;

    IF ( do_upd ) THEN

        slct(cg$upd_rec);


        --  Report error if attempt to update non updateable Primary Key ETU_PK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_uk_not_updateable('ETU_PK');
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.CODE_COM) THEN
            cg$rec.CODE_COM := cg$upd_rec.CODE_COM;
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_UBO) THEN
            cg$rec.NO_ETUDIANT_UBO := cg$upd_rec.NO_ETUDIANT_UBO;
        END IF;
        IF NOT (cg$ind.SEXE) THEN
            cg$rec.SEXE := cg$upd_rec.SEXE;
        END IF;
        IF NOT (cg$ind.NOM) THEN
            cg$rec.NOM := cg$upd_rec.NOM;
        END IF;
        IF NOT (cg$ind.PRENOM) THEN
            cg$rec.PRENOM := cg$upd_rec.PRENOM;
        END IF;
        IF NOT (cg$ind.DATE_NAISSANCE) THEN
            cg$rec.DATE_NAISSANCE := cg$upd_rec.DATE_NAISSANCE;
        END IF;
        IF NOT (cg$ind.LIEU_NAISSANCE) THEN
            cg$rec.LIEU_NAISSANCE := cg$upd_rec.LIEU_NAISSANCE;
        END IF;
        IF NOT (cg$ind.SITUATION) THEN
            cg$rec.SITUATION := cg$upd_rec.SITUATION;
        END IF;
        IF NOT (cg$ind.NATIONALITE) THEN
            cg$rec.NATIONALITE := cg$upd_rec.NATIONALITE;
        END IF;
        IF NOT (cg$ind.TEL_PORT) THEN
            cg$rec.TEL_PORT := cg$upd_rec.TEL_PORT;
        END IF;
        IF NOT (cg$ind.TEL_FIXE) THEN
            cg$rec.TEL_FIXE := cg$upd_rec.TEL_FIXE;
        END IF;
        IF NOT (cg$ind.EMAIL) THEN
            cg$rec.EMAIL := cg$upd_rec.EMAIL;
        END IF;
        IF NOT (cg$ind.ACTU_ADRESSE) THEN
            cg$rec.ACTU_ADRESSE := cg$upd_rec.ACTU_ADRESSE;
        END IF;
        IF NOT (cg$ind.ACTU_CP) THEN
            cg$rec.ACTU_CP := cg$upd_rec.ACTU_CP;
        END IF;
        IF NOT (cg$ind.ACTU_VILLE) THEN
            cg$rec.ACTU_VILLE := cg$upd_rec.ACTU_VILLE;
        END IF;
        IF NOT (cg$ind.ACTU_PAYS) THEN
            cg$rec.ACTU_PAYS := cg$upd_rec.ACTU_PAYS;
        END IF;
        IF NOT (cg$ind.PERM_ADRESSE) THEN
            cg$rec.PERM_ADRESSE := cg$upd_rec.PERM_ADRESSE;
        END IF;
        IF NOT (cg$ind.PERM_CP) THEN
            cg$rec.PERM_CP := cg$upd_rec.PERM_CP;
        END IF;
        IF NOT (cg$ind.PERM_VILLE) THEN
            cg$rec.PERM_VILLE := cg$upd_rec.PERM_VILLE;
        END IF;
        IF NOT (cg$ind.PERM_PAYS) THEN
            cg$rec.PERM_PAYS := cg$upd_rec.PERM_PAYS;
        END IF;
        IF NOT (cg$ind.DERNIER_DIPLOME) THEN
            cg$rec.DERNIER_DIPLOME := cg$upd_rec.DERNIER_DIPLOME;
        END IF;
        IF NOT (cg$ind.UNIVERSITE) THEN
            cg$rec.UNIVERSITE := cg$upd_rec.UNIVERSITE;
        END IF;
        IF NOT (cg$ind.SIGLE_ETU) THEN
            cg$rec.SIGLE_ETU := cg$upd_rec.SIGLE_ETU;
        END IF;
        IF NOT (cg$ind.COMPTE_CRI) THEN
            cg$rec.COMPTE_CRI := cg$upd_rec.COMPTE_CRI;
        END IF;
        IF NOT (cg$ind.UBO_EMAIL) THEN
            cg$rec.UBO_EMAIL := cg$upd_rec.UBO_EMAIL;
        END IF;
        IF NOT (cg$ind.GRPE_ANGLAIS) THEN
            cg$rec.GRPE_ANGLAIS := cg$upd_rec.GRPE_ANGLAIS;
        END IF;
        IF NOT (cg$ind.ABANDON_MOTIF) THEN
            cg$rec.ABANDON_MOTIF := cg$upd_rec.ABANDON_MOTIF;
        END IF;
        IF NOT (cg$ind.ABANDON_DATE) THEN
            cg$rec.ABANDON_DATE := cg$upd_rec.ABANDON_DATE;
        END IF;
        IF NOT (cg$ind.EST_DIPLOME) THEN
            cg$rec.EST_DIPLOME := cg$upd_rec.EST_DIPLOME;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key ETU_PK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_uk_not_updateable('ETU_PK');
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
            UPDATE ETUDIANT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,CODE_COM = cg$rec.CODE_COM
              ,NO_ETUDIANT_UBO = cg$rec.NO_ETUDIANT_UBO
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,SITUATION = cg$rec.SITUATION
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TEL_PORT = cg$rec.TEL_PORT
              ,TEL_FIXE = cg$rec.TEL_FIXE
              ,EMAIL = cg$rec.EMAIL
              ,ACTU_ADRESSE = cg$rec.ACTU_ADRESSE
              ,ACTU_CP = cg$rec.ACTU_CP
              ,ACTU_VILLE = cg$rec.ACTU_VILLE
              ,ACTU_PAYS = cg$rec.ACTU_PAYS
              ,PERM_ADRESSE = cg$rec.PERM_ADRESSE
              ,PERM_CP = cg$rec.PERM_CP
              ,PERM_VILLE = cg$rec.PERM_VILLE
              ,PERM_PAYS = cg$rec.PERM_PAYS
              ,DERNIER_DIPLOME = cg$rec.DERNIER_DIPLOME
              ,UNIVERSITE = cg$rec.UNIVERSITE
              ,SIGLE_ETU = cg$rec.SIGLE_ETU
              ,COMPTE_CRI = cg$rec.COMPTE_CRI
              ,UBO_EMAIL = cg$rec.UBO_EMAIL
              ,GRPE_ANGLAIS = cg$rec.GRPE_ANGLAIS
              ,ABANDON_MOTIF = cg$rec.ABANDON_MOTIF
              ,ABANDON_DATE = cg$rec.ABANDON_DATE
              ,EST_DIPLOME = cg$rec.EST_DIPLOME
            WHERE  NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT;
            null;
          ELSE
            UPDATE ETUDIANT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,CODE_COM = cg$rec.CODE_COM
              ,NO_ETUDIANT_UBO = cg$rec.NO_ETUDIANT_UBO
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,SITUATION = cg$rec.SITUATION
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TEL_PORT = cg$rec.TEL_PORT
              ,TEL_FIXE = cg$rec.TEL_FIXE
              ,EMAIL = cg$rec.EMAIL
              ,ACTU_ADRESSE = cg$rec.ACTU_ADRESSE
              ,ACTU_CP = cg$rec.ACTU_CP
              ,ACTU_VILLE = cg$rec.ACTU_VILLE
              ,ACTU_PAYS = cg$rec.ACTU_PAYS
              ,PERM_ADRESSE = cg$rec.PERM_ADRESSE
              ,PERM_CP = cg$rec.PERM_CP
              ,PERM_VILLE = cg$rec.PERM_VILLE
              ,PERM_PAYS = cg$rec.PERM_PAYS
              ,DERNIER_DIPLOME = cg$rec.DERNIER_DIPLOME
              ,UNIVERSITE = cg$rec.UNIVERSITE
              ,SIGLE_ETU = cg$rec.SIGLE_ETU
              ,COMPTE_CRI = cg$rec.COMPTE_CRI
              ,UBO_EMAIL = cg$rec.UBO_EMAIL
              ,GRPE_ANGLAIS = cg$rec.GRPE_ANGLAIS
              ,ABANDON_MOTIF = cg$rec.ABANDON_MOTIF
              ,ABANDON_DATE = cg$rec.ABANDON_DATE
              ,EST_DIPLOME = cg$rec.EST_DIPLOME
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
        cg$table(idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
        cg$tableind(idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;
        cg$table(idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
        cg$tableind(idx).ANNEE_PRO := cg$ind.ANNEE_PRO;
        cg$table(idx).CODE_COM := cg$rec.CODE_COM;
        cg$tableind(idx).CODE_COM := cg$ind.CODE_COM;
        cg$table(idx).NO_ETUDIANT_UBO := cg$rec.NO_ETUDIANT_UBO;
        cg$tableind(idx).NO_ETUDIANT_UBO := cg$ind.NO_ETUDIANT_UBO;
        cg$table(idx).SEXE := cg$rec.SEXE;
        cg$tableind(idx).SEXE := cg$ind.SEXE;
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).DATE_NAISSANCE := cg$rec.DATE_NAISSANCE;
        cg$tableind(idx).DATE_NAISSANCE := cg$ind.DATE_NAISSANCE;
        cg$table(idx).LIEU_NAISSANCE := cg$rec.LIEU_NAISSANCE;
        cg$tableind(idx).LIEU_NAISSANCE := cg$ind.LIEU_NAISSANCE;
        cg$table(idx).SITUATION := cg$rec.SITUATION;
        cg$tableind(idx).SITUATION := cg$ind.SITUATION;
        cg$table(idx).NATIONALITE := cg$rec.NATIONALITE;
        cg$tableind(idx).NATIONALITE := cg$ind.NATIONALITE;
        cg$table(idx).TEL_PORT := cg$rec.TEL_PORT;
        cg$tableind(idx).TEL_PORT := cg$ind.TEL_PORT;
        cg$table(idx).TEL_FIXE := cg$rec.TEL_FIXE;
        cg$tableind(idx).TEL_FIXE := cg$ind.TEL_FIXE;
        cg$table(idx).EMAIL := cg$rec.EMAIL;
        cg$tableind(idx).EMAIL := cg$ind.EMAIL;
        cg$table(idx).ACTU_ADRESSE := cg$rec.ACTU_ADRESSE;
        cg$tableind(idx).ACTU_ADRESSE := cg$ind.ACTU_ADRESSE;
        cg$table(idx).ACTU_CP := cg$rec.ACTU_CP;
        cg$tableind(idx).ACTU_CP := cg$ind.ACTU_CP;
        cg$table(idx).ACTU_VILLE := cg$rec.ACTU_VILLE;
        cg$tableind(idx).ACTU_VILLE := cg$ind.ACTU_VILLE;
        cg$table(idx).ACTU_PAYS := cg$rec.ACTU_PAYS;
        cg$tableind(idx).ACTU_PAYS := cg$ind.ACTU_PAYS;
        cg$table(idx).PERM_ADRESSE := cg$rec.PERM_ADRESSE;
        cg$tableind(idx).PERM_ADRESSE := cg$ind.PERM_ADRESSE;
        cg$table(idx).PERM_CP := cg$rec.PERM_CP;
        cg$tableind(idx).PERM_CP := cg$ind.PERM_CP;
        cg$table(idx).PERM_VILLE := cg$rec.PERM_VILLE;
        cg$tableind(idx).PERM_VILLE := cg$ind.PERM_VILLE;
        cg$table(idx).PERM_PAYS := cg$rec.PERM_PAYS;
        cg$tableind(idx).PERM_PAYS := cg$ind.PERM_PAYS;
        cg$table(idx).DERNIER_DIPLOME := cg$rec.DERNIER_DIPLOME;
        cg$tableind(idx).DERNIER_DIPLOME := cg$ind.DERNIER_DIPLOME;
        cg$table(idx).UNIVERSITE := cg$rec.UNIVERSITE;
        cg$tableind(idx).UNIVERSITE := cg$ind.UNIVERSITE;
        cg$table(idx).SIGLE_ETU := cg$rec.SIGLE_ETU;
        cg$tableind(idx).SIGLE_ETU := cg$ind.SIGLE_ETU;
        cg$table(idx).COMPTE_CRI := cg$rec.COMPTE_CRI;
        cg$tableind(idx).COMPTE_CRI := cg$ind.COMPTE_CRI;
        cg$table(idx).UBO_EMAIL := cg$rec.UBO_EMAIL;
        cg$tableind(idx).UBO_EMAIL := cg$ind.UBO_EMAIL;
        cg$table(idx).GRPE_ANGLAIS := cg$rec.GRPE_ANGLAIS;
        cg$tableind(idx).GRPE_ANGLAIS := cg$ind.GRPE_ANGLAIS;
        cg$table(idx).ABANDON_MOTIF := cg$rec.ABANDON_MOTIF;
        cg$tableind(idx).ABANDON_MOTIF := cg$ind.ABANDON_MOTIF;
        cg$table(idx).ABANDON_DATE := cg$rec.ABANDON_DATE;
        cg$tableind(idx).ABANDON_DATE := cg$ind.ABANDON_DATE;
        cg$table(idx).EST_DIPLOME := cg$rec.EST_DIPLOME;
        cg$tableind(idx).EST_DIPLOME := cg$ind.EST_DIPLOME;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$ETUDIANT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$ETUDIANT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$ETUDIANT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$ETUDIANT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ETUDIANT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of ETUDIANT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for ETUDIANT's domain key constraint columns 
--              cg$ind      Indicates changed ETUDIANT's domain key constraint columns
--              cg$old_rec  Current values for ETUDIANT's domain key constraint columns
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
           cg$rec.NO_ETUDIANT_NAT := cg$pk.NO_ETUDIANT_NAT;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE ETUDIANT
              WHERE                    NO_ETUDIANT_NAT = cg$pk.NO_ETUDIANT_NAT;
           ELSE
              DELETE ETUDIANT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$ETUDIANT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ETUDIANT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$ETUDIANT.del.others');
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
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            CODE_COM
               ,            NO_ETUDIANT_UBO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_PORT
               ,            TEL_FIXE
               ,            EMAIL
               ,            ACTU_ADRESSE
               ,            ACTU_CP
               ,            ACTU_VILLE
               ,            ACTU_PAYS
               ,            PERM_ADRESSE
               ,            PERM_CP
               ,            PERM_VILLE
               ,            PERM_PAYS
               ,            DERNIER_DIPLOME
               ,            UNIVERSITE
               ,            SIGLE_ETU
               ,            COMPTE_CRI
               ,            UBO_EMAIL
               ,            GRPE_ANGLAIS
               ,            ABANDON_MOTIF
               ,            ABANDON_DATE
               ,            EST_DIPLOME
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_ETUDIANT_UBO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ACTU_ADRESSE
               ,            cg$tmp_rec.ACTU_CP
               ,            cg$tmp_rec.ACTU_VILLE
               ,            cg$tmp_rec.ACTU_PAYS
               ,            cg$tmp_rec.PERM_ADRESSE
               ,            cg$tmp_rec.PERM_CP
               ,            cg$tmp_rec.PERM_VILLE
               ,            cg$tmp_rec.PERM_PAYS
               ,            cg$tmp_rec.DERNIER_DIPLOME
               ,            cg$tmp_rec.UNIVERSITE
               ,            cg$tmp_rec.SIGLE_ETU
               ,            cg$tmp_rec.COMPTE_CRI
               ,            cg$tmp_rec.UBO_EMAIL
               ,            cg$tmp_rec.GRPE_ANGLAIS
               ,            cg$tmp_rec.ABANDON_MOTIF
               ,            cg$tmp_rec.ABANDON_DATE
               ,            cg$tmp_rec.EST_DIPLOME
               FROM      ETUDIANT
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            CODE_COM
               ,            NO_ETUDIANT_UBO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_PORT
               ,            TEL_FIXE
               ,            EMAIL
               ,            ACTU_ADRESSE
               ,            ACTU_CP
               ,            ACTU_VILLE
               ,            ACTU_PAYS
               ,            PERM_ADRESSE
               ,            PERM_CP
               ,            PERM_VILLE
               ,            PERM_PAYS
               ,            DERNIER_DIPLOME
               ,            UNIVERSITE
               ,            SIGLE_ETU
               ,            COMPTE_CRI
               ,            UBO_EMAIL
               ,            GRPE_ANGLAIS
               ,            ABANDON_MOTIF
               ,            ABANDON_DATE
               ,            EST_DIPLOME
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_ETUDIANT_UBO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ACTU_ADRESSE
               ,            cg$tmp_rec.ACTU_CP
               ,            cg$tmp_rec.ACTU_VILLE
               ,            cg$tmp_rec.ACTU_PAYS
               ,            cg$tmp_rec.PERM_ADRESSE
               ,            cg$tmp_rec.PERM_CP
               ,            cg$tmp_rec.PERM_VILLE
               ,            cg$tmp_rec.PERM_PAYS
               ,            cg$tmp_rec.DERNIER_DIPLOME
               ,            cg$tmp_rec.UNIVERSITE
               ,            cg$tmp_rec.SIGLE_ETU
               ,            cg$tmp_rec.COMPTE_CRI
               ,            cg$tmp_rec.UBO_EMAIL
               ,            cg$tmp_rec.GRPE_ANGLAIS
               ,            cg$tmp_rec.ABANDON_MOTIF
               ,            cg$tmp_rec.ABANDON_DATE
               ,            cg$tmp_rec.EST_DIPLOME
               FROM      ETUDIANT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            CODE_COM
               ,            NO_ETUDIANT_UBO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_PORT
               ,            TEL_FIXE
               ,            EMAIL
               ,            ACTU_ADRESSE
               ,            ACTU_CP
               ,            ACTU_VILLE
               ,            ACTU_PAYS
               ,            PERM_ADRESSE
               ,            PERM_CP
               ,            PERM_VILLE
               ,            PERM_PAYS
               ,            DERNIER_DIPLOME
               ,            UNIVERSITE
               ,            SIGLE_ETU
               ,            COMPTE_CRI
               ,            UBO_EMAIL
               ,            GRPE_ANGLAIS
               ,            ABANDON_MOTIF
               ,            ABANDON_DATE
               ,            EST_DIPLOME
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_ETUDIANT_UBO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ACTU_ADRESSE
               ,            cg$tmp_rec.ACTU_CP
               ,            cg$tmp_rec.ACTU_VILLE
               ,            cg$tmp_rec.ACTU_PAYS
               ,            cg$tmp_rec.PERM_ADRESSE
               ,            cg$tmp_rec.PERM_CP
               ,            cg$tmp_rec.PERM_VILLE
               ,            cg$tmp_rec.PERM_PAYS
               ,            cg$tmp_rec.DERNIER_DIPLOME
               ,            cg$tmp_rec.UNIVERSITE
               ,            cg$tmp_rec.SIGLE_ETU
               ,            cg$tmp_rec.COMPTE_CRI
               ,            cg$tmp_rec.UBO_EMAIL
               ,            cg$tmp_rec.GRPE_ANGLAIS
               ,            cg$tmp_rec.ABANDON_MOTIF
               ,            cg$tmp_rec.ABANDON_DATE
               ,            cg$tmp_rec.EST_DIPLOME
               FROM      ETUDIANT
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            CODE_COM
               ,            NO_ETUDIANT_UBO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_PORT
               ,            TEL_FIXE
               ,            EMAIL
               ,            ACTU_ADRESSE
               ,            ACTU_CP
               ,            ACTU_VILLE
               ,            ACTU_PAYS
               ,            PERM_ADRESSE
               ,            PERM_CP
               ,            PERM_VILLE
               ,            PERM_PAYS
               ,            DERNIER_DIPLOME
               ,            UNIVERSITE
               ,            SIGLE_ETU
               ,            COMPTE_CRI
               ,            UBO_EMAIL
               ,            GRPE_ANGLAIS
               ,            ABANDON_MOTIF
               ,            ABANDON_DATE
               ,            EST_DIPLOME
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.CODE_COM
               ,            cg$tmp_rec.NO_ETUDIANT_UBO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_PORT
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.EMAIL
               ,            cg$tmp_rec.ACTU_ADRESSE
               ,            cg$tmp_rec.ACTU_CP
               ,            cg$tmp_rec.ACTU_VILLE
               ,            cg$tmp_rec.ACTU_PAYS
               ,            cg$tmp_rec.PERM_ADRESSE
               ,            cg$tmp_rec.PERM_CP
               ,            cg$tmp_rec.PERM_VILLE
               ,            cg$tmp_rec.PERM_PAYS
               ,            cg$tmp_rec.DERNIER_DIPLOME
               ,            cg$tmp_rec.UNIVERSITE
               ,            cg$tmp_rec.SIGLE_ETU
               ,            cg$tmp_rec.COMPTE_CRI
               ,            cg$tmp_rec.UBO_EMAIL
               ,            cg$tmp_rec.GRPE_ANGLAIS
               ,            cg$tmp_rec.ABANDON_MOTIF
               ,            cg$tmp_rec.ABANDON_DATE
               ,            cg$tmp_rec.EST_DIPLOME
               FROM      ETUDIANT
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
                           'cg$ETUDIANT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ETUDIANT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$ETUDIANT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.CODE_COM) THEN
        IF (cg$tmp_rec.CODE_COM IS NOT NULL
        AND cg$old_rec.CODE_COM IS NOT NULL) THEN
            IF (cg$tmp_rec.CODE_COM != cg$old_rec.CODE_COM) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25CODE_COM
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CODE_COM IS NOT NULL
        OR cg$old_rec.CODE_COM IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P25CODE_COM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ETUDIANT_UBO) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_UBO IS NOT NULL
        AND cg$old_rec.NO_ETUDIANT_UBO IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ETUDIANT_UBO != cg$old_rec.NO_ETUDIANT_UBO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_ETUDIANT_UBO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ETUDIANT_UBO IS NOT NULL
        OR cg$old_rec.NO_ETUDIANT_UBO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30NO_ETUDIANT_UBO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_PORT) THEN
        IF (cg$tmp_rec.TEL_PORT IS NOT NULL
        AND cg$old_rec.TEL_PORT IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PORT != cg$old_rec.TEL_PORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110TEL_PORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PORT IS NOT NULL
        OR cg$old_rec.TEL_PORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110TEL_PORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_FIXE) THEN
        IF (cg$tmp_rec.TEL_FIXE IS NOT NULL
        AND cg$old_rec.TEL_FIXE IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_FIXE != cg$old_rec.TEL_FIXE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120TEL_FIXE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_FIXE IS NOT NULL
        OR cg$old_rec.TEL_FIXE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120TEL_FIXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL) THEN
        IF (cg$tmp_rec.EMAIL IS NOT NULL
        AND cg$old_rec.EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.EMAIL != cg$old_rec.EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EMAIL IS NOT NULL
        OR cg$old_rec.EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_ADRESSE) THEN
        IF (cg$tmp_rec.ACTU_ADRESSE IS NOT NULL
        AND cg$old_rec.ACTU_ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_ADRESSE != cg$old_rec.ACTU_ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140ACTU_ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_ADRESSE IS NOT NULL
        OR cg$old_rec.ACTU_ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140ACTU_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_CP) THEN
        IF (cg$tmp_rec.ACTU_CP IS NOT NULL
        AND cg$old_rec.ACTU_CP IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_CP != cg$old_rec.ACTU_CP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150ACTU_CP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_CP IS NOT NULL
        OR cg$old_rec.ACTU_CP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150ACTU_CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_VILLE) THEN
        IF (cg$tmp_rec.ACTU_VILLE IS NOT NULL
        AND cg$old_rec.ACTU_VILLE IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_VILLE != cg$old_rec.ACTU_VILLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160ACTU_VILLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_VILLE IS NOT NULL
        OR cg$old_rec.ACTU_VILLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160ACTU_VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_PAYS) THEN
        IF (cg$tmp_rec.ACTU_PAYS IS NOT NULL
        AND cg$old_rec.ACTU_PAYS IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_PAYS != cg$old_rec.ACTU_PAYS) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170ACTU_PAYS
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_PAYS IS NOT NULL
        OR cg$old_rec.ACTU_PAYS IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170ACTU_PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.UBO_EMAIL) THEN
        IF (cg$tmp_rec.UBO_EMAIL IS NOT NULL
        AND cg$old_rec.UBO_EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.UBO_EMAIL != cg$old_rec.UBO_EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P260UBO_EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.UBO_EMAIL IS NOT NULL
        OR cg$old_rec.UBO_EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P260UBO_EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.GRPE_ANGLAIS) THEN
        IF (cg$tmp_rec.GRPE_ANGLAIS IS NOT NULL
        AND cg$old_rec.GRPE_ANGLAIS IS NOT NULL) THEN
            IF (cg$tmp_rec.GRPE_ANGLAIS != cg$old_rec.GRPE_ANGLAIS) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270GRPE_ANGLAIS
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.GRPE_ANGLAIS IS NOT NULL
        OR cg$old_rec.GRPE_ANGLAIS IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270GRPE_ANGLAIS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ABANDON_MOTIF) THEN
        IF (cg$tmp_rec.ABANDON_MOTIF IS NOT NULL
        AND cg$old_rec.ABANDON_MOTIF IS NOT NULL) THEN
            IF (cg$tmp_rec.ABANDON_MOTIF != cg$old_rec.ABANDON_MOTIF) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280ABANDON_MOTIF
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ABANDON_MOTIF IS NOT NULL
        OR cg$old_rec.ABANDON_MOTIF IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280ABANDON_MOTIF
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ABANDON_DATE) THEN
        IF (cg$tmp_rec.ABANDON_DATE IS NOT NULL
        AND cg$old_rec.ABANDON_DATE IS NOT NULL) THEN
            IF (cg$tmp_rec.ABANDON_DATE != cg$old_rec.ABANDON_DATE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P290ABANDON_DATE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ABANDON_DATE IS NOT NULL
        OR cg$old_rec.ABANDON_DATE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P290ABANDON_DATE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EST_DIPLOME) THEN
        IF (cg$tmp_rec.EST_DIPLOME IS NOT NULL
        AND cg$old_rec.EST_DIPLOME IS NOT NULL) THEN
            IF (cg$tmp_rec.EST_DIPLOME != cg$old_rec.EST_DIPLOME) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P291EST_DIPLOME
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EST_DIPLOME IS NOT NULL
        OR cg$old_rec.EST_DIPLOME IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P291EST_DIPLOME
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SEXE) THEN
        IF (cg$tmp_rec.SEXE != cg$old_rec.SEXE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40SEXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_NAISSANCE) THEN
        IF (cg$tmp_rec.DATE_NAISSANCE != cg$old_rec.DATE_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70DATE_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU_NAISSANCE) THEN
        IF (cg$tmp_rec.LIEU_NAISSANCE != cg$old_rec.LIEU_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80LIEU_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SITUATION) THEN
        IF (cg$tmp_rec.SITUATION != cg$old_rec.SITUATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90SITUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NATIONALITE) THEN
        IF (cg$tmp_rec.NATIONALITE != cg$old_rec.NATIONALITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100NATIONALITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_ADRESSE) THEN
        IF (cg$tmp_rec.PERM_ADRESSE != cg$old_rec.PERM_ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180PERM_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_CP) THEN
        IF (cg$tmp_rec.PERM_CP != cg$old_rec.PERM_CP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190PERM_CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_VILLE) THEN
        IF (cg$tmp_rec.PERM_VILLE != cg$old_rec.PERM_VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200PERM_VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_PAYS) THEN
        IF (cg$tmp_rec.PERM_PAYS != cg$old_rec.PERM_PAYS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P210PERM_PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DERNIER_DIPLOME) THEN
        IF (cg$tmp_rec.DERNIER_DIPLOME != cg$old_rec.DERNIER_DIPLOME) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P220DERNIER_DIPLOME
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.UNIVERSITE) THEN
        IF (cg$tmp_rec.UNIVERSITE != cg$old_rec.UNIVERSITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230UNIVERSITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SIGLE_ETU) THEN
        IF (cg$tmp_rec.SIGLE_ETU != cg$old_rec.SIGLE_ETU) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P240SIGLE_ETU
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMPTE_CRI) THEN
        IF (cg$tmp_rec.COMPTE_CRI != cg$old_rec.COMPTE_CRI) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P250COMPTE_CRI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$ETUDIANT.lck');
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
      cg$ind_true.NO_ETUDIANT_NAT := TRUE;
      cg$ind_true.ANNEE_PRO := TRUE;
      cg$ind_true.CODE_COM := TRUE;
      cg$ind_true.NO_ETUDIANT_UBO := TRUE;
      cg$ind_true.SEXE := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.DATE_NAISSANCE := TRUE;
      cg$ind_true.LIEU_NAISSANCE := TRUE;
      cg$ind_true.SITUATION := TRUE;
      cg$ind_true.NATIONALITE := TRUE;
      cg$ind_true.TEL_PORT := TRUE;
      cg$ind_true.TEL_FIXE := TRUE;
      cg$ind_true.EMAIL := TRUE;
      cg$ind_true.ACTU_ADRESSE := TRUE;
      cg$ind_true.ACTU_CP := TRUE;
      cg$ind_true.ACTU_VILLE := TRUE;
      cg$ind_true.ACTU_PAYS := TRUE;
      cg$ind_true.PERM_ADRESSE := TRUE;
      cg$ind_true.PERM_CP := TRUE;
      cg$ind_true.PERM_VILLE := TRUE;
      cg$ind_true.PERM_PAYS := TRUE;
      cg$ind_true.DERNIER_DIPLOME := TRUE;
      cg$ind_true.UNIVERSITE := TRUE;
      cg$ind_true.SIGLE_ETU := TRUE;
      cg$ind_true.COMPTE_CRI := TRUE;
      cg$ind_true.UBO_EMAIL := TRUE;
      cg$ind_true.GRPE_ANGLAIS := TRUE;
      cg$ind_true.ABANDON_MOTIF := TRUE;
      cg$ind_true.ABANDON_DATE := TRUE;
      cg$ind_true.EST_DIPLOME := TRUE;
   

END cg$ETUDIANT;
/

