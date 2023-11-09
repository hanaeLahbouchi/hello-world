
PROMPT Creating API Package Body for Table 'CANDIDAT'
--------------------------------------------------------------------------------
-- Name:        cg$CANDIDAT
-- Description: CANDIDAT table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$CANDIDAT IS

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
                   'cg$CANDIDAT.raise_uk_not_updateable');
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
                   'cg$CANDIDAT.raise_fk_not_transferable');
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
                    'cg$CANDIDAT.up_autogen_columns');
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
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30SEXE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50PRENOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60DATE_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LIEU_NAISSANCE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70LIEU_NAISSANCE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SITUATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80SITUATION),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NATIONALITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P90NATIONALITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_ADRESSE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P170PERM_ADRESSE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_CP IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P180PERM_CP),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_VILLE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P190PERM_VILLE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PERM_PAYS IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P200PERM_PAYS),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DERNIER_DIPLOME IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P210DERNIER_DIPLOME),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.UNIVERSITE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P220UNIVERSITE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SELECTION_ORIGINE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P230SELECTION_ORIGINE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SELECTION_COURANTE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P240SELECTION_COURANTE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.REPONSE_ILI IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P250REPONSE_ILI),
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
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         SITUATION
       ,         NATIONALITE
       ,         TEL_FIXE
       ,         TEL_PORT
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
       ,         SELECTION_ORIGINE
       ,         SELECTION_COURANTE
       ,         REPONSE_ILI
       ,         DATE_REPONSE_ILI
       ,         REPONSE_CAN
       ,         DATE_REPONSE_CAN
       ,         NO_ORDRE
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.SITUATION
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TEL_FIXE
       ,         cg$sel_rec.TEL_PORT
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
       ,         cg$sel_rec.SELECTION_ORIGINE
       ,         cg$sel_rec.SELECTION_COURANTE
       ,         cg$sel_rec.REPONSE_ILI
       ,         cg$sel_rec.DATE_REPONSE_ILI
       ,         cg$sel_rec.REPONSE_CAN
       ,         cg$sel_rec.DATE_REPONSE_CAN
       ,         cg$sel_rec.NO_ORDRE
       ,cg$sel_rec.the_rowid
       FROM   CANDIDAT
       WHERE        NO_ETUDIANT_NAT = cg$sel_rec.NO_ETUDIANT_NAT;
    ELSE
       SELECT    NO_ETUDIANT_NAT
       ,         ANNEE_PRO
       ,         SEXE
       ,         NOM
       ,         PRENOM
       ,         DATE_NAISSANCE
       ,         LIEU_NAISSANCE
       ,         SITUATION
       ,         NATIONALITE
       ,         TEL_FIXE
       ,         TEL_PORT
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
       ,         SELECTION_ORIGINE
       ,         SELECTION_COURANTE
       ,         REPONSE_ILI
       ,         DATE_REPONSE_ILI
       ,         REPONSE_CAN
       ,         DATE_REPONSE_CAN
       ,         NO_ORDRE
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.SEXE
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.DATE_NAISSANCE
       ,         cg$sel_rec.LIEU_NAISSANCE
       ,         cg$sel_rec.SITUATION
       ,         cg$sel_rec.NATIONALITE
       ,         cg$sel_rec.TEL_FIXE
       ,         cg$sel_rec.TEL_PORT
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
       ,         cg$sel_rec.SELECTION_ORIGINE
       ,         cg$sel_rec.SELECTION_COURANTE
       ,         cg$sel_rec.REPONSE_ILI
       ,         cg$sel_rec.DATE_REPONSE_ILI
       ,         cg$sel_rec.REPONSE_CAN
       ,         cg$sel_rec.DATE_REPONSE_CAN
       ,         cg$sel_rec.NO_ORDRE
       ,cg$sel_rec.the_rowid
       FROM   CANDIDAT
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$CANDIDAT.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to CANDIDAT 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
--              cg$old_rec Record of CANDIDAT previous values
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
--              of each child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
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
--              child table that references this table CANDIDAT 
--
-- Parameters:  cg$new_rec  New values for CANDIDAT's domain key constraint columns 
--              cg$new_ind  Indicates changed CANDIDAT's domain key constraint columns
--              cg$old_rec  Current values for CANDIDAT's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to CANDIDAT 
--
-- Parameters:  cg$rec     Record of CANDIDAT current values
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
--              child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
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
--              of each child table that references this tableCANDIDAT 
--
-- Parameters:  cg$old_rec     Record of CANDIDAT current values
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
-- Parameters:  cg$rec     Record of CANDIDAT current values
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
-- Parameters:  cg$rec     Record of CANDIDAT current values
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
                                            'CG_REF_CODES','CANDIDAT'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$CANDIDAT.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.v_domain.others');
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
    IF (con_name = 'CAN_PK') THEN
        cg$errors.push(nvl(CAN_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'CAN_PK' 
                                     ,'CANDIDAT')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);

    ELSIF (con_name = 'CAN_PRO_FK') THEN
        cg$errors.push(nvl(CAN_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'CAN_PRO_FK' 
                                     ,'CANDIDAT')),
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

D90_NATIONALITE CONSTANT CANDIDAT.NATIONALITE%TYPE := 'Française';
D250_REPONSE_ILI CONSTANT CANDIDAT.REPONSE_ILI%TYPE := 'N';
D270_REPONSE_CAN CONSTANT CANDIDAT.REPONSE_CAN%TYPE := 'NRE';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.NATIONALITE) THEN cg$rec.NATIONALITE := D90_NATIONALITE; END IF;
    IF NOT (cg$ind.REPONSE_ILI) THEN cg$rec.REPONSE_ILI := D250_REPONSE_ILI; END IF;
    IF NOT (cg$ind.REPONSE_CAN) THEN cg$rec.REPONSE_CAN := D270_REPONSE_CAN; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO CANDIDAT
            (NO_ETUDIANT_NAT
            ,ANNEE_PRO
            ,SEXE
            ,NOM
            ,PRENOM
            ,DATE_NAISSANCE
            ,LIEU_NAISSANCE
            ,SITUATION
            ,NATIONALITE
            ,TEL_FIXE
            ,TEL_PORT
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
            ,SELECTION_ORIGINE
            ,SELECTION_COURANTE
            ,REPONSE_ILI
            ,DATE_REPONSE_ILI
            ,REPONSE_CAN
            ,DATE_REPONSE_CAN
            ,NO_ORDRE)
        VALUES
            (cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.ANNEE_PRO
            ,cg$rec.SEXE
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.DATE_NAISSANCE
            ,cg$rec.LIEU_NAISSANCE
            ,cg$rec.SITUATION
            ,cg$rec.NATIONALITE
            ,cg$rec.TEL_FIXE
            ,cg$rec.TEL_PORT
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
            ,cg$rec.SELECTION_ORIGINE
            ,cg$rec.SELECTION_COURANTE
            ,cg$rec.REPONSE_ILI
            ,cg$rec.DATE_REPONSE_ILI
            ,cg$rec.REPONSE_CAN
            ,cg$rec.DATE_REPONSE_CAN
            ,cg$rec.NO_ORDRE
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
        validate_mandatory(cg$rec, 'cg$CANDIDAT.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CANDIDAT.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CANDIDAT.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CANDIDAT.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.ins.others');
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


        --  Report error if attempt to update non updateable Primary Key CAN_PK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_uk_not_updateable('CAN_PK');
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
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
        IF NOT (cg$ind.TEL_FIXE) THEN
            cg$rec.TEL_FIXE := cg$upd_rec.TEL_FIXE;
        END IF;
        IF NOT (cg$ind.TEL_PORT) THEN
            cg$rec.TEL_PORT := cg$upd_rec.TEL_PORT;
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
        IF NOT (cg$ind.SELECTION_ORIGINE) THEN
            cg$rec.SELECTION_ORIGINE := cg$upd_rec.SELECTION_ORIGINE;
        END IF;
        IF NOT (cg$ind.SELECTION_COURANTE) THEN
            cg$rec.SELECTION_COURANTE := cg$upd_rec.SELECTION_COURANTE;
        END IF;
        IF NOT (cg$ind.REPONSE_ILI) THEN
            cg$rec.REPONSE_ILI := cg$upd_rec.REPONSE_ILI;
        END IF;
        IF NOT (cg$ind.DATE_REPONSE_ILI) THEN
            cg$rec.DATE_REPONSE_ILI := cg$upd_rec.DATE_REPONSE_ILI;
        END IF;
        IF NOT (cg$ind.REPONSE_CAN) THEN
            cg$rec.REPONSE_CAN := cg$upd_rec.REPONSE_CAN;
        END IF;
        IF NOT (cg$ind.DATE_REPONSE_CAN) THEN
            cg$rec.DATE_REPONSE_CAN := cg$upd_rec.DATE_REPONSE_CAN;
        END IF;
        IF NOT (cg$ind.NO_ORDRE) THEN
            cg$rec.NO_ORDRE := cg$upd_rec.NO_ORDRE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
        --  Report error if attempt to update non updateable Primary Key CAN_PK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_uk_not_updateable('CAN_PK');
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
            UPDATE CANDIDAT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,SITUATION = cg$rec.SITUATION
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TEL_FIXE = cg$rec.TEL_FIXE
              ,TEL_PORT = cg$rec.TEL_PORT
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
              ,SELECTION_ORIGINE = cg$rec.SELECTION_ORIGINE
              ,SELECTION_COURANTE = cg$rec.SELECTION_COURANTE
              ,REPONSE_ILI = cg$rec.REPONSE_ILI
              ,DATE_REPONSE_ILI = cg$rec.DATE_REPONSE_ILI
              ,REPONSE_CAN = cg$rec.REPONSE_CAN
              ,DATE_REPONSE_CAN = cg$rec.DATE_REPONSE_CAN
              ,NO_ORDRE = cg$rec.NO_ORDRE
            WHERE  NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT;
            null;
          ELSE
            UPDATE CANDIDAT
            SET
              ANNEE_PRO = cg$rec.ANNEE_PRO
              ,SEXE = cg$rec.SEXE
              ,NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,DATE_NAISSANCE = cg$rec.DATE_NAISSANCE
              ,LIEU_NAISSANCE = cg$rec.LIEU_NAISSANCE
              ,SITUATION = cg$rec.SITUATION
              ,NATIONALITE = cg$rec.NATIONALITE
              ,TEL_FIXE = cg$rec.TEL_FIXE
              ,TEL_PORT = cg$rec.TEL_PORT
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
              ,SELECTION_ORIGINE = cg$rec.SELECTION_ORIGINE
              ,SELECTION_COURANTE = cg$rec.SELECTION_COURANTE
              ,REPONSE_ILI = cg$rec.REPONSE_ILI
              ,DATE_REPONSE_ILI = cg$rec.DATE_REPONSE_ILI
              ,REPONSE_CAN = cg$rec.REPONSE_CAN
              ,DATE_REPONSE_CAN = cg$rec.DATE_REPONSE_CAN
              ,NO_ORDRE = cg$rec.NO_ORDRE
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
        cg$table(idx).TEL_FIXE := cg$rec.TEL_FIXE;
        cg$tableind(idx).TEL_FIXE := cg$ind.TEL_FIXE;
        cg$table(idx).TEL_PORT := cg$rec.TEL_PORT;
        cg$tableind(idx).TEL_PORT := cg$ind.TEL_PORT;
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
        cg$table(idx).SELECTION_ORIGINE := cg$rec.SELECTION_ORIGINE;
        cg$tableind(idx).SELECTION_ORIGINE := cg$ind.SELECTION_ORIGINE;
        cg$table(idx).SELECTION_COURANTE := cg$rec.SELECTION_COURANTE;
        cg$tableind(idx).SELECTION_COURANTE := cg$ind.SELECTION_COURANTE;
        cg$table(idx).REPONSE_ILI := cg$rec.REPONSE_ILI;
        cg$tableind(idx).REPONSE_ILI := cg$ind.REPONSE_ILI;
        cg$table(idx).DATE_REPONSE_ILI := cg$rec.DATE_REPONSE_ILI;
        cg$tableind(idx).DATE_REPONSE_ILI := cg$ind.DATE_REPONSE_ILI;
        cg$table(idx).REPONSE_CAN := cg$rec.REPONSE_CAN;
        cg$tableind(idx).REPONSE_CAN := cg$ind.REPONSE_CAN;
        cg$table(idx).DATE_REPONSE_CAN := cg$rec.DATE_REPONSE_CAN;
        cg$tableind(idx).DATE_REPONSE_CAN := cg$ind.DATE_REPONSE_CAN;
        cg$table(idx).NO_ORDRE := cg$rec.NO_ORDRE;
        cg$tableind(idx).NO_ORDRE := cg$ind.NO_ORDRE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$CANDIDAT.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$CANDIDAT.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$CANDIDAT.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$CANDIDAT.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of CANDIDAT when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for CANDIDAT's domain key constraint columns 
--              cg$ind      Indicates changed CANDIDAT's domain key constraint columns
--              cg$old_rec  Current values for CANDIDAT's domain key constraint columns
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
              DELETE CANDIDAT
              WHERE                    NO_ETUDIANT_NAT = cg$pk.NO_ETUDIANT_NAT;
           ELSE
              DELETE CANDIDAT
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$CANDIDAT.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$CANDIDAT.del.others');
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
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_FIXE
               ,            TEL_PORT
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
               ,            SELECTION_ORIGINE
               ,            SELECTION_COURANTE
               ,            REPONSE_ILI
               ,            DATE_REPONSE_ILI
               ,            REPONSE_CAN
               ,            DATE_REPONSE_CAN
               ,            NO_ORDRE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.TEL_PORT
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
               ,            cg$tmp_rec.SELECTION_ORIGINE
               ,            cg$tmp_rec.SELECTION_COURANTE
               ,            cg$tmp_rec.REPONSE_ILI
               ,            cg$tmp_rec.DATE_REPONSE_ILI
               ,            cg$tmp_rec.REPONSE_CAN
               ,            cg$tmp_rec.DATE_REPONSE_CAN
               ,            cg$tmp_rec.NO_ORDRE
               FROM      CANDIDAT
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_FIXE
               ,            TEL_PORT
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
               ,            SELECTION_ORIGINE
               ,            SELECTION_COURANTE
               ,            REPONSE_ILI
               ,            DATE_REPONSE_ILI
               ,            REPONSE_CAN
               ,            DATE_REPONSE_CAN
               ,            NO_ORDRE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.TEL_PORT
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
               ,            cg$tmp_rec.SELECTION_ORIGINE
               ,            cg$tmp_rec.SELECTION_COURANTE
               ,            cg$tmp_rec.REPONSE_ILI
               ,            cg$tmp_rec.DATE_REPONSE_ILI
               ,            cg$tmp_rec.REPONSE_CAN
               ,            cg$tmp_rec.DATE_REPONSE_CAN
               ,            cg$tmp_rec.NO_ORDRE
               FROM      CANDIDAT
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_FIXE
               ,            TEL_PORT
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
               ,            SELECTION_ORIGINE
               ,            SELECTION_COURANTE
               ,            REPONSE_ILI
               ,            DATE_REPONSE_ILI
               ,            REPONSE_CAN
               ,            DATE_REPONSE_CAN
               ,            NO_ORDRE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.TEL_PORT
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
               ,            cg$tmp_rec.SELECTION_ORIGINE
               ,            cg$tmp_rec.SELECTION_COURANTE
               ,            cg$tmp_rec.REPONSE_ILI
               ,            cg$tmp_rec.DATE_REPONSE_ILI
               ,            cg$tmp_rec.REPONSE_CAN
               ,            cg$tmp_rec.DATE_REPONSE_CAN
               ,            cg$tmp_rec.NO_ORDRE
               FROM      CANDIDAT
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            ANNEE_PRO
               ,            SEXE
               ,            NOM
               ,            PRENOM
               ,            DATE_NAISSANCE
               ,            LIEU_NAISSANCE
               ,            SITUATION
               ,            NATIONALITE
               ,            TEL_FIXE
               ,            TEL_PORT
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
               ,            SELECTION_ORIGINE
               ,            SELECTION_COURANTE
               ,            REPONSE_ILI
               ,            DATE_REPONSE_ILI
               ,            REPONSE_CAN
               ,            DATE_REPONSE_CAN
               ,            NO_ORDRE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.SEXE
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.DATE_NAISSANCE
               ,            cg$tmp_rec.LIEU_NAISSANCE
               ,            cg$tmp_rec.SITUATION
               ,            cg$tmp_rec.NATIONALITE
               ,            cg$tmp_rec.TEL_FIXE
               ,            cg$tmp_rec.TEL_PORT
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
               ,            cg$tmp_rec.SELECTION_ORIGINE
               ,            cg$tmp_rec.SELECTION_COURANTE
               ,            cg$tmp_rec.REPONSE_ILI
               ,            cg$tmp_rec.DATE_REPONSE_ILI
               ,            cg$tmp_rec.REPONSE_CAN
               ,            cg$tmp_rec.DATE_REPONSE_CAN
               ,            cg$tmp_rec.NO_ORDRE
               FROM      CANDIDAT
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
                           'cg$CANDIDAT.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CANDIDAT.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$CANDIDAT.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.TEL_FIXE) THEN
        IF (cg$tmp_rec.TEL_FIXE IS NOT NULL
        AND cg$old_rec.TEL_FIXE IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_FIXE != cg$old_rec.TEL_FIXE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TEL_FIXE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_FIXE IS NOT NULL
        OR cg$old_rec.TEL_FIXE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100TEL_FIXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_PORT) THEN
        IF (cg$tmp_rec.TEL_PORT IS NOT NULL
        AND cg$old_rec.TEL_PORT IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PORT != cg$old_rec.TEL_PORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110TEL_PORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PORT IS NOT NULL
        OR cg$old_rec.TEL_PORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110TEL_PORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL) THEN
        IF (cg$tmp_rec.EMAIL IS NOT NULL
        AND cg$old_rec.EMAIL IS NOT NULL) THEN
            IF (cg$tmp_rec.EMAIL != cg$old_rec.EMAIL) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120EMAIL
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EMAIL IS NOT NULL
        OR cg$old_rec.EMAIL IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120EMAIL
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_ADRESSE) THEN
        IF (cg$tmp_rec.ACTU_ADRESSE IS NOT NULL
        AND cg$old_rec.ACTU_ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_ADRESSE != cg$old_rec.ACTU_ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130ACTU_ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_ADRESSE IS NOT NULL
        OR cg$old_rec.ACTU_ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130ACTU_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_CP) THEN
        IF (cg$tmp_rec.ACTU_CP IS NOT NULL
        AND cg$old_rec.ACTU_CP IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_CP != cg$old_rec.ACTU_CP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140ACTU_CP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_CP IS NOT NULL
        OR cg$old_rec.ACTU_CP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140ACTU_CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_VILLE) THEN
        IF (cg$tmp_rec.ACTU_VILLE IS NOT NULL
        AND cg$old_rec.ACTU_VILLE IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_VILLE != cg$old_rec.ACTU_VILLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150ACTU_VILLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_VILLE IS NOT NULL
        OR cg$old_rec.ACTU_VILLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150ACTU_VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ACTU_PAYS) THEN
        IF (cg$tmp_rec.ACTU_PAYS IS NOT NULL
        AND cg$old_rec.ACTU_PAYS IS NOT NULL) THEN
            IF (cg$tmp_rec.ACTU_PAYS != cg$old_rec.ACTU_PAYS) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160ACTU_PAYS
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ACTU_PAYS IS NOT NULL
        OR cg$old_rec.ACTU_PAYS IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160ACTU_PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_REPONSE_ILI) THEN
        IF (cg$tmp_rec.DATE_REPONSE_ILI IS NOT NULL
        AND cg$old_rec.DATE_REPONSE_ILI IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REPONSE_ILI != cg$old_rec.DATE_REPONSE_ILI) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P260DATE_REPONSE_ILI
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REPONSE_ILI IS NOT NULL
        OR cg$old_rec.DATE_REPONSE_ILI IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P260DATE_REPONSE_ILI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.REPONSE_CAN) THEN
        IF (cg$tmp_rec.REPONSE_CAN IS NOT NULL
        AND cg$old_rec.REPONSE_CAN IS NOT NULL) THEN
            IF (cg$tmp_rec.REPONSE_CAN != cg$old_rec.REPONSE_CAN) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270REPONSE_CAN
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.REPONSE_CAN IS NOT NULL
        OR cg$old_rec.REPONSE_CAN IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P270REPONSE_CAN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_REPONSE_CAN) THEN
        IF (cg$tmp_rec.DATE_REPONSE_CAN IS NOT NULL
        AND cg$old_rec.DATE_REPONSE_CAN IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_REPONSE_CAN != cg$old_rec.DATE_REPONSE_CAN) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280DATE_REPONSE_CAN
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_REPONSE_CAN IS NOT NULL
        OR cg$old_rec.DATE_REPONSE_CAN IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P280DATE_REPONSE_CAN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ORDRE) THEN
        IF (cg$tmp_rec.NO_ORDRE IS NOT NULL
        AND cg$old_rec.NO_ORDRE IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ORDRE != cg$old_rec.NO_ORDRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P290NO_ORDRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ORDRE IS NOT NULL
        OR cg$old_rec.NO_ORDRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P290NO_ORDRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SEXE) THEN
        IF (cg$tmp_rec.SEXE != cg$old_rec.SEXE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30SEXE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_NAISSANCE) THEN
        IF (cg$tmp_rec.DATE_NAISSANCE != cg$old_rec.DATE_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60DATE_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU_NAISSANCE) THEN
        IF (cg$tmp_rec.LIEU_NAISSANCE != cg$old_rec.LIEU_NAISSANCE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70LIEU_NAISSANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SITUATION) THEN
        IF (cg$tmp_rec.SITUATION != cg$old_rec.SITUATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80SITUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NATIONALITE) THEN
        IF (cg$tmp_rec.NATIONALITE != cg$old_rec.NATIONALITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90NATIONALITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_ADRESSE) THEN
        IF (cg$tmp_rec.PERM_ADRESSE != cg$old_rec.PERM_ADRESSE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P170PERM_ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_CP) THEN
        IF (cg$tmp_rec.PERM_CP != cg$old_rec.PERM_CP) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P180PERM_CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_VILLE) THEN
        IF (cg$tmp_rec.PERM_VILLE != cg$old_rec.PERM_VILLE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P190PERM_VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PERM_PAYS) THEN
        IF (cg$tmp_rec.PERM_PAYS != cg$old_rec.PERM_PAYS) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P200PERM_PAYS
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DERNIER_DIPLOME) THEN
        IF (cg$tmp_rec.DERNIER_DIPLOME != cg$old_rec.DERNIER_DIPLOME) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P210DERNIER_DIPLOME
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.UNIVERSITE) THEN
        IF (cg$tmp_rec.UNIVERSITE != cg$old_rec.UNIVERSITE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P220UNIVERSITE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SELECTION_ORIGINE) THEN
        IF (cg$tmp_rec.SELECTION_ORIGINE != cg$old_rec.SELECTION_ORIGINE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P230SELECTION_ORIGINE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SELECTION_COURANTE) THEN
        IF (cg$tmp_rec.SELECTION_COURANTE != cg$old_rec.SELECTION_COURANTE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P240SELECTION_COURANTE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.REPONSE_ILI) THEN
        IF (cg$tmp_rec.REPONSE_ILI != cg$old_rec.REPONSE_ILI) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P250REPONSE_ILI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$CANDIDAT.lck');
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
      cg$ind_true.SEXE := TRUE;
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.DATE_NAISSANCE := TRUE;
      cg$ind_true.LIEU_NAISSANCE := TRUE;
      cg$ind_true.SITUATION := TRUE;
      cg$ind_true.NATIONALITE := TRUE;
      cg$ind_true.TEL_FIXE := TRUE;
      cg$ind_true.TEL_PORT := TRUE;
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
      cg$ind_true.SELECTION_ORIGINE := TRUE;
      cg$ind_true.SELECTION_COURANTE := TRUE;
      cg$ind_true.REPONSE_ILI := TRUE;
      cg$ind_true.DATE_REPONSE_ILI := TRUE;
      cg$ind_true.REPONSE_CAN := TRUE;
      cg$ind_true.DATE_REPONSE_CAN := TRUE;
      cg$ind_true.NO_ORDRE := TRUE;
   

END cg$CANDIDAT;
/

