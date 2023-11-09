create or replace TRIGGER CG$AUR_NOTE_ENTREPRISE AFTER UPDATE ON NOTE_ENTREPRISE
FOR EACH ROW
DECLARE
  NEWVALUE NUMBER;
  OLDVALUE NUMBER;
  WEIGHT CRITERE_ENTREPRISE.poids%type;
  MARK STAGE.note_entreprise%type;
  
BEGIN
  IF (:new.codn_id != :old.codn_id) THEN
    SELECT note_entreprise INTO MARK FROM STAGE WHERE no_etudiant_nat = :old.no_etudiant_nat;
    SELECT poids INTO WEIGHT FROM CRITERE_ENTREPRISE WHERE crite_id = :old.crite_id;
    SELECT valeur_note INTO NEWVALUE FROM CODE_NOTATION WHERE codn_id = :new.codn_id;
    IF (LENGTH(MARK) <> 0) THEN
      SELECT valeur_note INTO OLDVALUE FROM CODE_NOTATION WHERE codn_id = :old.codn_id;
      MARK := MARK - (OLDVALUE * WEIGHT / 100);
      MARK := MARK + (NEWVALUE * WEIGHT / 100);
      UPDATE STAGE SET note_entreprise = MARK WHERE no_etudiant_nat = :old.no_etudiant_nat;
      UPDATE EVALUATION_ENTREPRISE SET date_maj = SYSDATE WHERE no_etudiant_nat = :old.no_etudiant_nat;
    ELSE
      MARK := NEWVALUE * WEIGHT / 100;
      UPDATE STAGE SET note_entreprise = MARK WHERE no_etudiant_nat = :old.no_etudiant_nat;
      UPDATE EVALUATION_ENTREPRISE SET date_maj = SYSDATE WHERE no_etudiant_nat = :old.no_etudiant_nat;
    END IF;
  END IF;
END;
/