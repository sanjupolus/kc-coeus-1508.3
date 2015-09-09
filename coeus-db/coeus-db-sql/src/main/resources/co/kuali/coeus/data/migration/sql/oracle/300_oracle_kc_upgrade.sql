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

set define off
set sqlblanklines on

spool 300_oracle_kc_upgrade.sql.log
@./kc/bootstrap/V300_107__schema.sql
@./kc/bootstrap/V300_108__KRC_DML_01_KRNS_NTE_TYP_T.sql
@./kc/bootstrap/V300_109__KRC_DML_01_KRSB_QRTZ_LOCKS.sql
@./kc/bootstrap/V300_110__KC_DML_01_ABSTRACT_TYPE.sql
@./kc/bootstrap/V300_111__KC_DML_01_ACCOUNT_TYPE.sql
@./kc/bootstrap/V300_112__KC_DML_01_ACTIVITY_TYPE.sql
@./kc/bootstrap/V300_113__KC_DML_01_AFFILIATION_TYPE.sql
@./kc/bootstrap/V300_114__KC_DML_01_APPOINTMENT_TYPE.sql
@./kc/bootstrap/V300_115__KC_DML_01_ARG_VALUE_LOOKUP.sql
@./kc/bootstrap/V300_116__KC_DML_01_AWARD_ATTACHMENT_TYPE.sql
@./kc/bootstrap/V300_117__KC_DML_01_AWARD_BASIS_OF_PAYMENT.sql
@./kc/bootstrap/V300_118__KC_DML_01_AWARD_BUDGET_STATUS.sql
@./kc/bootstrap/V300_119__KC_DML_01_AWARD_BUDGET_TYPE.sql
@./kc/bootstrap/V300_120__KC_DML_01_AWARD_METHOD_OF_PAYMENT.sql
@./kc/bootstrap/V300_121__KC_DML_01_AWARD_STATUS.sql
@./kc/bootstrap/V300_122__KC_DML_01_AWARD_TRANSACTION_TYPE.sql
@./kc/bootstrap/V300_123__KC_DML_01_AWARD_TYPE.sql
@./kc/bootstrap/V300_124__KC_DML_01_BUDGET_CATEGORY_MAPS.sql
@./kc/bootstrap/V300_125__KC_DML_01_BUDGET_CATEGORY_TYPE.sql
@./kc/bootstrap/V300_126__KC_DML_01_BUDGET_CATEGORY.sql
@./kc/bootstrap/V300_127__KC_DML_01_BUDGET_PERIOD_TYPE.sql
@./kc/bootstrap/V300_128__KC_DML_01_BUDGET_STATUS.sql
@./kc/bootstrap/V300_129__KC_DML_01_CARRIER_TYPE.sql
@./kc/bootstrap/V300_130__KC_DML_01_CLOSEOUT_REPORT_TYPE.sql
@./kc/bootstrap/V300_131__KC_DML_01_COEUS_MODULE.sql
@./kc/bootstrap/V300_132__KC_DML_01_COMM_DECISION_MOTION_TYPE.sql
@./kc/bootstrap/V300_133__KC_DML_01_COMM_MEMBERSHIP_TYPE.sql
@./kc/bootstrap/V300_134__KC_DML_01_COMM_SCHEDULE_FREQUENCY.sql
@./kc/bootstrap/V300_135__KC_DML_01_COMMENT_TYPE.sql
@./kc/bootstrap/V300_136__KC_DML_01_COMMITTEE_TYPE.sql
@./kc/bootstrap/V300_137__KC_DML_01_CONTACT_TYPE.sql
@./kc/bootstrap/V300_138__KC_DML_01_CORRESPONDENT_TYPE.sql
@./kc/bootstrap/V300_139__KC_DML_01_COST_SHARE_TYPE.sql
@./kc/bootstrap/V300_140__KC_DML_01_CUSTOM_ATTRIBUTE_DATA_TYPE.sql
@./kc/bootstrap/V300_141__KC_DML_01_DEADLINE_TYPE.sql
@./kc/bootstrap/V300_142__KC_DML_01_DEGREE_TYPE.sql
@./kc/bootstrap/V300_143__KC_DML_01_DISTRIBUTION.sql
@./kc/bootstrap/V300_144__KC_DML_01_EPS_PROP_COLUMNS_TO_ALTER.sql
@./kc/bootstrap/V300_145__KC_DML_01_EPS_PROP_PER_DOC_TYPE.sql
@./kc/bootstrap/V300_146__KC_DML_01_EPS_PROP_PERSON_ROLE.sql
@./kc/bootstrap/V300_147__KC_DML_01_EPS_PROPOSAL_STATUS.sql
@./kc/bootstrap/V300_148__KC_DML_01_EXEMPT_STUDIES_CHECKLIST.sql
@./kc/bootstrap/V300_149__KC_DML_01_EXEMPTION_TYPE.sql
@./kc/bootstrap/V300_150__KC_DML_01_EXPEDITED_REVIEW_CHECKLIST.sql
@./kc/bootstrap/V300_151__KC_DML_01_FP_DOC_TYPE_T.sql
@./kc/bootstrap/V300_152__KC_DML_01_FREQUENCY_BASE.sql
@./kc/bootstrap/V300_153__KC_DML_01_FREQUENCY.sql
@./kc/bootstrap/V300_154__KC_DML_01_FUNDING_SOURCE_TYPE.sql
@./kc/bootstrap/V300_155__KC_DML_01_GROUP_TYPES.sql
@./kc/bootstrap/V300_156__KC_DML_01_IDC_RATE_TYPE.sql
@./kc/bootstrap/V300_157__KC_DML_01_IP_REVIEW_ACTIVITY_TYPE.sql
@./kc/bootstrap/V300_158__KC_DML_01_IP_REVIEW_REQ_TYPE.sql
@./kc/bootstrap/V300_159__KC_DML_01_IP_REVIEW_RESULT_TYPE.sql
@./kc/bootstrap/V300_160__KC_DML_01_JOB_CODE.sql
@./kc/bootstrap/V300_161__KC_DML_01_LOCATION_TYPE.sql
@./kc/bootstrap/V300_162__KC_DML_01_MAIL_BY.sql
@./kc/bootstrap/V300_163__KC_DML_01_MAIL_TYPE.sql
@./kc/bootstrap/V300_164__KC_DML_01_MEMBERSHIP_ROLE.sql
@./kc/bootstrap/V300_165__KC_DML_01_MINUTE_ENTRY_TYPE.sql
@./kc/bootstrap/V300_166__KC_DML_01_NARRATIVE_STATUS.sql
@./kc/bootstrap/V300_167__KC_DML_01_NARRATIVE_TYPE.sql
@./kc/bootstrap/V300_168__KC_DML_01_NOTICE_OF_OPPORTUNITY.sql
@./kc/bootstrap/V300_169__KC_DML_01_NSF_CODES.sql
@./kc/bootstrap/V300_170__KC_DML_01_ORGANIZATION_TYPE_LIST.sql
@./kc/bootstrap/V300_171__KC_DML_01_PERSON_EDITABLE_FIELDS.sql
@./kc/bootstrap/V300_172__KC_DML_01_PROPOSAL_LOG_STATUS.sql
@./kc/bootstrap/V300_173__KC_DML_01_PROPOSAL_LOG_TYPE.sql
@./kc/bootstrap/V300_174__KC_DML_01_PROPOSAL_RESPONSE.sql
@./kc/bootstrap/V300_175__KC_DML_01_PROPOSAL_STATE.sql
@./kc/bootstrap/V300_176__KC_DML_01_PROPOSAL_STATUS.sql
@./kc/bootstrap/V300_177__KC_DML_01_PROPOSAL_TYPE.sql
@./kc/bootstrap/V300_178__KC_DML_01_PROTO_CORRESP_TYPE.sql
@./kc/bootstrap/V300_179__KC_DML_01_PROTOCOL_ACTION_TYPE.sql
@./kc/bootstrap/V300_180__KC_DML_01_PROTOCOL_ATTACHMENT_GROUP.sql
@./kc/bootstrap/V300_181__KC_DML_01_PROTOCOL_ATTACHMENT_STATUS.sql
@./kc/bootstrap/V300_182__KC_DML_01_PROTOCOL_ATTACHMENT_TYPE.sql
@./kc/bootstrap/V300_183__KC_DML_01_PROTOCOL_CONTINGENCY.sql
@./kc/bootstrap/V300_184__KC_DML_01_PROTOCOL_MODULES.sql
@./kc/bootstrap/V300_185__KC_DML_01_PROTOCOL_ONLN_RVW_DETERM_RECOM.sql
@./kc/bootstrap/V300_186__KC_DML_01_PROTOCOL_ONLN_RVW_STATUS.sql
@./kc/bootstrap/V300_187__KC_DML_01_PROTOCOL_ORG_TYPE.sql
@./kc/bootstrap/V300_188__KC_DML_01_PROTOCOL_PERSON_ROLES.sql
@./kc/bootstrap/V300_189__KC_DML_01_PROTOCOL_REFERENCE_TYPE.sql
@./kc/bootstrap/V300_190__KC_DML_01_PROTOCOL_REVIEW_TYPE.sql
@./kc/bootstrap/V300_191__KC_DML_01_PROTOCOL_REVIEWER_TYPE.sql
@./kc/bootstrap/V300_192__KC_DML_01_PROTOCOL_STATUS.sql
@./kc/bootstrap/V300_193__KC_DML_01_PROTOCOL_TYPE.sql
@./kc/bootstrap/V300_194__KC_DML_01_QUESTION_TYPES.sql
@./kc/bootstrap/V300_195__KC_DML_01_RATE_CLASS_TYPE.sql
@./kc/bootstrap/V300_196__KC_DML_01_RATE_CLASS.sql
@./kc/bootstrap/V300_197__KC_DML_01_REPORT_CLASS.sql
@./kc/bootstrap/V300_198__KC_DML_01_REPORT.sql
@./kc/bootstrap/V300_199__KC_DML_01_RESEARCH_AREAS.sql
@./kc/bootstrap/V300_200__KC_DML_01_RISK_LEVEL.sql
@./kc/bootstrap/V300_201__KC_DML_01_S2S_REVISION_TYPE.sql
@./kc/bootstrap/V300_202__KC_DML_01_S2S_SUBMISSION_TYPE.sql
@./kc/bootstrap/V300_203__KC_DML_01_SCHEDULE_ACT_ITEM_TYPE.sql
@./kc/bootstrap/V300_204__KC_DML_01_SCHEDULE_STATUS.sql
@./kc/bootstrap/V300_205__KC_DML_01_SCHOOL_CODE.sql
@./kc/bootstrap/V300_206__KC_DML_01_SP_REV_APPROVAL_TYPE.sql
@./kc/bootstrap/V300_207__KC_DML_01_SPECIAL_REVIEW.sql
@./kc/bootstrap/V300_208__KC_DML_01_SPONSOR_TERM_TYPE.sql
@./kc/bootstrap/V300_209__KC_DML_01_SPONSOR_TYPE.sql
@./kc/bootstrap/V300_210__KC_DML_01_SUBMISSION_STATUS.sql
@./kc/bootstrap/V300_211__KC_DML_01_SUBMISSION_TYPE_QUALIFIER.sql
@./kc/bootstrap/V300_212__KC_DML_01_SUBMISSION_TYPE.sql
@./kc/bootstrap/V300_213__KC_DML_01_TRAINING.sql
@./kc/bootstrap/V300_214__KC_DML_01_UNIT_ADMINISTRATOR_TYPE.sql
@./kc/bootstrap/V300_215__KC_DML_01_UNIT.sql
@./kc/bootstrap/V300_216__KC_DML_01_VULNERABLE_SUBJECT_TYPE.sql
@./kc/bootstrap/V300_217__KC_DML_01_YNQ_EXPLANATION_TYPE.sql
@./kc/bootstrap/V300_218__KC_DML_01_YNQ.sql
@./kc/bootstrap/V300_219__KC_DML_02_BATCH_CORRESPONDENCE.sql
@./kc/bootstrap/V300_220__KC_DML_02_BUDGET_CATEGORY_MAPPING.sql
@./kc/bootstrap/V300_221__KC_DML_02_PROTO_CORRESP_TEMPL_00.sql
@./kc/bootstrap/V300_222__KC_DML_02_PROTO_CORRESP_TEMPL_01.sql
@./kc/bootstrap/V300_223__KC_DML_02_PROTO_CORRESP_TEMPL_03.sql
@./kc/bootstrap/V300_224__KC_DML_02_PROTO_CORRESP_TEMPL_04.sql
@./kc/bootstrap/V300_225__KC_DML_02_PROTO_CORRESP_TEMPL_05.sql
@./kc/bootstrap/V300_226__KC_DML_02_PROTO_CORRESP_TEMPL_06.sql
@./kc/bootstrap/V300_227__KC_DML_02_PROTO_CORRESP_TEMPL_07.sql
@./kc/bootstrap/V300_228__KC_DML_02_PROTO_CORRESP_TEMPL_08.sql
@./kc/bootstrap/V300_229__KC_DML_02_PROTO_CORRESP_TEMPL_09.sql
@./kc/bootstrap/V300_230__KC_DML_02_PROTO_CORRESP_TEMPL_10.sql
@./kc/bootstrap/V300_231__KC_DML_02_PROTO_CORRESP_TEMPL_15.sql
@./kc/bootstrap/V300_232__KC_DML_02_PROTO_CORRESP_TEMPL_16.sql
@./kc/bootstrap/V300_233__KC_DML_02_PROTO_CORRESP_TEMPL_17.sql
@./kc/bootstrap/V300_234__KC_DML_02_PROTO_CORRESP_TEMPL_20.sql
@./kc/bootstrap/V300_235__KC_DML_02_PROTO_CORRESP_TEMPL_21.sql
@./kc/bootstrap/V300_236__KC_DML_02_PROTO_CORRESP_TEMPL_23.sql
@./kc/bootstrap/V300_237__KC_DML_02_PROTO_CORRESP_TEMPL_24.sql
@./kc/bootstrap/V300_238__KC_DML_02_PROTO_CORRESP_TEMPL_26.sql
@./kc/bootstrap/V300_239__KC_DML_02_PROTOCOL_ATTACHMENT_TYPE_GROUP.sql
@./kc/bootstrap/V300_240__KC_DML_02_PROTOCOL_PERSON_ROLE_MAPPING.sql
@./kc/bootstrap/V300_241__KC_DML_02_QUESTION.sql
@./kc/bootstrap/V300_242__KC_DML_02_RATE_TYPE.sql
@./kc/bootstrap/V300_243__KC_DML_02_ROLODEX.sql
@./kc/bootstrap/V300_244__KC_DML_02_SPONSOR_TERM.sql
@./kc/bootstrap/V300_245__KC_DML_02_TBN.sql
@./kc/bootstrap/V300_246__KC_DML_02_VALID_AWARD_BASIS_PAYMENT.sql
@./kc/bootstrap/V300_247__KC_DML_02_VALID_BASIS_METHOD_PMT.sql
@./kc/bootstrap/V300_248__KC_DML_02_VALID_CLASS_REPORT_FREQ.sql
@./kc/bootstrap/V300_249__KC_DML_02_VALID_FREQUENCY_BASE.sql
@./kc/bootstrap/V300_250__KC_DML_02_VALID_NARR_FORMS.sql
@./kc/bootstrap/V300_251__KC_DML_02_VALID_PROTO_SUB_REV_TYPE.sql
@./kc/bootstrap/V300_252__KC_DML_02_VALID_PROTO_SUB_TYPE_QUAL.sql
@./kc/bootstrap/V300_253__KC_DML_02_YNQ_EXPLANATION.sql
@./kc/bootstrap/V300_254__KC_DML_03_BATCH_CORRESPONDENCE_DETAIL.sql
@./kc/bootstrap/V300_255__KC_DML_03_ORGANIZATION.sql
@./kc/bootstrap/V300_256__KC_DML_03_QUESTION_EXPLANATION.sql
@./kc/bootstrap/V300_257__KC_DML_03_VALID_CALC_TYPES.sql
@./kc/bootstrap/V300_258__schema-constraints.sql
commit;
