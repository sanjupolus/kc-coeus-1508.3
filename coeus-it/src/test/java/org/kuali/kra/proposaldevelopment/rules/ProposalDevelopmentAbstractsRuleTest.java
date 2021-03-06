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
package org.kuali.kra.proposaldevelopment.rules;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.kuali.coeus.propdev.impl.abstrct.ProposalDevelopmentAbstractsRule;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.coeus.propdev.impl.abstrct.ProposalAbstract;
import org.kuali.rice.krad.util.ErrorMessage;
import org.kuali.rice.krad.util.GlobalVariables;

import java.util.List;
import static org.junit.Assert.*;

/**
 * Test the business rules for Proposal Abstracts.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class ProposalDevelopmentAbstractsRuleTest extends ProposalDevelopmentRuleTestBase {

    private ProposalDevelopmentAbstractsRule rule = null;

    @Before
    public void setUp() throws Exception {
        super.setUp();
        rule = new ProposalDevelopmentAbstractsRule();
    }

    @After
    public void tearDown() throws Exception {
        rule = null;
        super.tearDown();
    }

    /**
     * Test a good case. 
     *  
     * @throws Exception
     */
    @Test
    public void testOK() throws Exception {
        ProposalDevelopmentDocument document = getNewProposalDevelopmentDocument();
        ProposalAbstract proposalAbstract = new ProposalAbstract();
        proposalAbstract.setAbstractTypeCode("1");
        assertTrue(rule.processAddAbstractBusinessRules(document, proposalAbstract));
    }
    
    /**
     * Test adding an abstract with an unspecified abstract type code.
     * This corresponds to a empty string type code, i.e. the user didn't
     * select an abstract type.
     * 
     * @throws Exception
     */
    @Test
    public void testUnspecifiedAbstractType() throws Exception {
        ProposalDevelopmentDocument document = getNewProposalDevelopmentDocument();
        ProposalAbstract proposalAbstract = new ProposalAbstract();
        proposalAbstract.setAbstractTypeCode("");
        assertFalse(rule.processAddAbstractBusinessRules(document, proposalAbstract));
        
        List errors = GlobalVariables.getMessageMap().getMessages(Constants.ABSTRACTS_PROPERTY_KEY + ".abstractTypeCode");
        assertNotNull(errors);
        assertTrue(errors.size() == 1);
        
        ErrorMessage message = (ErrorMessage) errors.get(0);
        assertNotNull(message);
        assertEquals(message.getErrorKey(), KeyConstants.ERROR_ABSTRACT_TYPE_NOT_SELECTED);
    }
    
    /**
     * Test adding an abstract with an invalid type code.
     * 
     * @throws Exception
     */
    @Test
    public void testInvalidAbstractType() throws Exception {
        ProposalDevelopmentDocument document = getNewProposalDevelopmentDocument();
        ProposalAbstract proposalAbstract = new ProposalAbstract();
        proposalAbstract.setAbstractTypeCode("FOO_JUNK");

        assertFalse(rule.processAddAbstractBusinessRules(document, proposalAbstract));
        
        List errors = GlobalVariables.getMessageMap().getMessages(Constants.ABSTRACTS_PROPERTY_KEY);
        assertNotNull(errors);
        assertTrue(errors.size() == 1);
        
        ErrorMessage message = (ErrorMessage) errors.get(0);
        assertNotNull(message);
        assertEquals(message.getErrorKey(), KeyConstants.ERROR_ABSTRACT_TYPE_INVALID);
    }
    
    /**
     * Test adding an abstract with a duplicate type code, i.e. the
     * document already has an abstract with that type code.
     * 
     * @throws Exception
     */
    @Test
    public void testDuplicateAbstractType() throws Exception {
        ProposalDevelopmentDocument document = getNewProposalDevelopmentDocument();
        addAbstract(document, "1");
        
        ProposalAbstract proposalAbstract = new ProposalAbstract();
        proposalAbstract.setAbstractTypeCode("1");
        assertFalse(rule.processAddAbstractBusinessRules(document, proposalAbstract));
        
        List errors = GlobalVariables.getMessageMap().getMessages(Constants.ABSTRACTS_PROPERTY_KEY);
        assertNotNull(errors);
        assertTrue(errors.size() == 1);
        
        ErrorMessage message = (ErrorMessage) errors.get(0);
        assertNotNull(message);
        assertEquals(message.getErrorKey(), KeyConstants.ERROR_ABSTRACT_TYPE_DUPLICATE);
    }

    private void addAbstract(ProposalDevelopmentDocument document, String abstractTypeCode) {
        List<ProposalAbstract> abstracts = document.getDevelopmentProposal().getProposalAbstracts();
        ProposalAbstract proposalAbstract = new ProposalAbstract();
        proposalAbstract.setAbstractTypeCode("1");
        abstracts.add(proposalAbstract);
    }
}
