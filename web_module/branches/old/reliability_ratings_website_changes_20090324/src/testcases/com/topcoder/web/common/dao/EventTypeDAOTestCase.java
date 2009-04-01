package com.topcoder.web.common.dao;

import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class EventTypeDAOTestCase extends TCHibernateTestCase {

    public void testFind() {
        assertFalse("couldn't find event type", DAOUtil.getFactory().getEventTypeDAO().find(new Integer(4)) == null);
    }
}
