package com.topcoder.web.creative.dao;

import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.Contest;

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


}
