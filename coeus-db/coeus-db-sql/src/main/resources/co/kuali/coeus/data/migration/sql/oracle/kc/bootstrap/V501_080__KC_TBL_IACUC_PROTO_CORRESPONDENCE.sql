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

CREATE TABLE IACUC_PROTO_CORRESPONDENCE (
    ID 						NUMBER(12),
    PROTOCOL_NUMBER 		VARCHAR2(20) NOT NULL,
    SEQUENCE_NUMBER		 	NUMBER(4) NOT NULL,
    ACTION_ID 				NUMBER(6) NOT NULL,
    PROTOCOL_ID 			NUMBER(12) NOT NULL,
    ACTION_ID_FK 			NUMBER(12) NOT NULL,
    PROTO_CORRESP_TYPE_CODE VARCHAR2(3) NOT NULL,
    FINAL_FLAG 				CHAR(1) NOT NULL,
    UPDATE_TIMESTAMP 		DATE,
    UPDATE_USER 			VARCHAR2(60),
    VER_NBR 				NUMBER(8) default 1 NOT NULL,
    CORRESPONDENCE 			BLOB NOT NULL,
    OBJ_ID 					VARCHAR2(36) NOT NULL,
    CREATE_TIMESTAMP 		DATE,
    CREATE_USER 			VARCHAR2(60),
    FINAL_FLAG_TIMESTAMP 	DATE );
ALTER TABLE IACUC_PROTO_CORRESPONDENCE
ADD CONSTRAINT IACUC_PROTO_CORRESPONDENCEP1
PRIMARY KEY (ID);
