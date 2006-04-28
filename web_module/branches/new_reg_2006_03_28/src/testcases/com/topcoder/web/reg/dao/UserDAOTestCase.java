package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.HibernateUtils;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class UserDAOTestCase extends TestCase {
    public void testFind() {
        User tomek = new UserDAO().find(new Long(144400));
        assertTrue("could not load tomek", tomek != null);
    }

    public void testSaveOrUpdate() {
        User u= TestUtils.makeUser();
        try {
            new UserDAO().saveOrUpdate(u);
            User u1= new UserDAO().find(u.getId());
            assertTrue("new coder does not exist", u1!=null);
        } finally {
            HibernateUtils.close();
        }

    }

    public void testSecurityGroupsLoaded() {
        User dok = new UserDAO().find(new Long(132456));
        assertTrue("did not load groups for dok", !dok.getSecurityGroups().isEmpty());
    }
}
