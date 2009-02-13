package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Event test = DAOUtil.getFactory().getEventDAO().find(new Long(1));
        assertTrue("could not load test", test != null);

    }


}
