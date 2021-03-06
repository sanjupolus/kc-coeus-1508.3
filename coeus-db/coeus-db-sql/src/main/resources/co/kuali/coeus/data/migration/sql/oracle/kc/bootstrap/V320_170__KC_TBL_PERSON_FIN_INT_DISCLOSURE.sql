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

CREATE TABLE PERSON_FIN_INT_DISCLOSURE ( 
    PERSON_FIN_INT_DISCLOSURE_ID NUMBER(12,0) NOT NULL, 
    PERSON_ID VARCHAR2(40) NOT NULL, 
    FINANCIAL_ENTITY_REPORTER_ID NUMBER(12,0) NOT NULL, 
    ENTITY_NUMBER VARCHAR2(10) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
    STATUS_CODE NUMBER(3,0) NOT NULL, 
    STATUS_DESCRIPTION VARCHAR2(2000), 
    ENTITY_NAME VARCHAR2(60) NOT NULL, 
    ENTITY_TYPE_CODE NUMBER(3,0) NOT NULL, 
    ENTITY_OWNERSHIP_TYPE CHAR(1), 
    RELATIONSHIP_TYPE_CODE VARCHAR2(3) NOT NULL, 
    RELATIONSHIP_DESCRIPTION VARCHAR2(2000), 
    RELATED_TO_ORG_FLAG CHAR(1) NOT NULL, 
    CURRENT_FLAG CHAR(1) NOT NULL, 
    ORG_RELATION_DESCRIPTION VARCHAR2(2000), 
    PRINCIPAL_BUSINESS_ACTIVITY VARCHAR2(2000) NOT NULL, 
    SPONSOR_CODE VARCHAR2(6), 
    SPONSOR_NAME varchar2 (200),
    PROCESS_STATUS VARCHAR2(1) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL);
ALTER TABLE PERSON_FIN_INT_DISCLOSURE 
ADD CONSTRAINT PK_PERSON_FIN_INT_DISCLOSURE 
PRIMARY KEY (PERSON_FIN_INT_DISCLOSURE_ID);
