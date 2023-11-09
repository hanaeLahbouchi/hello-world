create or replace procedure maj_mod_comp is
      tmp number; 
begin
      select count(*) into tmp from modele_competence where en_vigueur='O';
      
      if(tmp>1) then
            update modele_competence
            set en_vigueur='N'
            where date_creation!= (select max(date_creation) from modele_competence where en_vigueur='O')
            and en_vigueur='O';
      end if;
      
      update modele_competence set etat='DIS' where en_vigueur='O';
end;
/
