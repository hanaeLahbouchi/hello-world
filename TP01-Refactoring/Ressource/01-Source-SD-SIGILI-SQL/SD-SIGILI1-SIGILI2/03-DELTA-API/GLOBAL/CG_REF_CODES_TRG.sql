create or replace TRIGGER CG$AUR_CG_REF_CODES AFTER UPDATE ON CG_REF_CODES 
FOR EACH ROW 
BEGIN
  IF (:NEW.RV_DOMAIN = 'TYPE_AUTHENTIFICATION') THEN
    UPDATE DOMAINE SET code_valeur = :new.rv_low_value, DESIGNATION = :new.rv_meaning
    WHERE SIGLE_DOMAINE = 'TYPE_AUTH' AND code_valeur = :old.rv_low_value;
  ELSE
    IF (:NEW.RV_DOMAIN = 'PROCESSUS_STAGE') THEN
      UPDATE DOMAINE SET code_valeur = :new.rv_low_value, DESIGNATION = :new.rv_meaning
      WHERE SIGLE_DOMAINE = 'PROC_STAGE' AND code_valeur = :old.rv_low_value;
    END IF;
  END IF;
END;
/

create or replace TRIGGER CG$AIR_CG_REF_CODES AFTER INSERT ON CG_REF_CODES 
FOR EACH ROW 
BEGIN
  IF (:NEW.RV_DOMAIN = 'TYPE_AUTHENTIFICATION') THEN
    INSERT INTO DOMAINE(CODE_VALEUR, SIGLE_DOMAINE, DESIGNATION) VALUES(:new.rv_low_value,'TYPE_AUTH' ,:new.rv_meaning);
  ELSE
    IF (:NEW.RV_DOMAIN = 'PROCESSUS_STAGE') THEN
      INSERT INTO DOMAINE(CODE_VALEUR, SIGLE_DOMAINE, DESIGNATION) VALUES(:new.rv_low_value,'PROC_STAGE' ,:new.rv_meaning);
    END IF;
  END IF;
END;
/

create or replace TRIGGER cg$ADR_CG_REF_CODES
AFTER DELETE ON CG_REF_CODES FOR EACH ROW 
BEGIN
  IF (:OLD.RV_DOMAIN = 'TYPE_AUTHENTIFICATION') THEN
    DELETE DOMAINE WHERE SIGLE_DOMAINE = 'TYPE_AUTH' AND code_valeur = :old.rv_low_value;
  ELSE
    IF (:OLD.RV_DOMAIN = 'PROCESSUS_STAGE') THEN
      DELETE DOMAINE WHERE SIGLE_DOMAINE = 'PROC_STAGE' AND code_valeur = :old.rv_low_value;
    END IF;
  END IF;
END;
/

commit;