
PROMPT Creating Trigger Logic for Table 'COMPAGNIE'
PROMPT Creating Before Insert Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BIS_COMPAGNIE
BEFORE INSERT ON COMPAGNIE
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$COMPAGNIE.cg$table.DELETE;
    cg$COMPAGNIE.cg$tableind.DELETE;
    cg$COMPAGNIE.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BIR_COMPAGNIE
BEFORE INSERT ON COMPAGNIE FOR EACH ROW
DECLARE
    cg$rec cg$COMPAGNIE.cg$row_type;
    cg$ind cg$COMPAGNIE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM := TRUE;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO := TRUE;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT := TRUE;
    cg$rec.CODE_PAILI := :new.CODE_PAILI;
    cg$ind.CODE_PAILI := TRUE;
    cg$rec.SIGLE_COM := :new.SIGLE_COM;
    cg$ind.SIGLE_COM := TRUE;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM := TRUE;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE := TRUE;
    cg$rec.CP := :new.CP;
    cg$ind.CP := TRUE;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE := TRUE;
    cg$rec.TEL := :new.TEL;
    cg$ind.TEL := TRUE;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL := TRUE;
    cg$rec.LOGO := :new.LOGO;
    cg$ind.LOGO := TRUE;
    cg$rec.NOM_PROJET := :new.NOM_PROJET;
    cg$ind.NOM_PROJET := TRUE;
    cg$rec.DESC_PROJET := :new.DESC_PROJET;
    cg$ind.DESC_PROJET := TRUE;

    if not (cg$COMPAGNIE.called_from_package) then
        cg$COMPAGNIE.validate_arc(cg$rec);
        cg$COMPAGNIE.validate_domain(cg$rec);

        cg$COMPAGNIE.ins(cg$rec, cg$ind, FALSE);
        cg$COMPAGNIE.called_from_package := FALSE;
    end if;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_COM := cg$rec.CODE_COM;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).CODE_COM := cg$ind.CODE_COM;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).ANNEE_PRO := cg$rec.ANNEE_PRO;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).ANNEE_PRO := cg$ind.ANNEE_PRO;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).NO_ENSEIGNANT := cg$ind.NO_ENSEIGNANT;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_PAILI := cg$rec.CODE_PAILI;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).CODE_PAILI := cg$ind.CODE_PAILI;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).SIGLE_COM := cg$rec.SIGLE_COM;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).SIGLE_COM := cg$ind.SIGLE_COM;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NOM := cg$rec.NOM;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).NOM := cg$ind.NOM;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).ADRESSE := cg$rec.ADRESSE;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).ADRESSE := cg$ind.ADRESSE;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CP := cg$rec.CP;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).CP := cg$ind.CP;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).VILLE := cg$rec.VILLE;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).VILLE := cg$ind.VILLE;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).TEL := cg$rec.TEL;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).TEL := cg$ind.TEL;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).EMAIL := cg$rec.EMAIL;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).EMAIL := cg$ind.EMAIL;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).LOGO := cg$rec.LOGO;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).LOGO := cg$ind.LOGO;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NOM_PROJET := cg$rec.NOM_PROJET;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).NOM_PROJET := cg$ind.NOM_PROJET;

    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).DESC_PROJET := cg$rec.DESC_PROJET;
    cg$COMPAGNIE.cg$tableind(cg$COMPAGNIE.idx).DESC_PROJET := cg$ind.DESC_PROJET;

    cg$COMPAGNIE.idx := cg$COMPAGNIE.idx + 1;

    :new.CODE_COM := cg$rec.CODE_COM;
    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.CODE_PAILI := cg$rec.CODE_PAILI;
    :new.SIGLE_COM := cg$rec.SIGLE_COM;
    :new.NOM := cg$rec.NOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.TEL := cg$rec.TEL;
    :new.EMAIL := cg$rec.EMAIL;
    :new.LOGO := cg$rec.LOGO;
    :new.NOM_PROJET := cg$rec.NOM_PROJET;
    :new.DESC_PROJET := cg$rec.DESC_PROJET;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_COMPAGNIE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_COMPAGNIE
AFTER INSERT ON COMPAGNIE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_COMPAGNIE
/

PROMPT Creating After Insert Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$AIS_COMPAGNIE
AFTER INSERT ON COMPAGNIE
DECLARE
    idx      BINARY_INTEGER := cg$COMPAGNIE.cg$table.FIRST;
    cg$rec   cg$COMPAGNIE.cg$row_type;
    cg$old_rec   cg$COMPAGNIE.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$COMPAGNIE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_COM := cg$COMPAGNIE.cg$table(idx).CODE_COM;
            cg$rec.ANNEE_PRO := cg$COMPAGNIE.cg$table(idx).ANNEE_PRO;
            cg$rec.NO_ENSEIGNANT := cg$COMPAGNIE.cg$table(idx).NO_ENSEIGNANT;
            cg$rec.CODE_PAILI := cg$COMPAGNIE.cg$table(idx).CODE_PAILI;
            cg$rec.SIGLE_COM := cg$COMPAGNIE.cg$table(idx).SIGLE_COM;
            cg$rec.NOM := cg$COMPAGNIE.cg$table(idx).NOM;
            cg$rec.ADRESSE := cg$COMPAGNIE.cg$table(idx).ADRESSE;
            cg$rec.CP := cg$COMPAGNIE.cg$table(idx).CP;
            cg$rec.VILLE := cg$COMPAGNIE.cg$table(idx).VILLE;
            cg$rec.TEL := cg$COMPAGNIE.cg$table(idx).TEL;
            cg$rec.EMAIL := cg$COMPAGNIE.cg$table(idx).EMAIL;
            cg$rec.LOGO := cg$COMPAGNIE.cg$table(idx).LOGO;
            cg$rec.NOM_PROJET := cg$COMPAGNIE.cg$table(idx).NOM_PROJET;
            cg$rec.DESC_PROJET := cg$COMPAGNIE.cg$table(idx).DESC_PROJET;

            cg$COMPAGNIE.validate_foreign_keys_ins(cg$rec);

            cg$COMPAGNIE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPAGNIE.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$COMPAGNIE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BUS_COMPAGNIE
BEFORE UPDATE ON COMPAGNIE
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$COMPAGNIE.cg$table.DELETE;
    cg$COMPAGNIE.cg$tableind.DELETE;
    cg$COMPAGNIE.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BUR_COMPAGNIE
BEFORE UPDATE ON COMPAGNIE FOR EACH ROW
DECLARE
    cg$rec     cg$COMPAGNIE.cg$row_type;
    cg$ind     cg$COMPAGNIE.cg$ind_type;
    cg$old_rec cg$COMPAGNIE.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM :=    (:new.CODE_COM IS NULL AND :old.CODE_COM IS NOT NULL )
                        OR (:new.CODE_COM IS NOT NULL AND :old.CODE_COM IS NULL)
                        OR NOT(:new.CODE_COM = :old.CODE_COM) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_COM := :old.CODE_COM;
    cg$rec.ANNEE_PRO := :new.ANNEE_PRO;
    cg$ind.ANNEE_PRO :=    (:new.ANNEE_PRO IS NULL AND :old.ANNEE_PRO IS NOT NULL )
                        OR (:new.ANNEE_PRO IS NOT NULL AND :old.ANNEE_PRO IS NULL)
                        OR NOT(:new.ANNEE_PRO = :old.ANNEE_PRO) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ENSEIGNANT := :new.NO_ENSEIGNANT;
    cg$ind.NO_ENSEIGNANT :=    (:new.NO_ENSEIGNANT IS NULL AND :old.NO_ENSEIGNANT IS NOT NULL )
                        OR (:new.NO_ENSEIGNANT IS NOT NULL AND :old.NO_ENSEIGNANT IS NULL)
                        OR NOT(:new.NO_ENSEIGNANT = :old.NO_ENSEIGNANT) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$rec.CODE_PAILI := :new.CODE_PAILI;
    cg$ind.CODE_PAILI :=    (:new.CODE_PAILI IS NULL AND :old.CODE_PAILI IS NOT NULL )
                        OR (:new.CODE_PAILI IS NOT NULL AND :old.CODE_PAILI IS NULL)
                        OR NOT(:new.CODE_PAILI = :old.CODE_PAILI) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_PAILI := :old.CODE_PAILI;
    cg$rec.SIGLE_COM := :new.SIGLE_COM;
    cg$ind.SIGLE_COM :=    (:new.SIGLE_COM IS NULL AND :old.SIGLE_COM IS NOT NULL )
                        OR (:new.SIGLE_COM IS NOT NULL AND :old.SIGLE_COM IS NULL)
                        OR NOT(:new.SIGLE_COM = :old.SIGLE_COM) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).SIGLE_COM := :old.SIGLE_COM;
    cg$rec.NOM := :new.NOM;
    cg$ind.NOM :=    (:new.NOM IS NULL AND :old.NOM IS NOT NULL )
                        OR (:new.NOM IS NOT NULL AND :old.NOM IS NULL)
                        OR NOT(:new.NOM = :old.NOM) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NOM := :old.NOM;
    cg$rec.ADRESSE := :new.ADRESSE;
    cg$ind.ADRESSE :=    (:new.ADRESSE IS NULL AND :old.ADRESSE IS NOT NULL )
                        OR (:new.ADRESSE IS NOT NULL AND :old.ADRESSE IS NULL)
                        OR NOT(:new.ADRESSE = :old.ADRESSE) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).ADRESSE := :old.ADRESSE;
    cg$rec.CP := :new.CP;
    cg$ind.CP :=    (:new.CP IS NULL AND :old.CP IS NOT NULL )
                        OR (:new.CP IS NOT NULL AND :old.CP IS NULL)
                        OR NOT(:new.CP = :old.CP) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CP := :old.CP;
    cg$rec.VILLE := :new.VILLE;
    cg$ind.VILLE :=    (:new.VILLE IS NULL AND :old.VILLE IS NOT NULL )
                        OR (:new.VILLE IS NOT NULL AND :old.VILLE IS NULL)
                        OR NOT(:new.VILLE = :old.VILLE) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).VILLE := :old.VILLE;
    cg$rec.TEL := :new.TEL;
    cg$ind.TEL :=    (:new.TEL IS NULL AND :old.TEL IS NOT NULL )
                        OR (:new.TEL IS NOT NULL AND :old.TEL IS NULL)
                        OR NOT(:new.TEL = :old.TEL) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).TEL := :old.TEL;
    cg$rec.EMAIL := :new.EMAIL;
    cg$ind.EMAIL :=    (:new.EMAIL IS NULL AND :old.EMAIL IS NOT NULL )
                        OR (:new.EMAIL IS NOT NULL AND :old.EMAIL IS NULL)
                        OR NOT(:new.EMAIL = :old.EMAIL) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).EMAIL := :old.EMAIL;
    cg$rec.LOGO := :new.LOGO;
    cg$ind.LOGO :=    (:new.LOGO IS NULL AND :old.LOGO IS NOT NULL )
                        OR (:new.LOGO IS NOT NULL AND :old.LOGO IS NULL)
                        OR NOT(:new.LOGO = :old.LOGO) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).LOGO := :old.LOGO;
    cg$rec.NOM_PROJET := :new.NOM_PROJET;
    cg$ind.NOM_PROJET :=    (:new.NOM_PROJET IS NULL AND :old.NOM_PROJET IS NOT NULL )
                        OR (:new.NOM_PROJET IS NOT NULL AND :old.NOM_PROJET IS NULL)
                        OR NOT(:new.NOM_PROJET = :old.NOM_PROJET) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NOM_PROJET := :old.NOM_PROJET;
    cg$rec.DESC_PROJET := :new.DESC_PROJET;
    cg$ind.DESC_PROJET :=    (:new.DESC_PROJET IS NULL AND :old.DESC_PROJET IS NOT NULL )
                        OR (:new.DESC_PROJET IS NOT NULL AND :old.DESC_PROJET IS NULL)
                        OR NOT(:new.DESC_PROJET = :old.DESC_PROJET) ;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).DESC_PROJET := :old.DESC_PROJET;


    cg$COMPAGNIE.idx := cg$COMPAGNIE.idx + 1;

    if not (cg$COMPAGNIE.called_from_package) then
        cg$COMPAGNIE.validate_arc(cg$rec);
        cg$COMPAGNIE.validate_domain(cg$rec, cg$ind);
        cg$COMPAGNIE.validate_domain_cascade_update(cg$old_rec);   

        cg$COMPAGNIE.upd(cg$rec, cg$ind, FALSE);
        cg$COMPAGNIE.called_from_package := FALSE;
    end if;

    :new.ANNEE_PRO := cg$rec.ANNEE_PRO;
    :new.NO_ENSEIGNANT := cg$rec.NO_ENSEIGNANT;
    :new.CODE_PAILI := cg$rec.CODE_PAILI;
    :new.SIGLE_COM := cg$rec.SIGLE_COM;
    :new.NOM := cg$rec.NOM;
    :new.ADRESSE := cg$rec.ADRESSE;
    :new.CP := cg$rec.CP;
    :new.VILLE := cg$rec.VILLE;
    :new.TEL := cg$rec.TEL;
    :new.EMAIL := cg$rec.EMAIL;
    :new.LOGO := cg$rec.LOGO;
    :new.NOM_PROJET := cg$rec.NOM_PROJET;
    :new.DESC_PROJET := cg$rec.DESC_PROJET;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_COMPAGNIE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_COMPAGNIE
AFTER UPDATE ON COMPAGNIE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_COMPAGNIE
/






PROMPT Creating After Update Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$AUS_COMPAGNIE
AFTER UPDATE ON COMPAGNIE
DECLARE
    idx        BINARY_INTEGER := cg$COMPAGNIE.cg$table.FIRST;
    cg$old_rec cg$COMPAGNIE.cg$row_type;
    cg$rec     cg$COMPAGNIE.cg$row_type;
    cg$ind     cg$COMPAGNIE.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.CODE_COM := cg$COMPAGNIE.cg$table(idx).CODE_COM;
        cg$old_rec.ANNEE_PRO := cg$COMPAGNIE.cg$table(idx).ANNEE_PRO;
        cg$old_rec.NO_ENSEIGNANT := cg$COMPAGNIE.cg$table(idx).NO_ENSEIGNANT;
        cg$old_rec.CODE_PAILI := cg$COMPAGNIE.cg$table(idx).CODE_PAILI;
        cg$old_rec.SIGLE_COM := cg$COMPAGNIE.cg$table(idx).SIGLE_COM;
        cg$old_rec.NOM := cg$COMPAGNIE.cg$table(idx).NOM;
        cg$old_rec.ADRESSE := cg$COMPAGNIE.cg$table(idx).ADRESSE;
        cg$old_rec.CP := cg$COMPAGNIE.cg$table(idx).CP;
        cg$old_rec.VILLE := cg$COMPAGNIE.cg$table(idx).VILLE;
        cg$old_rec.TEL := cg$COMPAGNIE.cg$table(idx).TEL;
        cg$old_rec.EMAIL := cg$COMPAGNIE.cg$table(idx).EMAIL;
        cg$old_rec.LOGO := cg$COMPAGNIE.cg$table(idx).LOGO;
        cg$old_rec.NOM_PROJET := cg$COMPAGNIE.cg$table(idx).NOM_PROJET;
        cg$old_rec.DESC_PROJET := cg$COMPAGNIE.cg$table(idx).DESC_PROJET;

    IF NOT (cg$COMPAGNIE.called_from_package) THEN
        idx := cg$COMPAGNIE.cg$table.NEXT(idx);
        cg$rec.CODE_COM := cg$COMPAGNIE.cg$table(idx).CODE_COM;
        cg$ind.CODE_COM := updating('CODE_COM');
        cg$rec.ANNEE_PRO := cg$COMPAGNIE.cg$table(idx).ANNEE_PRO;
        cg$ind.ANNEE_PRO := updating('ANNEE_PRO');
        cg$rec.NO_ENSEIGNANT := cg$COMPAGNIE.cg$table(idx).NO_ENSEIGNANT;
        cg$ind.NO_ENSEIGNANT := updating('NO_ENSEIGNANT');
        cg$rec.CODE_PAILI := cg$COMPAGNIE.cg$table(idx).CODE_PAILI;
        cg$ind.CODE_PAILI := updating('CODE_PAILI');
        cg$rec.SIGLE_COM := cg$COMPAGNIE.cg$table(idx).SIGLE_COM;
        cg$ind.SIGLE_COM := updating('SIGLE_COM');
        cg$rec.NOM := cg$COMPAGNIE.cg$table(idx).NOM;
        cg$ind.NOM := updating('NOM');
        cg$rec.ADRESSE := cg$COMPAGNIE.cg$table(idx).ADRESSE;
        cg$ind.ADRESSE := updating('ADRESSE');
        cg$rec.CP := cg$COMPAGNIE.cg$table(idx).CP;
        cg$ind.CP := updating('CP');
        cg$rec.VILLE := cg$COMPAGNIE.cg$table(idx).VILLE;
        cg$ind.VILLE := updating('VILLE');
        cg$rec.TEL := cg$COMPAGNIE.cg$table(idx).TEL;
        cg$ind.TEL := updating('TEL');
        cg$rec.EMAIL := cg$COMPAGNIE.cg$table(idx).EMAIL;
        cg$ind.EMAIL := updating('EMAIL');
        cg$rec.LOGO := cg$COMPAGNIE.cg$table(idx).LOGO;
        cg$ind.LOGO := updating('LOGO');
        cg$rec.NOM_PROJET := cg$COMPAGNIE.cg$table(idx).NOM_PROJET;
        cg$ind.NOM_PROJET := updating('NOM_PROJET');
        cg$rec.DESC_PROJET := cg$COMPAGNIE.cg$table(idx).DESC_PROJET;
        cg$ind.DESC_PROJET := updating('DESC_PROJET');

        cg$COMPAGNIE.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$COMPAGNIE.upd_denorm2( cg$rec,
                                       cg$COMPAGNIE.cg$tableind(idx)
                                     );
        cg$COMPAGNIE.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$COMPAGNIE.cg$tableind(idx)
								                  );
        cg$COMPAGNIE.cascade_update(cg$rec, cg$old_rec);
        cg$COMPAGNIE.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$COMPAGNIE.called_from_package := FALSE;
	END IF;
        idx := cg$COMPAGNIE.cg$table.NEXT(idx);
    END LOOP;

    cg$COMPAGNIE.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BDS_COMPAGNIE
BEFORE DELETE ON COMPAGNIE
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$COMPAGNIE.cg$table.DELETE;
    cg$COMPAGNIE.cg$tableind.DELETE;
    cg$COMPAGNIE.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$BDR_COMPAGNIE
BEFORE DELETE ON COMPAGNIE FOR EACH ROW
DECLARE
    cg$pk cg$COMPAGNIE.cg$pk_type;
    cg$rec cg$COMPAGNIE.cg$row_type;
    cg$ind cg$COMPAGNIE.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.CODE_COM  := :old.CODE_COM;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_COM := :old.CODE_COM;
    cg$rec.CODE_PAILI := :old.CODE_PAILI;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).CODE_PAILI := :old.CODE_PAILI;
    cg$rec.ANNEE_PRO := :old.ANNEE_PRO;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).ANNEE_PRO := :old.ANNEE_PRO;
    cg$rec.NO_ENSEIGNANT := :old.NO_ENSEIGNANT;
    cg$COMPAGNIE.cg$table(cg$COMPAGNIE.idx).NO_ENSEIGNANT := :old.NO_ENSEIGNANT;


    cg$COMPAGNIE.idx := cg$COMPAGNIE.idx + 1;

    if not (cg$COMPAGNIE.called_from_package) then
        cg$COMPAGNIE.validate_domain_cascade_delete(cg$rec);   
        cg$COMPAGNIE.del(cg$pk, FALSE);
        cg$COMPAGNIE.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_COMPAGNIE, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_COMPAGNIE
AFTER DELETE ON COMPAGNIE FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_COMPAGNIE
/

PROMPT Creating After Delete Statement Trigger on 'COMPAGNIE'
CREATE OR REPLACE TRIGGER cg$ADS_COMPAGNIE
AFTER DELETE ON COMPAGNIE
DECLARE
    idx        BINARY_INTEGER := cg$COMPAGNIE.cg$table.FIRST;
    cg$rec   cg$COMPAGNIE.cg$row_type;
    cg$old_rec   cg$COMPAGNIE.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$COMPAGNIE.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.CODE_COM := cg$COMPAGNIE.cg$table(idx).CODE_COM;
            cg$COMPAGNIE.cg$tableind(idx).CODE_COM := TRUE;
            cg$rec.ANNEE_PRO := cg$COMPAGNIE.cg$table(idx).ANNEE_PRO;
            cg$COMPAGNIE.cg$tableind(idx).ANNEE_PRO := TRUE;
            cg$rec.NO_ENSEIGNANT := cg$COMPAGNIE.cg$table(idx).NO_ENSEIGNANT;
            cg$COMPAGNIE.cg$tableind(idx).NO_ENSEIGNANT := TRUE;
            cg$rec.CODE_PAILI := cg$COMPAGNIE.cg$table(idx).CODE_PAILI;
            cg$COMPAGNIE.cg$tableind(idx).CODE_PAILI := TRUE;
            cg$rec.SIGLE_COM := cg$COMPAGNIE.cg$table(idx).SIGLE_COM;
            cg$COMPAGNIE.cg$tableind(idx).SIGLE_COM := TRUE;
            cg$rec.NOM := cg$COMPAGNIE.cg$table(idx).NOM;
            cg$COMPAGNIE.cg$tableind(idx).NOM := TRUE;
            cg$rec.ADRESSE := cg$COMPAGNIE.cg$table(idx).ADRESSE;
            cg$COMPAGNIE.cg$tableind(idx).ADRESSE := TRUE;
            cg$rec.CP := cg$COMPAGNIE.cg$table(idx).CP;
            cg$COMPAGNIE.cg$tableind(idx).CP := TRUE;
            cg$rec.VILLE := cg$COMPAGNIE.cg$table(idx).VILLE;
            cg$COMPAGNIE.cg$tableind(idx).VILLE := TRUE;
            cg$rec.TEL := cg$COMPAGNIE.cg$table(idx).TEL;
            cg$COMPAGNIE.cg$tableind(idx).TEL := TRUE;
            cg$rec.EMAIL := cg$COMPAGNIE.cg$table(idx).EMAIL;
            cg$COMPAGNIE.cg$tableind(idx).EMAIL := TRUE;
            cg$rec.LOGO := cg$COMPAGNIE.cg$table(idx).LOGO;
            cg$COMPAGNIE.cg$tableind(idx).LOGO := TRUE;
            cg$rec.NOM_PROJET := cg$COMPAGNIE.cg$table(idx).NOM_PROJET;
            cg$COMPAGNIE.cg$tableind(idx).NOM_PROJET := TRUE;
            cg$rec.DESC_PROJET := cg$COMPAGNIE.cg$table(idx).DESC_PROJET;
            cg$COMPAGNIE.cg$tableind(idx).DESC_PROJET := TRUE;

            cg$COMPAGNIE.validate_foreign_keys_del(cg$rec);
            cg$COMPAGNIE.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPAGNIE.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$COMPAGNIE.cascade_delete(cg$rec);
            cg$COMPAGNIE.domain_cascade_delete(cg$rec);             

            idx := cg$COMPAGNIE.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



