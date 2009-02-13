package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Contact;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class ContactDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Contact dok = DAOUtil.getFactory().getContactDAO().find(new Long(132456));
        assertTrue("could not load dok", dok != null);

    }


}
