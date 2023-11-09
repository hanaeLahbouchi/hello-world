-- 
-- Script de création des INDEX du CSCI-GLOB
-- Ph. Saliou - 04 octobre 2012 - 
--

PROMPT Creating Index 'CGRC_I'
CREATE INDEX CGRC_I ON CG_REF_CODES
 (RV_DOMAIN
 ,RV_LOW_VALUE)
/
