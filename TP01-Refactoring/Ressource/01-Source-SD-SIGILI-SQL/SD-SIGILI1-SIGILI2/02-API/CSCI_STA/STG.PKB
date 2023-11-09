
PROMPT Creating API Package Body for Table 'STAGE'
--------------------------------------------------------------------------------
-- Name:        cg$STAGE
-- Description: STAGE table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$STAGE IS

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
                   'cg$STAGE.raise_uk_not_updateable');
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
                   'cg$STAGE.raise_fk_not_transferable');
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
                    'cg$STAGE.up_autogen_columns');
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
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P10ANNEE_PRO),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ETUDIANT_NAT IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P15NO_ETUDIANT_NAT),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_ENTREPRISE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P17NO_ENTREPRISE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.NO_CONTACT_ILI IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P19NO_CONTACT_ILI),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.INTITULE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20INTITULE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.SUJET IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30SUJET),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_DEB IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40DATE_DEB),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.DATE_FIN IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P50DATE_FIN),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.LIEU IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P60LIEU),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.ETAT_STAGE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P70ETAT_STAGE),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.CLE_EVALUATION IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P80CLE_EVALUATION),
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
       ,         NO_ETUDIANT_NAT
       ,         NO_ENTREPRISE
       ,         NO_OFFRE
       ,         NO_CONTACT_ILI
       ,         INTITULE
       ,         SUJET
       ,         DATE_DEB
       ,         DATE_FIN
       ,         LIEU
       ,         ETAT_STAGE
       ,         CLE_EVALUATION
       ,         DESCRIPTION
       ,         ETAT_CONVENTION
       ,         DATE_SIGNATURE_CONV
       ,         NO_ENSEIGNANT
       ,         COMMENTAIRE_TUTEUR
       ,         DATE_RECEPTION_RAPPORT
       ,         NOTE_ENTREPRISE
       ,         NOTE_RAPPORT
       ,         NO_SESSION
       ,         NOTE_SOUTENANCE
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_OFFRE
       ,         cg$sel_rec.NO_CONTACT_ILI
       ,         cg$sel_rec.INTITULE
       ,         cg$sel_rec.SUJET
       ,         cg$sel_rec.DATE_DEB
       ,         cg$sel_rec.DATE_FIN
       ,         cg$sel_rec.LIEU
       ,         cg$sel_rec.ETAT_STAGE
       ,         cg$sel_rec.CLE_EVALUATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.ETAT_CONVENTION
       ,         cg$sel_rec.DATE_SIGNATURE_CONV
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.COMMENTAIRE_TUTEUR
       ,         cg$sel_rec.DATE_RECEPTION_RAPPORT
       ,         cg$sel_rec.NOTE_ENTREPRISE
       ,         cg$sel_rec.NOTE_RAPPORT
       ,         cg$sel_rec.NO_SESSION
       ,         cg$sel_rec.NOTE_SOUTENANCE
       ,cg$sel_rec.the_rowid
       FROM   STAGE
       WHERE        NO_ETUDIANT_NAT = cg$sel_rec.NO_ETUDIANT_NAT
       AND       ANNEE_PRO = cg$sel_rec.ANNEE_PRO;
    ELSE
       SELECT    ANNEE_PRO
       ,         NO_ETUDIANT_NAT
       ,         NO_ENTREPRISE
       ,         NO_OFFRE
       ,         NO_CONTACT_ILI
       ,         INTITULE
       ,         SUJET
       ,         DATE_DEB
       ,         DATE_FIN
       ,         LIEU
       ,         ETAT_STAGE
       ,         CLE_EVALUATION
       ,         DESCRIPTION
       ,         ETAT_CONVENTION
       ,         DATE_SIGNATURE_CONV
       ,         NO_ENSEIGNANT
       ,         COMMENTAIRE_TUTEUR
       ,         DATE_RECEPTION_RAPPORT
       ,         NOTE_ENTREPRISE
       ,         NOTE_RAPPORT
       ,         NO_SESSION
       ,         NOTE_SOUTENANCE
       , rowid
       INTO      cg$sel_rec.ANNEE_PRO
       ,         cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NO_ENTREPRISE
       ,         cg$sel_rec.NO_OFFRE
       ,         cg$sel_rec.NO_CONTACT_ILI
       ,         cg$sel_rec.INTITULE
       ,         cg$sel_rec.SUJET
       ,         cg$sel_rec.DATE_DEB
       ,         cg$sel_rec.DATE_FIN
       ,         cg$sel_rec.LIEU
       ,         cg$sel_rec.ETAT_STAGE
       ,         cg$sel_rec.CLE_EVALUATION
       ,         cg$sel_rec.DESCRIPTION
       ,         cg$sel_rec.ETAT_CONVENTION
       ,         cg$sel_rec.DATE_SIGNATURE_CONV
       ,         cg$sel_rec.NO_ENSEIGNANT
       ,         cg$sel_rec.COMMENTAIRE_TUTEUR
       ,         cg$sel_rec.DATE_RECEPTION_RAPPORT
       ,         cg$sel_rec.NOTE_ENTREPRISE
       ,         cg$sel_rec.NOTE_RAPPORT
       ,         cg$sel_rec.NO_SESSION
       ,         cg$sel_rec.NOTE_SOUTENANCE
       ,cg$sel_rec.the_rowid
       FROM   STAGE
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$STAGE.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to STAGE 
--
-- Parameters:  cg$rec     Record of STAGE current values
--              cg$old_rec Record of STAGE previous values
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
--              of each child table that references this tableSTAGE 
--
-- Parameters:  cg$old_rec     Record of STAGE current values
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
--              child table that references this table STAGE 
--
-- Parameters:  cg$new_rec  New values for STAGE's domain key constraint columns 
--              cg$new_ind  Indicates changed STAGE's domain key constraint columns
--              cg$old_rec  Current values for STAGE's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to STAGE 
--
-- Parameters:  cg$rec     Record of STAGE current values
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
--              child table that references this tableSTAGE 
--
-- Parameters:  cg$old_rec     Record of STAGE current values
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
--              of each child table that references this tableSTAGE 
--
-- Parameters:  cg$old_rec     Record of STAGE current values
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
-- Parameters:  cg$rec     Record of STAGE current values
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
-- Parameters:  cg$rec     Record of STAGE current values
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
    IF (cg$ind.ETAT_STAGE AND cg$rec.ETAT_STAGE IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'ETAT_STAGE' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.ETAT_STAGE = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.ETAT_STAGE BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.ETAT_STAGE,'STAGE','ETAT_STAGE'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$STAGE.v_domain.no_data_found' );
        cg$errors.raise_failure;
      END IF;
    END IF;



    found := false;
    IF (cg$ind.ETAT_CONVENTION AND cg$rec.ETAT_CONVENTION IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'ETAT_CONVENTION' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.ETAT_CONVENTION = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.ETAT_CONVENTION BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.ETAT_CONVENTION,'STAGE','ETAT_CONVENTION'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$STAGE.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','STAGE'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$STAGE.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$STAGE.v_domain.others');
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
    IF (con_name = 'STG_PK') THEN
        cg$errors.push(nvl(STG_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'STG_PK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'VST_STG_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Stage', 'Visite Stage'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);
    ELSIF (con_name = 'AVE_STG_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Stage', 'Avenant'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'STG_SOUT_FK') THEN
        cg$errors.push(nvl(STG_SOUT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_SOUT_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_ETU_FK') THEN
        cg$errors.push(nvl(STG_ETU_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_ETU_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_ENT_FK') THEN
        cg$errors.push(nvl(STG_ENT_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_ENT_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_PRO_FK') THEN
        cg$errors.push(nvl(STG_PRO_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_PRO_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_OFF_FK') THEN
        cg$errors.push(nvl(STG_OFF_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_OFF_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_ENS_FK') THEN
        cg$errors.push(nvl(STG_ENS_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_ENS_FK' 
                                     ,'STAGE')),
                       'E',
                       'API',
                       cg$errors.API_FK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'STG_EMP_FK') THEN
        cg$errors.push(nvl(STG_EMP_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'STG_EMP_FK' 
                                     ,'STAGE')),
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

D70_ETAT_STAGE CONSTANT STAGE.ETAT_STAGE%TYPE := 'ELA';
D100_ETAT_CONVENTION CONSTANT STAGE.ETAT_CONVENTION%TYPE := 'ELA';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.ETAT_STAGE) THEN cg$rec.ETAT_STAGE := D70_ETAT_STAGE; END IF;
    IF NOT (cg$ind.ETAT_CONVENTION) THEN cg$rec.ETAT_CONVENTION := D100_ETAT_CONVENTION; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO STAGE
            (ANNEE_PRO
            ,NO_ETUDIANT_NAT
            ,NO_ENTREPRISE
            ,NO_OFFRE
            ,NO_CONTACT_ILI
            ,INTITULE
            ,SUJET
            ,DATE_DEB
            ,DATE_FIN
            ,LIEU
            ,ETAT_STAGE
            ,CLE_EVALUATION
            ,DESCRIPTION
            ,ETAT_CONVENTION
            ,DATE_SIGNATURE_CONV
            ,NO_ENSEIGNANT
            ,COMMENTAIRE_TUTEUR
            ,DATE_RECEPTION_RAPPORT
            ,NOTE_ENTREPRISE
            ,NOTE_RAPPORT
            ,NO_SESSION
            ,NOTE_SOUTENANCE)
        VALUES
            (cg$rec.ANNEE_PRO
            ,cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.NO_ENTREPRISE
            ,cg$rec.NO_OFFRE
            ,cg$rec.NO_CONTACT_ILI
            ,cg$rec.INTITULE
            ,cg$rec.SUJET
            ,cg$rec.DATE_DEB
            ,cg$rec.DATE_FIN
            ,cg$rec.LIEU
            ,cg$rec.ETAT_STAGE
            ,cg$rec.CLE_EVALUATION
            ,cg$rec.DESCRIPTION
            ,cg$rec.ETAT_CONVENTION
            ,cg$rec.DATE_SIGNATURE_CONV
            ,cg$rec.NO_ENSEIGNANT
            ,cg$rec.COMMENTAIRE_TUTEUR
            ,cg$rec.DATE_RECEPTION_RAPPORT
            ,cg$rec.NOTE_ENTREPRISE
            ,cg$rec.NOTE_RAPPORT
            ,cg$rec.NO_SESSION
            ,cg$rec.NOTE_SOUTENANCE
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
        validate_mandatory(cg$rec, 'cg$STAGE.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$STAGE.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$STAGE.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$STAGE.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$STAGE.ins.others');
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

           --  Report error if attempt to update non transferable Foreign Key STG_ETU_FK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_fk_not_transferable('STG_ETU_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            raise_fk_not_transferable('STG_ETU_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NOT NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NULL) THEN
            raise_fk_not_transferable('STG_ETU_FK');
        END IF;

        --  Report error if attempt to update non updateable Primary Key STG_PK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_uk_not_updateable('STG_PK');
        END IF;
        IF (cg$ind.ANNEE_PRO AND cg$rec.ANNEE_PRO != cg$upd_rec.ANNEE_PRO) THEN
            raise_uk_not_updateable('STG_PK');
        END IF;
        IF NOT (cg$ind.ANNEE_PRO) THEN
            cg$rec.ANNEE_PRO := cg$upd_rec.ANNEE_PRO;
        END IF;
        IF NOT (cg$ind.NO_ETUDIANT_NAT) THEN
            cg$rec.NO_ETUDIANT_NAT := cg$upd_rec.NO_ETUDIANT_NAT;
        END IF;
        IF NOT (cg$ind.NO_ENTREPRISE) THEN
            cg$rec.NO_ENTREPRISE := cg$upd_rec.NO_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.NO_OFFRE) THEN
            cg$rec.NO_OFFRE := cg$upd_rec.NO_OFFRE;
        END IF;
        IF NOT (cg$ind.NO_CONTACT_ILI) THEN
            cg$rec.NO_CONTACT_ILI := cg$upd_rec.NO_CONTACT_ILI;
        END IF;
        IF NOT (cg$ind.INTITULE) THEN
            cg$rec.INTITULE := cg$upd_rec.INTITULE;
        END IF;
        IF NOT (cg$ind.SUJET) THEN
            cg$rec.SUJET := cg$upd_rec.SUJET;
        END IF;
        IF NOT (cg$ind.DATE_DEB) THEN
            cg$rec.DATE_DEB := cg$upd_rec.DATE_DEB;
        END IF;
        IF NOT (cg$ind.DATE_FIN) THEN
            cg$rec.DATE_FIN := cg$upd_rec.DATE_FIN;
        END IF;
        IF NOT (cg$ind.LIEU) THEN
            cg$rec.LIEU := cg$upd_rec.LIEU;
        END IF;
        IF NOT (cg$ind.ETAT_STAGE) THEN
            cg$rec.ETAT_STAGE := cg$upd_rec.ETAT_STAGE;
        END IF;
        IF NOT (cg$ind.CLE_EVALUATION) THEN
            cg$rec.CLE_EVALUATION := cg$upd_rec.CLE_EVALUATION;
        END IF;
        IF NOT (cg$ind.DESCRIPTION) THEN
            cg$rec.DESCRIPTION := cg$upd_rec.DESCRIPTION;
        END IF;
        IF NOT (cg$ind.ETAT_CONVENTION) THEN
            cg$rec.ETAT_CONVENTION := cg$upd_rec.ETAT_CONVENTION;
        END IF;
        IF NOT (cg$ind.DATE_SIGNATURE_CONV) THEN
            cg$rec.DATE_SIGNATURE_CONV := cg$upd_rec.DATE_SIGNATURE_CONV;
        END IF;
        IF NOT (cg$ind.NO_ENSEIGNANT) THEN
            cg$rec.NO_ENSEIGNANT := cg$upd_rec.NO_ENSEIGNANT;
        END IF;
        IF NOT (cg$ind.COMMENTAIRE_TUTEUR) THEN
            cg$rec.COMMENTAIRE_TUTEUR := cg$upd_rec.COMMENTAIRE_TUTEUR;
        END IF;
        IF NOT (cg$ind.DATE_RECEPTION_RAPPORT) THEN
            cg$rec.DATE_RECEPTION_RAPPORT := cg$upd_rec.DATE_RECEPTION_RAPPORT;
        END IF;
        IF NOT (cg$ind.NOTE_ENTREPRISE) THEN
            cg$rec.NOTE_ENTREPRISE := cg$upd_rec.NOTE_ENTREPRISE;
        END IF;
        IF NOT (cg$ind.NOTE_RAPPORT) THEN
            cg$rec.NOTE_RAPPORT := cg$upd_rec.NOTE_RAPPORT;
        END IF;
        IF NOT (cg$ind.NO_SESSION) THEN
            cg$rec.NO_SESSION := cg$upd_rec.NO_SESSION;
        END IF;
        IF NOT (cg$ind.NOTE_SOUTENANCE) THEN
            cg$rec.NOTE_SOUTENANCE := cg$upd_rec.NOTE_SOUTENANCE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
           --  Report error if attempt to update non transferable Foreign Key STG_ETU_FK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_fk_not_transferable('STG_ETU_FK');
        END IF;
        --  Report error if attempt to update non updateable Primary Key STG_PK
        IF ( cg$ind.NO_ETUDIANT_NAT 
        OR   cg$ind.ANNEE_PRO ) THEN
          raise_uk_not_updateable('STG_PK');
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
            UPDATE STAGE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_OFFRE = cg$rec.NO_OFFRE
              ,NO_CONTACT_ILI = cg$rec.NO_CONTACT_ILI
              ,INTITULE = cg$rec.INTITULE
              ,SUJET = cg$rec.SUJET
              ,DATE_DEB = cg$rec.DATE_DEB
              ,DATE_FIN = cg$rec.DATE_FIN
              ,LIEU = cg$rec.LIEU
              ,ETAT_STAGE = cg$rec.ETAT_STAGE
              ,CLE_EVALUATION = cg$rec.CLE_EVALUATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,ETAT_CONVENTION = cg$rec.ETAT_CONVENTION
              ,DATE_SIGNATURE_CONV = cg$rec.DATE_SIGNATURE_CONV
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,COMMENTAIRE_TUTEUR = cg$rec.COMMENTAIRE_TUTEUR
              ,DATE_RECEPTION_RAPPORT = cg$rec.DATE_RECEPTION_RAPPORT
              ,NOTE_ENTREPRISE = cg$rec.NOTE_ENTREPRISE
              ,NOTE_RAPPORT = cg$rec.NOTE_RAPPORT
              ,NO_SESSION = cg$rec.NO_SESSION
              ,NOTE_SOUTENANCE = cg$rec.NOTE_SOUTENANCE
            WHERE  NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT
            AND    ANNEE_PRO = cg$rec.ANNEE_PRO;
            null;
          ELSE
            UPDATE STAGE
            SET
              NO_ENTREPRISE = cg$rec.NO_ENTREPRISE
              ,NO_OFFRE = cg$rec.NO_OFFRE
              ,NO_CONTACT_ILI = cg$rec.NO_CONTACT_ILI
              ,INTITULE = cg$rec.INTITULE
              ,SUJET = cg$rec.SUJET
              ,DATE_DEB = cg$rec.DATE_DEB
              ,DATE_FIN = cg$rec.DATE_FIN
              ,LIEU = cg$rec.LIEU
              ,ETAT_STAGE = cg$rec.ETAT_STAGE
              ,CLE_EVALUATION = cg$rec.CLE_EVALUATION
              ,DESCRIPTION = cg$rec.DESCRIPTION
              ,ETAT_CONVENTION = cg$rec.ETAT_CONVENTION
              ,DATE_SIGNATURE_CONV = cg$rec.DATE_SIGNATURE_CONV
              ,NO_ENSEIGNANT = cg$rec.NO_ENSEIGNANT
              ,COMMENTAIRE_TUTEUR = cg$rec.COMMENTAIRE_TUTEUR
              ,DATE_RECEPTION_RAPPORT = cg$rec.DATE_RECEPTION_RAPPORT
              ,NOTE_ENTREPRISE = cg$rec.NOTE_ENTREPRISE
              ,NOTE_RAPPORT = cg$rec.NOTE_RAPPORT
              ,NO_SESSION = cg$rec.NO_SESSION
              ,NOTE_SOUTENANCE = cg$rec.NOTE_SOUTENANCE
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
        cg$table(idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
        cg$tableind(idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;
        cg$table(idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
        cg$tableind(idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;
        cg$table(idx).NO_OFFRE := cg$rec.NO_OFFRE;
        cg$tableind(idx).NO_OFFRE := cg$ind.NO_OFFRE;
        cg$table(idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
        cg$tableind(idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;
        cg$table(idx).INTITULE := cg$rec.INTITULE;
        cg$tableind(idx).INTITULE := cg$ind.INTITULE;
        cg$table(idx).SUJET := cg$rec.SUJET;
        cg$tableind(idx).SUJET := cg$ind.SUJET;
        cg$table(idx).DATE_DEB := cg$rec.DATE_DEB;
        cg$tableind(idx).DATE_DEB := cg$ind.DATE_DEB;
        cg$table(idx).DATE_FIN := cg$rec.DATE_FIN;
        cg$tableind(idx).DATE_FIN := cg$ind.DATE_FIN;
        cg$table(idx).LIEU := cg$rec.LIEU;
        cg$tableind(idx).LIEU := cg$ind.LIEU;
        cg$table(idx).ETAT_STAGE := cg$rec.ETAT_STAGE;
        cg$tableind(idx).ETAT_STAGE := cg$ind.ETAT_STAGE;
        cg$table(idx).CLE_EVALUATION := cg$rec.CLE_EVALUATION;
        cg$tableind(idx).CLE_EVALUATION := cg$ind.CLE_EVALUATION;
        cg$table(idx).DESCRIPTION := cg$rec.DESCRIPTION;
        cg$tableind(idx).DESCRIPTION := cg$ind.DESCRIPTION;
        cg$table(idx).ETAT_CONVENTION := cg$rec.ETAT_CONVENTION;
        cg$tableind(idx).ETAT_CONVENTION := cg$ind.ETAT_CONVENTION;
        cg$table(idx).DATE_SIGNATURE_CONV := cg$rec.DATE_SIGNATURE_CONV;
        cg$tableind(idx).DATE_SIGNATURE_CONV := cg$ind.DATE_SIGNATURE_CONV;
        cg$table(idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
        cg$tableind(idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;
        cg$table(idx).COMMENTAIRE_TUTEUR := cg$rec.COMMENTAIRE_TUTEUR;
        cg$tableind(idx).COMMENTAIRE_TUTEUR := cg$ind.COMMENTAIRE_TUTEUR;
        cg$table(idx).DATE_RECEPTION_RAPPORT := cg$rec.DATE_RECEPTION_RAPPORT;
        cg$tableind(idx).DATE_RECEPTION_RAPPORT := cg$ind.DATE_RECEPTION_RAPPORT;
        cg$table(idx).NOTE_ENTREPRISE := cg$rec.NOTE_ENTREPRISE;
        cg$tableind(idx).NOTE_ENTREPRISE := cg$ind.NOTE_ENTREPRISE;
        cg$table(idx).NOTE_RAPPORT := cg$rec.NOTE_RAPPORT;
        cg$tableind(idx).NOTE_RAPPORT := cg$ind.NOTE_RAPPORT;
        cg$table(idx).NO_SESSION := cg$rec.NO_SESSION;
        cg$tableind(idx).NO_SESSION := cg$ind.NO_SESSION;
        cg$table(idx).NOTE_SOUTENANCE := cg$rec.NOTE_SOUTENANCE;
        cg$tableind(idx).NOTE_SOUTENANCE := cg$ind.NOTE_SOUTENANCE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$STAGE.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$STAGE.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$STAGE.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$STAGE.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$STAGE.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of STAGE when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for STAGE's domain key constraint columns 
--              cg$ind      Indicates changed STAGE's domain key constraint columns
--              cg$old_rec  Current values for STAGE's domain key constraint columns
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
           cg$rec.ANNEE_PRO := cg$pk.ANNEE_PRO;
           slct(cg$rec);

           validate_foreign_keys_del(cg$rec);
           validate_domain_cascade_delete(cg$rec);    

           IF cg$pk.the_rowid is null THEN
              DELETE STAGE
              WHERE                    NO_ETUDIANT_NAT = cg$pk.NO_ETUDIANT_NAT
              AND          ANNEE_PRO = cg$pk.ANNEE_PRO;
           ELSE
              DELETE STAGE
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$STAGE.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$STAGE.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$STAGE.del.others');
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
               ,            NO_ETUDIANT_NAT
               ,            NO_ENTREPRISE
               ,            NO_OFFRE
               ,            NO_CONTACT_ILI
               ,            INTITULE
               ,            SUJET
               ,            DATE_DEB
               ,            DATE_FIN
               ,            LIEU
               ,            ETAT_STAGE
               ,            CLE_EVALUATION
               ,            DESCRIPTION
               ,            ETAT_CONVENTION
               ,            DATE_SIGNATURE_CONV
               ,            NO_ENSEIGNANT
               ,            COMMENTAIRE_TUTEUR
               ,            DATE_RECEPTION_RAPPORT
               ,            NOTE_ENTREPRISE
               ,            NOTE_RAPPORT
               ,            NO_SESSION
               ,            NOTE_SOUTENANCE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_DEB
               ,            cg$tmp_rec.DATE_FIN
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.ETAT_STAGE
               ,            cg$tmp_rec.CLE_EVALUATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.ETAT_CONVENTION
               ,            cg$tmp_rec.DATE_SIGNATURE_CONV
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.COMMENTAIRE_TUTEUR
               ,            cg$tmp_rec.DATE_RECEPTION_RAPPORT
               ,            cg$tmp_rec.NOTE_ENTREPRISE
               ,            cg$tmp_rec.NOTE_RAPPORT
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NOTE_SOUTENANCE
               FROM      STAGE
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               AND          ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            NO_ENTREPRISE
               ,            NO_OFFRE
               ,            NO_CONTACT_ILI
               ,            INTITULE
               ,            SUJET
               ,            DATE_DEB
               ,            DATE_FIN
               ,            LIEU
               ,            ETAT_STAGE
               ,            CLE_EVALUATION
               ,            DESCRIPTION
               ,            ETAT_CONVENTION
               ,            DATE_SIGNATURE_CONV
               ,            NO_ENSEIGNANT
               ,            COMMENTAIRE_TUTEUR
               ,            DATE_RECEPTION_RAPPORT
               ,            NOTE_ENTREPRISE
               ,            NOTE_RAPPORT
               ,            NO_SESSION
               ,            NOTE_SOUTENANCE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_DEB
               ,            cg$tmp_rec.DATE_FIN
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.ETAT_STAGE
               ,            cg$tmp_rec.CLE_EVALUATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.ETAT_CONVENTION
               ,            cg$tmp_rec.DATE_SIGNATURE_CONV
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.COMMENTAIRE_TUTEUR
               ,            cg$tmp_rec.DATE_RECEPTION_RAPPORT
               ,            cg$tmp_rec.NOTE_ENTREPRISE
               ,            cg$tmp_rec.NOTE_RAPPORT
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NOTE_SOUTENANCE
               FROM      STAGE
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            NO_ENTREPRISE
               ,            NO_OFFRE
               ,            NO_CONTACT_ILI
               ,            INTITULE
               ,            SUJET
               ,            DATE_DEB
               ,            DATE_FIN
               ,            LIEU
               ,            ETAT_STAGE
               ,            CLE_EVALUATION
               ,            DESCRIPTION
               ,            ETAT_CONVENTION
               ,            DATE_SIGNATURE_CONV
               ,            NO_ENSEIGNANT
               ,            COMMENTAIRE_TUTEUR
               ,            DATE_RECEPTION_RAPPORT
               ,            NOTE_ENTREPRISE
               ,            NOTE_RAPPORT
               ,            NO_SESSION
               ,            NOTE_SOUTENANCE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_DEB
               ,            cg$tmp_rec.DATE_FIN
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.ETAT_STAGE
               ,            cg$tmp_rec.CLE_EVALUATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.ETAT_CONVENTION
               ,            cg$tmp_rec.DATE_SIGNATURE_CONV
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.COMMENTAIRE_TUTEUR
               ,            cg$tmp_rec.DATE_RECEPTION_RAPPORT
               ,            cg$tmp_rec.NOTE_ENTREPRISE
               ,            cg$tmp_rec.NOTE_RAPPORT
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NOTE_SOUTENANCE
               FROM      STAGE
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               AND          ANNEE_PRO = cg$old_rec.ANNEE_PRO
               FOR UPDATE;
            ELSE
               SELECT       ANNEE_PRO
               ,            NO_ETUDIANT_NAT
               ,            NO_ENTREPRISE
               ,            NO_OFFRE
               ,            NO_CONTACT_ILI
               ,            INTITULE
               ,            SUJET
               ,            DATE_DEB
               ,            DATE_FIN
               ,            LIEU
               ,            ETAT_STAGE
               ,            CLE_EVALUATION
               ,            DESCRIPTION
               ,            ETAT_CONVENTION
               ,            DATE_SIGNATURE_CONV
               ,            NO_ENSEIGNANT
               ,            COMMENTAIRE_TUTEUR
               ,            DATE_RECEPTION_RAPPORT
               ,            NOTE_ENTREPRISE
               ,            NOTE_RAPPORT
               ,            NO_SESSION
               ,            NOTE_SOUTENANCE
               INTO         cg$tmp_rec.ANNEE_PRO
               ,            cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NO_ENTREPRISE
               ,            cg$tmp_rec.NO_OFFRE
               ,            cg$tmp_rec.NO_CONTACT_ILI
               ,            cg$tmp_rec.INTITULE
               ,            cg$tmp_rec.SUJET
               ,            cg$tmp_rec.DATE_DEB
               ,            cg$tmp_rec.DATE_FIN
               ,            cg$tmp_rec.LIEU
               ,            cg$tmp_rec.ETAT_STAGE
               ,            cg$tmp_rec.CLE_EVALUATION
               ,            cg$tmp_rec.DESCRIPTION
               ,            cg$tmp_rec.ETAT_CONVENTION
               ,            cg$tmp_rec.DATE_SIGNATURE_CONV
               ,            cg$tmp_rec.NO_ENSEIGNANT
               ,            cg$tmp_rec.COMMENTAIRE_TUTEUR
               ,            cg$tmp_rec.DATE_RECEPTION_RAPPORT
               ,            cg$tmp_rec.NOTE_ENTREPRISE
               ,            cg$tmp_rec.NOTE_RAPPORT
               ,            cg$tmp_rec.NO_SESSION
               ,            cg$tmp_rec.NOTE_SOUTENANCE
               FROM      STAGE
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
                           'cg$STAGE.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$STAGE.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$STAGE.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.NO_OFFRE) THEN
        IF (cg$tmp_rec.NO_OFFRE IS NOT NULL
        AND cg$old_rec.NO_OFFRE IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_OFFRE != cg$old_rec.NO_OFFRE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P18NO_OFFRE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_OFFRE IS NOT NULL
        OR cg$old_rec.NO_OFFRE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P18NO_OFFRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DESCRIPTION) THEN
        IF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        AND cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            IF (cg$tmp_rec.DESCRIPTION != cg$old_rec.DESCRIPTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DESCRIPTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DESCRIPTION IS NOT NULL
        OR cg$old_rec.DESCRIPTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P90DESCRIPTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_CONVENTION) THEN
        IF (cg$tmp_rec.ETAT_CONVENTION IS NOT NULL
        AND cg$old_rec.ETAT_CONVENTION IS NOT NULL) THEN
            IF (cg$tmp_rec.ETAT_CONVENTION != cg$old_rec.ETAT_CONVENTION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100ETAT_CONVENTION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ETAT_CONVENTION IS NOT NULL
        OR cg$old_rec.ETAT_CONVENTION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P100ETAT_CONVENTION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_SIGNATURE_CONV) THEN
        IF (cg$tmp_rec.DATE_SIGNATURE_CONV IS NOT NULL
        AND cg$old_rec.DATE_SIGNATURE_CONV IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_SIGNATURE_CONV != cg$old_rec.DATE_SIGNATURE_CONV) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110DATE_SIGNATURE_CONV
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_SIGNATURE_CONV IS NOT NULL
        OR cg$old_rec.DATE_SIGNATURE_CONV IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110DATE_SIGNATURE_CONV
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENSEIGNANT) THEN
        IF (cg$tmp_rec.NO_ENSEIGNANT IS NOT NULL
        AND cg$old_rec.NO_ENSEIGNANT IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_ENSEIGNANT != cg$old_rec.NO_ENSEIGNANT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P115NO_ENSEIGNANT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_ENSEIGNANT IS NOT NULL
        OR cg$old_rec.NO_ENSEIGNANT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P115NO_ENSEIGNANT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.COMMENTAIRE_TUTEUR) THEN
        IF (cg$tmp_rec.COMMENTAIRE_TUTEUR IS NOT NULL
        AND cg$old_rec.COMMENTAIRE_TUTEUR IS NOT NULL) THEN
            IF (cg$tmp_rec.COMMENTAIRE_TUTEUR != cg$old_rec.COMMENTAIRE_TUTEUR) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P117COMMENTAIRE_TUTEUR
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.COMMENTAIRE_TUTEUR IS NOT NULL
        OR cg$old_rec.COMMENTAIRE_TUTEUR IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P117COMMENTAIRE_TUTEUR
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_RECEPTION_RAPPORT) THEN
        IF (cg$tmp_rec.DATE_RECEPTION_RAPPORT IS NOT NULL
        AND cg$old_rec.DATE_RECEPTION_RAPPORT IS NOT NULL) THEN
            IF (cg$tmp_rec.DATE_RECEPTION_RAPPORT != cg$old_rec.DATE_RECEPTION_RAPPORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120DATE_RECEPTION_RAPPORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.DATE_RECEPTION_RAPPORT IS NOT NULL
        OR cg$old_rec.DATE_RECEPTION_RAPPORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120DATE_RECEPTION_RAPPORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOTE_ENTREPRISE) THEN
        IF (cg$tmp_rec.NOTE_ENTREPRISE IS NOT NULL
        AND cg$old_rec.NOTE_ENTREPRISE IS NOT NULL) THEN
            IF (cg$tmp_rec.NOTE_ENTREPRISE != cg$old_rec.NOTE_ENTREPRISE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140NOTE_ENTREPRISE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOTE_ENTREPRISE IS NOT NULL
        OR cg$old_rec.NOTE_ENTREPRISE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P140NOTE_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOTE_RAPPORT) THEN
        IF (cg$tmp_rec.NOTE_RAPPORT IS NOT NULL
        AND cg$old_rec.NOTE_RAPPORT IS NOT NULL) THEN
            IF (cg$tmp_rec.NOTE_RAPPORT != cg$old_rec.NOTE_RAPPORT) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150NOTE_RAPPORT
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOTE_RAPPORT IS NOT NULL
        OR cg$old_rec.NOTE_RAPPORT IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P150NOTE_RAPPORT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_SESSION) THEN
        IF (cg$tmp_rec.NO_SESSION IS NOT NULL
        AND cg$old_rec.NO_SESSION IS NOT NULL) THEN
            IF (cg$tmp_rec.NO_SESSION != cg$old_rec.NO_SESSION) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P155NO_SESSION
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NO_SESSION IS NOT NULL
        OR cg$old_rec.NO_SESSION IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P155NO_SESSION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOTE_SOUTENANCE) THEN
        IF (cg$tmp_rec.NOTE_SOUTENANCE IS NOT NULL
        AND cg$old_rec.NOTE_SOUTENANCE IS NOT NULL) THEN
            IF (cg$tmp_rec.NOTE_SOUTENANCE != cg$old_rec.NOTE_SOUTENANCE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160NOTE_SOUTENANCE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.NOTE_SOUTENANCE IS NOT NULL
        OR cg$old_rec.NOTE_SOUTENANCE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P160NOTE_SOUTENANCE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.ANNEE_PRO) THEN
        IF (cg$tmp_rec.ANNEE_PRO != cg$old_rec.ANNEE_PRO) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10ANNEE_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P15NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_ENTREPRISE) THEN
        IF (cg$tmp_rec.NO_ENTREPRISE != cg$old_rec.NO_ENTREPRISE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P17NO_ENTREPRISE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NO_CONTACT_ILI) THEN
        IF (cg$tmp_rec.NO_CONTACT_ILI != cg$old_rec.NO_CONTACT_ILI) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P19NO_CONTACT_ILI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.INTITULE) THEN
        IF (cg$tmp_rec.INTITULE != cg$old_rec.INTITULE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20INTITULE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.SUJET) THEN
        IF (cg$tmp_rec.SUJET != cg$old_rec.SUJET) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30SUJET
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_DEB) THEN
        IF (cg$tmp_rec.DATE_DEB != cg$old_rec.DATE_DEB) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40DATE_DEB
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.DATE_FIN) THEN
        IF (cg$tmp_rec.DATE_FIN != cg$old_rec.DATE_FIN) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50DATE_FIN
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.LIEU) THEN
        IF (cg$tmp_rec.LIEU != cg$old_rec.LIEU) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60LIEU
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ETAT_STAGE) THEN
        IF (cg$tmp_rec.ETAT_STAGE != cg$old_rec.ETAT_STAGE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70ETAT_STAGE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CLE_EVALUATION) THEN
        IF (cg$tmp_rec.CLE_EVALUATION != cg$old_rec.CLE_EVALUATION) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P80CLE_EVALUATION
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$STAGE.lck');
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
      cg$ind_true.NO_ETUDIANT_NAT := TRUE;
      cg$ind_true.NO_ENTREPRISE := TRUE;
      cg$ind_true.NO_OFFRE := TRUE;
      cg$ind_true.NO_CONTACT_ILI := TRUE;
      cg$ind_true.INTITULE := TRUE;
      cg$ind_true.SUJET := TRUE;
      cg$ind_true.DATE_DEB := TRUE;
      cg$ind_true.DATE_FIN := TRUE;
      cg$ind_true.LIEU := TRUE;
      cg$ind_true.ETAT_STAGE := TRUE;
      cg$ind_true.CLE_EVALUATION := TRUE;
      cg$ind_true.DESCRIPTION := TRUE;
      cg$ind_true.ETAT_CONVENTION := TRUE;
      cg$ind_true.DATE_SIGNATURE_CONV := TRUE;
      cg$ind_true.NO_ENSEIGNANT := TRUE;
      cg$ind_true.COMMENTAIRE_TUTEUR := TRUE;
      cg$ind_true.DATE_RECEPTION_RAPPORT := TRUE;
      cg$ind_true.NOTE_ENTREPRISE := TRUE;
      cg$ind_true.NOTE_RAPPORT := TRUE;
      cg$ind_true.NO_SESSION := TRUE;
      cg$ind_true.NOTE_SOUTENANCE := TRUE;
   

END cg$STAGE;
/

