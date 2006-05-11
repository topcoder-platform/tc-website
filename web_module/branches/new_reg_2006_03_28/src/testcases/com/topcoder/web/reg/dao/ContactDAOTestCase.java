package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Contact;
import com.topcoder.web.reg.HibernateUtils;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class ContactDAOTestCase extends TestCase {
    public void tearDown() {
        HibernateUtils.close();
    }

    public void testFind() {

        Contact dok = Util.getFactory().getContactDAO().find(new Long(132456));
        assertTrue("could not load dok", dok != null);

    }


}
