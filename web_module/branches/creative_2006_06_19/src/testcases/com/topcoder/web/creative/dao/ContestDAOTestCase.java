package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.ContestConfig;
import com.topcoder.web.creative.model.ContestPrize;
import com.topcoder.web.creative.model.ContestProperty;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ContestDAOTestCase extends TCHibernateTestCase {

    public void testGetCountries() {
        List countries = CreativeDAOUtil.getFactory().getContestDAO().getContests();
        assertTrue("could not find any contests in the db", countries != null && !countries.isEmpty());
    }

    public void testSave() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        CreativeDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = CreativeDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contst", c1 != null);
    }

    public void testSaveWithDetails() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60 * 24 * 20));

        ContestConfig conf1 = new ContestConfig();
        conf1.setContest(c);
        conf1.setProperty(CreativeDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
        conf1.setValue("this is my contest description");
        conf1.getId().setContest(c);
        conf1.getId().setProperty(conf1.getProperty());

        ContestConfig conf2 = new ContestConfig();
        conf2.setContest(c);
        conf2.setProperty(CreativeDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
        conf2.setValue("this is my prize description");
        conf2.getId().setContest(c);
        conf2.getId().setProperty(conf2.getProperty());

        c.addConfig(conf1);
        c.addConfig(conf2);

        ContestPrize cp1 = new ContestPrize();
        cp1.setAmount(new Float("100"));
        cp1.setPlace(new Integer(1));
        cp1.setContest(c);
        cp1.getId().setContest(c);
        cp1.getId().setPlace(new Integer(1));

        ContestPrize cp2 = new ContestPrize();
        cp2.setAmount(new Float("50"));
        cp2.setPlace(new Integer(2));
        cp2.setContest(c);
        cp2.getId().setContest(c);
        cp2.getId().setPlace(new Integer(2));

        c.addPrize(cp1);
        c.addPrize(cp2);


        CreativeDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        Contest c1 = CreativeDAOUtil.getFactory().getContestDAO().find(c.getId());
        assertTrue("did not create contst", c1 != null);
        assertFalse("did not create prizes", c1.getPrizes().isEmpty());
        assertFalse("did not create config", c1.getConfig().isEmpty());

    }


}
