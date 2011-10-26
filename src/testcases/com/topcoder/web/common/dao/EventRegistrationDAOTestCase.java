package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 57593 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 14, 2007
 */
public class EventRegistrationDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        DAOFactory f = DAOUtil.getFactory();
        User dok = f.getUserDAO().find(new Long(132456));

        Event e = (Event) f.getEventDAO().getEvents().iterator().next();
        log.debug("event " + e.getDescription() + " " + e.getId());
        EventRegistration er = new EventRegistration();
        er.setEligible(Boolean.TRUE);
        er.getId().setEvent(e);
        er.getId().setUser(dok);
        dok.addEventRegistration(er);
        dok.addTerms(e.getTerms());
        f.getUserDAO().saveOrUpdate(dok);
        tearDown();
        setUp();
        assertFalse("couldn't find event event registration",
                DAOUtil.getFactory().getEventRegistrationDAO().find(dok.getId(), e.getId()) == null);
    }
}

