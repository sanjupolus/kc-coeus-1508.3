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

spool 1506_oracle_kc_upgrade.sql.log
@./kc/bootstrap/V1506_005__CertificationNotification.sql
@./kc/bootstrap/V1506_007__RESKC-365.sql
@./kc/bootstrap/V1506_009__add_indexes.sql
@./kc/bootstrap/V1506_011__RESOPS-211.sql
@./kc/bootstrap/V1506_021__RESKC-486-createTimestamp.sql
commit;
