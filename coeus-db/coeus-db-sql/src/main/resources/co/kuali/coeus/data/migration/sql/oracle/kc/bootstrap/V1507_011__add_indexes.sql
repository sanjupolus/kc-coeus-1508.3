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

create index TRANSACTION_DETAILS_IDX on
  TRANSACTION_DETAILS(tnm_document_number);

create index AWARD_AMOUNT_TRANSACTION_IDX on
  AWARD_AMOUNT_TRANSACTION(TRANSACTION_ID);

create index BUDGET_PER_DET_RB_IDX on
  BUDGET_PER_DET_RATE_AND_BASE(BUDGET_PERSONNEL_DETAILS_ID);

create index BUDGET_PERS_CAL_AMTS_IDX on
  BUDGET_PERSONNEL_CAL_AMTS(BUDGET_PERSONNEL_DETAILS_ID);

create index BUDGET_RATE_AND_BASE_IDX on
  BUDGET_RATE_AND_BASE(BUDGET_DETAILS_ID);

CREATE INDEX PROTOCOL_PERSONS_IDX
ON PROTOCOL_PERSONS (PROTOCOL_ID);

CREATE INDEX AWARD_AMOUNT_INFO_IDX
ON AWARD_AMOUNT_INFO (TNM_DOCUMENT_NUMBER);

CREATE INDEX AWARD_SPONSOR_CONTACTS_IDX
ON AWARD_SPONSOR_CONTACTS (AWARD_ID);

CREATE INDEX PROTOCOL_SUBMISSION_IDX
ON PROTOCOL_SUBMISSION (PROTOCOL_ID);

CREATE INDEX PROTOCOL_ACTIONS_IDX
ON PROTOCOL_ACTIONS (PROTOCOL_ID);

CREATE INDEX COMM_SCHEDULE_MINUTES_IDX
ON COMM_SCHEDULE_MINUTES (SUBMISSION_ID_FK);

CREATE INDEX PROTO_CORRESP_IDX
ON PROTOCOL_CORRESPONDENCE (ACTION_ID_FK);

CREATE INDEX PROTO_AMEND_RENEWAL_IDX
ON PROTO_AMEND_RENEWAL (PROTOCOL_ID);

CREATE INDEX PROTOCOL_SUBMISSION_IDX1
ON PROTOCOL_SUBMISSION (SCHEDULE_ID_FK);

CREATE INDEX PROTOCOL_PERSONS_IDX1
ON PROTOCOL_PERSONS (PROTOCOL_ID,PROTOCOL_PERSON_ROLE_ID);

CREATE INDEX AWARD_PERSON_UNITS_IDX1
ON AWARD_PERSON_UNITS (AWARD_PERSON_ID);

CREATE INDEX BUDGET_DETAILS_IDX1
ON BUDGET_DETAILS (BUDGET_PERIOD_NUMBER);

create index PROTOCOL_SUBMISSION_IDX2 on
  PROTOCOL_SUBMISSION(PROTOCOL_NUMBER);