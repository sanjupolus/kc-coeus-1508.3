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

DELIMITER /

CREATE TABLE IACUC_AFFILIATION_TYPE
(
    VER_NBR                 DECIMAL(8,0) DEFAULT 1 NOT NULL
    , AFFILIATION_TYPE_CODE DECIMAL(3,0)
    , DESCRIPTION           VARCHAR(200) NOT NULL
    , UPDATE_TIMESTAMP      DATE NOT NULL
    , UPDATE_USER           VARCHAR(60) NOT NULL
    , OBJ_ID                VARCHAR(36) NOT NULL
    , ACTIVE_FLAG           CHAR(1) NOT NULL
    
)
/

ALTER TABLE IACUC_AFFILIATION_TYPE
    ADD CONSTRAINT IACUC_AFFILIATION_TYPE1
PRIMARY KEY (AFFILIATION_TYPE_CODE)
/

DELIMITER ;