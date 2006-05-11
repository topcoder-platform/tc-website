package com.topcoder.web.reg;

import junit.framework.TestCase;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.Address;
import com.topcoder.web.reg.dao.Util;
import org.hibernate.LazyInitializationException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DetachedTestCase extends TestCase {

    public void tearDown() {
        HibernateUtils.close();
    }

    
    public void testDetachedUserAddress() {
/*
        HibernateUtils.getLocalSession();
        User u = new User();
        HibernateUtils.closeLocal();
        boolean found = false;
        try {
            HibernateUtils.getLocalSession();
            u.getHomeAddress();
        } catch (LazyInitializationException e) {
            found = true;
        } finally {
            HibernateUtils.closeLocal();
        }

        assertFalse("got an exception attempting to check on the home address", found);
*/
    }
    public void testDetachedExistingUserAddress() {
        User u = Util.getFactory().getUserDAO().find(new Long(132456));
        HibernateUtils.getSession().disconnect();
        boolean found = false;
        try {
            HibernateUtils.getSession().update(u);

            Address a = u.getHomeAddress();
        } catch (LazyInitializationException e) {
            found = true;
        }

        assertFalse("got an exception attempting to check on the home address", found);
    }
}
