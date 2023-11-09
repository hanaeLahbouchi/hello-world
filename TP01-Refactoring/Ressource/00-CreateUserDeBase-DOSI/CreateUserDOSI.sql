REM 
REM Cr�ation Utilisateur DOSI
REM

create user DOSI identified by dosi account unlock;
ALTER USER DOSI DEFAULT ROLE ALL;
GRANT UNLIMITED TABLESPACE TO DOSI;
grant CONNECT,RESOURCE to DOSI;
GRANT CREATE TABLE TO DOSI;
GRANT CREATE VIEW TO DOSI;          
GRANT CREATE PROCEDURE TO DOSI;                	 
GRANT CREATE SYNONYM TO DOSI;                  
GRANT CREATE SEQUENCE TO DOSI;                	 
GRANT CREATE TRIGGER TO DOSI;
GRANT CREATE TYPE TO DOSI;
GRANT SELECT ON dba_rollback_segs TO DOSI;            
GRANT SELECT ON dba_segments TO DOSI;
