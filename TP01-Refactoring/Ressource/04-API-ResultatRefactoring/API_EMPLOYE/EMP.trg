
PROMPT Creating Trigger Logic for Table 'EMPLOYE'
PROMPT Creating Before Insert Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$BIS_EMPLOYE
BEFORE INSERT ON EMPLOYE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$EMPLOYE.cg$table.DELETE;
    cg$EMPLOYE.cg$tableind.DELETE;
    cg$EMPLOYE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'EMPLOYE'
create or replace TRIGGER CG$BIR_EMPLOYE 
BEFORE INSERT ON EMPLOYE 
FOR EACH ROW 
DECLARE
    cg$rec cg$EMPLOYE.cg$row_type;
    cg$ind cg$EMPLOYE.cg$ind_type;
    
    NOM_DIPLOME EMPLOYE.nom%type;
    PRENOM_DIPLOME EMPLOYE.prenom%type;
    MAIL_PRO EMPLOYE.mail_pro%type;
    TEL_PRO EMPLOYE.tel_pro%type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI := TRUE;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE := TRUE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM := TRUE;
    cg$rec.MAIL_PRO := :new.MAIL_PRO;
    cg$ind.MAIL_PRO := TRUE;
    cg$rec.TEL_PRO := :new.TEL_PRO;
    cg$ind.TEL_PRO := TRUE;
    cg$rec.FONCTION := :new.FONCTION;
    cg$ind.FONCTION := TRUE;

    if not (cg$EMPLOYE.called_from_package) then
        cg$EMPLOYE.validate_arc(cg$rec);
        cg$EMPLOYE.validate_domain(cg$rec);

        cg$EMPLOYE.ins(cg$rec, cg$ind, FALSE);
        cg$EMPLOYE.called_from_package := FALSE;
    end if;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).NO_CONTACT_ILI := cg$ind.NO_CONTACT_ILI;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).NO_ENTREPRISE := cg$ind.NO_ENTREPRISE;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).NO_ETUDIANT_NAT := cg$ind.NO_ETUDIANT_NAT;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NOM := cg$rec.NOM;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).NOM := cg$ind.NOM;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).PRENOM := cg$rec.PRENOM;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).PRENOM := cg$ind.PRENOM;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).MAIL_PRO := cg$rec.MAIL_PRO;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).MAIL_PRO := cg$ind.MAIL_PRO;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).TEL_PRO := cg$rec.TEL_PRO;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).TEL_PRO := cg$ind.TEL_PRO;

    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).FONCTION := cg$rec.FONCTION;
    cg$EMPLOYE.cg$tableind(cg$EMPLOYE.idx).FONCTION := cg$ind.FONCTION;

    cg$EMPLOYE.idx := cg$EMPLOYE.idx + 1;

    --SELECT EMP_SEQ.nextval INTO :NEW.NO_CONTACT_ILI FROM DUAL;
    :new.NO_CONTACT_ILI := cg$rec.NO_CONTACT_ILI;
    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    
    IF (LENGTH(:new.NO_ETUDIANT_NAT) <> 0) THEN
      SELECT nom, prenom, mail_pro, tel_pro INTO NOM_DIPLOME,PRENOM_DIPLOME, MAIL_PRO, TEL_PRO FROM DIPLOME WHERE no_etudiant_nat = :new.no_etudiant_nat;
      :new.NOM := NOM_DIPLOME;
      :new.PRENOM := PRENOM_DIPLOME;
      :new.MAIL_PRO := MAIL_PRO;
      :new.TEL_PRO := TEL_PRO;
    ELSE
      :new.NOM := cg$rec.NOM;
      :new.PRENOM := cg$rec.PRENOM;
      :new.MAIL_PRO := cg$rec.MAIL_PRO;
      :new.TEL_PRO := cg$rec.TEL_PRO;
    END IF;
    
    :new.FONCTION := cg$rec.FONCTION;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/

-- No application logic defined for Trigger cg$AIR_EMPLOYE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_EMPLOYE
AFTER INSERT ON EMPLOYE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_EMPLOYE
/

PROMPT Creating After Insert Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$AIS_EMPLOYE
AFTER INSERT ON EMPLOYE
DECLARE
    idx      BINARY_INTEGER := cg$EMPLOYE.cg$table.FIRST;
    cg$rec   cg$EMPLOYE.cg$row_type;
    cg$old_rec   cg$EMPLOYE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$EMPLOYE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_CONTACT_ILI := cg$EMPLOYE.cg$table(idx).NO_CONTACT_ILI;
            cg$rec.NO_ENTREPRISE := cg$EMPLOYE.cg$table(idx).NO_ENTREPRISE;
            cg$rec.NO_ETUDIANT_NAT := cg$EMPLOYE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$rec.NOM := cg$EMPLOYE.cg$table(idx).NOM;
            cg$rec.PRENOM := cg$EMPLOYE.cg$table(idx).PRENOM;
            cg$rec.MAIL_PRO := cg$EMPLOYE.cg$table(idx).MAIL_PRO;
            cg$rec.TEL_PRO := cg$EMPLOYE.cg$table(idx).TEL_PRO;
            cg$rec.FONCTION := cg$EMPLOYE.cg$table(idx).FONCTION;

            cg$EMPLOYE.validate_foreign_keys_ins(cg$rec);

            cg$EMPLOYE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EMPLOYE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$EMPLOYE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$BUS_EMPLOYE
BEFORE UPDATE ON EMPLOYE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$EMPLOYE.cg$table.DELETE;
    cg$EMPLOYE.cg$tableind.DELETE;
    cg$EMPLOYE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$BUR_EMPLOYE
BEFORE UPDATE ON EMPLOYE FOR EACH ROW
DECLARE
    cg$rec     cg$EMPLOYE.cg$row_type;
    cg$ind     cg$EMPLOYE.cg$ind_type;
    cg$old_rec cg$EMPLOYE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_CONTACT_ILI := :new.NO_CONTACT_ILI;
    cg$ind.NO_CONTACT_ILI :=    (:new.NO_CONTACT_ILI IS NULL AND :old.NO_CONTACT_ILI IS NOT NULL )
                        OR (:new.NO_CONTACT_ILI IS NOT NULL AND :old.NO_CONTACT_ILI IS NULL)
                        OR NOT(:new.NO_CONTACT_ILI = :old.NO_CONTACT_ILI) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.NO_ENTREPRISE := :new.NO_ENTREPRISE;
    cg$ind.NO_ENTREPRISE :=    (:new.NO_ENTREPRISE IS NULL AND :old.NO_ENTREPRISE IS NOT NULL )
                        OR (:new.NO_ENTREPRISE IS NOT NULL AND :old.NO_ENTREPRISE IS NULL)
                        OR NOT(:new.NO_ENTREPRISE = :old.NO_ENTREPRISE) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_ETUDIANT_NAT := :new.NO_ETUDIANT_NAT;
    cg$ind.NO_ETUDIANT_NAT :=    (:new.NO_ETUDIANT_NAT IS NULL AND :old.NO_ETUDIANT_NAT IS NOT NULL )
                        OR (:new.NO_ETUDIANT_NAT IS NOT NULL AND :old.NO_ETUDIANT_NAT IS NULL)
                        OR NOT(:new.NO_ETUDIANT_NAT = :old.NO_ETUDIANT_NAT) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NOM := :old.NOM;
    cg$rec.PRENOM := :new.PRENOM;
    cg$ind.PRENOM :=    (:new.PRENOM IS NULL AND :old.PRENOM IS NOT NULL )
                        OR (:new.PRENOM IS NOT NULL AND :old.PRENOM IS NULL)
                        OR NOT(:new.PRENOM = :old.PRENOM) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).PRENOM := :old.PRENOM;
    cg$rec.MAIL_PRO := :new.MAIL_PRO;
    cg$ind.MAIL_PRO :=    (:new.MAIL_PRO IS NULL AND :old.MAIL_PRO IS NOT NULL )
                        OR (:new.MAIL_PRO IS NOT NULL AND :old.MAIL_PRO IS NULL)
                        OR NOT(:new.MAIL_PRO = :old.MAIL_PRO) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).MAIL_PRO := :old.MAIL_PRO;
    cg$rec.TEL_PRO := :new.TEL_PRO;
    cg$ind.TEL_PRO :=    (:new.TEL_PRO IS NULL AND :old.TEL_PRO IS NOT NULL )
                        OR (:new.TEL_PRO IS NOT NULL AND :old.TEL_PRO IS NULL)
                        OR NOT(:new.TEL_PRO = :old.TEL_PRO) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).TEL_PRO := :old.TEL_PRO;
    cg$rec.FONCTION := :new.FONCTION;
    cg$ind.FONCTION :=    (:new.FONCTION IS NULL AND :old.FONCTION IS NOT NULL )
                        OR (:new.FONCTION IS NOT NULL AND :old.FONCTION IS NULL)
                        OR NOT(:new.FONCTION = :old.FONCTION) ;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).FONCTION := :old.FONCTION;


    cg$EMPLOYE.idx := cg$EMPLOYE.idx + 1;

    if not (cg$EMPLOYE.called_from_package) then
        cg$EMPLOYE.validate_arc(cg$rec);
        cg$EMPLOYE.validate_domain(cg$rec, cg$ind);
        cg$EMPLOYE.validate_domain_cascade_update(cg$old_rec);   

        cg$EMPLOYE.upd(cg$rec, cg$ind, FALSE);
        cg$EMPLOYE.called_from_package := FALSE;
    end if;

    :new.NO_ENTREPRISE := cg$rec.NO_ENTREPRISE;
    :new.NO_ETUDIANT_NAT := cg$rec.NO_ETUDIANT_NAT;
    :new.NOM := cg$rec.NOM;
    :new.PRENOM := cg$rec.PRENOM;
    :new.MAIL_PRO := cg$rec.MAIL_PRO;
    :new.TEL_PRO := cg$rec.TEL_PRO;
    :new.FONCTION := cg$rec.FONCTION;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_EMPLOYE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_EMPLOYE
AFTER UPDATE ON EMPLOYE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_EMPLOYE
/






PROMPT Creating After Update Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$AUS_EMPLOYE
AFTER UPDATE ON EMPLOYE
DECLARE
    idx        BINARY_INTEGER := cg$EMPLOYE.cg$table.FIRST;
    cg$old_rec cg$EMPLOYE.cg$row_type;
    cg$rec     cg$EMPLOYE.cg$row_type;
    cg$ind     cg$EMPLOYE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_CONTACT_ILI := cg$EMPLOYE.cg$table(idx).NO_CONTACT_ILI;
        cg$old_rec.NO_ENTREPRISE := cg$EMPLOYE.cg$table(idx).NO_ENTREPRISE;
        cg$old_rec.NO_ETUDIANT_NAT := cg$EMPLOYE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$old_rec.NOM := cg$EMPLOYE.cg$table(idx).NOM;
        cg$old_rec.PRENOM := cg$EMPLOYE.cg$table(idx).PRENOM;
        cg$old_rec.MAIL_PRO := cg$EMPLOYE.cg$table(idx).MAIL_PRO;
        cg$old_rec.TEL_PRO := cg$EMPLOYE.cg$table(idx).TEL_PRO;
        cg$old_rec.FONCTION := cg$EMPLOYE.cg$table(idx).FONCTION;

    IF NOT (cg$EMPLOYE.called_from_package) THEN
        idx := cg$EMPLOYE.cg$table.NEXT(idx);
        cg$rec.NO_CONTACT_ILI := cg$EMPLOYE.cg$table(idx).NO_CONTACT_ILI;
        cg$ind.NO_CONTACT_ILI := updating('NO_CONTACT_ILI');
        cg$rec.NO_ENTREPRISE := cg$EMPLOYE.cg$table(idx).NO_ENTREPRISE;
        cg$ind.NO_ENTREPRISE := updating('NO_ENTREPRISE');
        cg$rec.NO_ETUDIANT_NAT := cg$EMPLOYE.cg$table(idx).NO_ETUDIANT_NAT;
        cg$ind.NO_ETUDIANT_NAT := updating('NO_ETUDIANT_NAT');
        cg$rec.NOM := cg$EMPLOYE.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.PRENOM := cg$EMPLOYE.cg$table(idx).PRENOM;
        cg$ind.PRENOM := updating('PRENOM');
        cg$rec.MAIL_PRO := cg$EMPLOYE.cg$table(idx).MAIL_PRO;
        cg$ind.MAIL_PRO := updating('MAIL_PRO');
        cg$rec.TEL_PRO := cg$EMPLOYE.cg$table(idx).TEL_PRO;
        cg$ind.TEL_PRO := updating('TEL_PRO');
        cg$rec.FONCTION := cg$EMPLOYE.cg$table(idx).FONCTION;
        cg$ind.FONCTION := updating('FONCTION');

        cg$EMPLOYE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$EMPLOYE.upd_denorm2( cg$rec,
                                       cg$EMPLOYE.cg$tableind(idx)
                                     );
        cg$EMPLOYE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$EMPLOYE.cg$tableind(idx)
								                  );
        cg$EMPLOYE.cascade_update(cg$rec, cg$old_rec);
        cg$EMPLOYE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$EMPLOYE.called_from_package := FALSE;
	END IF;
        idx := cg$EMPLOYE.cg$table.NEXT(idx);
    END LOOP;

    cg$EMPLOYE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$BDS_EMPLOYE
BEFORE DELETE ON EMPLOYE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$EMPLOYE.cg$table.DELETE;
    cg$EMPLOYE.cg$tableind.DELETE;
    cg$EMPLOYE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$BDR_EMPLOYE
BEFORE DELETE ON EMPLOYE FOR EACH ROW
DECLARE
    cg$pk cg$EMPLOYE.cg$pk_type;
    cg$rec cg$EMPLOYE.cg$row_type;
    cg$ind cg$EMPLOYE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_CONTACT_ILI  := :old.NO_CONTACT_ILI;
    cg$rec.NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_CONTACT_ILI := :old.NO_CONTACT_ILI;
    cg$rec.NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ENTREPRISE := :old.NO_ENTREPRISE;
    cg$rec.NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;
    cg$EMPLOYE.cg$table(cg$EMPLOYE.idx).NO_ETUDIANT_NAT := :old.NO_ETUDIANT_NAT;


    cg$EMPLOYE.idx := cg$EMPLOYE.idx + 1;

    if not (cg$EMPLOYE.called_from_package) then
        cg$EMPLOYE.validate_domain_cascade_delete(cg$rec);   
        cg$EMPLOYE.del(cg$pk, FALSE);
        cg$EMPLOYE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_EMPLOYE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_EMPLOYE
AFTER DELETE ON EMPLOYE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_EMPLOYE
/

PROMPT Creating After Delete Statement Trigger on 'EMPLOYE'
CREATE OR REPLACE TRIGGER cg$ADS_EMPLOYE
AFTER DELETE ON EMPLOYE
DECLARE
    idx        BINARY_INTEGER := cg$EMPLOYE.cg$table.FIRST;
    cg$rec   cg$EMPLOYE.cg$row_type;
    cg$old_rec   cg$EMPLOYE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$EMPLOYE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_CONTACT_ILI := cg$EMPLOYE.cg$table(idx).NO_CONTACT_ILI;
            cg$EMPLOYE.cg$tableind(idx).NO_CONTACT_ILI := TRUE;
            cg$rec.NO_ENTREPRISE := cg$EMPLOYE.cg$table(idx).NO_ENTREPRISE;
            cg$EMPLOYE.cg$tableind(idx).NO_ENTREPRISE := TRUE;
            cg$rec.NO_ETUDIANT_NAT := cg$EMPLOYE.cg$table(idx).NO_ETUDIANT_NAT;
            cg$EMPLOYE.cg$tableind(idx).NO_ETUDIANT_NAT := TRUE;
            cg$rec.NOM := cg$EMPLOYE.cg$table(idx).NOM;
            cg$EMPLOYE.cg$tableind(idx).NOM := TRUE;
            cg$rec.PRENOM := cg$EMPLOYE.cg$table(idx).PRENOM;
            cg$EMPLOYE.cg$tableind(idx).PRENOM := TRUE;
            cg$rec.MAIL_PRO := cg$EMPLOYE.cg$table(idx).MAIL_PRO;
            cg$EMPLOYE.cg$tableind(idx).MAIL_PRO := TRUE;
            cg$rec.TEL_PRO := cg$EMPLOYE.cg$table(idx).TEL_PRO;
            cg$EMPLOYE.cg$tableind(idx).TEL_PRO := TRUE;
            cg$rec.FONCTION := cg$EMPLOYE.cg$table(idx).FONCTION;
            cg$EMPLOYE.cg$tableind(idx).FONCTION := TRUE;

            cg$EMPLOYE.validate_foreign_keys_del(cg$rec);
            cg$EMPLOYE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$EMPLOYE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$EMPLOYE.cascade_delete(cg$rec);
            cg$EMPLOYE.domain_cascade_delete(cg$rec);             

            idx := cg$EMPLOYE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



