package com.topcoder.web.reg;

import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class TCHibernateTestCase extends TestCase {
    public void tearDown() {
        HibernateUtils.commit();
        HibernateUtils.close();
    }

    public void setUp() {
        HibernateUtils.begin();
    }

}
