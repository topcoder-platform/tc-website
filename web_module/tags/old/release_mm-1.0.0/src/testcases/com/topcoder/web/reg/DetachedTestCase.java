package com.topcoder.web.reg;

import com.topcoder.web.common.HibernateUtils;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DetachedTestCase extends TCHibernateTestCase {


    public void testRollback() {
        HibernateUtils.begin();
        HibernateUtils.rollback();
        assertTrue("got here without exception", true);
    }


}