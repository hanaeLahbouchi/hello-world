
PROMPT Creating API Package Body for Table 'DIPLOME'
--------------------------------------------------------------------------------
-- Name:        cg$DIPLOME
-- Description: DIPLOME table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$DIPLOME IS

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
                   'cg$DIPLOME.raise_uk_not_updateable');
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
                   'cg$DIPLOME.raise_fk_not_transferable');
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
                    'cg$DIPLOME.up_autogen_columns');
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
    IF (cg$val_rec.NOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P20NOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.PRENOM IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P30PRENOM),
                       'E',
                       'API',
                       cg$errors.API_MAND_COLUMN_ISNULL,
                       loc);
    END IF;
    IF (cg$val_rec.AUTORISATION_ANNUAIRE IS NULL) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_MAND_COLUMN_ISNULL, cg$errors.VAL_MAND, P40AUTORISATION_ANNUAIRE),
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
       ,         NOM
       ,         PRENOM
       ,         AUTORISATION_ANNUAIRE
       ,         TYPE_EMPLOI
       ,         MAIL_PRO
       ,         TEL_PRO
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         EMAIL_PERSO
       ,         TEL_PERSO
       ,         PORTABLE
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.AUTORISATION_ANNUAIRE
       ,         cg$sel_rec.TYPE_EMPLOI
       ,         cg$sel_rec.MAIL_PRO
       ,         cg$sel_rec.TEL_PRO
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.EMAIL_PERSO
       ,         cg$sel_rec.TEL_PERSO
       ,         cg$sel_rec.PORTABLE
       ,cg$sel_rec.the_rowid
       FROM   DIPLOME
       WHERE        NO_ETUDIANT_NAT = cg$sel_rec.NO_ETUDIANT_NAT;
    ELSE
       SELECT    NO_ETUDIANT_NAT
       ,         NOM
       ,         PRENOM
       ,         AUTORISATION_ANNUAIRE
       ,         TYPE_EMPLOI
       ,         MAIL_PRO
       ,         TEL_PRO
       ,         ADRESSE
       ,         CP
       ,         VILLE
       ,         EMAIL_PERSO
       ,         TEL_PERSO
       ,         PORTABLE
       , rowid
       INTO      cg$sel_rec.NO_ETUDIANT_NAT
       ,         cg$sel_rec.NOM
       ,         cg$sel_rec.PRENOM
       ,         cg$sel_rec.AUTORISATION_ANNUAIRE
       ,         cg$sel_rec.TYPE_EMPLOI
       ,         cg$sel_rec.MAIL_PRO
       ,         cg$sel_rec.TEL_PRO
       ,         cg$sel_rec.ADRESSE
       ,         cg$sel_rec.CP
       ,         cg$sel_rec.VILLE
       ,         cg$sel_rec.EMAIL_PERSO
       ,         cg$sel_rec.TEL_PERSO
       ,         cg$sel_rec.PORTABLE
       ,cg$sel_rec.the_rowid
       FROM   DIPLOME
       WHERE  rowid = cg$sel_rec.the_rowid;
    END IF;

EXCEPTION WHEN OTHERS THEN
    cg$errors.push(SQLERRM,
                   'E',
                   'ORA',
                   SQLCODE,
                   'cg$DIPLOME.slct.others');
    cg$errors.raise_failure;

END slct;


--------------------------------------------------------------------------------
-- Name:        cascade_update
--
-- Description: Updates all child tables affected by a change to DIPLOME 
--
-- Parameters:  cg$rec     Record of DIPLOME current values
--              cg$old_rec Record of DIPLOME previous values
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
--              of each child table that references this tableDIPLOME 
--
-- Parameters:  cg$old_rec     Record of DIPLOME current values
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
--              child table that references this table DIPLOME 
--
-- Parameters:  cg$new_rec  New values for DIPLOME's domain key constraint columns 
--              cg$new_ind  Indicates changed DIPLOME's domain key constraint columns
--              cg$old_rec  Current values for DIPLOME's domain key constraint columns
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
-- Description: Delete all child tables affected by a delete to DIPLOME 
--
-- Parameters:  cg$rec     Record of DIPLOME current values
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
--              child table that references this tableDIPLOME 
--
-- Parameters:  cg$old_rec     Record of DIPLOME current values
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
--              of each child table that references this tableDIPLOME 
--
-- Parameters:  cg$old_rec     Record of DIPLOME current values
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
-- Parameters:  cg$rec     Record of DIPLOME current values
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
-- Parameters:  cg$rec     Record of DIPLOME current values
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
    IF (cg$ind.TYPE_EMPLOI AND cg$rec.TYPE_EMPLOI IS NOT NULL) THEN
      FOR c IN (SELECT RV_LOW_VALUE, RV_HIGH_VALUE FROM CG_REF_CODES WHERE RV_DOMAIN = 'TYPE_EMPLOI' )
      LOOP
         IF (    c.RV_HIGH_VALUE IS NULL 
             AND cg$rec.TYPE_EMPLOI = c.RV_LOW_VALUE )
         OR (    c.RV_HIGH_VALUE IS NOT NULL
             AND cg$rec.TYPE_EMPLOI BETWEEN c.RV_LOW_VALUE AND c.RV_HIGH_VALUE )
         THEN
           found := true;
           EXIT;
         END IF;
      END LOOP;

      IF ( NOT found ) THEN
        cg$errors.push( cg$errors.MsgGetText(cg$errors.API_RV_LOOKUP_FAIL,
                                             cg$errors.APIMSG_RV_LOOKUP_FAIL,
                                             cg$rec.TYPE_EMPLOI,'DIPLOME','TYPE_EMPLOI'),
                        'E',
                        'API',
                        cg$errors.API_RV_LOOKUP_FAIL,
                        'cg$DIPLOME.v_domain.no_data_found' );
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
                                            'CG_REF_CODES','DIPLOME'),
                       'E',
                       'API',
                       cg$errors.API_RV_TAB_NOT_FOUND,
                       'cg$DIPLOME.v_domain.no_reftable_found');
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DIPLOME.v_domain.others');
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
    IF (con_name = 'DIP_PK') THEN
        cg$errors.push(nvl(DIP_PK 
                  ,cg$errors.MsgGetText(cg$errors.API_PK_CON_VIOLATED
					                 ,cg$errors.APIMSG_PK_VIOLAT
                                     ,'DIP_PK' 
                                     ,'DIPLOME')),
                       'E',
                       'API',
                       cg$errors.API_PK_CON_VIOLATED,
                       loc);
    ELSIF (con_name = 'POE_DIP_FK' AND type = cg$errors.ERR_DELETE_RESTRICT) THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_DEL_RESTRICT, cg$errors.ERR_DEL_RESTRICT, 'Diplome', 'Poste Entreprise'),
                       'E',
                       'API',
                       cg$errors.API_DEL_RESTRICT,
                       loc);

    ELSIF (con_name = 'DIP_ETU_FK') THEN
        cg$errors.push(nvl(DIP_ETU_FK 
                      ,cg$errors.MsgGetText(cg$errors.API_FK_CON_VIOLATED
					                 ,cg$errors.APIMSG_FK_VIOLAT
                                     ,'DIP_ETU_FK' 
                                     ,'DIPLOME')),
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

D40_AUTORISATION_ANNUAIRE CONSTANT DIPLOME.AUTORISATION_ANNUAIRE%TYPE := 'N';

BEGIN
--  Application_logic Pre-Insert <<Start>>
--  Application_logic Pre-Insert << End >>

--  Defaulted

    IF NOT (cg$ind.AUTORISATION_ANNUAIRE) THEN cg$rec.AUTORISATION_ANNUAIRE := D40_AUTORISATION_ANNUAIRE; END IF;
--  Auto-generated and uppercased columns

    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);

    called_from_package := TRUE;

    IF (do_ins) THEN 
        validate_foreign_keys_ins(cg$rec);
        validate_arc(cg$rec);
        validate_domain(cg$rec);

        INSERT INTO DIPLOME
            (NO_ETUDIANT_NAT
            ,NOM
            ,PRENOM
            ,AUTORISATION_ANNUAIRE
            ,TYPE_EMPLOI
            ,MAIL_PRO
            ,TEL_PRO
            ,ADRESSE
            ,CP
            ,VILLE
            ,EMAIL_PERSO
            ,TEL_PERSO
            ,PORTABLE)
        VALUES
            (cg$rec.NO_ETUDIANT_NAT
            ,cg$rec.NOM
            ,cg$rec.PRENOM
            ,cg$rec.AUTORISATION_ANNUAIRE
            ,cg$rec.TYPE_EMPLOI
            ,cg$rec.MAIL_PRO
            ,cg$rec.TEL_PRO
            ,cg$rec.ADRESSE
            ,cg$rec.CP
            ,cg$rec.VILLE
            ,cg$rec.EMAIL_PERSO
            ,cg$rec.TEL_PERSO
            ,cg$rec.PORTABLE
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
        validate_mandatory(cg$rec, 'cg$DIPLOME.ins.mandatory_missing');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$DIPLOME.ins.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$DIPLOME.ins.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$DIPLOME.ins.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DIPLOME.ins.others');
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

           --  Report error if attempt to update non transferable Foreign Key DIP_ETU_FK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_fk_not_transferable('DIP_ETU_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NOT NULL) THEN
            raise_fk_not_transferable('DIP_ETU_FK');
        END IF;
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT IS NOT NULL AND cg$upd_rec.NO_ETUDIANT_NAT IS NULL) THEN
            raise_fk_not_transferable('DIP_ETU_FK');
        END IF;

        --  Report error if attempt to update non updateable Primary Key DIP_PK
        IF (cg$ind.NO_ETUDIANT_NAT AND cg$rec.NO_ETUDIANT_NAT != cg$upd_rec.NO_ETUDIANT_NAT) THEN
            raise_uk_not_updateable('DIP_PK');
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
        IF NOT (cg$ind.AUTORISATION_ANNUAIRE) THEN
            cg$rec.AUTORISATION_ANNUAIRE := cg$upd_rec.AUTORISATION_ANNUAIRE;
        END IF;
        IF NOT (cg$ind.TYPE_EMPLOI) THEN
            cg$rec.TYPE_EMPLOI := cg$upd_rec.TYPE_EMPLOI;
        END IF;
        IF NOT (cg$ind.MAIL_PRO) THEN
            cg$rec.MAIL_PRO := cg$upd_rec.MAIL_PRO;
        END IF;
        IF NOT (cg$ind.TEL_PRO) THEN
            cg$rec.TEL_PRO := cg$upd_rec.TEL_PRO;
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
        IF NOT (cg$ind.EMAIL_PERSO) THEN
            cg$rec.EMAIL_PERSO := cg$upd_rec.EMAIL_PERSO;
        END IF;
        IF NOT (cg$ind.TEL_PERSO) THEN
            cg$rec.TEL_PERSO := cg$upd_rec.TEL_PERSO;
        END IF;
        IF NOT (cg$ind.PORTABLE) THEN
            cg$rec.PORTABLE := cg$upd_rec.PORTABLE;
        END IF;
    ELSE
	     -- Perform checks if called from a trigger
	     -- Indicators are only set on changed values
	     null;
           --  Report error if attempt to update non transferable Foreign Key DIP_ETU_FK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_fk_not_transferable('DIP_ETU_FK');
        END IF;
        --  Report error if attempt to update non updateable Primary Key DIP_PK
        IF ( cg$ind.NO_ETUDIANT_NAT ) THEN
          raise_uk_not_updateable('DIP_PK');
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
            UPDATE DIPLOME
            SET
              NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,AUTORISATION_ANNUAIRE = cg$rec.AUTORISATION_ANNUAIRE
              ,TYPE_EMPLOI = cg$rec.TYPE_EMPLOI
              ,MAIL_PRO = cg$rec.MAIL_PRO
              ,TEL_PRO = cg$rec.TEL_PRO
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,EMAIL_PERSO = cg$rec.EMAIL_PERSO
              ,TEL_PERSO = cg$rec.TEL_PERSO
              ,PORTABLE = cg$rec.PORTABLE
            WHERE  NO_ETUDIANT_NAT = cg$rec.NO_ETUDIANT_NAT;
            null;
          ELSE
            UPDATE DIPLOME
            SET
              NOM = cg$rec.NOM
              ,PRENOM = cg$rec.PRENOM
              ,AUTORISATION_ANNUAIRE = cg$rec.AUTORISATION_ANNUAIRE
              ,TYPE_EMPLOI = cg$rec.TYPE_EMPLOI
              ,MAIL_PRO = cg$rec.MAIL_PRO
              ,TEL_PRO = cg$rec.TEL_PRO
              ,ADRESSE = cg$rec.ADRESSE
              ,CP = cg$rec.CP
              ,VILLE = cg$rec.VILLE
              ,EMAIL_PERSO = cg$rec.EMAIL_PERSO
              ,TEL_PERSO = cg$rec.TEL_PERSO
              ,PORTABLE = cg$rec.PORTABLE
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
        cg$table(idx).NOM := cg$rec.NOM;
        cg$tableind(idx).NOM := cg$ind.NOM;
        cg$table(idx).PRENOM := cg$rec.PRENOM;
        cg$tableind(idx).PRENOM := cg$ind.PRENOM;
        cg$table(idx).AUTORISATION_ANNUAIRE := cg$rec.AUTORISATION_ANNUAIRE;
        cg$tableind(idx).AUTORISATION_ANNUAIRE := cg$ind.AUTORISATION_ANNUAIRE;
        cg$table(idx).TYPE_EMPLOI := cg$rec.TYPE_EMPLOI;
        cg$tableind(idx).TYPE_EMPLOI := cg$ind.TYPE_EMPLOI;
        cg$table(idx).MAIL_PRO := cg$rec.MAIL_PRO;
        cg$tableind(idx).MAIL_PRO := cg$ind.MAIL_PRO;
        cg$table(idx).TEL_PRO := cg$rec.TEL_PRO;
        cg$tableind(idx).TEL_PRO := cg$ind.TEL_PRO;
        cg$table(idx).ADRESSE := cg$rec.ADRESSE;
        cg$tableind(idx).ADRESSE := cg$ind.ADRESSE;
        cg$table(idx).CP := cg$rec.CP;
        cg$tableind(idx).CP := cg$ind.CP;
        cg$table(idx).VILLE := cg$rec.VILLE;
        cg$tableind(idx).VILLE := cg$ind.VILLE;
        cg$table(idx).EMAIL_PERSO := cg$rec.EMAIL_PERSO;
        cg$tableind(idx).EMAIL_PERSO := cg$ind.EMAIL_PERSO;
        cg$table(idx).TEL_PERSO := cg$rec.TEL_PERSO;
        cg$tableind(idx).TEL_PERSO := cg$ind.TEL_PERSO;
        cg$table(idx).PORTABLE := cg$rec.PORTABLE;
        cg$tableind(idx).PORTABLE := cg$ind.PORTABLE;
        idx := idx + 1;
    END IF;

--  Application_logic Post-Update <<Start>>
--  Application_logic Post-Update << End >>
            
EXCEPTION
    WHEN cg$errors.cg$error THEN 
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
        validate_mandatory(cg$rec, 'cg$DIPLOME.upd.upd_mandatory_null');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_CHECK_CON, 'cg$DIPLOME.upd.check_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_FOREIGN_KEY, 'cg$DIPLOME.upd.fk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
        err_msg(SQLERRM, cg$errors.ERR_UNIQUE_KEY, 'cg$DIPLOME.upd.uk_violation');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DIPLOME.upd.others');
        called_from_package := FALSE;
        cg$errors.raise_failure;
END upd;


----------------------------------------------------------------------------------------
-- Name:        domain_cascade_upd
--
-- Description: Update the Domain Constraint Key columns of DIPLOME when the
--              Cascade Update rule is Cascades and the domain table has been
--              updated. Called from <Domain Table pkg>.domain_cascade_update().
--
-- Parameters:  cg$rec      New values for DIPLOME's domain key constraint columns 
--              cg$ind      Indicates changed DIPLOME's domain key constraint columns
--              cg$old_rec  Current values for DIPLOME's domain key constraint columns
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
              DELETE DIPLOME
              WHERE                    NO_ETUDIANT_NAT = cg$pk.NO_ETUDIANT_NAT;
           ELSE
              DELETE DIPLOME
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
        err_msg(SQLERRM, cg$errors.ERR_DELETE_RESTRICT, 'cg$DIPLOME.del.delete_restrict');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DIPLOME.del.no_data_found');
        called_from_package := FALSE;
        cg$errors.raise_failure;
    WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$DIPLOME.del.others');
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
               ,            NOM
               ,            PRENOM
               ,            AUTORISATION_ANNUAIRE
               ,            TYPE_EMPLOI
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            EMAIL_PERSO
               ,            TEL_PERSO
               ,            PORTABLE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.AUTORISATION_ANNUAIRE
               ,            cg$tmp_rec.TYPE_EMPLOI
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.EMAIL_PERSO
               ,            cg$tmp_rec.TEL_PERSO
               ,            cg$tmp_rec.PORTABLE
               FROM      DIPLOME
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE NOWAIT;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            AUTORISATION_ANNUAIRE
               ,            TYPE_EMPLOI
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            EMAIL_PERSO
               ,            TEL_PERSO
               ,            PORTABLE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.AUTORISATION_ANNUAIRE
               ,            cg$tmp_rec.TYPE_EMPLOI
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.EMAIL_PERSO
               ,            cg$tmp_rec.TEL_PERSO
               ,            cg$tmp_rec.PORTABLE
               FROM      DIPLOME
               WHERE rowid = cg$old_rec.the_rowid
               FOR UPDATE NOWAIT;
            END IF;
        ELSE
            IF cg$old_rec.the_rowid is null THEN
               SELECT       NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            AUTORISATION_ANNUAIRE
               ,            TYPE_EMPLOI
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            EMAIL_PERSO
               ,            TEL_PERSO
               ,            PORTABLE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.AUTORISATION_ANNUAIRE
               ,            cg$tmp_rec.TYPE_EMPLOI
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.EMAIL_PERSO
               ,            cg$tmp_rec.TEL_PERSO
               ,            cg$tmp_rec.PORTABLE
               FROM      DIPLOME
               WHERE              NO_ETUDIANT_NAT = cg$old_rec.NO_ETUDIANT_NAT
               FOR UPDATE;
            ELSE
               SELECT       NO_ETUDIANT_NAT
               ,            NOM
               ,            PRENOM
               ,            AUTORISATION_ANNUAIRE
               ,            TYPE_EMPLOI
               ,            MAIL_PRO
               ,            TEL_PRO
               ,            ADRESSE
               ,            CP
               ,            VILLE
               ,            EMAIL_PERSO
               ,            TEL_PERSO
               ,            PORTABLE
               INTO         cg$tmp_rec.NO_ETUDIANT_NAT
               ,            cg$tmp_rec.NOM
               ,            cg$tmp_rec.PRENOM
               ,            cg$tmp_rec.AUTORISATION_ANNUAIRE
               ,            cg$tmp_rec.TYPE_EMPLOI
               ,            cg$tmp_rec.MAIL_PRO
               ,            cg$tmp_rec.TEL_PRO
               ,            cg$tmp_rec.ADRESSE
               ,            cg$tmp_rec.CP
               ,            cg$tmp_rec.VILLE
               ,            cg$tmp_rec.EMAIL_PERSO
               ,            cg$tmp_rec.TEL_PERSO
               ,            cg$tmp_rec.PORTABLE
               FROM      DIPLOME
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
                           'cg$DIPLOME.lck.resource_busy');
            cg$errors.raise_failure;
        WHEN no_data_found THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL, cg$errors.ROW_DEL),
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$DIPLOME.lck.no_data_found');
            cg$errors.raise_failure;
        WHEN OTHERS THEN
            cg$errors.push(SQLERRM,
                           'E',
                           'ORA',
                           SQLCODE,
                           'cg$DIPLOME.lck.others');
            cg$errors.raise_failure;
    END;

-- Optional Columns

    IF (cg$old_ind.TYPE_EMPLOI) THEN
        IF (cg$tmp_rec.TYPE_EMPLOI IS NOT NULL
        AND cg$old_rec.TYPE_EMPLOI IS NOT NULL) THEN
            IF (cg$tmp_rec.TYPE_EMPLOI != cg$old_rec.TYPE_EMPLOI) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P41TYPE_EMPLOI
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TYPE_EMPLOI IS NOT NULL
        OR cg$old_rec.TYPE_EMPLOI IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P41TYPE_EMPLOI
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.MAIL_PRO) THEN
        IF (cg$tmp_rec.MAIL_PRO IS NOT NULL
        AND cg$old_rec.MAIL_PRO IS NOT NULL) THEN
            IF (cg$tmp_rec.MAIL_PRO != cg$old_rec.MAIL_PRO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P42MAIL_PRO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.MAIL_PRO IS NOT NULL
        OR cg$old_rec.MAIL_PRO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P42MAIL_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_PRO) THEN
        IF (cg$tmp_rec.TEL_PRO IS NOT NULL
        AND cg$old_rec.TEL_PRO IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PRO != cg$old_rec.TEL_PRO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P43TEL_PRO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PRO IS NOT NULL
        OR cg$old_rec.TEL_PRO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P43TEL_PRO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.ADRESSE) THEN
        IF (cg$tmp_rec.ADRESSE IS NOT NULL
        AND cg$old_rec.ADRESSE IS NOT NULL) THEN
            IF (cg$tmp_rec.ADRESSE != cg$old_rec.ADRESSE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50ADRESSE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.ADRESSE IS NOT NULL
        OR cg$old_rec.ADRESSE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P50ADRESSE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.CP) THEN
        IF (cg$tmp_rec.CP IS NOT NULL
        AND cg$old_rec.CP IS NOT NULL) THEN
            IF (cg$tmp_rec.CP != cg$old_rec.CP) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60CP
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.CP IS NOT NULL
        OR cg$old_rec.CP IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P60CP
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.VILLE) THEN
        IF (cg$tmp_rec.VILLE IS NOT NULL
        AND cg$old_rec.VILLE IS NOT NULL) THEN
            IF (cg$tmp_rec.VILLE != cg$old_rec.VILLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70VILLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.VILLE IS NOT NULL
        OR cg$old_rec.VILLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P70VILLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.EMAIL_PERSO) THEN
        IF (cg$tmp_rec.EMAIL_PERSO IS NOT NULL
        AND cg$old_rec.EMAIL_PERSO IS NOT NULL) THEN
            IF (cg$tmp_rec.EMAIL_PERSO != cg$old_rec.EMAIL_PERSO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110EMAIL_PERSO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.EMAIL_PERSO IS NOT NULL
        OR cg$old_rec.EMAIL_PERSO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P110EMAIL_PERSO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.TEL_PERSO) THEN
        IF (cg$tmp_rec.TEL_PERSO IS NOT NULL
        AND cg$old_rec.TEL_PERSO IS NOT NULL) THEN
            IF (cg$tmp_rec.TEL_PERSO != cg$old_rec.TEL_PERSO) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120TEL_PERSO
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.TEL_PERSO IS NOT NULL
        OR cg$old_rec.TEL_PERSO IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P120TEL_PERSO
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PORTABLE) THEN
        IF (cg$tmp_rec.PORTABLE IS NOT NULL
        AND cg$old_rec.PORTABLE IS NOT NULL) THEN
            IF (cg$tmp_rec.PORTABLE != cg$old_rec.PORTABLE) THEN
                cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130PORTABLE
                    ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
                any_modified := TRUE;
            END IF;
        ELSIF (cg$tmp_rec.PORTABLE IS NOT NULL
        OR cg$old_rec.PORTABLE IS NOT NULL) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P130PORTABLE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;

-- Mandatory Columns

    IF (cg$old_ind.NO_ETUDIANT_NAT) THEN
        IF (cg$tmp_rec.NO_ETUDIANT_NAT != cg$old_rec.NO_ETUDIANT_NAT) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P10NO_ETUDIANT_NAT
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.NOM) THEN
        IF (cg$tmp_rec.NOM != cg$old_rec.NOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P20NOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.PRENOM) THEN
        IF (cg$tmp_rec.PRENOM != cg$old_rec.PRENOM) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P30PRENOM
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
            any_modified := TRUE;
        END IF;
    END IF;
    IF (cg$old_ind.AUTORISATION_ANNUAIRE) THEN
        IF (cg$tmp_rec.AUTORISATION_ANNUAIRE != cg$old_rec.AUTORISATION_ANNUAIRE) THEN
            cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_MOD, cg$errors.ROW_MOD, P40AUTORISATION_ANNUAIRE
                ),'E', 'API', CG$ERRORS.API_MODIFIED, 'cg$DIPLOME.lck');
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
      cg$ind_true.NOM := TRUE;
      cg$ind_true.PRENOM := TRUE;
      cg$ind_true.AUTORISATION_ANNUAIRE := TRUE;
      cg$ind_true.TYPE_EMPLOI := TRUE;
      cg$ind_true.MAIL_PRO := TRUE;
      cg$ind_true.TEL_PRO := TRUE;
      cg$ind_true.ADRESSE := TRUE;
      cg$ind_true.CP := TRUE;
      cg$ind_true.VILLE := TRUE;
      cg$ind_true.EMAIL_PERSO := TRUE;
      cg$ind_true.TEL_PERSO := TRUE;
      cg$ind_true.PORTABLE := TRUE;
   

END cg$DIPLOME;
/

