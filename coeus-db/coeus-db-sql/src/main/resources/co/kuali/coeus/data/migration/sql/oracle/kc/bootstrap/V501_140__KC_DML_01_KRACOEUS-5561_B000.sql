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

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'leadUnitRule','Lead Unit Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Lead Unit Number','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'sponsorGroupRule','Sponsor Group Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Sponsor Group Name','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'proposalAwardTypeRule','Award Type Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Award Type Code','java.lang.Integer',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'s2sLeadershipRule','S2S Leadership Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'checkProposalPiRule','Check Proposal Principal Investigator','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'User Principal ID','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'checkProposalCoiRule','Check Proposal Co-Investigator','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'User Principal ID','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'leadUnitBelowRule','Lead Unit Below In Hierarchy','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Unit Number','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'specialReviewRule','Special Review Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Special Review Type Code','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'proposalUnitRule','Unit in Proposal','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Unit Number','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'sponsorTypeRule','Sponsor Type Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Sponsor Type Code','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'s2sAttachmentNarrativeRule','S2S Attachment Narrative Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'s2sModularBudgetRule','S2S Modular Budget Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'s2sFederalIdRule','S2S Federal ID Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'mtdcDeviation','MTDC Deviation in Final Budget Version','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'s2sExemptionRule','S2S Exemption Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'costElement','Cost Element Exists','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Cost Element','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'activityTypeRule','Activity Type Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Activity Type Code','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'sponsor','Sponsor Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Sponsor Code','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'nonFacultyPi','Non Faculty Principal Investigator','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'attachmentFileNameRule','Attachment File Name Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'mtdcDeviationInVersion','MTDC Deviation In Budget Version','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Budget Version Number','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'proposalTypeRule','Proposal Type Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'Proposal Type Code','java.lang.String',2,sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUNCTION_ID.NEXTVAL,'incompleteNarrativeRule','Incomplete Narrative Rule','java.lang.String','2',sysdate,'admin',1,sys_guid());
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) 
		values (SEQ_KC_KRMS_TERM_FUN_PARM_ID.NEXTVAL,SEQ_KC_KRMS_TERM_FUNCTION_ID.CURRVAL,'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,sysdate,'admin',1,sys_guid());
