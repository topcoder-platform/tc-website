package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Contact;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class ContactDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Contact dok = Util.getFactory().getContactDAO().find(new Long(132456));
        assertTrue("could not load dok", dok != null);

    }


}
