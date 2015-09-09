--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--



INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'NSF s2s form supporting questions'),'admin','S',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'NSF s2s form supporting questions'),'admin','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
  
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS Fellowship Supplemental Form V1-0 & 1-1'),'admin','S',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS Fellowship Supplemental Form V1-0 & 1-1'),'admin','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS398 Training Budget Form version 1-0'),'admin','S',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS398 Training Budget Form version 1-0'),'admin','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS Fellowship Supplemental Form V1-2'),'admin','S',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'PHS Fellowship Supplemental Form V1-2'),'admin','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);

COMMIT;