create or replace PROCEDURE creer_spc (numero_etudiant VARCHAR2) AS
  cursor resultat is  select id_spc
                      from suivi_personnel_competence
                      where no_etudiant_nat=numero_etudiant;
        tmp resultat%ROWTYPE;

  TMP_CODE_MCP VARCHAR2(8);
  TMP_ID_SPC NUMBER(10);

BEGIN
  open resultat;
  loop
      fetch resultat into tmp;
      EXIT WHEN resultat%NOTFOUND;

      update SUIVI_PERSONNEL_COMPETENCE set date_fin=sysdate where id_spc=tmp.id_spc;

  end loop;
  close resultat;

  SELECT CODE_MCP INTO TMP_CODE_MCP FROM MODELE_COMPETENCE WHERE MODELE_COMPETENCE.EN_VIGUEUR = 'O';

  INSERT INTO SUIVI_PERSONNEL_COMPETENCE(CODE_MCP, NO_ETUDIANT_NAT, DATE_DEBUT)
  VALUES (TMP_CODE_MCP, numero_etudiant ,SYSDATE);

  SELECT SEQ_SPC.currval INTO TMP_ID_SPC FROM DUAL;

  CREER_SPC_POS_CPTT(TMP_CODE_MCP, TMP_ID_SPC);
  CREER_SPC_POS_CPT(TMP_CODE_MCP, TMP_ID_SPC);
  CREER_SPC_POS_CAP(TMP_CODE_MCP, TMP_ID_SPC);
  CREER_SPC_POS_FC(TMP_CODE_MCP, TMP_ID_SPC);

END;
/
