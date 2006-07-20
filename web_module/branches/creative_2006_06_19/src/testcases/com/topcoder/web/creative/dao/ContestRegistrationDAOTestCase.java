package com.topcoder.web.creative.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.TCHibernateTestCase;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.ContestRegistration;

import java.sql.Timestamp;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class ContestRegistrationDAOTestCase extends TCHibernateTestCase {
    public void testSave() {

        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        CreativeDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        ContestRegistration cr = new ContestRegistration();
        cr.setContest(c);
        cr.setUser(dok);
        cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(new Integer(Constants.CONTEST_TERMS_OF_USE_ID)));
        cr.getId().setContest(c);
        cr.getId().setUser(dok);

        CreativeDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

        tearDown();
        setUp();

        ContestRegistration new1 = CreativeDAOUtil.getFactory().getContestRegistrationDAO().find(c, dok);
        assertFalse("new contest reg entry not created", new1 == null);
    }

    public void testFind() {
        Contest c = CreativeDAOUtil.getFactory().getContestDAO().find(new Long(1120));
        User dok = DAOUtil.getFactory().getUserDAO().find(new Long(132456));
        ContestRegistration new1 = CreativeDAOUtil.getFactory().getContestRegistrationDAO().find(c, dok);
        assertFalse("new contest reg entry not created", new1 == null);
    }

}
