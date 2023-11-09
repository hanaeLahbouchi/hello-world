create or replace function get_AuthorisationCreerRic (numetud varchar2, id_dric varchar2)
RETURN NUMBER IS

 return_value NUMBER := 0;

BEGIN
 select count(*) into return_value from RECUEIL_INDIVIDUEL_COMPETENCE ric, SUIVI_PERSONNEL_COMPETENCE spc
 where ric.ID_SPC = spc.ID_SPC
 and ric.NO_DEMANDE_RIC = id_dric
 and spc.NO_ETUDIANT_NAT = numetud;

 return return_value;
END;
/