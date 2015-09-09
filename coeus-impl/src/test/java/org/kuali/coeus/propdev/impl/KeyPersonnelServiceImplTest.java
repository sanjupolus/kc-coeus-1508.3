package org.kuali.coeus.propdev.impl;

import org.junit.Before;
import org.junit.Test;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.coeus.propdev.impl.person.KeyPersonnelServiceImpl;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.propdev.impl.person.ProposalPersonUnit;
import org.kuali.coeus.propdev.impl.person.creditsplit.ProposalCreditSplitListDto;
import org.kuali.coeus.propdev.impl.person.creditsplit.ProposalPersonCreditSplit;
import org.kuali.coeus.propdev.impl.person.creditsplit.ProposalUnitCreditSplit;
import org.kuali.coeus.sys.api.model.ScaleTwoDecimal;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class KeyPersonnelServiceImplTest {

    public static final String BOB = "BOB";
    public static final String FINANCIAL = "FINANCIAL";
    public static final String RECOGNITION = "RECOGNITION";
    public static final String RESPONSIBILITY = "RESPONSIBILITY";
    KeyPersonnelServiceImpl keyPersonnelService;
    private ProposalPerson proposalPerson;

    @Before
    public void setup() {
        keyPersonnelService = new KeyPersonnelServiceImpl();

        proposalPerson = new ProposalPerson();
        proposalPerson.setFullName(BOB);

        proposalPerson.getCreditSplits().add(createPersonCreditSplit(FINANCIAL, 100));
        proposalPerson.getCreditSplits().add(createPersonCreditSplit(RECOGNITION, 100));
        proposalPerson.getCreditSplits().add(createPersonCreditSplit(RESPONSIBILITY, 100));

        ProposalPersonUnit unit = new ProposalPersonUnit();
        unit.setUnit(new Unit());
        unit.getUnit().setUnitNumber("1");
        unit.getUnit().setUnitName("UNIT1");

        unit.getCreditSplits().add(createUnitCreditSplit(FINANCIAL, 0));
        unit.getCreditSplits().add(createUnitCreditSplit(RECOGNITION, 20));
        unit.getCreditSplits().add(createUnitCreditSplit(RESPONSIBILITY, 60));

        ProposalPersonUnit unit2 = new ProposalPersonUnit();
        unit2.setUnit(new Unit());
        unit2.getUnit().setUnitNumber("2");
        unit2.getUnit().setUnitName("UNIT2");

        unit2.getCreditSplits().add(createUnitCreditSplit(FINANCIAL, 50));
        unit2.getCreditSplits().add(createUnitCreditSplit(RECOGNITION, 20));
        unit2.getCreditSplits().add(createUnitCreditSplit(RESPONSIBILITY, 0));

        proposalPerson.getUnits().add(unit);
        proposalPerson.getUnits().add(unit2);
    }

    protected ProposalPersonCreditSplit createPersonCreditSplit(String financial, int value) {
        ProposalPersonCreditSplit creditSplit = new ProposalPersonCreditSplit();
        creditSplit.setCredit(new ScaleTwoDecimal(value));
        creditSplit.setInvCreditTypeCode(financial);
        return creditSplit;
    }

    protected ProposalUnitCreditSplit createUnitCreditSplit(String financial, int value) {
        ProposalUnitCreditSplit creditSplit = new ProposalUnitCreditSplit();
        creditSplit.setCredit(new ScaleTwoDecimal(value));
        creditSplit.setInvCreditTypeCode(financial);
        return creditSplit;
    }

    protected void verifyCreditSplitListDto(ProposalCreditSplitListDto proposalCreditSplitListDto, String bob, int... value) {
        assertEquals(bob, proposalCreditSplitListDto.getDescription());
        for (int i = 0; i < value.length; i++) {
            assertEquals(proposalCreditSplitListDto.getDescription() + " " + proposalCreditSplitListDto.getCreditSplits().get(i).getInvCreditTypeCode() + " credit split is wrong",new ScaleTwoDecimal(value[i]), proposalCreditSplitListDto.getCreditSplits().get(i).getCredit());
        }
    }

    @Test
    public void test_createCreditSplitListItems() {
        List<ProposalPerson> proposalPersons = new ArrayList<>();
        proposalPersons.add(proposalPerson);
        List<ProposalCreditSplitListDto> creditSplitListDtos =  keyPersonnelService.createCreditSplitListItems(proposalPersons);
        assertEquals(5,creditSplitListDtos.size());
        verifyCreditSplitListDto(creditSplitListDtos.get(0), BOB, 100, 100, 100);
        verifyCreditSplitListDto(creditSplitListDtos.get(1),"1 - UNIT1",0,20,60);
        verifyCreditSplitListDto(creditSplitListDtos.get(2),"2 - UNIT2",50,20,0);
        verifyCreditSplitListDto(creditSplitListDtos.get(3),"Unit Total:",50,40,60);
        verifyCreditSplitListDto(creditSplitListDtos.get(4), "Investigator Total:", 100, 100, 100);
    }
}
