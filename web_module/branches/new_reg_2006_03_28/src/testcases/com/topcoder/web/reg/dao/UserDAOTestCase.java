package com.topcoder.web.reg.dao;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.model.User;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class UserDAOTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(UserDAOTestCase.class);

    public void testFind() {
        User tomek = new UserDAO(HibernateUtils.getLocalSession()).find(new Long(144400));
        assertTrue("could not load tomek", tomek != null && "tomek".equals(tomek.getHandle()));
    }

    public void testSaveOrUpdate() {
        User u= TestUtils.makeUser();
        try {
            new UserDAO(HibernateUtils.getLocalSession()).saveOrUpdate(u);
            User u1= new UserDAO(HibernateUtils.getLocalSession()).find(u.getId());
            assertTrue("new coder does not exist", u1!=null);
        } finally {
            HibernateUtils.closeLocal();
        }

    }

    public void testSecurityGroupsLoaded() {
        User dok = new UserDAO(HibernateUtils.getLocalSession()).find(new Long(132456));
        assertTrue("did not load groups for dok", !dok.getSecurityGroups().isEmpty());
    }

    public void testAddressesLoaded() {
        User dok = new UserDAO(HibernateUtils.getLocalSession()).find(new Long(132456));
        assertTrue("did not load addresses for dok", !dok.getAddresses().isEmpty());
    }

    public void testNotificationsLoaded() {
        User dok = new UserDAO(HibernateUtils.getLocalSession()).find(new Long(132456));
        assertTrue("did not load notifications for dok", !dok.getNotifications().isEmpty());
    }
}
