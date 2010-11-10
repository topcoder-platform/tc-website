package com.topcoder.web.openaim.dao;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.ContestRegistration;
import com.topcoder.web.openaim.model.ContestStatus;

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
        c.setStatus(OpenAIMDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        OpenAIMDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        User dok = DAOUtil.getFactory().getUserDAO().find((long) 132456);
        ContestRegistration cr = new ContestRegistration();
        cr.setContest(c);
        cr.setUser(dok);
        cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));
        cr.getId().setContest(c);
        cr.getId().setUser(dok);

        OpenAIMDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

        tearDown();
        setUp();

        ContestRegistration new1 = OpenAIMDAOUtil.getFactory().getContestRegistrationDAO().find(c, dok);
        assertFalse("new contest reg entry not created", new1 == null);
    }

    public void testFind() {
        Contest c = new Contest();
        c.setName("gp contest " + System.currentTimeMillis());
        c.setStartTime(new Timestamp(new Date().getTime()));
        c.setEndTime(new Timestamp(c.getStartTime().getTime() + 1000 * 60 * 60));
        c.setStatus(OpenAIMDAOUtil.getFactory().getContestStatusDAO().find(ContestStatus.UNACTIVE));
        OpenAIMDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);
        User dok = DAOUtil.getFactory().getUserDAO().find((long) 132456);
        ContestRegistration cr = new ContestRegistration();
        cr.setContest(c);
        cr.setUser(dok);
        cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));
        cr.getId().setContest(c);
        cr.getId().setUser(dok);

        OpenAIMDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);
        tearDown();
        setUp();

        ContestRegistration new1 = OpenAIMDAOUtil.getFactory().getContestRegistrationDAO().find(c, dok);
        assertFalse("new contest reg entry not created", new1 == null);
    }

}
