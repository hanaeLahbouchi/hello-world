
PROMPT Creating Trigger Logic for Table 'DIPLOME'
PROMPT Creating Before Insert Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BIS_DIPLOME
BEFORE INSERT ON DIPLOME
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$DIPLOME.cg$table.DELETE;
    cg$DIPLOME.cg$tableind.DELETE;
    cg$DIPLOME.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BIR_DIPLOME
BEFORE INSERT ON DIPLOME FOR EACH ROW
DECLARE
    cg$rec cg$DIPLOME.cg$row_type;
    cg$ind cg$DIPLOME.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.AUTORISATION_ANNUAIRE := :new.AUTORISATION_ANNUAIRE;
    cg$ind.AUTORISATION_ANNUAIRE := TRUE;
    cg$rec.TYPE_EMPLOI := :new.TYPE_EMPLOI;
    cg$ind.TYPE_EMPLOI := TRUE;
    cg$rec.MAIL_PRO := :new.MAIL_PRO;
    cg$ind.MAIL_PRO := TRUE;
    cg$rec.TEL_PRO := :new.TEL_PRO;
    cg$ind.TEL_PRO := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CP := :new.CP;
    cg$ind.CP := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.EMAIL_PERSO := :new.EMAIL_PERSO;
    cg$ind.EMAIL_PERSO := TRUE;
    cg$rec.TEL_PERSO := :new.TEL_PERSO;
    cg$ind.TEL_PERSO := TRUE;
    cg$rec.PORTABLE := :new.PORTABLE;
    cg$ind.PORTABLE := TRUE;

    if not (cg$DIPLOME.called_from_package) then
        cg$DIPLOME.validate_arc(cg$rec);
        cg$DIPLOME.validate_domain(cg$rec);

        cg$DIPLOME.ins(cg$rec, cg$ind, FALSE);
        cg$DIPLOME.called_from_package := FALSE;
    end if;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NOM := cg$rec.NOM;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).NOM := cg$ind.NOM;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).PRENOM := cg$rec.PRENOM;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).PRENOM := cg$ind.PRENOM;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).AUTORISATION_ANNUAIRE := cg$rec.AUTORISATION_ANNUAIRE;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).AUTORISATION_ANNUAIRE := cg$ind.AUTORISATION_ANNUAIRE;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TYPE_EMPLOI := cg$rec.TYPE_EMPLOI;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).TYPE_EMPLOI := cg$ind.TYPE_EMPLOI;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).MAIL_PRO := cg$rec.MAIL_PRO;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).MAIL_PRO := cg$ind.MAIL_PRO;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TEL_PRO := cg$rec.TEL_PRO;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).TEL_PRO := cg$ind.TEL_PRO;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).ADRESSE := cg$rec.ADRESSE;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).ADRESSE := cg$ind.ADRESSE;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).CP := cg$rec.CP;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).CP := cg$ind.CP;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).VILLE := cg$rec.VILLE;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).VILLE := cg$ind.VILLE;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).EMAIL_PERSO := cg$rec.EMAIL_PERSO;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).EMAIL_PERSO := cg$ind.EMAIL_PERSO;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TEL_PERSO := cg$rec.TEL_PERSO;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).TEL_PERSO := cg$ind.TEL_PERSO;

    cg$DIPLOME.cg$table(cg$DIPLOME.idx).PORTABLE := cg$rec.PORTABLE;
    cg$DIPLOME.cg$tableind(cg$DIPLOME.idx).PORTABLE := cg$ind.PORTABLE;

    cg$DIPLOME.idx := cg$DIPLOME.idx + 1;

    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.AUTORISATION_ANNUAIRE := cg$rec.AUTORISATION_ANNUAIRE;
    :new.TYPE_EMPLOI := cg$rec.TYPE_EMPLOI;
    :new.MAIL_PRO := cg$rec.MAIL_PRO;
    :new.TEL_PRO := cg$rec.TEL_PRO;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.EMAIL_PERSO := cg$rec.EMAIL_PERSO;
    :new.TEL_PERSO := cg$rec.TEL_PERSO;
    :new.PORTABLE := cg$rec.PORTABLE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_DIPLOME, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_DIPLOME
AFTER INSERT ON DIPLOME FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_DIPLOME
/

PROMPT Creating After Insert Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$AIS_DIPLOME
AFTER INSERT ON DIPLOME
DECLARE
    idx      BINARY_INTEGER := cg$DIPLOME.cg$table.FIRST;
    cg$rec   cg$DIPLOME.cg$row_type;
    cg$old_rec   cg$DIPLOME.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$DIPLOME.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$DIPLOME.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NOM := cg$DIPLOME.cg$table(idx).NOM;
            cg$rec.PRENOM := cg$DIPLOME.cg$table(idx).PRENOM;
            cg$rec.AUTORISATION_ANNUAIRE := cg$DIPLOME.cg$table(idx).AUTORISATION_ANNUAIRE;
            cg$rec.TYPE_EMPLOI := cg$DIPLOME.cg$table(idx).TYPE_EMPLOI;
            cg$rec.MAIL_PRO := cg$DIPLOME.cg$table(idx).MAIL_PRO;
            cg$rec.TEL_PRO := cg$DIPLOME.cg$table(idx).TEL_PRO;
            cg$rec.ADRESSE := cg$DIPLOME.cg$table(idx).ADRESSE;
            cg$rec.CP := cg$DIPLOME.cg$table(idx).CP;
            cg$rec.VILLE := cg$DIPLOME.cg$table(idx).VILLE;
            cg$rec.EMAIL_PERSO := cg$DIPLOME.cg$table(idx).EMAIL_PERSO;
            cg$rec.TEL_PERSO := cg$DIPLOME.cg$table(idx).TEL_PERSO;
            cg$rec.PORTABLE := cg$DIPLOME.cg$table(idx).PORTABLE;

            cg$DIPLOME.validate_foreign_keys_ins(cg$rec);

            cg$DIPLOME.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DIPLOME.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$DIPLOME.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BUS_DIPLOME
BEFORE UPDATE ON DIPLOME
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$DIPLOME.cg$table.DELETE;
    cg$DIPLOME.cg$tableind.DELETE;
    cg$DIPLOME.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BUR_DIPLOME
BEFORE UPDATE ON DIPLOME FOR EACH ROW
DECLARE
    cg$rec     cg$DIPLOME.cg$row_type;
    cg$ind     cg$DIPLOME.cg$ind_type;
    cg$old_rec cg$DIPLOME.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).PRENOM := :old.PRENOM;
    cg$rec.AUTORISATION_ANNUAIRE := :new.AUTORISATION_ANNUAIRE;
    cg$ind.AUTORISATION_ANNUAIRE :=    (:new.AUTORISATION_ANNUAIRE IS NULL AND :old.AUTORISATION_ANNUAIRE IS NOT NULL )
                        OR (:new.AUTORISATION_ANNUAIRE IS NOT NULL AND :old.AUTORISATION_ANNUAIRE IS NULL)
                        OR NOT(:new.AUTORISATION_ANNUAIRE = :old.AUTORISATION_ANNUAIRE) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).AUTORISATION_ANNUAIRE := :old.AUTORISATION_ANNUAIRE;
    cg$rec.TYPE_EMPLOI := :new.TYPE_EMPLOI;
    cg$ind.TYPE_EMPLOI :=    (:new.TYPE_EMPLOI IS NULL AND :old.TYPE_EMPLOI IS NOT NULL )
                        OR (:new.TYPE_EMPLOI IS NOT NULL AND :old.TYPE_EMPLOI IS NULL)
                        OR NOT(:new.TYPE_EMPLOI = :old.TYPE_EMPLOI) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TYPE_EMPLOI := :old.TYPE_EMPLOI;
    cg$rec.MAIL_PRO := :new.MAIL_PRO;
    cg$ind.MAIL_PRO :=    (:new.MAIL_PRO IS NULL AND :old.MAIL_PRO IS NOT NULL )
                        OR (:new.MAIL_PRO IS NOT NULL AND :old.MAIL_PRO IS NULL)
                        OR NOT(:new.MAIL_PRO = :old.MAIL_PRO) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).MAIL_PRO := :old.MAIL_PRO;
    cg$rec.TEL_PRO := :new.TEL_PRO;
    cg$ind.TEL_PRO :=    (:new.TEL_PRO IS NULL AND :old.TEL_PRO IS NOT NULL )
                        OR (:new.TEL_PRO IS NOT NULL AND :old.TEL_PRO IS NULL)
                        OR NOT(:new.TEL_PRO = :old.TEL_PRO) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TEL_PRO := :old.TEL_PRO;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CP := :new.CP;
    cg$ind.CP :=    (:new.CP IS NULL AND :old.CP IS NOT NULL )
                        OR (:new.CP IS NOT NULL AND :old.CP IS NULL)
                        OR NOT(:new.CP = :old.CP) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).CP := :old.CP;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).VILLE := :old.VILLE;
    cg$rec.EMAIL_PERSO := :new.EMAIL_PERSO;
    cg$ind.EMAIL_PERSO :=    (:new.EMAIL_PERSO IS NULL AND :old.EMAIL_PERSO IS NOT NULL )
                        OR (:new.EMAIL_PERSO IS NOT NULL AND :old.EMAIL_PERSO IS NULL)
                        OR NOT(:new.EMAIL_PERSO = :old.EMAIL_PERSO) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).EMAIL_PERSO := :old.EMAIL_PERSO;
    cg$rec.TEL_PERSO := :new.TEL_PERSO;
    cg$ind.TEL_PERSO :=    (:new.TEL_PERSO IS NULL AND :old.TEL_PERSO IS NOT NULL )
                        OR (:new.TEL_PERSO IS NOT NULL AND :old.TEL_PERSO IS NULL)
                        OR NOT(:new.TEL_PERSO = :old.TEL_PERSO) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).TEL_PERSO := :old.TEL_PERSO;
    cg$rec.PORTABLE := :new.PORTABLE;
    cg$ind.PORTABLE :=    (:new.PORTABLE IS NULL AND :old.PORTABLE IS NOT NULL )
                        OR (:new.PORTABLE IS NOT NULL AND :old.PORTABLE IS NULL)
                        OR NOT(:new.PORTABLE = :old.PORTABLE) ;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).PORTABLE := :old.PORTABLE;


    cg$DIPLOME.idx := cg$DIPLOME.idx + 1;

    if not (cg$DIPLOME.called_from_package) then
        cg$DIPLOME.validate_arc(cg$rec);
        cg$DIPLOME.validate_domain(cg$rec, cg$ind);
        cg$DIPLOME.validate_domain_cascade_update(cg$old_rec);   

        cg$DIPLOME.upd(cg$rec, cg$ind, FALSE);
        cg$DIPLOME.called_from_package := FALSE;
    end if;

    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.AUTORISATION_ANNUAIRE := cg$rec.AUTORISATION_ANNUAIRE;
    :new.TYPE_EMPLOI := cg$rec.TYPE_EMPLOI;
    :new.MAIL_PRO := cg$rec.MAIL_PRO;
    :new.TEL_PRO := cg$rec.TEL_PRO;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.EMAIL_PERSO := cg$rec.EMAIL_PERSO;
    :new.TEL_PERSO := cg$rec.TEL_PERSO;
    :new.PORTABLE := cg$rec.PORTABLE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_DIPLOME, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_DIPLOME
AFTER UPDATE ON DIPLOME FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_DIPLOME
/






PROMPT Creating After Update Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$AUS_DIPLOME
AFTER UPDATE ON DIPLOME
DECLARE
    idx        BINARY_INTEGER := cg$DIPLOME.cg$table.FIRST;
    cg$old_rec cg$DIPLOME.cg$row_type;
    cg$rec     cg$DIPLOME.cg$row_type;
    cg$ind     cg$DIPLOME.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_ETUDIANT_NAT := cg$DIPLOME.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NOM := cg$DIPLOME.cg$table(idx).NOM;
        cg$old_rec.PRENOM := cg$DIPLOME.cg$table(idx).PRENOM;
        cg$old_rec.AUTORISATION_ANNUAIRE := cg$DIPLOME.cg$table(idx).AUTORISATION_ANNUAIRE;
        cg$old_rec.TYPE_EMPLOI := cg$DIPLOME.cg$table(idx).TYPE_EMPLOI;
        cg$old_rec.MAIL_PRO := cg$DIPLOME.cg$table(idx).MAIL_PRO;
        cg$old_rec.TEL_PRO := cg$DIPLOME.cg$table(idx).TEL_PRO;
        cg$old_rec.ADRESSE := cg$DIPLOME.cg$table(idx).ADRESSE;
        cg$old_rec.CP := cg$DIPLOME.cg$table(idx).CP;
        cg$old_rec.VILLE := cg$DIPLOME.cg$table(idx).VILLE;
        cg$old_rec.EMAIL_PERSO := cg$DIPLOME.cg$table(idx).EMAIL_PERSO;
        cg$old_rec.TEL_PERSO := cg$DIPLOME.cg$table(idx).TEL_PERSO;
        cg$old_rec.PORTABLE := cg$DIPLOME.cg$table(idx).PORTABLE;

    IF NOT (cg$DIPLOME.called_from_package) THEN
        idx := cg$DIPLOME.cg$table.NEXT(idx);
        cg$rec.NO_ETUDIANT_NAT := cg$DIPLOME.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NOM := cg$DIPLOME.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.PRENOM := cg$DIPLOME.cg$table(idx).PRENOM;
        cg$ind.PRENOM := updating('PRENOM');
        cg$rec.AUTORISATION_ANNUAIRE := cg$DIPLOME.cg$table(idx).AUTORISATION_ANNUAIRE;
        cg$ind.AUTORISATION_ANNUAIRE := updating('AUTORISATION_ANNUAIRE');
        cg$rec.TYPE_EMPLOI := cg$DIPLOME.cg$table(idx).TYPE_EMPLOI;
        cg$ind.TYPE_EMPLOI := updating('TYPE_EMPLOI');
        cg$rec.MAIL_PRO := cg$DIPLOME.cg$table(idx).MAIL_PRO;
        cg$ind.MAIL_PRO := updating('MAIL_PRO');
        cg$rec.TEL_PRO := cg$DIPLOME.cg$table(idx).TEL_PRO;
        cg$ind.TEL_PRO := updating('TEL_PRO');
        cg$rec.ADRESSE := cg$DIPLOME.cg$table(idx).ADRESSE;
        cg$ind.ADRESSE := updating('ADRESSE');
        cg$rec.CP := cg$DIPLOME.cg$table(idx).CP;
        cg$ind.CP := updating('CP');
        cg$rec.VILLE := cg$DIPLOME.cg$table(idx).VILLE;
        cg$ind.VILLE := updating('VILLE');
        cg$rec.EMAIL_PERSO := cg$DIPLOME.cg$table(idx).EMAIL_PERSO;
        cg$ind.EMAIL_PERSO := updating('EMAIL_PERSO');
        cg$rec.TEL_PERSO := cg$DIPLOME.cg$table(idx).TEL_PERSO;
        cg$ind.TEL_PERSO := updating('TEL_PERSO');
        cg$rec.PORTABLE := cg$DIPLOME.cg$table(idx).PORTABLE;
        cg$ind.PORTABLE := updating('PORTABLE');

        cg$DIPLOME.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$DIPLOME.upd_denorm2( cg$rec,
                                       cg$DIPLOME.cg$tableind(idx)
                                     );
        cg$DIPLOME.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$DIPLOME.cg$tableind(idx)
								                  );
        cg$DIPLOME.cascade_update(cg$rec, cg$old_rec);
        cg$DIPLOME.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$DIPLOME.called_from_package := FALSE;
	END IF;
        idx := cg$DIPLOME.cg$table.NEXT(idx);
    END LOOP;

    cg$DIPLOME.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BDS_DIPLOME
BEFORE DELETE ON DIPLOME
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$DIPLOME.cg$table.DELETE;
    cg$DIPLOME.cg$tableind.DELETE;
    cg$DIPLOME.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$BDR_DIPLOME
BEFORE DELETE ON DIPLOME FOR EACH ROW
DECLARE
    cg$pk cg$DIPLOME.cg$pk_type;
    cg$rec cg$DIPLOME.cg$row_type;
    cg$ind cg$DIPLOME.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_ETUDIANT_NAT  := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$DIPLOME.cg$table(cg$DIPLOME.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;


    cg$DIPLOME.idx := cg$DIPLOME.idx + 1;

    if not (cg$DIPLOME.called_from_package) then
        cg$DIPLOME.validate_domain_cascade_delete(cg$rec);   
        cg$DIPLOME.del(cg$pk, FALSE);
        cg$DIPLOME.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_DIPLOME, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_DIPLOME
AFTER DELETE ON DIPLOME FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_DIPLOME
/

PROMPT Creating After Delete Statement Trigger on 'DIPLOME'
CREATE OR REPLACE TRIGGER cg$ADS_DIPLOME
AFTER DELETE ON DIPLOME
DECLARE
    idx        BINARY_INTEGER := cg$DIPLOME.cg$table.FIRST;
    cg$rec   cg$DIPLOME.cg$row_type;
    cg$old_rec   cg$DIPLOME.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$DIPLOME.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_ETUDIANT_NAT := cg$DIPLOME.cg$table(idx).NO_ETUDIANT_NAT;
            cg$DIPLOME.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NOM := cg$DIPLOME.cg$table(idx).NOM;
            cg$DIPLOME.cg$tableind(idx).NOM := TRUE;
            cg$rec.PRENOM := cg$DIPLOME.cg$table(idx).PRENOM;
            cg$DIPLOME.cg$tableind(idx).PRENOM := TRUE;
            cg$rec.AUTORISATION_ANNUAIRE := cg$DIPLOME.cg$table(idx).AUTORISATION_ANNUAIRE;
            cg$DIPLOME.cg$tableind(idx).AUTORISATION_ANNUAIRE := TRUE;
            cg$rec.TYPE_EMPLOI := cg$DIPLOME.cg$table(idx).TYPE_EMPLOI;
            cg$DIPLOME.cg$tableind(idx).TYPE_EMPLOI := TRUE;
            cg$rec.MAIL_PRO := cg$DIPLOME.cg$table(idx).MAIL_PRO;
            cg$DIPLOME.cg$tableind(idx).MAIL_PRO := TRUE;
            cg$rec.TEL_PRO := cg$DIPLOME.cg$table(idx).TEL_PRO;
            cg$DIPLOME.cg$tableind(idx).TEL_PRO := TRUE;
            cg$rec.ADRESSE := cg$DIPLOME.cg$table(idx).ADRESSE;
            cg$DIPLOME.cg$tableind(idx).ADRESSE := TRUE;
            cg$rec.CP := cg$DIPLOME.cg$table(idx).CP;
            cg$DIPLOME.cg$tableind(idx).CP := TRUE;
            cg$rec.VILLE := cg$DIPLOME.cg$table(idx).VILLE;
            cg$DIPLOME.cg$tableind(idx).VILLE := TRUE;
            cg$rec.EMAIL_PERSO := cg$DIPLOME.cg$table(idx).EMAIL_PERSO;
            cg$DIPLOME.cg$tableind(idx).EMAIL_PERSO := TRUE;
            cg$rec.TEL_PERSO := cg$DIPLOME.cg$table(idx).TEL_PERSO;
            cg$DIPLOME.cg$tableind(idx).TEL_PERSO := TRUE;
            cg$rec.PORTABLE := cg$DIPLOME.cg$table(idx).PORTABLE;
            cg$DIPLOME.cg$tableind(idx).PORTABLE := TRUE;

            cg$DIPLOME.validate_foreign_keys_del(cg$rec);
            cg$DIPLOME.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$DIPLOME.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$DIPLOME.cascade_delete(cg$rec);
            cg$DIPLOME.domain_cascade_delete(cg$rec);             

            idx := cg$DIPLOME.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



