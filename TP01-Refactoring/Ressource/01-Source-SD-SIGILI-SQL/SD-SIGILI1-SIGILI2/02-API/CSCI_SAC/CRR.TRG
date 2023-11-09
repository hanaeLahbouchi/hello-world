
PROMPT Creating Trigger Logic for Table 'COMPTE_RENDU_REUNION'
PROMPT Creating Before Insert Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BIS_COMPTE_RENDU_REUNION
BEFORE INSERT ON COMPTE_RENDU_REUNION
BEGIN
--  Application_logic Pre-Before-Insert-statement <<Start>>
--  Application_logic Pre-Before-Insert-statement << End >>

    cg$COMPTE_RENDU_REUNION.cg$table.DELETE;
    cg$COMPTE_RENDU_REUNION.cg$tableind.DELETE;
    cg$COMPTE_RENDU_REUNION.idx := 1;

--  Application_logic Post-Before-Insert-statement <<Start>>
--  Application_logic Post-Before-Insert-statement << End >>
END;
/
  

PROMPT Creating Before Insert Row Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BIR_COMPTE_RENDU_REUNION
BEFORE INSERT ON COMPTE_RENDU_REUNION FOR EACH ROW
DECLARE
    cg$rec cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$ind cg$COMPTE_RENDU_REUNION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Insert-row <<Start>>
--  Application_logic Pre-Before-Insert-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR := TRUE;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM := TRUE;
    cg$rec.REUNION_NO := :new.REUNION_NO;
    cg$ind.REUNION_NO := TRUE;
    cg$rec.DATE_REUNION := :new.DATE_REUNION;
    cg$ind.DATE_REUNION := TRUE;
    cg$rec.OFFICIEL := :new.OFFICIEL;
    cg$ind.OFFICIEL := TRUE;
    cg$rec.LIBELLE := :new.LIBELLE;
    cg$ind.LIBELLE := TRUE;
    cg$rec.ETAT_AVANCEMENT := :new.ETAT_AVANCEMENT;
    cg$ind.ETAT_AVANCEMENT := TRUE;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE := TRUE;

    if not (cg$COMPTE_RENDU_REUNION.called_from_package) then
        cg$COMPTE_RENDU_REUNION.validate_arc(cg$rec);
        cg$COMPTE_RENDU_REUNION.validate_domain(cg$rec);

        cg$COMPTE_RENDU_REUNION.ins(cg$rec, cg$ind, FALSE);
        cg$COMPTE_RENDU_REUNION.called_from_package := FALSE;
    end if;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).NO_CRR := cg$rec.NO_CRR;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).NO_CRR := cg$ind.NO_CRR;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).CODE_COM := cg$rec.CODE_COM;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).CODE_COM := cg$ind.CODE_COM;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).REUNION_NO := cg$rec.REUNION_NO;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).REUNION_NO := cg$ind.REUNION_NO;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).DATE_REUNION := cg$rec.DATE_REUNION;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).DATE_REUNION := cg$ind.DATE_REUNION;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).OFFICIEL := cg$rec.OFFICIEL;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).OFFICIEL := cg$ind.OFFICIEL;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).LIBELLE := cg$rec.LIBELLE;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).LIBELLE := cg$ind.LIBELLE;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).ETAT_AVANCEMENT := cg$rec.ETAT_AVANCEMENT;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).ETAT_AVANCEMENT := cg$ind.ETAT_AVANCEMENT;

    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).COMMENTAIRE := cg$rec.COMMENTAIRE;
    cg$COMPTE_RENDU_REUNION.cg$tableind(cg$COMPTE_RENDU_REUNION.idx).COMMENTAIRE := cg$ind.COMMENTAIRE;

    cg$COMPTE_RENDU_REUNION.idx := cg$COMPTE_RENDU_REUNION.idx + 1;

    :new.NO_CRR := cg$rec.NO_CRR;
    :new.CODE_COM := cg$rec.CODE_COM;
    :new.REUNION_NO := cg$rec.REUNION_NO;
    :new.DATE_REUNION := cg$rec.DATE_REUNION;
    :new.OFFICIEL := cg$rec.OFFICIEL;
    :new.LIBELLE := cg$rec.LIBELLE;
    :new.ETAT_AVANCEMENT := cg$rec.ETAT_AVANCEMENT;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;

--  Application_logic Post-Before-Insert-row <<Start>>
--  Application_logic Post-Before-Insert-row << End >>
END;
/


-- No application logic defined for Trigger cg$AIR_COMPTE_RENDU_REUNION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AIR_COMPTE_RENDU_REUNION
AFTER INSERT ON COMPTE_RENDU_REUNION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AIR_COMPTE_RENDU_REUNION
/

PROMPT Creating After Insert Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$AIS_COMPTE_RENDU_REUNION
AFTER INSERT ON COMPTE_RENDU_REUNION
DECLARE
    idx      BINARY_INTEGER := cg$COMPTE_RENDU_REUNION.cg$table.FIRST;
    cg$rec   cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$old_rec   cg$COMPTE_RENDU_REUNION.cg$row_type;
    fk_check INTEGER;
BEGIN
--  Application_logic Pre-After-Insert-statement <<Start>>
--  Application_logic Pre-After-Insert-statement << End >>


    IF NOT (cg$COMPTE_RENDU_REUNION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_CRR := cg$COMPTE_RENDU_REUNION.cg$table(idx).NO_CRR;
            cg$rec.CODE_COM := cg$COMPTE_RENDU_REUNION.cg$table(idx).CODE_COM;
            cg$rec.REUNION_NO := cg$COMPTE_RENDU_REUNION.cg$table(idx).REUNION_NO;
            cg$rec.DATE_REUNION := cg$COMPTE_RENDU_REUNION.cg$table(idx).DATE_REUNION;
            cg$rec.OFFICIEL := cg$COMPTE_RENDU_REUNION.cg$table(idx).OFFICIEL;
            cg$rec.LIBELLE := cg$COMPTE_RENDU_REUNION.cg$table(idx).LIBELLE;
            cg$rec.ETAT_AVANCEMENT := cg$COMPTE_RENDU_REUNION.cg$table(idx).ETAT_AVANCEMENT;
            cg$rec.COMMENTAIRE := cg$COMPTE_RENDU_REUNION.cg$table(idx).COMMENTAIRE;

            cg$COMPTE_RENDU_REUNION.validate_foreign_keys_ins(cg$rec);

            cg$COMPTE_RENDU_REUNION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPTE_RENDU_REUNION.cg$tableind(idx),
                                                'INS'
                                              );
	
            idx := cg$COMPTE_RENDU_REUNION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Insert-statement <<Start>>
--  Application_logic Post-After-Insert-statement << End >>

END;
/


    

PROMPT Creating Before Update Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BUS_COMPTE_RENDU_REUNION
BEFORE UPDATE ON COMPTE_RENDU_REUNION
BEGIN
--  Application_logic Pre-Before-Update-statement <<Start>>
--  Application_logic Pre-Before-Update-statement << End >>

    cg$COMPTE_RENDU_REUNION.cg$table.DELETE;
    cg$COMPTE_RENDU_REUNION.cg$tableind.DELETE;
    cg$COMPTE_RENDU_REUNION.idx := 1;

--  Application_logic Post-Before-Update-statement <<Start>>
--  Application_logic Post-Before-Update-statement << End >>

END;
/
  

PROMPT Creating Before Update Row Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BUR_COMPTE_RENDU_REUNION
BEFORE UPDATE ON COMPTE_RENDU_REUNION FOR EACH ROW
DECLARE
    cg$rec     cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$ind     cg$COMPTE_RENDU_REUNION.cg$ind_type;
    cg$old_rec cg$COMPTE_RENDU_REUNION.cg$row_type;  
BEGIN
--  Application_logic Pre-Before-Update-row <<Start>>
--  Application_logic Pre-Before-Update-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$rec.NO_CRR := :new.NO_CRR;
    cg$ind.NO_CRR :=    (:new.NO_CRR IS NULL AND :old.NO_CRR IS NOT NULL )
                        OR (:new.NO_CRR IS NOT NULL AND :old.NO_CRR IS NULL)
                        OR NOT(:new.NO_CRR = :old.NO_CRR) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).NO_CRR := :old.NO_CRR;
    cg$rec.CODE_COM := :new.CODE_COM;
    cg$ind.CODE_COM :=    (:new.CODE_COM IS NULL AND :old.CODE_COM IS NOT NULL )
                        OR (:new.CODE_COM IS NOT NULL AND :old.CODE_COM IS NULL)
                        OR NOT(:new.CODE_COM = :old.CODE_COM) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).CODE_COM := :old.CODE_COM;
    cg$rec.REUNION_NO := :new.REUNION_NO;
    cg$ind.REUNION_NO :=    (:new.REUNION_NO IS NULL AND :old.REUNION_NO IS NOT NULL )
                        OR (:new.REUNION_NO IS NOT NULL AND :old.REUNION_NO IS NULL)
                        OR NOT(:new.REUNION_NO = :old.REUNION_NO) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).REUNION_NO := :old.REUNION_NO;
    cg$rec.DATE_REUNION := :new.DATE_REUNION;
    cg$ind.DATE_REUNION :=    (:new.DATE_REUNION IS NULL AND :old.DATE_REUNION IS NOT NULL )
                        OR (:new.DATE_REUNION IS NOT NULL AND :old.DATE_REUNION IS NULL)
                        OR NOT(:new.DATE_REUNION = :old.DATE_REUNION) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).DATE_REUNION := :old.DATE_REUNION;
    cg$rec.OFFICIEL := :new.OFFICIEL;
    cg$ind.OFFICIEL :=    (:new.OFFICIEL IS NULL AND :old.OFFICIEL IS NOT NULL )
                        OR (:new.OFFICIEL IS NOT NULL AND :old.OFFICIEL IS NULL)
                        OR NOT(:new.OFFICIEL = :old.OFFICIEL) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).OFFICIEL := :old.OFFICIEL;
    cg$rec.LIBELLE := :new.LIBELLE;
    cg$ind.LIBELLE :=    (:new.LIBELLE IS NULL AND :old.LIBELLE IS NOT NULL )
                        OR (:new.LIBELLE IS NOT NULL AND :old.LIBELLE IS NULL)
                        OR NOT(:new.LIBELLE = :old.LIBELLE) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).LIBELLE := :old.LIBELLE;
    cg$rec.ETAT_AVANCEMENT := :new.ETAT_AVANCEMENT;
    cg$ind.ETAT_AVANCEMENT :=    (:new.ETAT_AVANCEMENT IS NULL AND :old.ETAT_AVANCEMENT IS NOT NULL )
                        OR (:new.ETAT_AVANCEMENT IS NOT NULL AND :old.ETAT_AVANCEMENT IS NULL)
                        OR NOT(:new.ETAT_AVANCEMENT = :old.ETAT_AVANCEMENT) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).ETAT_AVANCEMENT := :old.ETAT_AVANCEMENT;
    cg$rec.COMMENTAIRE := :new.COMMENTAIRE;
    cg$ind.COMMENTAIRE :=    (:new.COMMENTAIRE IS NULL AND :old.COMMENTAIRE IS NOT NULL )
                        OR (:new.COMMENTAIRE IS NOT NULL AND :old.COMMENTAIRE IS NULL)
                        OR NOT(:new.COMMENTAIRE = :old.COMMENTAIRE) ;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).COMMENTAIRE := :old.COMMENTAIRE;


    cg$COMPTE_RENDU_REUNION.idx := cg$COMPTE_RENDU_REUNION.idx + 1;

    if not (cg$COMPTE_RENDU_REUNION.called_from_package) then
        cg$COMPTE_RENDU_REUNION.validate_arc(cg$rec);
        cg$COMPTE_RENDU_REUNION.validate_domain(cg$rec, cg$ind);
        cg$COMPTE_RENDU_REUNION.validate_domain_cascade_update(cg$old_rec);   

        cg$COMPTE_RENDU_REUNION.upd(cg$rec, cg$ind, FALSE);
        cg$COMPTE_RENDU_REUNION.called_from_package := FALSE;
    end if;

    :new.CODE_COM := cg$rec.CODE_COM;
    :new.REUNION_NO := cg$rec.REUNION_NO;
    :new.DATE_REUNION := cg$rec.DATE_REUNION;
    :new.OFFICIEL := cg$rec.OFFICIEL;
    :new.LIBELLE := cg$rec.LIBELLE;
    :new.ETAT_AVANCEMENT := cg$rec.ETAT_AVANCEMENT;
    :new.COMMENTAIRE := cg$rec.COMMENTAIRE;
--  Application_logic Post-Before-Update-row <<Start>>
--  Application_logic Post-Before-Update-row << End >>
END;
/

-- No application logic defined for Trigger cg$AUR_COMPTE_RENDU_REUNION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$AUR_COMPTE_RENDU_REUNION
AFTER UPDATE ON COMPTE_RENDU_REUNION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$AUR_COMPTE_RENDU_REUNION
/






PROMPT Creating After Update Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$AUS_COMPTE_RENDU_REUNION
AFTER UPDATE ON COMPTE_RENDU_REUNION
DECLARE
    idx        BINARY_INTEGER := cg$COMPTE_RENDU_REUNION.cg$table.FIRST;
    cg$old_rec cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$rec     cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$ind     cg$COMPTE_RENDU_REUNION.cg$ind_type;
BEGIN
--  Application_logic Pre-After-Update-statement <<Start>>
--  Application_logic Pre-After-Update-statement << End >>

    WHILE idx IS NOT NULL LOOP
        cg$old_rec.NO_CRR := cg$COMPTE_RENDU_REUNION.cg$table(idx).NO_CRR;
        cg$old_rec.CODE_COM := cg$COMPTE_RENDU_REUNION.cg$table(idx).CODE_COM;
        cg$old_rec.REUNION_NO := cg$COMPTE_RENDU_REUNION.cg$table(idx).REUNION_NO;
        cg$old_rec.DATE_REUNION := cg$COMPTE_RENDU_REUNION.cg$table(idx).DATE_REUNION;
        cg$old_rec.OFFICIEL := cg$COMPTE_RENDU_REUNION.cg$table(idx).OFFICIEL;
        cg$old_rec.LIBELLE := cg$COMPTE_RENDU_REUNION.cg$table(idx).LIBELLE;
        cg$old_rec.ETAT_AVANCEMENT := cg$COMPTE_RENDU_REUNION.cg$table(idx).ETAT_AVANCEMENT;
        cg$old_rec.COMMENTAIRE := cg$COMPTE_RENDU_REUNION.cg$table(idx).COMMENTAIRE;

    IF NOT (cg$COMPTE_RENDU_REUNION.called_from_package) THEN
        idx := cg$COMPTE_RENDU_REUNION.cg$table.NEXT(idx);
        cg$rec.NO_CRR := cg$COMPTE_RENDU_REUNION.cg$table(idx).NO_CRR;
        cg$ind.NO_CRR := updating('NO_CRR');
        cg$rec.CODE_COM := cg$COMPTE_RENDU_REUNION.cg$table(idx).CODE_COM;
        cg$ind.CODE_COM := updating('CODE_COM');
        cg$rec.REUNION_NO := cg$COMPTE_RENDU_REUNION.cg$table(idx).REUNION_NO;
        cg$ind.REUNION_NO := updating('REUNION_NO');
        cg$rec.DATE_REUNION := cg$COMPTE_RENDU_REUNION.cg$table(idx).DATE_REUNION;
        cg$ind.DATE_REUNION := updating('DATE_REUNION');
        cg$rec.OFFICIEL := cg$COMPTE_RENDU_REUNION.cg$table(idx).OFFICIEL;
        cg$ind.OFFICIEL := updating('OFFICIEL');
        cg$rec.LIBELLE := cg$COMPTE_RENDU_REUNION.cg$table(idx).LIBELLE;
        cg$ind.LIBELLE := updating('LIBELLE');
        cg$rec.ETAT_AVANCEMENT := cg$COMPTE_RENDU_REUNION.cg$table(idx).ETAT_AVANCEMENT;
        cg$ind.ETAT_AVANCEMENT := updating('ETAT_AVANCEMENT');
        cg$rec.COMMENTAIRE := cg$COMPTE_RENDU_REUNION.cg$table(idx).COMMENTAIRE;
        cg$ind.COMMENTAIRE := updating('COMMENTAIRE');

        cg$COMPTE_RENDU_REUNION.validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);

        cg$COMPTE_RENDU_REUNION.upd_denorm2( cg$rec,
                                       cg$COMPTE_RENDU_REUNION.cg$tableind(idx)
                                     );
        cg$COMPTE_RENDU_REUNION.upd_oper_denorm2( cg$rec,
                                            cg$old_rec,
                                            cg$COMPTE_RENDU_REUNION.cg$tableind(idx)
								                  );
        cg$COMPTE_RENDU_REUNION.cascade_update(cg$rec, cg$old_rec);
        cg$COMPTE_RENDU_REUNION.domain_cascade_update(cg$rec, cg$ind, cg$old_rec);             

		cg$COMPTE_RENDU_REUNION.called_from_package := FALSE;
	END IF;
        idx := cg$COMPTE_RENDU_REUNION.cg$table.NEXT(idx);
    END LOOP;

    cg$COMPTE_RENDU_REUNION.cg$table.DELETE;

--  Application_logic Post-After-Update-statement <<Start>>
--  Application_logic Post-After-Update-statement << End >>

END;
/

PROMPT Creating Before Delete Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BDS_COMPTE_RENDU_REUNION
BEFORE DELETE ON COMPTE_RENDU_REUNION
BEGIN
--  Application_logic Pre-Before-Delete-statement <<Start>>
--  Application_logic Pre-Before-Delete-statement << End >>

    cg$COMPTE_RENDU_REUNION.cg$table.DELETE;
    cg$COMPTE_RENDU_REUNION.cg$tableind.DELETE;
    cg$COMPTE_RENDU_REUNION.idx := 1;

--  Application_logic Post-Before-Delete-statement <<Start>>
--  Application_logic Post-Before-Delete-statement << End >>
END;
/
  

PROMPT Creating Before Delete Row Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$BDR_COMPTE_RENDU_REUNION
BEFORE DELETE ON COMPTE_RENDU_REUNION FOR EACH ROW
DECLARE
    cg$pk cg$COMPTE_RENDU_REUNION.cg$pk_type;
    cg$rec cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$ind cg$COMPTE_RENDU_REUNION.cg$ind_type;
BEGIN
--  Application_logic Pre-Before-Delete-row <<Start>>
--  Application_logic Pre-Before-Delete-row << End >>

--  Load cg$rec/cg$ind values from new

    cg$pk.NO_CRR  := :old.NO_CRR;
    cg$rec.NO_CRR := :old.NO_CRR;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).NO_CRR := :old.NO_CRR;
    cg$rec.CODE_COM := :old.CODE_COM;
    cg$COMPTE_RENDU_REUNION.cg$table(cg$COMPTE_RENDU_REUNION.idx).CODE_COM := :old.CODE_COM;


    cg$COMPTE_RENDU_REUNION.idx := cg$COMPTE_RENDU_REUNION.idx + 1;

    if not (cg$COMPTE_RENDU_REUNION.called_from_package) then
        cg$COMPTE_RENDU_REUNION.validate_domain_cascade_delete(cg$rec);   
        cg$COMPTE_RENDU_REUNION.del(cg$pk, FALSE);
        cg$COMPTE_RENDU_REUNION.called_from_package := FALSE;
    end if;

--  Application_logic Post-Before-Delete-row <<Start>>
--  Application_logic Post-Before-Delete-row << End >>
END;
/

-- No application logic defined for Trigger cg$ADR_COMPTE_RENDU_REUNION, so drop it.
-- To avoid an error if there isn't one, create or replace it, and then drop it
CREATE OR REPLACE TRIGGER cg$ADR_COMPTE_RENDU_REUNION
AFTER DELETE ON COMPTE_RENDU_REUNION FOR EACH ROW
BEGIN
 null;
END;
/
drop trigger cg$ADR_COMPTE_RENDU_REUNION
/

PROMPT Creating After Delete Statement Trigger on 'COMPTE_RENDU_REUNION'
CREATE OR REPLACE TRIGGER cg$ADS_COMPTE_RENDU_REUNION
AFTER DELETE ON COMPTE_RENDU_REUNION
DECLARE
    idx        BINARY_INTEGER := cg$COMPTE_RENDU_REUNION.cg$table.FIRST;
    cg$rec   cg$COMPTE_RENDU_REUNION.cg$row_type;
    cg$old_rec   cg$COMPTE_RENDU_REUNION.cg$row_type;
BEGIN
--  Application_logic Pre-After-Delete-statement <<Start>>
--  Application_logic Pre-After-Delete-statement << End >>

    IF NOT (cg$COMPTE_RENDU_REUNION.called_from_package) THEN
        WHILE idx IS NOT NULL LOOP
            cg$rec.NO_CRR := cg$COMPTE_RENDU_REUNION.cg$table(idx).NO_CRR;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).NO_CRR := TRUE;
            cg$rec.CODE_COM := cg$COMPTE_RENDU_REUNION.cg$table(idx).CODE_COM;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).CODE_COM := TRUE;
            cg$rec.REUNION_NO := cg$COMPTE_RENDU_REUNION.cg$table(idx).REUNION_NO;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).REUNION_NO := TRUE;
            cg$rec.DATE_REUNION := cg$COMPTE_RENDU_REUNION.cg$table(idx).DATE_REUNION;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).DATE_REUNION := TRUE;
            cg$rec.OFFICIEL := cg$COMPTE_RENDU_REUNION.cg$table(idx).OFFICIEL;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).OFFICIEL := TRUE;
            cg$rec.LIBELLE := cg$COMPTE_RENDU_REUNION.cg$table(idx).LIBELLE;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).LIBELLE := TRUE;
            cg$rec.ETAT_AVANCEMENT := cg$COMPTE_RENDU_REUNION.cg$table(idx).ETAT_AVANCEMENT;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).ETAT_AVANCEMENT := TRUE;
            cg$rec.COMMENTAIRE := cg$COMPTE_RENDU_REUNION.cg$table(idx).COMMENTAIRE;
            cg$COMPTE_RENDU_REUNION.cg$tableind(idx).COMMENTAIRE := TRUE;

            cg$COMPTE_RENDU_REUNION.validate_foreign_keys_del(cg$rec);
            cg$COMPTE_RENDU_REUNION.upd_oper_denorm2( cg$rec,
                                                cg$old_rec,
                                                cg$COMPTE_RENDU_REUNION.cg$tableind(idx),
                                                'DEL'
                                              );
	
            cg$COMPTE_RENDU_REUNION.cascade_delete(cg$rec);
            cg$COMPTE_RENDU_REUNION.domain_cascade_delete(cg$rec);             

            idx := cg$COMPTE_RENDU_REUNION.cg$table.NEXT(idx);
        END LOOP;
    END IF;

--  Application_logic Post-After-Delete-statement <<Start>>
--  Application_logic Post-After-Delete-statement << End >>

END;
/



