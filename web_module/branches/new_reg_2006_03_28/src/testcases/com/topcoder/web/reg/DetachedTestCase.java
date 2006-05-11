package com.topcoder.web.reg;

import com.topcoder.web.reg.model.User;
import org.hibernate.LazyInitializationException;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DetachedTestCase extends TestCase {
    public void testDetachedUserAddress() {
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
    }
}
