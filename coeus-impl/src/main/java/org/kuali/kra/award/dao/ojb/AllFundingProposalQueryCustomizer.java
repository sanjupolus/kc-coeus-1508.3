/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.award.dao.ojb;

import java.util.Arrays;
import java.util.Collections;

import org.apache.ojb.broker.PersistenceBroker;
import org.apache.ojb.broker.accesslayer.QueryCustomizerDefaultImpl;
import org.apache.ojb.broker.metadata.CollectionDescriptor;
import org.apache.ojb.broker.query.Criteria;
import org.apache.ojb.broker.query.Query;
import org.apache.ojb.broker.query.QueryByCriteria;
import org.kuali.coeus.common.framework.version.VersionStatus;
import org.kuali.kra.award.home.Award;

public class AllFundingProposalQueryCustomizer extends QueryCustomizerDefaultImpl {
    private static final String ACTIVE = "active";
	private static final String AWARD_SEQUENCE_STATUS = "award.awardSequenceStatus";
	private static final String AWARD_NUMBER = "award.awardNumber";

	@Override
    public Query customizeQuery(Object anObject,
            PersistenceBroker aBroker,
            CollectionDescriptor aCod, QueryByCriteria aQuery){
    	Criteria crit = new Criteria();
    	crit.addEqualTo(AWARD_NUMBER, ((Award)anObject).getAwardNumber());
    	crit.addIn(AWARD_SEQUENCE_STATUS, Arrays.asList(new String[]{VersionStatus.ACTIVE.toString(), VersionStatus.PENDING.toString(), VersionStatus.ARCHIVED.toString()}));
    	crit.addEqualTo(ACTIVE, Boolean.TRUE);
        aQuery.setCriteria(crit);
        return aQuery;
    }
}
